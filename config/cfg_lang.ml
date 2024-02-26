open Ppxlib

let error fmt = Spices.(default |> fg (color "#FF0000") |> build) fmt
let mint = Spices.color "#77e5b7"
let keyword fmt = Spices.(default |> fg mint |> build) fmt

type error = { loc : Location.t; error : string }

exception Error of error

let failwith ~loc error = raise (Error { loc; error = error ^ "\n" })

let bug ~loc reason =
  failwith ~loc
    (Format.sprintf
       {|Oops! This is a bug. We should never get here, please file an issue here \

https://github.com/leostera/riot/issues/new

Contenxt: %s |}
       reason)

(* let log = Printf.printf *)

module Lexer = struct
  type token =
    | ATOM of string
    | STRING of string
    | NUMBER of int
    | LPARENS
    | EQ
    | RPARENS
    | COMMA

  let digit = [%sedlex.regexp? Plus '0' .. '9']
  let letter = [%sedlex.regexp? '_' | 'a' .. 'z' | 'A' .. 'Z']
  let ident = [%sedlex.regexp? letter, Star (letter | digit)]

  let pp_one fmt (t : token) =
    match t with
    | ATOM name -> Format.fprintf fmt "ATOM(%S)" name
    | STRING s -> Format.fprintf fmt "STRING(%S)" s
    | NUMBER n -> Format.fprintf fmt "NUMBER(%d)" n
    | RPARENS -> Format.fprintf fmt "RPARENS"
    | LPARENS -> Format.fprintf fmt "LPARENS"
    | EQ -> Format.fprintf fmt "EQ"
    | COMMA -> Format.fprintf fmt "COMMA"

  let pp fmt t =
    Format.fprintf fmt "[\r\n  ";
    Format.pp_print_list
      ~pp_sep:(fun fmt () -> Format.fprintf fmt ";\r\n  ")
      pp_one fmt t;
    Format.fprintf fmt "\r\n]\r\n"

  let rec token ~loc buf (acc : token list) =
    match%sedlex buf with
    | white_space | "\n" | "\r" -> token ~loc buf acc
    | ")" -> token ~loc buf (RPARENS :: acc)
    | "(" -> token ~loc buf (LPARENS :: acc)
    | "=" -> token ~loc buf (EQ :: acc)
    | "," -> token ~loc buf (COMMA :: acc)
    | digit ->
        let num = Sedlexing.Utf8.lexeme buf in
        token ~loc buf (NUMBER (Int64.of_string num |> Int64.to_int) :: acc)
    | "\"" -> string ~loc buf acc
    | ident ->
        let atom = Sedlexing.Utf8.lexeme buf in
        token ~loc buf (ATOM atom :: acc)
    | eof -> acc
    | _ ->
        let char = Sedlexing.Utf8.lexeme buf in
        failwith ~loc
          (Format.sprintf "Syntax error, invalid character: %S" char)

  and string ~loc buf ?(str = []) acc =
    match%sedlex buf with
    | "\"" ->
        let str = List.rev str |> String.concat "" in
        (* log "%s\"%!" str; *)
        token ~loc buf (STRING str :: acc)
    | "\\r" -> string ~loc buf ~str:("\r" :: str) acc
    | "\\n" -> string ~loc buf ~str:("\n" :: str) acc
    | any ->
        let ident = Sedlexing.Utf8.lexeme buf in
        (* log "%s%!" ident; *)
        string ~loc buf ~str:(ident :: str) acc
    | _ -> failwith ~loc "unsupported character in string"

  let read ~loc str =
    let lexbuf = Sedlexing.Utf8.from_string str in
    token ~loc lexbuf [] |> List.rev
end

module Parser = struct
  open Lexer

  type value = Number of int | String of string

  type parsetree =
    | Any of parsetree list
    | All of parsetree list
    | Not of parsetree
    | Pred of { var : string; value : value }

  let rec pp fmt (t : parsetree) =
    match t with
    | Any parts -> Format.fprintf fmt "Any(%a)" pp_parts parts
    | All parts -> Format.fprintf fmt "All(%a)" pp_parts parts
    | Not expr -> Format.fprintf fmt "Not(%a)" pp expr
    | Pred { var; value } ->
        Format.fprintf fmt "Pred { var=%S; value=%a }" var pp_value value

  and pp_value fmt value =
    match value with
    | Number n -> Format.fprintf fmt "Number %d" n
    | String s -> Format.fprintf fmt "String %S" s

  and pp_parts fmt parts =
    Format.fprintf fmt "[\r\n  ";
    Format.pp_print_list
      ~pp_sep:(fun fmt () -> Format.fprintf fmt ";\r\n  ")
      pp fmt parts;
    Format.fprintf fmt "\r\n]\r\n"

  let rec parse ~loc str =
    let tokens = Lexer.read ~loc str in
    let tree, _rest = do_parse ~loc tokens in
    tree

  and do_parse ~loc tokens =
    match tokens with
    | ATOM "any" :: LPARENS :: rest ->
        let list, rest = parse_list ~loc rest in
        (Any list, rest)
    | ATOM "all" :: LPARENS :: rest ->
        let list, rest = parse_list ~loc rest in
        (All list, rest)
    | ATOM "not" :: LPARENS :: rest -> (
        match do_parse ~loc rest with
        | pred, RPARENS :: rest -> (Not pred, rest)
        | _ -> failwith ~loc "Not expressions must have a single parameter")
    | ATOM ("any" | "all" | "not") :: _ ->
        failwith ~loc "Forms any/all/not must parenthesize its arguments"
    | LPARENS :: ATOM var :: EQ :: STRING s :: RPARENS :: rest ->
        (Pred { var; value = String s }, rest)
    | LPARENS :: ATOM var :: EQ :: NUMBER n :: RPARENS :: rest ->
        (Pred { var; value = Number n }, rest)
    | [ ATOM var; EQ; STRING s; RPARENS ] -> (Pred { var; value = String s }, [])
    | [ ATOM var; EQ; NUMBER n; RPARENS ] -> (Pred { var; value = Number n }, [])
    | ATOM var :: rest -> (Pred { var; value = String "true" }, rest)
    | _ ->
        failwith ~loc
          (Format.asprintf "Invalid sequence of tokens: %a" Lexer.pp tokens)

  and parse_list ~loc ?(acc = []) tokens =
    match tokens with
    | [] -> (List.rev acc, [])
    | COMMA :: RPARENS :: rest | RPARENS :: rest -> (List.rev acc, rest)
    | COMMA :: rest | rest ->
        let pred, rest = do_parse ~loc rest in
        parse_list ~loc rest ~acc:(pred :: acc)
end

module Eval = struct
  open Parser

  let value_equal a b =
    match (a, b) with
    | Number a1, Number a2 -> Int.equal a1 a2
    | String s1, String s2 -> String.equal s1 s2
    | _ -> false

  let rec do_eval ~loc ~env (parsetree : Parser.parsetree) =
    match parsetree with
    | Parser.Any trees -> List.exists (do_eval ~loc ~env) trees
    | Parser.All trees -> List.for_all (do_eval ~loc ~env) trees
    | Parser.Not tree -> not (do_eval ~loc ~env tree)
    | Parser.Pred { var; value } -> (
        match List.assoc_opt var env with
        | Some actual -> value_equal actual value
        | None -> false)

  let eval ~loc ~env str =
    let parsetree = Parser.parse ~loc str in
    do_eval ~loc ~env parsetree
end

let eval = Eval.eval

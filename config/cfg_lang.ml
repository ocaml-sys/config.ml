open Ppxlib

let error fmt = Spices.(default |> fg (color "#FF0000") |> build) fmt
let mint = Spices.color "#77e5b7"
let keyword fmt = Spices.(default |> fg mint |> build) fmt

type error = { loc : Location.t; error : string }

exception Error of error

let failwith ~loc error = 
  raise (Error { loc; error = error ^ "\n" })

(* let log = Printf.printf *)

module Parser = struct
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

  module Exp = struct
    let arg_list loc = function
      | [ (Nolabel, { pexp_desc = Pexp_tuple args; _ }) ] -> args
      | [ (Nolabel, arg) ] -> [ arg ]
      | _ -> failwith ~loc "Forms any/all/not must parenthesize its arguments"

    let one_arg loc = function
      | [ (Nolabel, { pexp_desc = Pexp_tuple _; _ }) ] ->
          failwith ~loc "Not expressions must have a single parameter"
      | [ (Nolabel, arg) ] -> arg
      | _ -> failwith ~loc "Forms any/all/not must parenthesize its arguments"

    let var loc = function
      | Nolabel, { pexp_desc = Pexp_ident { txt = Lident var; _ }; _ } -> var
      | _ -> failwith ~loc (Format.sprintf "Expected identifier")

    let value loc = function
      | Nolabel, { pexp_desc = Pexp_constant (Pconst_integer (i, _)); _ } ->
          Number (int_of_string i)
      | Nolabel, { pexp_desc = Pexp_constant (Pconst_string (s, _, _)); _ } ->
          String s
      | Nolabel, [%expr true] -> String "true"
      | _ -> failwith ~loc (Format.sprintf "Expected int, string or bool value")

    let rec parse ~loc (exp : expression) =
      let fail () =
        failwith ~loc
          (Format.asprintf "Invalid expression: %a" Pprintast.expression exp)
      in
      match exp.pexp_desc with
      | Pexp_apply (fn, args) -> (
          match fn with
          | [%expr any] -> Any (List.map (parse ~loc) (arg_list loc args))
          | [%expr all] -> All (List.map (parse ~loc) (arg_list loc args))
          | [%expr not] -> Not (parse ~loc (one_arg loc args))
          | [%expr ( = )] -> (
              match args with
              | [ x; y ] -> Pred { var = var loc x; value = value loc y }
              | _ -> fail ())
          | _ -> fail ())
      | Pexp_ident { txt = Lident var; _ } ->
          Pred { var; value = String "true" }
      | _ -> fail ()
  end

  let parse = Exp.parse
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

  let eval ~loc ~env exp =
    let parsetree = Parser.parse ~loc exp in
    do_eval ~loc ~env parsetree
end

let eval = Eval.eval

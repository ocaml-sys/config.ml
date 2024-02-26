open Ppxlib
open Cfg_lang

let keyword fmt = Spices.(default |> fg (color "#00FF00") |> build) fmt
let error fmt = Spices.(default |> fg (color "#FF0000") |> build) fmt
let loc = Location.none

let () =
  let test str expected =
    let actual_str =
      match Lexer.read ~loc str with
      | exception Cfg_lang.Error { error; _ } ->
          Format.sprintf "Exception: %S" error
      | actual -> Format.asprintf "%a" Lexer.pp actual
    in
    let expect_str = Format.asprintf "%a" Lexer.pp expected in

    if String.equal actual_str expect_str then
      Format.printf "lexer test %S %s\r\n%!" str (keyword "OK")
    else (
      Format.printf "%s\n\nExpected:\n\n%a\n\nbut found:\n\n%s\n\n"
        (error "Tokens do not match")
        Lexer.pp expected actual_str;
      assert false)
  in

  test "" [];
  test "not" [ ATOM "not" ];
  test "not any" [ ATOM "not"; ATOM "any" ];
  test "(target_os = \"macos\")"
    [ LPARENS; ATOM "target_os"; EQ; STRING "macos"; RPARENS ];
  test "any (macos)" [ ATOM "any"; LPARENS; ATOM "macos"; RPARENS ];
  test "all (target_os = \"macos\")"
    [ ATOM "all"; LPARENS; ATOM "target_os"; EQ; STRING "macos"; RPARENS ];
  test "any ((target_os = \"macos\"))"
    [
      ATOM "any";
      LPARENS;
      LPARENS;
      ATOM "target_os";
      EQ;
      STRING "macos";
      RPARENS;
      RPARENS;
    ];
  test "any (architecture = 2112)"
    [ ATOM "any"; LPARENS; ATOM "architecture"; EQ; NUMBER 2112; RPARENS ];
  test "any (target_os = \"macos\", another)"
    [
      ATOM "any";
      LPARENS;
      ATOM "target_os";
      EQ;
      STRING "macos";
      COMMA;
      ATOM "another";
      RPARENS;
    ];
  test
    {|
any
    ( target_os = "macos",
      target_os = "ios",
      target_os = "watchos",
      target_os = "tvos",
      not(all(target_os = "freebsd",
      target_os = "netbsd")),
      target_os = "linux" )


      |}
    [
      ATOM "any";
      LPARENS;
      ATOM "target_os";
      EQ;
      STRING "macos";
      COMMA;
      ATOM "target_os";
      EQ;
      STRING "ios";
      COMMA;
      ATOM "target_os";
      EQ;
      STRING "watchos";
      COMMA;
      ATOM "target_os";
      EQ;
      STRING "tvos";
      COMMA;
      ATOM "not";
      LPARENS;
      ATOM "all";
      LPARENS;
      ATOM "target_os";
      EQ;
      STRING "freebsd";
      COMMA;
      ATOM "target_os";
      EQ;
      STRING "netbsd";
      RPARENS;
      RPARENS;
      COMMA;
      ATOM "target_os";
      EQ;
      STRING "linux";
      RPARENS;
    ];

  ()

let () =
  let open Parser in
  let test str expected =
    let actual_str =
      match Parser.parse ~loc str with
      | exception Cfg_lang.Error { error; _ } ->
          Format.sprintf "Exception: %S" error
      | actual -> Format.asprintf "%a" Parser.pp actual
    in

    let expect_str = Format.asprintf "%a" Parser.pp expected in

    if String.equal actual_str expect_str then
      Format.printf "parser test %S %s\r\n%!" str (keyword "OK")
    else (
      Format.printf "%s\n\nExpected:\n\n%a\n\nbut found:\n\n%s\n\n"
        (error "In test %S Parse trees do not match" str)
        Parser.pp expected actual_str;
      assert false)
  in

  test "test" (Pred { var = "test"; value = String "true" });
  test "not(test)" (Not (Pred { var = "test"; value = String "true" }));

  test "(target = \"macos\")" (Pred { var = "target"; value = String "macos" });
  test "not((target = \"macos\"))"
    (Not (Pred { var = "target"; value = String "macos" }));

  test "all(target = \"macos\")"
    (All [ Pred { var = "target"; value = String "macos" } ]);

  test "all((target = \"macos\"), (what = \"nope\"))"
    (All
       [
         Pred { var = "target"; value = String "macos" };
         Pred { var = "what"; value = String "nope" };
       ]);

  test "any((target = \"macos\"), (what = \"nope\"))"
    (Any
       [
         Pred { var = "target"; value = String "macos" };
         Pred { var = "what"; value = String "nope" };
       ]);

  test "not(all((target = \"macos\"), (what = \"nope\")))"
    (Not
       (All
          [
            Pred { var = "target"; value = String "macos" };
            Pred { var = "what"; value = String "nope" };
          ]));

  test
    {|

any( (target_os = "macos"),
      (target_os = "ios"),
      (target_os = "watchos"),
      (target_os = "tvos"),
      not(all((target_os = "freebsd"), (target_os = "netbsd"))),
      (target_os = "linux") )


      |}
    (Any
       [
         Pred { var = "target_os"; value = String "macos" };
         Pred { var = "target_os"; value = String "ios" };
         Pred { var = "target_os"; value = String "watchos" };
         Pred { var = "target_os"; value = String "tvos" };
         Not
           (All
              [
                Pred { var = "target_os"; value = String "freebsd" };
                Pred { var = "target_os"; value = String "netbsd" };
              ]);
         Pred { var = "target_os"; value = String "linux" };
       ]);

  ()

let () =
  let test str env expected =
    let actual_str =
      match Eval.eval ~loc ~env str with
      | exception Cfg_lang.Error { error; _ } ->
          Format.sprintf "Exception: %S" error
      | actual -> Format.asprintf "%b" actual
    in

    let expect_str = Format.asprintf "%b" expected in

    if String.equal actual_str expect_str then
      Format.printf "eval test %S %s\r\n%!" str (keyword "OK")
    else (
      Format.printf "%s\n\nExpected:\n\n%b\n\nbut found:\n\n%s\n\n"
        (error "In test %S eval result does not match" str)
        expected actual_str;
      assert false)
  in

  test "test" [ ("test", String "false") ] false;
  test "test" [ ("test", String "true") ] true;
  test "not(test)" [ ("test", String "true") ] false;
  test "not(test)" [ ("test", String "false") ] true;
  test "(name = \"rush\")" [ ("name", String "rush") ] true;
  test "(album = 2112)" [ ("album", Number 2112) ] true;
  test "any((album = 2113), (name =\"rush\"))" [ ("album", Number 2113) ] true;
  test "all((album = 2113), (name =\"rush\"))"
    [ ("album", Number 2113); ("name", String "rush") ]
    true;
  test "not(all((album = 2113), (name =\"rush\")))"
    [ ("album", Number 2113); ("name", String "rush") ]
    false;

  test
    {|
any(  (target_os = "macos"),
      (target_os = "ios"),
      (target_os = "watchos"),
      (target_os = "tvos"),
      not(all((target_os = "freebsd"), (target_arch = "js"))),
      (target_os = "linux") )
      |}
    [ ("target_arch", String "freebsd"); ("target_arch", String "js") ]
    true;

  ()

let () = Format.printf "%s %s %s" Cfg.target_arch Cfg.target_os Cfg.target_env

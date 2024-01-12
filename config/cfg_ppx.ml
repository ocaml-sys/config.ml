open Ppxlib

let log = Printf.printf
let tag = "config"

let env =
  let open Cfg_lang.Parser in
  (Unix.environment () |> Array.to_list
  |> List.map (fun kv ->
         let[@warning "-8"] (k :: v) = String.split_on_char '=' kv in
         (k, String (String.concat "=" v))))
  @ [
      ("target_os", String Cfg.target_os);
      ("target_arch", String Cfg.target_arch);
    ]

let apply_config stri =
  try
    match stri.pstr_desc with
    | Pstr_module { pmb_attributes = [ attr ]; _ } -> (
        let loc = attr.attr_loc in
        match attr.attr_payload with
        | PStr payload ->
            let payload = Pprintast.string_of_structure payload in
            (* NOTE(leostera): payloads begin with `;;` *)
            let payload = String.sub payload 2 (String.length payload - 2) in
            (* Printf.printf "\n\npayload: %S\n\n" payload; *)
            if Cfg_lang.eval ~loc ~env payload then Some stri else None
        | _ -> Some stri)
    | _ -> Some stri
  with Cfg_lang.Error { loc; error } ->
    let ext = Location.error_extensionf ~loc "%s" error in
    Some (Ast_builder.Default.pstr_extension ~loc ext [])

let impl str = List.filter_map apply_config str
let () = Driver.register_transformation tag ~impl

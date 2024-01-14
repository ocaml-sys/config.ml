open Ppxlib

let tag = "config"

let user_env =
  Unix.environment () |> Array.to_list
  |> List.map (fun kv ->
         let[@warning "-8"] (k :: v) = String.split_on_char '=' kv in
         (k, String.concat "=" v))

let env =
  user_env
  @ [
      ("target_os", Cfg.target_os);
      ("target_arch", Cfg.target_arch);
      ("target_env", Cfg.target_env);
    ]
  |> List.sort_uniq (fun (k1, _) (k2, _) -> String.compare k1 k2)

let () =
  if Option.is_some (Sys.getenv_opt "CONFIG_DEBUG") then (
    Format.printf "Config PPX running with environment:\n\n%!";
    List.iter (fun (k, v) -> Format.printf "  %s = %S\r\n" k v) env;
    Format.printf "\n%!")

let env = List.map (fun (k, v) -> (k, Cfg_lang.Parser.String v)) env

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

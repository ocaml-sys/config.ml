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

let eval_attr attr =
  if not (String.equal attr.attr_name.txt tag) then `keep
  else
    let loc = attr.attr_loc in
    (* Printf.printf "\n\nattr name: %S\n\n" attr.attr_name.txt; *)
    match attr.attr_payload with
    | PStr payload ->
        let payload = Pprintast.string_of_structure payload in
        (* NOTE(leostera): payloads begin with `;;` *)
        let payload = String.sub payload 2 (String.length payload - 2) in
        (* Printf.printf "\n\npayload: %S\n\n" payload; *)
        if Cfg_lang.eval ~loc ~env payload then `keep else `drop
    | _ -> `keep

let rec should_keep attrs =
  match attrs with
  | [] -> `keep
  | attr :: attrs -> if eval_attr attr = `drop then `drop else should_keep attrs

let rec should_keep_many list fn =
  match list with
  | [] -> `keep
  | item :: list ->
      if should_keep (fn item) = `drop then `drop else should_keep_many list fn

let apply_config_on_types (tds : type_declaration list) =
  List.filter_map
    (fun td ->
      match td with
      | { ptype_kind = Ptype_abstract; _ } -> Some td
      | { ptype_kind = Ptype_variant cstrs; _ } ->
          let cstrs =
            List.filter_map
              (fun cstr ->
                if should_keep cstr.pcd_attributes = `keep then Some cstr
                else None)
              cstrs
          in

          if cstrs = [] then None
          else Some { td with ptype_kind = Ptype_variant cstrs }
      | { ptype_kind = Ptype_record labels; _ } ->
          let labels =
            List.filter_map
              (fun label ->
                if should_keep label.pld_attributes = `keep then Some label
                else None)
              labels
          in

          if labels = [] then None
          else Some { td with ptype_kind = Ptype_record labels }
      | { ptype_kind = Ptype_open; _ } -> Some td)
    tds

let apply_config stri =
  try
    match stri.pstr_desc with
    | Pstr_typext { ptyext_attributes = attrs; _ }
    | Pstr_modtype { pmtd_attributes = attrs; _ }
    | Pstr_open { popen_attributes = attrs; _ }
    | Pstr_include { pincl_attributes = attrs; _ }
    | Pstr_exception { ptyexn_attributes = attrs; _ }
    | Pstr_primitive { pval_attributes = attrs; _ }
    | Pstr_eval (_, attrs)
    | Pstr_module { pmb_attributes = attrs; _ } ->
        if should_keep attrs = `keep then Some stri else None
    | Pstr_value (_, vbs) ->
        if should_keep_many vbs (fun vb -> vb.pvb_attributes) = `keep then
          Some stri
        else None
    | Pstr_type (recflag, tds) ->
        if should_keep_many tds (fun td -> td.ptype_attributes) = `keep then
          let tds = apply_config_on_types tds in
          Some { stri with pstr_desc = Pstr_type (recflag, tds) }
        else None
    | Pstr_recmodule md ->
        if should_keep_many md (fun md -> md.pmb_attributes) = `keep then
          Some stri
        else None
    | Pstr_class cds ->
        if should_keep_many cds (fun cd -> cd.pci_attributes) = `keep then
          Some stri
        else None
    | Pstr_class_type ctds ->
        if should_keep_many ctds (fun ctd -> ctd.pci_attributes) = `keep then
          Some stri
        else None
    | Pstr_extension _ | Pstr_attribute _ -> Some stri
  with Cfg_lang.Error { loc; error } ->
    let ext = Location.error_extensionf ~loc "%s" error in
    Some (Ast_builder.Default.pstr_extension ~loc ext [])

let preprocess_impl str =
  match str with
  | { pstr_desc = Pstr_attribute attr; _ } :: rest
    when String.equal attr.attr_name.txt tag ->
      if eval_attr attr = `keep then rest else []
  | _ -> List.filter_map apply_config str

let () = Driver.register_transformation tag ~preprocess_impl

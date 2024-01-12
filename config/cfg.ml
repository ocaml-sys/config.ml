external config_target_os : unit -> string = "caml_config_target_os"
external config_target_arch : unit -> string = "caml_config_target_arch"

let target_os = config_target_os ()
let target_arch = config_target_arch ()

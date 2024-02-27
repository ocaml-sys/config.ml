(* conditional compilation with an attribute *)

(** ignored comments *)
let _ignored_variable = 0

module Cond_external = Cond_external
module Cond_typeext = Cond_typeext
module Cond_modtype = Cond_modtype
module Cond_modopen = Cond_modopen
module Cond_modinclude = Cond_modinclude
module Cond_exception = Cond_exception
module Cond_eval = Cond_eval
module Cond_module = Cond_module
module Cond_value = Cond_value
module Cond_type = Cond_type
module Cond_type_var_constructor = Cond_type_var_constructor
module Cond_type_record_field = Cond_type_record_field
module Cond_recmod = Cond_recmod
module Cond_class = Cond_class

module Whole_mod = Whole_mod

module Env = struct
  let name = "gnu"
end
[@@config target_env = "gnu"]

module Env = struct
  let name = "musl"
end
[@@config target_env = "musl"]

module Env = struct
  let name = "unknown"
end
[@@config target_env = ""]

module Sys = Sys_unix
[@@config
  any
    ( target_os = "macos",
      target_os = "ios",
      target_os = "watchos",
      target_os = "tvos",
      target_os = "freebsd",
      target_os = "netbsd",
      target_os = "linux" )]

module Sys = Sys_win32
[@@config all (target_os = "windows", target_arch = "x86")]

module Sys = Sys_win64
[@@config all (target_os = "windows", target_arch = "arm")]

let () = Printf.printf "sys=%s" Sys.name
(* will print "sys=unix" on my mac! *)

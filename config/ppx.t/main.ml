(* conditional compilation with an attribute *)

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

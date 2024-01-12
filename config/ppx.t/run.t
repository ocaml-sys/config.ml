  $ target_os=macos dune describe pp main.ml
  [@@@ocaml.ppx.context
    {
      tool_name = "ppx_driver";
      include_dirs = [];
      load_path = [];
      open_modules = [];
      for_package = None;
      debug = false;
      use_threads = false;
      use_vmthreads = false;
      recursive_types = false;
      principal = false;
      transparent_modules = false;
      unboxed_types = false;
      unsafe_string = false;
      cookies = []
    }]
  module Sys = Sys_unix[@@config
                         any
                           ((target_os = "macos"), (target_os = "ios"),
                             (target_os = "watchos"), (target_os = "tvos"),
                             (target_os = "freebsd"), (target_os = "netbsd"),
                             (target_os = "linux"))]
  let () = Printf.printf "sys=%s" Sys.name
  $ dune clean
  $ target_os=windows target_arch=x86 dune describe pp main.ml
  [@@@ocaml.ppx.context
    {
      tool_name = "ppx_driver";
      include_dirs = [];
      load_path = [];
      open_modules = [];
      for_package = None;
      debug = false;
      use_threads = false;
      use_vmthreads = false;
      recursive_types = false;
      principal = false;
      transparent_modules = false;
      unboxed_types = false;
      unsafe_string = false;
      cookies = []
    }]
  module Sys = Sys_win32[@@config
                          all ((target_os = "windows"), (target_arch = "x86"))]
  let () = Printf.printf "sys=%s" Sys.name

  $ dune clean
  $ target_os=windows target_arch=arm dune describe pp main.ml
  [@@@ocaml.ppx.context
    {
      tool_name = "ppx_driver";
      include_dirs = [];
      load_path = [];
      open_modules = [];
      for_package = None;
      debug = false;
      use_threads = false;
      use_vmthreads = false;
      recursive_types = false;
      principal = false;
      transparent_modules = false;
      unboxed_types = false;
      unsafe_string = false;
      cookies = []
    }]
  module Sys = Sys_win64[@@config
                          all ((target_os = "windows"), (target_arch = "arm"))]
  let () = Printf.printf "sys=%s" Sys.name

  $ dune clean
  $ dune exec ./main.exe

  $ dune clean
  $ target_os=windows target_arch=x86 dune exec ./main.exe

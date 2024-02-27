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
  let _ignored_variable = 0[@@ocaml.doc " ignored comments "]
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
  let _ignored_variable = 0[@@ocaml.doc " ignored comments "]
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
  let _ignored_variable = 0[@@ocaml.doc " ignored comments "]
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
  module Sys = Sys_win64[@@config
                          all ((target_os = "windows"), (target_arch = "arm"))]
  let () = Printf.printf "sys=%s" Sys.name

  $ dune clean
  $ dune exec ./main.exe
  sys=unix

  $ dune clean
  $ target_os=windows target_arch=x86 dune exec ./main.exe
  sys=win32

  $ dune clean
  $ dune build

  $ dune clean
  $ target_os=madeup dune describe pp whole_mod.ml
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

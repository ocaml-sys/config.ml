  $ target_os=macos target_env="" dune describe pp main.ml
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
  module Env = struct let name = "unknown" end[@@config target_env = ""]
  module Sys = Sys_unix[@@config
                         any
                           ((target_os = "macos"), (target_os = "ios"),
                             (target_os = "watchos"), (target_os = "tvos"),
                             (target_os = "freebsd"), (target_os = "netbsd"),
                             (target_os = "linux"))]
  let () = Printf.printf "sys=%s env=%s" Sys.name Env.name

  $ dune clean
  $ target_os=windows target_arch=x86 target_env="" dune describe pp main.ml
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
  module Env = struct let name = "unknown" end[@@config target_env = ""]
  module Sys = Sys_win32[@@config
                          all ((target_os = "windows"), (target_arch = "x86"))]
  let () = Printf.printf "sys=%s env=%s" Sys.name Env.name

  $ dune clean
  $ target_os=windows target_arch=arm target_env="" dune describe pp main.ml
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
  module Env = struct let name = "unknown" end[@@config target_env = ""]
  module Sys = Sys_win64[@@config
                          all ((target_os = "windows"), (target_arch = "arm"))]
  let () = Printf.printf "sys=%s env=%s" Sys.name Env.name

  $ dune clean
  $ value=1 made_up=false target_os=windows target_arch=x86 target_env="" dune exec ./main.exe
  sys=win32 env=unknown

  $ dune clean
  $ value=1 dune build

  $ dune clean
  $ value=1 target_os=madeup dune describe pp whole_mod.ml
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
  external foo : unit -> int = "made_up_call"

  $ dune clean
  $ value=1 target_os=madeup dune describe pp cond_module.ml
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
  module type A  =
    sig
      val best_band_in_the_world : string[@@cfg value = "1"]
      val get_upper_case_band_name : string -> string[@@cfg value = "1"]
    end
  module B : A =
    struct
      let best_band_in_the_world = "RUSH"[@@cfg value = "1"]
      let get_upper_case_band_name name = name[@@cfg value = "1"]
    end 
  module C : sig val best_band_in_the_world : string[@@cfg value = "1"] end =
    struct let best_band_in_the_world = "RUSH"[@@cfg value = "1"] end 
  let rush () = C.best_band_in_the_world

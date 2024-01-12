# config.ml

Ergonomic, lightweight conditional compilation through attributes inspired by Rust's `cfg` macro.

Config implements the `[@@config]` annotation, to conditionally compile
modules. You can use a small boolean language to check for conditions including
some built-in ones and environment variables.

## Getting Started

```
opam install config
```

And add it to your dune files:

```
(library
  (name my_lib)
  (preprocess (pps config.ppx)))
```

And tag your modules with the `@@config` attribute:

```ocaml
module A = A_unix [@@config any(target_os = "macos", target_os = "linux")]
module A = A_win32 [@@config any(target_os = "windows")]
```

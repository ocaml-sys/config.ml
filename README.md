# config.ml

Ergonomic, lightweight conditional compilation through attributes inspired by Rust's `cfg` macro.

Config implements the `[@@config]` annotation, to conditionally compile
modules. You can use a small boolean language to check for conditions including
some built-in ones and environment variables.

Currently includes/detects the following platforms:

* Windows 32/64
* macOS/tvOS/watchOS/iOS
* FreeBSD/NetBSD
* Android
* Linux

And the following architectures:

* x86-64
* x86 i386
* aarch64
* arm

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

## Contributing

Currently `config` relies on C preprocessor definitions to detect different
platforms and architectures. They are straightforward to add by extending the
file `./config/config_stubs.cl`. In there :

* To add a new platform, extend the main if-else chain in the
  `caml_config_target_os` function to include your OS.

* To add a new architecture, extend the main if-else chain in the
  `caml_config_target_arch` function to include your architecture.

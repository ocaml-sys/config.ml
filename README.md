# config.ml

Ergonomic, lightweight conditional compilation through attributes inspired by
Rust's `cfg` macro.

Config implements the `[@@config]` annotation, to conditionally compile
modules. You can use a small boolean language to check for conditions including
some built-in ones and environment variables.

It can be used to conditionally include/exclude:

* modules
* let bindings
* includes
* type definitions
* constructors from variant types and polymorphic variants
* fields from record types
* and more

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

And the following environment:

* msvc
* gnu
* musl

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

And tag your values with the `@@config` attribute:

```ocaml
module A = A_unix [@@config any(target_os = "macos", target_os = "linux")]
module A = A_win32 [@@config any(target_os = "windows")]
```

## The Config Language

Config implements a very small boolean language with 4 operations:

* `var = value`, that checks if a variable (from the environment or provided by
  config) is equals to a value. Equality is string or integer equality.
* `all(expr1, expr2, ...)`, expects all expressions to be true
* `any(expr1, expr2, ...)`, expects any expression to be true
* `not(expr)`, negates an expression

To define new variables you can pass them in as environment variables:

```
; export BAND="rush" dune build
```

And you'll be able to write `(BAND = "rush")`

## Cookbook

### Enabling/Disabling Modules and Includes

```ocaml
module Pro_mode_env = struct
  let name = "pro-mode"
  let coins = 2112
end
[@@config (project_mode = "pro")]

include Pro_mode_env
[@@config (project_mode = "pro")]
```

### Enabling/Disabling Let definitions

```ocaml
let favorite_band = "rush"
[@@config (is_rush_fan = true)]

let favorite_band = "unknown"
[@@config not (is_rush_fan = true)]
```

### Enabling/Disabling Externals

```ocaml
external dog_bark : unit -> int = "dog_bark"
[@@config (includes = "dog")]
```

### Enabling/Disabling Types

```ocaml
type band = { name: string }
[@@config (use_band = true)]
```

### Enabling/Disabling Variant Constructors

```ocaml
type favorite_bands = 
  | Rush
  | Yes
  | KingCrimson [@config (likes_trumpets = true)]

type has_published_album_recently = 
  [ `nope
  | `yes
  | `maybe [@config (is_indecisive = true)]
  ]
```

### Enabling/Disabling Record Fields

```ocaml
type user = {
  name: string;
  pass: string [@config (password_mode = "clear")];
  pass: Password.t [@config (password_mode = "encrypted")];
}
```

### Enabling/Disabling entire Modules

```ocaml
[@@@config (should_include = "no")]

let do_not_include_me = failwith "oh no"
```

## Contributing

Currently `config` relies on C preprocessor definitions to detect different
platforms and architectures. They are straightforward to add by extending the
file `./config/config_stubs.cl`. In there :

* To add a new platform, extend the main if-else chain in the
  `caml_config_target_os` function to include your OS.

* To add a new architecture, extend the main if-else chain in the
  `caml_config_target_arch` function to include your architecture.

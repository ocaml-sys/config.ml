(lang dune 3.11)
(using mdx 0.4)

(name config)

(generate_opam_files true)
(cram enable)

(source
 (github leostera/config.ml))

(authors "Leandro Ostera <leandro@abstractmachines.dev>")

(maintainers "Leandro Ostera <leandro@abstractmachines.dev>")

(license MIT)

(package
  (name config)
  (synopsis "Ergonomic, lightweight conditional compilation through attributes")
  (description "Config implements the [@@config] annotation, to conditionally compile modules. You can use a small boolean language to check for conditions including some built-in ones and environment variables.")
  (depends
    (ppxlib (>= 0.31.0))
    (ocaml (>= "5.1"))
    dune)
  (tags (conditional compilation target_os target_arch arch os system)))

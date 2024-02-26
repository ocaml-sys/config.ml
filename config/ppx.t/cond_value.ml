let best_band_in_the_world () = "rush"
[@@config (made_up = true)]

let print_band () = print_endline (best_band_in_the_world ())
[@@config (made_up = true)]

(** ignored comments *)
let hello = "world"

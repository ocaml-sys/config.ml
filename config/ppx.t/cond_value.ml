let best_band_in_the_world () = "rush"
[@@config (made_up = true)]

let print_band () = print_endline (best_band_in_the_world ())
[@@config (made_up = true)]

(* Applying config on a single value binding 
   should remove all value bindings. *)
let () = print_band () and 
print_name1 name = print_endline name 
[@@config (made_up = true)]

(** ignored comments *)
let hello = "world"

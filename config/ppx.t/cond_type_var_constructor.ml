type band = 
  | Rush
  | Yes
  | KingCrimson [@config (made_up = true)]
  | TheXX [@config (not (value = "1"))]
  | TheWho [@config (not (the_who))]
  | Beatles [@config (not (value = true))]

(* this pattern matching is exhaustive because the config removes the
   KingCrimson constructor *)
let best_band_in_the_world x =
  match x with
  | Rush -> true
  | Yes -> false
  | Beatles -> false
  | TheWho -> false

type band_polyvar = [
  | `Rush
  | `Yes
  | `KingCrimson [@config (made_up=true)]
]

let the_best_band_in_the_world (x: band_polyvar) =
  match x with
  | `Rush -> true
  | `Yes -> false

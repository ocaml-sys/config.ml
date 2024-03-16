type band = 
  | Rush
  | Yes
  | KingCrimson [@config (made_up = "false")]
  | TheXX [@config (not (value = "1"))]
  | TheWho [@config (not (the_who))]
  | Beatles [@config (not (value = true))]

(* this pattern matching is exhaustive because the config removes the
   KingCrimson & TheXX constructor *)
let best_band_in_the_world x =
  match x with
  | Rush -> true
  | Yes -> false
  | KingCrimson -> false [@config (made_up = "false")]

and worst_band_in_the_world = function 
| Rush -> false
| Yes -> false
| KingCrimson -> true [@config (made_up = "false")]
| TheWho -> false
| Beatles -> false

type band_polyvar = [
  | `Rush
  | `Yes
  | `KingCrimson [@config (made_up = true)]
  | `TheXX [@config (not (value = "1"))]
  | `TheWho [@config (not (the_who))]
  | `Beatles [@config (not (value = true))]
]

let the_best_band_in_the_world (x: band_polyvar) =
  match x with
  | `Rush -> true
  | `Yes -> false
  | `KingCrimson -> false [@config (made_up = true)]
  | `TheWho -> false
  | `Beatles -> false

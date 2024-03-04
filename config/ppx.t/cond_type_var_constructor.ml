type band = 
  | Rush
  | Yes
  | KingCrimson [@config (made_up = "false")]

let best_band_in_the_world x =
  match x with
  | Rush -> true
  | Yes -> false
  | KingCrimson -> false [@config (made_up = "false")]

and worst_band_in_the_world = function 
| Rush -> false
| Yes -> false
| KingCrimson -> true [@config (made_up = "false")]

type band_polyvar = [
  | `Rush
  | `Yes
  | `KingCrimson [@config (made_up = true)]
]

let the_best_band_in_the_world (x: band_polyvar) =
  match x with
  | `Rush -> true
  | `Yes -> false
  | `KingCrimson -> false [@config (made_up = true)]

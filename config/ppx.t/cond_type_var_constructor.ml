type band = 
  | Rush
  | Yes
  | KingCrimson [@config (made_up = true)]

(* this pattern matching is exhaustive because the config removes the
   KingCrimson constructor *)
let best_band_in_the_world x =
  match x with
  | Rush -> true
  | Yes -> false

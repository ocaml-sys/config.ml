module M = struct
  let best_band_in_the_world = "RUSH"
end
[@@config (made_up = true)]

let rush () = M.best_band_in_the_world
[@@config (made_up = true)]

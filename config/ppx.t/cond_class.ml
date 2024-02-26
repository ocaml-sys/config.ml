class type best_band_in_the_world = object
  method name : string
end
[@@config (skip= true)]

class the_actual_best_band: best_band_in_the_world =
  object (_self)
    method name = "rush"
  end
[@@config (skip= true)]

let print () = (new the_actual_best_band)#name
[@@config (skip= true)]

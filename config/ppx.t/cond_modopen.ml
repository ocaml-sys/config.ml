module M = struct
  let rush_2112 = "2112"
end

open M
[@@config (made_up = true)]

let best_album_in_the_world = "it's " ^ rush_2112
[@@config (made_up = true)]

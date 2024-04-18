module type M = sig
  val best_band_in_the_world : string [@@cfg (value = "1")]
  val worst_band_in_the_world : string [@@cfg (value = "2")]
  val get_lower_case_band_name : string -> string [@@cfg (value = "2")]
  val get_upper_case_band_name : string -> string [@@cfg (value = "1")]
end

module O:M = struct
  let best_band_in_the_world = "RUSH" [@@cfg (value = "1")]
  let worst_band_in_the_world = "Nickelback" [@@cfg (value = "2")]
  let get_lower_case_band_name name = name [@@cfg (value = "2")]
  let get_upper_case_band_name name = name [@@cfg (value = "1")]
end

module N : sig
  val best_band_in_the_world : string [@@cfg (value = "1")]
  val worst_band_in_the_world : string [@@cfg (value = "2")]
end  =  struct
  let best_band_in_the_world = "RUSH" [@@cfg (value = "1")]
  let worst_band_in_the_world = "Nickelback" [@@cfg (value = "2")]
end 

let rush () = N.best_band_in_the_world
let nickelback () = N.worst_band_in_the_world [@@cfg (value = "2")]
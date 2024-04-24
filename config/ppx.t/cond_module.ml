module type A = sig
  val best_band_in_the_world : string [@@cfg (value = "1")]
  val worst_band_in_the_world : string [@@cfg (value = "2")]
  val get_lower_case_band_name : string -> string [@@cfg (value = "2")]
  val get_upper_case_band_name : string -> string [@@cfg (value = "1")]
end

module B:A = struct
  let best_band_in_the_world = "RUSH" [@@cfg (value = "1")]
  let worst_band_in_the_world = "Nickelback" [@@cfg (value = "2")]
  let get_lower_case_band_name name = name [@@cfg (value = "2")]
  let get_upper_case_band_name name = name [@@cfg (value = "1")]
end

module C : sig
  val best_band_in_the_world : string [@@cfg (value = "1")]
  val worst_band_in_the_world : string [@@cfg (value = "2")]
end  =  struct
  let best_band_in_the_world = "RUSH" [@@cfg (value = "1")]
  let worst_band_in_the_world = "Nickelback" [@@cfg (value = "2")]
end 

module D = struct
  let best_band_in_the_world = "RUSH" [@@cfg (value = "1")]
  let worst_band_in_the_world = "Nickelback" [@@cfg (value = "2")]
end
[@@cfg (value = "2")]

let rush () = C.best_band_in_the_world
let nickelback () = C.worst_band_in_the_world [@@cfg (value = "2")]
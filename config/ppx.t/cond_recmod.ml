module rec A : sig 
  val band : string
end= struct
  let band = "rush"
end
and B : sig
  val album  : string
end = struct
  let album = "2112"
end
[@@config (skip= true)]

let print () = A.band ^ "-" ^ B.album
[@@config (skip= true)]

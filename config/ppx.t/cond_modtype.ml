module type I = sig
  type what
end
[@@config (made_up = true)]

module M: I = struct
  type what = unit
end
[@@config (made_up = true)]

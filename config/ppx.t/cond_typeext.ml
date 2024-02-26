type t = ..
type t += | Goodbye

type t += | Hello
[@@config (made_up = true)]

let a: t = Goodbye

let a: t = Hello
[@@config (made_up = true)]



(** this is an external call that if we can't disable via the config
    flag, will fail, because we can't find the `made_up_call` symbol at
    linking time *)
external foo : unit -> int = "made_up_call"
[@@config (made_up = true)]

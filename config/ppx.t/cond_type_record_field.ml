type band =  {
  name: string;
  is_rush: bool [@config (made_up = true)];
}

(* this pattern matching is exhaustive because the config removes the
   `is_rush` constructor *)
let get_name { name } = name

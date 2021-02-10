(* First we need some date for Pattern Matching *)

let myList = [1;3;5;6;8]

let rec sum lst =
  match lst with
  | [] -> 0
  | h::t -> h + sum t;;

sum myList (* => 23 *)


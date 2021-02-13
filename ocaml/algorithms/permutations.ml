(* Calculating n! permutations
   We use std modules here
   https://caml.inria.fr/pub/docs/manual-ocaml/libref/List.html
*)

(* Counter: 1 -> This counter reach 3 -> finished -> if not -> read C14 *)

(* Method 1 -> The insert-to-all-positions / brutal force *)

let rec insert_e element seen l=
  match l with
    []->[ seen @ [element]]
  | h::t->( seen @ element::h::t )::insert_e element (seen @ [h]) t

let insert_element_to_list element l=
  insert_e element [] l
(* Step 3:
   Assuming X is the inserted element, o is 3 original list elements
   We would like to get folling lists
   x o o o
   o x o o
   o o x o
   o! o o x
   Note that we would keep track of the elements before x -> `seen`
   We always put the `seen` at beginning for next round,
   followed by our element to be inserted
   i.e. (seen @ element :: h::t)
   h::t means complete original list
   ----
   We then put the first element to the `seen`,
   the `seen` would be [o] now
   then the head element would be the head of the tail from last round.
   concat the (seen @ element :: h::t) again, then go next round,
   the `seen` would be [o;o],
   contact again.
   Finally we would get the four lists we desired.
*)
let insert_to_all_lists element lists =
  List.concat (List.map (insert_element_to_list element ) lists)
(* Step 2:
   Apply the insert_element function to each lists
   and combine/concate them
*)
let rec permutate l =
  match l with
    []-> [[]]
  | h::t -> insert_to_all_lists h (permutate t);;
(* Step1:
   Assuming we have know the permutates other than the head.
   We can then insert the head to all possitions on each permutates.
*)

permutate [1;2;3;4];

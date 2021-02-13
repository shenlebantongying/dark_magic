(* JS's Core overides some functions*)
open Core;;


(*
Note that (printf "%d \n") is actually a currying. The another
paramater would come from List.iter
*)

List.iter ~f:(printf "%d \n") [1;2;3];;

(* What is the ~f: thing?*)
(* Its Labeled arguments *)
let frac ~numerator ~denominator =
  Float.of_int numerator /. Float.of_int denominator;;

(* We can use it in two ways*)
let numerator = 3 in
let denominator = 4 in
printf "%f \n" (frac ~numerator ~denominator);;

(* or a more direct way *)

frac ~numerator:3 ~denominator:4;;

(* Combine Higher-order functions and Labeled functions *)

let apply_to_tuple f (first,second) = f ~first ~second;;
(*
# val apply_to_tuple : (first:'a -> second:'b -> 'c) -> 'a * 'b -> 'c = <fun>
*)

let divide ~first ~second = first /. second;;

apply_to_tuple divide (3.0,4.0);;

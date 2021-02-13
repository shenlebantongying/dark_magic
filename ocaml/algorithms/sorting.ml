(*
According to "Introduction to algorithms 3rd"

There are 7 approaches for sorting
*)
open Base;;                     (* Just to get defination of drop & take *)

(* Approach 1: insertion sort *)

let rec insert x l=
  match l with
    []->[x]
  | h::t ->
    if x<=h
    then x::h::t
    else h::insert x t

let rec insertion_sort =function
    [] -> []
  | h::t -> insert h (insertion_sort t);;
(* Assuming we have the function to get a sorted tail,
   we just have to insert head in to the tail
   which will created a call to sort the tail
   which will result in a sort for deeper tail
   eventually the rec would return an [], then
   the rec calls would move back with insert for
   each levels
*)

insertion_sort [9;3;4;1;10]

(* Approach 2: merge sort *)

let rec merge x y =             (* Conquer *)
  match x,y with
    [],r ->r
  | l ,[]->l
  | hx::tx,hy::ty ->
    if hx < hy
    then hx::merge tx (hy::ty)  (* Pick the smaller one beteween two heads*)
    else hy::merge ty (hx::tx)  (* Put it in front then let the rest keep comparing *)

let rec merge_sort l=
  match l with
    []->[]
  | [x]-> [x]                   (* 1 or 0 elements no need to sort *)
  | __ ->
    let left  = List.take l (List.length l / 2)  in
    let right = List.drop l (List.length l / 2)  in
    merge(merge_sort left) (merge_sort right);; (* Dividing *)

merge_sort [6; 4; 5; 7; 2; 5; 3; 4];;

(*
[6; 4; 5; 7; 2; 5; 3; 4]
[6; 4; 5; 7][2; 5; 3; 4]
[6; 4][5; 7][2; 5][3; 4]
[6][4][5][7][2][5][3][4]
[4; 6][5; 7][2; 5][3; 4]
[4; 5; 6; 7][2; 3; 4; 5]
[2; 3; 4; 4; 5; 5; 6; 7]
*)

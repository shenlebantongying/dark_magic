(* 
This file is mean to be build with dune system!
use `make playground`
*)

class stack_of_ints =
    object (_)
      val mutable the_list = ( [] : int list ) (* instance variable *)
      method push x =                        (* push method *)
        the_list <- x :: the_list
      method pop =                           (* pop method *)
        let result = List.hd the_list in
        the_list <- List.tl the_list;        (*TODO: this do not working hwen open Core! *) 
        result
      method peek =                          (* peek method *)
        List.hd the_list
       method size =                          (* size method *)
        List.length the_list
    end;;

let mystack = new stack_of_ints;;

mystack#push 1;
print_int mystack#peek;



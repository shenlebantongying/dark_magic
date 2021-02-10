(* Basic defination *)

class point x_init =
  object (self) 
    val mutable x = x_init
    method get_x = x
    method move d = x <- x + d
    method print = print_int self#get_x
  end;;

let p = new point 5;;

p#move 10;;
p#get_x;;
p#print;;

(* inheritance *)


class colored_point x (c:string) =
  object
    inherit point x
    val c = c
    method color = c
  end;;

let p' = new colored_point 100 "red";;
p'#color;;

(* generic programming or Parameterized classes *)

class ['a] gereric_x (x_init:'a) =
  object
    val mutable x = x_init
    method get =x
    method set y = x <- y
  end;;

(* =>>>
 class ['a] gereric_x :
  'a -> object val mutable x : 'a method get : 'a method set : 'a -> unit end

   it means, give a generic type 'a, it will return an object with some methods
*)

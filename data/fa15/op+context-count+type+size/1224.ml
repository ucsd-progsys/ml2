
let rec listReverse l =
  match l with | [] -> [] | x::y -> (listReverse y) :: x;;


(* fix

let rec listReverse l =
  match l with | [] -> [] | x::y -> (listReverse y) @ [x];;

*)

(* changed spans
(3,38)-(3,51)
(3,38)-(3,57)
(3,56)-(3,57)
*)

(* type error slice
(2,4)-(3,59)
(2,21)-(3,57)
(3,3)-(3,57)
(3,38)-(3,49)
(3,38)-(3,51)
(3,38)-(3,57)
(3,38)-(3,57)
*)

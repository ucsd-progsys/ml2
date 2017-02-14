
let rec listReverse l =
  match l with | h::[] -> h | h::t -> [listReverse t; h];;


(* fix

let rec listReverse l =
  match l with | [] -> [] | h::t -> h :: (listReverse t);;

*)

(* changed spans
(3,3)-(3,57)
(3,27)-(3,28)
(3,39)-(3,57)
(3,55)-(3,56)
*)

(* type error slice
(3,3)-(3,57)
(3,3)-(3,57)
(3,3)-(3,57)
(3,3)-(3,57)
(3,3)-(3,57)
(3,3)-(3,57)
(3,27)-(3,28)
(3,39)-(3,57)
(3,39)-(3,57)
(3,55)-(3,56)
*)

let rec listReverse l =
  match l with | [] -> [] | h::t -> [t] @ (listReverse h);;


(* fix

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

*)

(* changed spans
(3,36)-(3,39)
(3,37)-(3,38)
(3,55)-(3,56)
*)

(* type error slice
(2,3)-(3,59)
(2,20)-(3,57)
(3,2)-(3,57)
(3,2)-(3,57)
(3,8)-(3,9)
(3,42)-(3,57)
(3,43)-(3,54)
(3,55)-(3,56)
*)

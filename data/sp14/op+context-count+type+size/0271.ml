
let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) :: h;;


(* fix

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

*)

(* changed spans
(3,36)-(3,51)
(3,36)-(3,56)
(3,55)-(3,56)
*)

(* type error slice
(2,3)-(3,58)
(2,20)-(3,56)
(3,2)-(3,56)
(3,36)-(3,51)
(3,36)-(3,56)
(3,36)-(3,56)
(3,37)-(3,48)
*)

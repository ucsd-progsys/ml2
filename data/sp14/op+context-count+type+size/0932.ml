
let rec digitsOfInt n =
  if n < 0 then [] else (n mod 10) :: ((digitsOfInt n) * 10);;


(* fix

let rec digitsOfInt n = if n < 0 then [] else (n mod 10) :: (digitsOfInt n);;

*)

(* changed spans
(3,38)-(3,60)
(3,57)-(3,59)
*)

(* type error slice
(2,3)-(3,62)
(2,20)-(3,60)
(3,2)-(3,60)
(3,24)-(3,60)
(3,24)-(3,60)
(3,38)-(3,60)
(3,38)-(3,60)
(3,39)-(3,54)
(3,40)-(3,51)
*)

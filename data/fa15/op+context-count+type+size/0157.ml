
let rec digitsOfInt n =
  if n < 0 then [] else ((digitsOfInt n) / 10) @ ([] @ [n mod 10]);;


(* fix

let rec digitsOfInt n = if n < 0 then [] else [] @ [n mod 10];;

*)

(* changed spans
(3,27)-(3,38)
(3,27)-(3,40)
(3,27)-(3,46)
(3,39)-(3,40)
(3,51)-(3,66)
*)

(* type error slice
(2,4)-(3,69)
(2,21)-(3,66)
(3,3)-(3,66)
(3,17)-(3,19)
(3,27)-(3,38)
(3,27)-(3,40)
(3,27)-(3,46)
(3,27)-(3,46)
(3,27)-(3,66)
(3,48)-(3,49)
*)
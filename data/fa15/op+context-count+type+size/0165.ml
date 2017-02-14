
let rec digitsOfInt n =
  if n < 0 then [] else (digitsOfInt (n / 10)) :: ([] @ [n mod 10]);;


(* fix

let rec digitsOfInt n = if n < 0 then [] else [] @ [n mod 10];;

*)

(* changed spans
(3,26)-(3,37)
(3,26)-(3,45)
(3,26)-(3,67)
(3,39)-(3,40)
(3,39)-(3,45)
(3,43)-(3,45)
*)

(* type error slice
(2,4)-(3,70)
(2,21)-(3,67)
(3,3)-(3,67)
(3,26)-(3,37)
(3,26)-(3,45)
(3,26)-(3,67)
(3,26)-(3,67)
*)

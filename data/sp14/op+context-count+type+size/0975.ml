
let rec digitsOfInt n =
  if n < 1 then [] else (digitsOfInt (n / 10)) :: (n mod 10);;


(* fix

let rec digitsOfInt n =
  if n < 1 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

*)

(* changed spans
(3,26)-(3,45)
(3,26)-(3,60)
(3,52)-(3,60)
*)

(* type error slice
(2,4)-(3,63)
(2,21)-(3,60)
(3,3)-(3,60)
(3,26)-(3,37)
(3,26)-(3,45)
(3,26)-(3,60)
(3,26)-(3,60)
(3,26)-(3,60)
(3,52)-(3,60)
*)
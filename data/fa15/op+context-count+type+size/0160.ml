
let rec digitsOfInt n =
  if n < 0 then [] else [digitsOfInt (n / 10)] @ [n mod 10];;


(* fix

let rec digitsOfInt n = if n < 0 then [] else [] @ [n mod 10];;

*)

(* changed spans
(3,25)-(3,47)
(3,26)-(3,37)
(3,26)-(3,45)
(3,39)-(3,45)
(3,50)-(3,60)
*)

(* type error slice
(2,4)-(3,62)
(2,21)-(3,60)
(3,3)-(3,60)
(3,25)-(3,47)
(3,25)-(3,47)
(3,25)-(3,60)
(3,26)-(3,37)
(3,26)-(3,45)
(3,48)-(3,49)
*)

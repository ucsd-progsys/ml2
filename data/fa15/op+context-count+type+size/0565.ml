
let rec digitsOfInt n = if n > 0 then [digitsOfInt (n mod 10)] else [];;


(* fix

let rec digitsOfInt n = if n > 0 then [n mod 100; n mod 10] else [];;

*)

(* changed spans
(2,38)-(2,62)
(2,39)-(2,50)
(2,39)-(2,61)
(2,58)-(2,60)
*)

(* type error slice
(2,3)-(2,72)
(2,20)-(2,70)
(2,24)-(2,70)
(2,38)-(2,62)
(2,38)-(2,62)
(2,39)-(2,50)
(2,39)-(2,61)
*)

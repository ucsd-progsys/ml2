
let rec digitsOfInt n = if n <= 0 then [] else [digitsOfInt (n / 10)];;


(* fix

let rec digitsOfInt n = if n <= 0 then [] else [n mod 10];;

*)

(* changed spans
(2,48)-(2,59)
(2,48)-(2,68)
(2,60)-(2,68)
*)

(* type error slice
(2,3)-(2,71)
(2,20)-(2,69)
(2,24)-(2,69)
(2,47)-(2,69)
(2,47)-(2,69)
(2,48)-(2,59)
(2,48)-(2,68)
*)

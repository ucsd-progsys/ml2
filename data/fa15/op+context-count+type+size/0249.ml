
let rec digitsOfInt n =
  let x = n mod 10 in if n > 9 then (digitsOfInt (n / 10)) :: x else n;;


(* fix

let rec digitsOfInt n =
  let x = n mod 10 in if n > 9 then (digitsOfInt (n / 10)) @ [x] else [n];;

*)

(* changed spans
(3,36)-(3,58)
(3,36)-(3,63)
(3,62)-(3,63)
(3,69)-(3,70)
*)

(* type error slice
(2,3)-(3,72)
(2,20)-(3,70)
(3,2)-(3,70)
(3,2)-(3,70)
(3,10)-(3,11)
(3,10)-(3,18)
(3,10)-(3,18)
(3,22)-(3,70)
(3,22)-(3,70)
(3,36)-(3,58)
(3,36)-(3,63)
(3,36)-(3,63)
(3,36)-(3,63)
(3,37)-(3,48)
(3,62)-(3,63)
(3,69)-(3,70)
*)

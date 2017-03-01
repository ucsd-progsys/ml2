
let rec digitsOfInt n =
  if n > 0 then let k = digitsOfInt (n / 10) in k :: (n mod 10) else [];;


(* fix

let rec digitsOfInt n =
  if n > 0 then let k = digitsOfInt (n / 10) in (n mod 10) :: k else [];;

*)

(* changed spans
(3,48)-(3,49)
(3,69)-(3,71)
*)

(* type error slice
(2,3)-(3,73)
(2,20)-(3,71)
(3,2)-(3,71)
(3,16)-(3,63)
(3,16)-(3,63)
(3,24)-(3,35)
(3,24)-(3,44)
(3,48)-(3,49)
(3,48)-(3,63)
(3,48)-(3,63)
(3,48)-(3,63)
(3,53)-(3,63)
*)

(* all spans
(2,20)-(3,71)
(3,2)-(3,71)
(3,5)-(3,10)
(3,5)-(3,6)
(3,9)-(3,10)
(3,16)-(3,63)
(3,24)-(3,44)
(3,24)-(3,35)
(3,36)-(3,44)
(3,37)-(3,38)
(3,41)-(3,43)
(3,48)-(3,63)
(3,48)-(3,49)
(3,53)-(3,63)
(3,54)-(3,55)
(3,60)-(3,62)
(3,69)-(3,71)
*)
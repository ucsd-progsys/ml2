
let rec digitsOfInt n =
  if n <= 0 then [] else (n mod 10) @ [digitsOfInt (n / 10)];;


(* fix

let rec digitsOfInt n =
  if n <= 0
  then []
  else (let digit = digitsOfInt (n / 10) in digit @ [n mod 10]);;

*)

(* changed spans
(3,25)-(3,35)
(3,25)-(3,60)
(3,26)-(3,27)
(3,32)-(3,34)
(3,36)-(3,37)
(3,38)-(3,60)
*)

(* type error slice
(3,25)-(3,35)
(3,25)-(3,60)
(3,36)-(3,37)
*)

(* all spans
(2,20)-(3,60)
(3,2)-(3,60)
(3,5)-(3,11)
(3,5)-(3,6)
(3,10)-(3,11)
(3,17)-(3,19)
(3,25)-(3,60)
(3,36)-(3,37)
(3,25)-(3,35)
(3,26)-(3,27)
(3,32)-(3,34)
(3,38)-(3,60)
(3,39)-(3,59)
(3,39)-(3,50)
(3,51)-(3,59)
(3,52)-(3,53)
(3,56)-(3,58)
*)

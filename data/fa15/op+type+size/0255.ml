
let rec digitsOfInt n =
  if n <= 0 then [] else (List.rev (n mod 10)) :: (digitsOfInt (n / 10));;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else List.rev ((n mod 10) :: (digitsOfInt (n / 10)));;

*)

(* changed spans
(3,25)-(3,72)
(3,35)-(3,45)
*)

(* type error slice
(3,25)-(3,46)
(3,26)-(3,34)
(3,35)-(3,45)
*)

(* all spans
(2,20)-(3,72)
(3,2)-(3,72)
(3,5)-(3,11)
(3,5)-(3,6)
(3,10)-(3,11)
(3,17)-(3,19)
(3,25)-(3,72)
(3,25)-(3,46)
(3,26)-(3,34)
(3,35)-(3,45)
(3,36)-(3,37)
(3,42)-(3,44)
(3,50)-(3,72)
(3,51)-(3,62)
(3,63)-(3,71)
(3,64)-(3,65)
(3,68)-(3,70)
*)

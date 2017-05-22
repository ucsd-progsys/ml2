
let rec append l r = match l with | [] -> r | h::t -> h :: (append t r);;

let rec digitsOfInt n =
  if n <= 0 then [n] else append digitsOfInt (n / 10) [n mod 10];;


(* fix

let rec append l r = match l with | [] -> r | h::t -> h :: (append t r);;

let rec digitsOfInt n =
  if n <= 0 then [n] else append (digitsOfInt (n / 10)) [n mod 10];;

*)

(* changed spans
(5,26)-(5,64)
(5,33)-(5,44)
*)

(* type error slice
(2,54)-(2,71)
(2,59)-(2,71)
(2,60)-(2,66)
(5,26)-(5,32)
(5,26)-(5,64)
*)

(* all spans
(2,15)-(2,71)
(2,17)-(2,71)
(2,21)-(2,71)
(2,27)-(2,28)
(2,42)-(2,43)
(2,54)-(2,71)
(2,54)-(2,55)
(2,59)-(2,71)
(2,60)-(2,66)
(2,67)-(2,68)
(2,69)-(2,70)
(4,20)-(5,64)
(5,2)-(5,64)
(5,5)-(5,11)
(5,5)-(5,6)
(5,10)-(5,11)
(5,17)-(5,20)
(5,18)-(5,19)
(5,26)-(5,64)
(5,26)-(5,32)
(5,33)-(5,44)
(5,45)-(5,53)
(5,46)-(5,47)
(5,50)-(5,52)
(5,54)-(5,64)
(5,55)-(5,63)
(5,55)-(5,56)
(5,61)-(5,63)
*)

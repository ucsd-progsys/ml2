
let rec append l r = match l with | [] -> [r] | h::t -> h :: (append t r);;

let rec digitsOfInt n = if n <= 0 then [n] else append digitsOfInt (n / 10);;


(* fix

let rec append l r = match l with | [] -> r | h::t -> h :: (append t r);;

let rec digitsOfInt n =
  if n <= 0 then [n] else append (digitsOfInt (n / 10)) [n mod 10];;

*)

(* changed spans
(2,42)-(2,45)
(4,55)-(4,66)
*)

(* type error slice
(2,21)-(2,73)
(2,21)-(2,73)
(2,61)-(2,73)
(2,62)-(2,68)
(2,69)-(2,70)
(4,3)-(4,77)
(4,20)-(4,75)
(4,48)-(4,54)
(4,48)-(4,75)
(4,55)-(4,66)
*)

(* all spans
(2,15)-(2,73)
(2,17)-(2,73)
(2,21)-(2,73)
(2,27)-(2,28)
(2,42)-(2,45)
(2,43)-(2,44)
(2,56)-(2,73)
(2,56)-(2,57)
(2,61)-(2,73)
(2,62)-(2,68)
(2,69)-(2,70)
(2,71)-(2,72)
(4,20)-(4,75)
(4,24)-(4,75)
(4,27)-(4,33)
(4,27)-(4,28)
(4,32)-(4,33)
(4,39)-(4,42)
(4,40)-(4,41)
(4,48)-(4,75)
(4,48)-(4,54)
(4,55)-(4,66)
(4,67)-(4,75)
(4,68)-(4,69)
(4,72)-(4,74)
*)
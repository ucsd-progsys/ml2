
let rec app l1 l2 = match l1 with | [] -> l2 | h::t -> h :: (app t l2);;

let rec digitsOfInt n =
  if n >= 10 then app ([n / 10] [n mod 10]) else app [3] [8];;


(* fix

let rec app l1 l2 = match l1 with | [] -> l2 | h::t -> h :: (app t l2);;

let rec digitsOfInt n = if n >= 10 then app [5] [n mod 10] else app [3] [8];;

*)

(* changed spans
(5,18)-(5,43)
(5,22)-(5,43)
(5,24)-(5,25)
(5,24)-(5,30)
(5,28)-(5,30)
*)

(* type error slice
(5,2)-(5,60)
(5,2)-(5,60)
(5,18)-(5,21)
(5,18)-(5,43)
(5,22)-(5,43)
(5,23)-(5,31)
(5,49)-(5,52)
(5,49)-(5,60)
*)

(* all spans
(2,12)-(2,70)
(2,15)-(2,70)
(2,20)-(2,70)
(2,26)-(2,28)
(2,42)-(2,44)
(2,55)-(2,70)
(2,55)-(2,56)
(2,60)-(2,70)
(2,61)-(2,64)
(2,65)-(2,66)
(2,67)-(2,69)
(4,20)-(5,60)
(5,2)-(5,60)
(5,5)-(5,12)
(5,5)-(5,6)
(5,10)-(5,12)
(5,18)-(5,43)
(5,18)-(5,21)
(5,22)-(5,43)
(5,23)-(5,31)
(5,24)-(5,30)
(5,24)-(5,25)
(5,28)-(5,30)
(5,32)-(5,42)
(5,33)-(5,41)
(5,33)-(5,34)
(5,39)-(5,41)
(5,49)-(5,60)
(5,49)-(5,52)
(5,53)-(5,56)
(5,54)-(5,55)
(5,57)-(5,60)
(5,58)-(5,59)
*)


let rec digitsOfIntHelper n =
  if n < 1
  then []
  else [n mod 10] @ (digitsOfIntHelper (n - ((n mod 10) / 10)));;

let rec digitsOfInt n = digitsOfIntHelper (n >= 10);;


(* fix

let rec digitsOfIntHelper n =
  if n < 1
  then []
  else [n mod 10] @ (digitsOfIntHelper (n - ((n mod 10) / 10)));;

let rec digitsOfInt n = digitsOfIntHelper n;;

*)

(* changed spans
(7,42)-(7,51)
(7,48)-(7,50)
*)

(* type error slice
(5,20)-(5,63)
(5,21)-(5,38)
(5,39)-(5,62)
(7,24)-(7,41)
(7,24)-(7,51)
(7,42)-(7,51)
*)

(* all spans
(2,26)-(5,63)
(3,2)-(5,63)
(3,5)-(3,10)
(3,5)-(3,6)
(3,9)-(3,10)
(4,7)-(4,9)
(5,7)-(5,63)
(5,18)-(5,19)
(5,7)-(5,17)
(5,8)-(5,16)
(5,8)-(5,9)
(5,14)-(5,16)
(5,20)-(5,63)
(5,21)-(5,38)
(5,39)-(5,62)
(5,40)-(5,41)
(5,44)-(5,61)
(5,45)-(5,55)
(5,46)-(5,47)
(5,52)-(5,54)
(5,58)-(5,60)
(7,20)-(7,51)
(7,24)-(7,51)
(7,24)-(7,41)
(7,42)-(7,51)
(7,43)-(7,44)
(7,48)-(7,50)
*)


let fixpointHelper f =
  match f with | (num,expr) -> if expr then (num, true) else (num, false);;

let rec wwhile (f,b) =
  match f b with | (num,expr) -> if expr then wwhile (f, num) else num;;

let fixpoint (f,b) = wwhile ((fixpointHelper f), b);;


(* fix

let fixpointHelper f b b = ((f b), (if (f b) = b then true else false));;

let rec wwhile (f,b) =
  match f b with | (num,expr) -> if expr then wwhile (f, num) else num;;

let fixpoint (f,b) = wwhile ((fixpointHelper f b), b);;

*)

(* changed spans
(3,2)-(3,73)
(3,8)-(3,9)
(3,31)-(3,73)
(3,34)-(3,38)
(3,44)-(3,55)
(3,45)-(3,48)
(3,50)-(3,54)
(3,61)-(3,73)
(3,62)-(3,65)
(8,29)-(8,47)
(8,30)-(8,44)
(8,45)-(8,46)
*)

(* type error slice
(2,3)-(3,75)
(2,19)-(3,73)
(3,2)-(3,73)
(3,31)-(3,73)
(3,44)-(3,55)
(6,8)-(6,9)
(6,8)-(6,11)
(6,46)-(6,52)
(6,46)-(6,61)
(6,53)-(6,61)
(6,54)-(6,55)
(8,21)-(8,27)
(8,21)-(8,51)
(8,28)-(8,51)
(8,29)-(8,47)
(8,30)-(8,44)
*)

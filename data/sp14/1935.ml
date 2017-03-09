
let rec wwhile (f,b) = match f b with | (a,c) -> if not c then a else f a;;


(* fix

let rec wwhile (f,b) =
  match f b with | (a,c) -> if not c then a else wwhile (f, a);;

*)

(* changed spans
(2,70)-(2,71)
*)

(* type error slice
(2,23)-(2,73)
(2,29)-(2,30)
(2,29)-(2,32)
(2,49)-(2,73)
(2,49)-(2,73)
(2,63)-(2,64)
(2,70)-(2,71)
(2,70)-(2,73)
*)

(* all spans
(2,16)-(2,73)
(2,23)-(2,73)
(2,29)-(2,32)
(2,29)-(2,30)
(2,31)-(2,32)
(2,49)-(2,73)
(2,52)-(2,57)
(2,52)-(2,55)
(2,56)-(2,57)
(2,63)-(2,64)
(2,70)-(2,73)
(2,70)-(2,71)
(2,72)-(2,73)
*)
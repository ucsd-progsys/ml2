
let rec wwhile (f,b) =
  match f b with | (a,b) -> if not b then a else wwhile (f, a);;

let fixpoint (f,b) = wwhile (f, (f b));;


(* fix

let rec wwhile (f,b) =
  match f b with | (a,b) -> if not b then a else wwhile (f, a);;

let fixpoint (f,b) =
  wwhile ((let f x = let xx = (x * x) * x in (xx, (xx < 100)) in f), b);;

*)

(* changed spans
(5,29)-(5,30)
(5,32)-(5,37)
(5,33)-(5,34)
*)

(* type error slice
(3,2)-(3,62)
(3,8)-(3,9)
(3,8)-(3,11)
(3,49)-(3,55)
(3,49)-(3,62)
(3,56)-(3,62)
(3,57)-(3,58)
(3,60)-(3,61)
(5,21)-(5,27)
(5,21)-(5,38)
(5,28)-(5,38)
(5,29)-(5,30)
(5,32)-(5,37)
(5,33)-(5,34)
*)

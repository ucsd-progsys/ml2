
let rec wwhile (f,b) =
  let check = f b in
  match (f, b) with | (x,y) -> if y = false then x else wwhile (f, x);;


(* fix

let rec wwhile (f,b) =
  let check = f b in
  match check with | (x,y) -> if y = false then x else wwhile (f, x);;

*)

(* changed spans
(4,8)-(4,14)
(4,9)-(4,10)
(4,12)-(4,13)
*)

(* type error slice
(2,3)-(4,71)
(2,16)-(4,69)
(3,14)-(3,15)
(3,14)-(3,17)
(4,2)-(4,69)
(4,8)-(4,14)
(4,9)-(4,10)
(4,12)-(4,13)
(4,34)-(4,35)
(4,34)-(4,43)
(4,34)-(4,43)
(4,38)-(4,43)
(4,56)-(4,62)
(4,56)-(4,69)
(4,63)-(4,69)
(4,67)-(4,68)
*)

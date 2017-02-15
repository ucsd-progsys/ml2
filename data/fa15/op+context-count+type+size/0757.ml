
let rec wwhile (f,b) =
  let pair = f b in
  let (b',c') = pair in if c' = false then b' else wwhile (f, b');;

let fixpoint (f,b) = wwhile (f, (b, (b != (f b))));;


(* fix

let rec wwhile (f,b) =
  let pair = f b in
  let (b',c') = pair in if c' = false then b' else wwhile (f, b');;

let fixpoint (f,b) = wwhile ((fun x  -> ((f x), (x != (f x)))), b);;

*)

(* changed spans
(6,29)-(6,30)
(6,33)-(6,34)
(6,36)-(6,48)
(6,37)-(6,38)
(6,45)-(6,46)
*)

(* type error slice
(3,2)-(4,65)
(3,13)-(3,14)
(3,13)-(3,16)
(4,2)-(4,65)
(4,16)-(4,20)
(4,51)-(4,57)
(4,51)-(4,65)
(4,58)-(4,65)
(4,59)-(4,60)
(4,62)-(4,64)
(6,21)-(6,27)
(6,21)-(6,50)
(6,28)-(6,50)
(6,29)-(6,30)
(6,32)-(6,49)
(6,33)-(6,34)
(6,36)-(6,48)
(6,36)-(6,48)
(6,37)-(6,38)
(6,42)-(6,47)
(6,43)-(6,44)
*)


let intboolf f x = ((f x), ((f x) < 1));;

let rec wwhile (f,b) =
  match f b with | (b',c') -> if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile (intboolf, b);;


(* fix

let func (f,b) b = ((f b), ((f b) == b));;

let rec wwhile (f,b) =
  match f b with | (b',c') -> if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((func (f, b)), b);;

*)

(* changed spans
(2,13)-(2,39)
(2,15)-(2,39)
(2,19)-(2,39)
(2,23)-(2,24)
(2,27)-(2,38)
(2,28)-(2,33)
(2,31)-(2,32)
(2,36)-(2,37)
(4,16)-(5,63)
(7,29)-(7,37)
(7,39)-(7,40)
*)

(* type error slice
(2,3)-(2,41)
(2,13)-(2,39)
(2,15)-(2,39)
(5,2)-(5,63)
(5,8)-(5,9)
(5,8)-(5,11)
(5,41)-(5,47)
(5,41)-(5,55)
(5,48)-(5,55)
(5,49)-(5,50)
(7,21)-(7,27)
(7,21)-(7,41)
(7,28)-(7,41)
(7,29)-(7,37)
*)

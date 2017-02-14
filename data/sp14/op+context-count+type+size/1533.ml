
let rec wwhile (f,b) =
  match f b with | (b',c') -> if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((not ((f b) = b)), b);;


(* fix

let rec wwhile (f,b) =
  match f b with
  | (b',c') -> (match c' with | true  -> wwhile (f, b') | false  -> b');;

let fixpoint (f,b) = wwhile (let func x x = (0, true) in ((func b), b));;

*)

(* changed spans
(3,31)-(3,64)
(5,31)-(5,34)
(5,31)-(5,45)
(5,31)-(5,50)
(5,37)-(5,38)
(5,37)-(5,40)
(5,37)-(5,45)
(5,39)-(5,40)
*)

(* type error slice
(3,9)-(3,10)
(3,9)-(3,12)
(3,42)-(3,48)
(3,42)-(3,55)
(3,50)-(3,51)
(3,50)-(3,55)
(5,22)-(5,28)
(5,22)-(5,50)
(5,31)-(5,34)
(5,31)-(5,45)
(5,31)-(5,50)
*)
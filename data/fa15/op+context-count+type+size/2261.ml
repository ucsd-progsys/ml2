
let rec wwhile (f,b) =
  let (x,y) = f b in match y with | false  -> x | true  -> wwhile (f, x);;

let fixpoint (f,b) = wwhile (((f b) = (let rr = f b in (rr, (rr = b)))), b);;


(* fix

let helper (f,b) = let f b = let x = f b in (x, (x != b)) in f;;

let rec wwhile (f,b) =
  let (x,y) = f b in match y with | false  -> x | true  -> wwhile (f, x);;

let fixpoint (f,b) = wwhile ((helper (f, b)), b);;

*)

(* changed spans
(3,3)-(3,72)
(3,15)-(3,18)
(3,22)-(3,72)
(5,32)-(5,33)
(5,32)-(5,68)
(5,34)-(5,35)
(5,40)-(5,68)
(5,49)-(5,50)
(5,49)-(5,52)
(5,51)-(5,52)
(5,57)-(5,59)
(5,62)-(5,64)
(5,62)-(5,68)
(5,74)-(5,75)
*)

(* type error slice
(3,15)-(3,16)
(3,15)-(3,18)
(3,60)-(3,66)
(3,60)-(3,72)
(3,68)-(3,69)
(3,68)-(3,72)
(5,22)-(5,28)
(5,22)-(5,75)
(5,32)-(5,33)
(5,32)-(5,35)
(5,32)-(5,68)
(5,32)-(5,68)
(5,32)-(5,68)
(5,32)-(5,75)
(5,40)-(5,68)
(5,40)-(5,68)
(5,49)-(5,50)
(5,49)-(5,52)
(5,57)-(5,59)
(5,57)-(5,68)
*)

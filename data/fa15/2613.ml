
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  let helper b = let fb = f b in if fb = b then (true, fb) else (false, fb) in
  wwhile ((helper b), b);;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  let helper b = let fb = f b in if fb = b then (true, fb) else (false, fb) in
  wwhile (helper, b);;

*)

(* changed spans
(6,10)-(6,20)
(6,22)-(6,23)
*)

(* type error slice
(2,37)-(2,38)
(2,37)-(2,40)
(2,55)-(2,61)
(2,55)-(2,69)
(2,62)-(2,69)
(2,63)-(2,64)
(5,2)-(6,24)
(5,13)-(5,75)
(5,17)-(5,75)
(5,33)-(5,75)
(5,48)-(5,58)
(6,2)-(6,8)
(6,2)-(6,24)
(6,9)-(6,24)
(6,10)-(6,20)
(6,11)-(6,17)
*)

(* all spans
(2,16)-(2,77)
(2,23)-(2,77)
(2,37)-(2,40)
(2,37)-(2,38)
(2,39)-(2,40)
(2,44)-(2,77)
(2,47)-(2,49)
(2,55)-(2,69)
(2,55)-(2,61)
(2,62)-(2,69)
(2,63)-(2,64)
(2,66)-(2,68)
(2,75)-(2,77)
(4,14)-(6,24)
(5,2)-(6,24)
(5,13)-(5,75)
(5,17)-(5,75)
(5,26)-(5,29)
(5,26)-(5,27)
(5,28)-(5,29)
(5,33)-(5,75)
(5,36)-(5,42)
(5,36)-(5,38)
(5,41)-(5,42)
(5,48)-(5,58)
(5,49)-(5,53)
(5,55)-(5,57)
(5,64)-(5,75)
(5,65)-(5,70)
(5,72)-(5,74)
(6,2)-(6,24)
(6,2)-(6,8)
(6,9)-(6,24)
(6,10)-(6,20)
(6,11)-(6,17)
(6,18)-(6,19)
(6,22)-(6,23)
*)
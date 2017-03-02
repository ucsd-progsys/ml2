
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile (let b' = f b in ((b' = b), b));;


(* fix

let h x = let xx = (x * x) * x in (xx, (xx < 512));;

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile (h, b);;

*)

(* changed spans
(2,16)-(2,77)
(2,23)-(2,77)
(4,28)-(4,59)
(4,38)-(4,39)
(4,38)-(4,41)
(4,40)-(4,41)
(4,46)-(4,54)
(4,47)-(4,49)
(4,52)-(4,53)
*)

(* type error slice
(2,37)-(2,38)
(2,37)-(2,40)
(2,55)-(2,61)
(2,55)-(2,69)
(2,62)-(2,69)
(2,63)-(2,64)
(4,21)-(4,27)
(4,21)-(4,59)
(4,28)-(4,59)
(4,45)-(4,58)
(4,46)-(4,54)
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
(4,14)-(4,59)
(4,21)-(4,59)
(4,21)-(4,27)
(4,28)-(4,59)
(4,38)-(4,41)
(4,38)-(4,39)
(4,40)-(4,41)
(4,45)-(4,58)
(4,46)-(4,54)
(4,47)-(4,49)
(4,52)-(4,53)
(4,56)-(4,57)
*)


let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile b' c' else b';;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

*)

(* changed spans
(2,55)-(2,67)
(2,62)-(2,64)
(2,65)-(2,67)
*)

(* type error slice
(2,3)-(2,77)
(2,16)-(2,75)
(2,23)-(2,75)
(2,37)-(2,38)
(2,37)-(2,40)
(2,55)-(2,61)
(2,55)-(2,67)
(2,62)-(2,64)
*)

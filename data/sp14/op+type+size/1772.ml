
let rec clone x n = match n with | 0 -> [] | _ -> x :: ((clone x n) - 1);;


(* fix

let rec clone x n = match n with | 0 -> [] | _ -> x :: (clone x (n - 1));;

*)

(* changed spans
(2,55)-(2,72)
(2,65)-(2,66)
*)

(* type error slice
(2,3)-(2,74)
(2,14)-(2,72)
(2,16)-(2,72)
(2,20)-(2,72)
(2,50)-(2,72)
(2,50)-(2,72)
(2,55)-(2,72)
(2,55)-(2,72)
(2,56)-(2,67)
(2,57)-(2,62)
*)

(* all spans
(2,14)-(2,72)
(2,16)-(2,72)
(2,20)-(2,72)
(2,26)-(2,27)
(2,40)-(2,42)
(2,50)-(2,72)
(2,50)-(2,51)
(2,55)-(2,72)
(2,56)-(2,67)
(2,57)-(2,62)
(2,63)-(2,64)
(2,65)-(2,66)
(2,70)-(2,71)
*)


let rec clone x n = if n = 1 then [] @ x else (clone x) @ ((x n) - 1);;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

*)

(* changed spans
(2,24)-(2,29)
(2,28)-(2,29)
(2,35)-(2,41)
(2,38)-(2,39)
(2,40)-(2,41)
(2,48)-(2,55)
(2,57)-(2,58)
*)

(* type error slice
(2,4)-(2,72)
(2,15)-(2,69)
(2,17)-(2,69)
(2,35)-(2,41)
(2,38)-(2,39)
(2,40)-(2,41)
(2,48)-(2,53)
(2,48)-(2,55)
(2,48)-(2,69)
(2,57)-(2,58)
(2,61)-(2,62)
(2,61)-(2,64)
(2,61)-(2,69)
*)
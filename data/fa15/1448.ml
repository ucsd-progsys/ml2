
let rec clone x n = [clone x (n - 1); x];;


(* fix

let rec clone x n = (clone x (n - 1)) @ [x];;

*)

(* changed spans
(2,20)-(2,40)
(2,21)-(2,26)
(2,38)-(2,39)
*)

(* type error slice
(2,3)-(2,42)
(2,14)-(2,40)
(2,16)-(2,40)
(2,20)-(2,40)
(2,20)-(2,40)
(2,21)-(2,26)
(2,21)-(2,36)
*)

(* all spans
(2,14)-(2,40)
(2,16)-(2,40)
(2,20)-(2,40)
(2,21)-(2,36)
(2,21)-(2,26)
(2,27)-(2,28)
(2,29)-(2,36)
(2,30)-(2,31)
(2,34)-(2,35)
(2,38)-(2,39)
*)

let rec clone x n = if n = 0 then [] else x :: (clone (x, (n - 1)));;


(* fix

let rec clone x n = if n = 0 then [] else x :: (clone x (n - 1));;

*)

(* changed spans
(2,49)-(2,65)
(2,56)-(2,65)
*)

(* type error slice
(2,4)-(2,70)
(2,15)-(2,65)
(2,49)-(2,54)
(2,49)-(2,65)
(2,56)-(2,57)
(2,56)-(2,65)
*)
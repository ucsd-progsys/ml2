
let pipe fs = let f a x = x a in let base = fs in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = a in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(2,26)-(2,27)
(2,26)-(2,29)
(2,44)-(2,46)
(2,50)-(2,74)
*)

(* type error slice
(2,14)-(2,74)
(2,20)-(2,29)
(2,22)-(2,29)
(2,26)-(2,27)
(2,26)-(2,29)
(2,33)-(2,74)
(2,44)-(2,46)
(2,50)-(2,64)
(2,50)-(2,74)
(2,65)-(2,66)
(2,67)-(2,71)
(2,72)-(2,74)
*)

(* all spans
(2,9)-(2,74)
(2,14)-(2,74)
(2,20)-(2,29)
(2,22)-(2,29)
(2,26)-(2,29)
(2,26)-(2,27)
(2,28)-(2,29)
(2,33)-(2,74)
(2,44)-(2,46)
(2,50)-(2,74)
(2,50)-(2,64)
(2,65)-(2,66)
(2,67)-(2,71)
(2,72)-(2,74)
*)

let pipe fs = let f a x y = a in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x y = y in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(2,28)-(2,29)
*)

(* type error slice
(2,14)-(2,75)
(2,20)-(2,29)
(2,22)-(2,29)
(2,24)-(2,29)
(2,28)-(2,29)
(2,51)-(2,65)
(2,51)-(2,75)
(2,66)-(2,67)
*)

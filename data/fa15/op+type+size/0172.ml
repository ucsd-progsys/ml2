
let pipe fs = let f a x = fs x in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = a in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(2,26)-(2,28)
(2,26)-(2,30)
(2,29)-(2,30)
(2,34)-(2,76)
(2,43)-(2,48)
*)

(* type error slice
(2,26)-(2,28)
(2,26)-(2,30)
(2,52)-(2,66)
(2,52)-(2,76)
(2,74)-(2,76)
*)

(* all spans
(2,9)-(2,76)
(2,14)-(2,76)
(2,20)-(2,30)
(2,22)-(2,30)
(2,26)-(2,30)
(2,26)-(2,28)
(2,29)-(2,30)
(2,34)-(2,76)
(2,43)-(2,48)
(2,47)-(2,48)
(2,52)-(2,76)
(2,52)-(2,66)
(2,67)-(2,68)
(2,69)-(2,73)
(2,74)-(2,76)
*)

let pipe fs = let f a x = x + a in let base = "" in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = x in let base = (+) 0 in List.fold_left f base fs;;

*)

(* changed spans
(2,26)-(2,31)
(2,30)-(2,31)
(2,35)-(2,76)
(2,46)-(2,48)
(2,52)-(2,76)
*)

(* type error slice
(2,14)-(2,76)
(2,20)-(2,31)
(2,26)-(2,31)
(2,30)-(2,31)
(2,35)-(2,76)
(2,46)-(2,48)
(2,52)-(2,66)
(2,52)-(2,76)
(2,67)-(2,68)
(2,69)-(2,73)
*)

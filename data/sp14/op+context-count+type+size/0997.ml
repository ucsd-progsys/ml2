
let pipe fs = let f a x y x = a in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x a x = x in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(2,24)-(2,31)
(2,30)-(2,31)
*)

(* type error slice
(2,14)-(2,77)
(2,20)-(2,31)
(2,22)-(2,31)
(2,24)-(2,31)
(2,26)-(2,31)
(2,30)-(2,31)
(2,53)-(2,67)
(2,53)-(2,77)
(2,68)-(2,69)
*)

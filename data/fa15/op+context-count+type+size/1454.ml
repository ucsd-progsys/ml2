
let pipe fs = let f a x = x :: a in let base = f in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = x in let base = f in List.fold_left f base fs;;

*)

(* changed spans
(2,27)-(2,33)
(2,32)-(2,33)
(2,37)-(2,77)
*)

(* type error slice
(2,37)-(2,77)
(2,48)-(2,49)
(2,53)-(2,67)
(2,53)-(2,77)
(2,68)-(2,69)
(2,70)-(2,74)
*)
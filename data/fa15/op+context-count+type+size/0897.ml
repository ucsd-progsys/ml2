
let pipe fs =
  let f a x result n = x (a n) in let base = 0 in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x n = x (a n) in let base f = 0 in List.fold_left f base fs;;

*)

(* changed spans
(3,13)-(3,30)
(3,35)-(3,75)
(3,46)-(3,47)
*)

(* type error slice
(3,3)-(3,75)
(3,9)-(3,30)
(3,27)-(3,28)
(3,27)-(3,30)
(3,35)-(3,75)
(3,46)-(3,47)
(3,51)-(3,65)
(3,51)-(3,75)
(3,66)-(3,67)
(3,68)-(3,72)
*)

let pipe fs =
  let f a x = x (a a) in let base y = y in List.fold_left f base fs;;


(* fix

let pipe fs y = let f a x = x a in let base = y in List.fold_left f base fs;;

*)

(* changed spans
(3,2)-(3,67)
(3,16)-(3,21)
(3,19)-(3,20)
(3,34)-(3,39)
*)

(* type error slice
(3,16)-(3,21)
(3,17)-(3,18)
(3,19)-(3,20)
*)

(* all spans
(2,9)-(3,67)
(3,2)-(3,67)
(3,8)-(3,21)
(3,10)-(3,21)
(3,14)-(3,21)
(3,14)-(3,15)
(3,16)-(3,21)
(3,17)-(3,18)
(3,19)-(3,20)
(3,25)-(3,67)
(3,34)-(3,39)
(3,38)-(3,39)
(3,43)-(3,67)
(3,43)-(3,57)
(3,58)-(3,59)
(3,60)-(3,64)
(3,65)-(3,67)
*)

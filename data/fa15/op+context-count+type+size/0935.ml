
let pipe fs =
  let f a x b x a = x a b in let base i = i in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x b = x (a b) in let base i = i in List.fold_left f base fs;;

*)

(* changed spans
(3,14)-(3,25)
(3,16)-(3,25)
(3,20)-(3,25)
(3,22)-(3,23)
(3,29)-(3,71)
*)

(* type error slice
(3,2)-(3,71)
(3,8)-(3,25)
(3,10)-(3,25)
(3,12)-(3,25)
(3,14)-(3,25)
(3,20)-(3,21)
(3,20)-(3,25)
(3,24)-(3,25)
(3,29)-(3,71)
(3,38)-(3,43)
(3,42)-(3,43)
(3,47)-(3,61)
(3,47)-(3,71)
(3,62)-(3,63)
(3,64)-(3,68)
*)

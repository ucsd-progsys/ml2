
let pipe fs =
  let f a x x y = x (a y) in let base m = m in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x y = x (a y) in let base m = m in List.fold_left f base fs;;

*)

(* changed spans
(3,13)-(3,25)
(3,30)-(3,72)
*)

(* type error slice
(3,3)-(3,72)
(3,9)-(3,25)
(3,11)-(3,25)
(3,13)-(3,25)
(3,15)-(3,25)
(3,19)-(3,20)
(3,19)-(3,25)
(3,22)-(3,23)
(3,22)-(3,25)
(3,24)-(3,25)
(3,48)-(3,62)
(3,48)-(3,72)
(3,63)-(3,64)
*)
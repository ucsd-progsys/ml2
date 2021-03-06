
let pipe fs =
  let f a x = (a, x) in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x y = x (a y) in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(3,14)-(3,20)
(3,15)-(3,16)
(3,18)-(3,19)
(3,24)-(3,66)
*)

(* type error slice
(3,2)-(3,66)
(3,8)-(3,20)
(3,10)-(3,20)
(3,14)-(3,20)
(3,15)-(3,16)
(3,42)-(3,56)
(3,42)-(3,66)
(3,57)-(3,58)
*)

(* all spans
(2,9)-(3,66)
(3,2)-(3,66)
(3,8)-(3,20)
(3,10)-(3,20)
(3,14)-(3,20)
(3,15)-(3,16)
(3,18)-(3,19)
(3,24)-(3,66)
(3,33)-(3,38)
(3,37)-(3,38)
(3,42)-(3,66)
(3,42)-(3,56)
(3,57)-(3,58)
(3,59)-(3,63)
(3,64)-(3,66)
*)

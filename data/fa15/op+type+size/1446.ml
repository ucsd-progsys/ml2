
let sqsum xs =
  let f a x = a + (x ** 2.) in let base = 0 in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = a + (x * x) in let base = 0 in List.fold_left f base xs;;

*)

(* changed spans
(3,18)-(3,27)
(3,21)-(3,23)
(3,24)-(3,26)
(3,31)-(3,71)
(3,42)-(3,43)
*)

(* type error slice
(3,14)-(3,27)
(3,18)-(3,27)
(3,21)-(3,23)
*)

(* all spans
(2,10)-(3,71)
(3,2)-(3,71)
(3,8)-(3,27)
(3,10)-(3,27)
(3,14)-(3,27)
(3,14)-(3,15)
(3,18)-(3,27)
(3,21)-(3,23)
(3,19)-(3,20)
(3,24)-(3,26)
(3,31)-(3,71)
(3,42)-(3,43)
(3,47)-(3,71)
(3,47)-(3,61)
(3,62)-(3,63)
(3,64)-(3,68)
(3,69)-(3,71)
*)

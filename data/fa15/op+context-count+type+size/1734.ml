
let sqsum xs =
  let f a x = a + (x * x) in let base x = x in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = a + (x * x) in let base = 0 in List.fold_left f base xs;;

*)

(* changed spans
(3,38)-(3,43)
(3,42)-(3,43)
*)

(* type error slice
(3,2)-(3,71)
(3,8)-(3,25)
(3,14)-(3,15)
(3,14)-(3,25)
(3,29)-(3,71)
(3,38)-(3,43)
(3,47)-(3,61)
(3,47)-(3,71)
(3,62)-(3,63)
(3,64)-(3,68)
*)


let sqsum xs =
  let f a x _ x = x * x in let base = 0 in List.fold_left f base xs;;


(* fix

let sqsum xs = let f a x = x * x in let base = 0 in List.fold_left f base xs;;

*)

(* changed spans
(3,2)-(3,67)
(3,12)-(3,23)
(3,14)-(3,23)
(3,27)-(3,67)
*)

(* type error slice
(3,2)-(3,67)
(3,8)-(3,23)
(3,10)-(3,23)
(3,12)-(3,23)
(3,27)-(3,67)
(3,38)-(3,39)
(3,43)-(3,57)
(3,43)-(3,67)
(3,58)-(3,59)
(3,60)-(3,64)
*)


let sqsum xs =
  let f a x sum x = sum + (x * x) in let base = 0 in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = a + (x * x) in let base = 0 in List.fold_left f base xs;;

*)

(* changed spans
(3,12)-(3,33)
(3,16)-(3,33)
(3,20)-(3,23)
(3,37)-(3,77)
*)

(* type error slice
(3,2)-(3,77)
(3,8)-(3,33)
(3,10)-(3,33)
(3,12)-(3,33)
(3,37)-(3,77)
(3,48)-(3,49)
(3,53)-(3,67)
(3,53)-(3,77)
(3,68)-(3,69)
(3,70)-(3,74)
*)

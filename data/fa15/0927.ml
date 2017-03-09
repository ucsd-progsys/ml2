
let pipe fs =
  let f a x = a (fun a  -> x a) in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x a = x a in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(3,2)-(3,77)
(3,14)-(3,15)
(3,14)-(3,31)
(3,35)-(3,77)
*)

(* type error slice
(3,2)-(3,77)
(3,8)-(3,31)
(3,10)-(3,31)
(3,14)-(3,15)
(3,14)-(3,31)
(3,53)-(3,67)
(3,53)-(3,77)
(3,68)-(3,69)
*)

(* all spans
(2,9)-(3,77)
(3,2)-(3,77)
(3,8)-(3,31)
(3,10)-(3,31)
(3,14)-(3,31)
(3,14)-(3,15)
(3,16)-(3,31)
(3,27)-(3,30)
(3,27)-(3,28)
(3,29)-(3,30)
(3,35)-(3,77)
(3,44)-(3,49)
(3,48)-(3,49)
(3,53)-(3,77)
(3,53)-(3,67)
(3,68)-(3,69)
(3,70)-(3,74)
(3,75)-(3,77)
*)
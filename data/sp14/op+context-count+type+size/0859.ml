
let pipe fs =
  let f a x = a = (fun x  -> fun a  -> fun t  -> x (a t)) in
  let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x y = x (a y) in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(3,14)-(3,15)
(3,14)-(3,57)
(3,18)-(3,57)
(3,29)-(3,56)
(3,39)-(3,56)
(3,54)-(3,55)
(4,2)-(4,44)
(4,11)-(4,16)
*)

(* type error slice
(3,2)-(4,44)
(3,8)-(3,57)
(3,10)-(3,57)
(3,14)-(3,15)
(3,14)-(3,57)
(3,14)-(3,57)
(3,14)-(3,57)
(3,18)-(3,57)
(4,20)-(4,34)
(4,20)-(4,44)
(4,35)-(4,36)
*)

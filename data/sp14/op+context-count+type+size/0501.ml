
let sqsum xs =
  let f a x = match xs with | [] -> a | hd::tl -> a + (x * x) in
  let base = f 0 xs in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = a + (x * x) in
  let base = match xs with | [] -> 0 | hd::tl -> f 0 hd in
  List.fold_left f base xs;;

*)

(* changed spans
(3,14)-(3,61)
(3,20)-(3,22)
(3,36)-(3,37)
(4,13)-(4,19)
(4,17)-(4,19)
*)

(* type error slice
(3,2)-(4,47)
(3,8)-(3,61)
(3,10)-(3,61)
(3,14)-(3,61)
(3,14)-(3,61)
(3,20)-(3,22)
(3,54)-(3,61)
(3,55)-(3,56)
(4,13)-(4,14)
(4,13)-(4,19)
(4,17)-(4,19)
*)

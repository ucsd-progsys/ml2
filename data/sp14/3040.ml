
let stringOfList f l =
  let g a x = a ^ ("; " ^ (f x)) in "[" ^ ((List.map g l) "]");;


(* fix

let stringOfList f l =
  match l with
  | [] -> "[]"
  | x::xs ->
      let g a x = a ^ ("; " ^ (f x)) in
      let base = "[" ^ (f x) in (List.fold_left g base xs) ^ "]";;

let stringOfList f l = "[" ^ ((stringOfList f (List.map f l)) ^ "]");;

*)

(* changed spans
(3,2)-(3,62)
(3,36)-(3,62)
(3,43)-(3,57)
(3,44)-(3,52)
(3,53)-(3,54)
(3,55)-(3,56)
*)

(* type error slice
(3,42)-(3,62)
(3,43)-(3,57)
(3,44)-(3,52)
*)

(* all spans
(2,17)-(3,62)
(2,19)-(3,62)
(3,2)-(3,62)
(3,8)-(3,32)
(3,10)-(3,32)
(3,14)-(3,32)
(3,16)-(3,17)
(3,14)-(3,15)
(3,18)-(3,32)
(3,24)-(3,25)
(3,19)-(3,23)
(3,26)-(3,31)
(3,27)-(3,28)
(3,29)-(3,30)
(3,36)-(3,62)
(3,40)-(3,41)
(3,36)-(3,39)
(3,42)-(3,62)
(3,43)-(3,57)
(3,44)-(3,52)
(3,53)-(3,54)
(3,55)-(3,56)
(3,58)-(3,61)
*)

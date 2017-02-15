
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sepConcat a x) in
      let base = h ^ sep in let l = List.rev t in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (x ^ a) in
      let base = h ^ sep in let l = List.rev t in List.fold_left f base l;;

*)

(* changed spans
(6,23)-(6,32)
(6,33)-(6,34)
(7,6)-(7,73)
*)

(* type error slice
(2,3)-(7,75)
(2,18)-(7,73)
(2,22)-(7,73)
(3,2)-(7,73)
(3,2)-(7,73)
(3,8)-(3,10)
(6,6)-(7,73)
(6,12)-(6,37)
(6,14)-(6,37)
(6,22)-(6,37)
(6,23)-(6,32)
(6,35)-(6,36)
(7,28)-(7,73)
(7,36)-(7,44)
(7,36)-(7,46)
(7,45)-(7,46)
(7,50)-(7,64)
(7,50)-(7,73)
(7,65)-(7,66)
(7,72)-(7,73)
*)

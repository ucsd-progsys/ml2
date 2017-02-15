
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = (x h) :: a in
      let base = h in let l = t in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ x in
      let base = h in let l = t in List.fold_left f base l;;

*)

(* changed spans
(6,18)-(6,23)
(6,18)-(6,28)
(6,19)-(6,20)
(6,21)-(6,22)
(6,27)-(6,28)
(7,6)-(7,58)
*)

(* type error slice
(3,2)-(7,58)
(3,2)-(7,58)
(6,6)-(7,58)
(6,12)-(6,28)
(6,14)-(6,28)
(6,18)-(6,23)
(6,19)-(6,20)
(6,21)-(6,22)
(7,22)-(7,58)
(7,30)-(7,31)
(7,35)-(7,49)
(7,35)-(7,58)
(7,50)-(7,51)
(7,57)-(7,58)
*)


let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ h) in
      let base = "" in let l = sepConcat t in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ h) in
      let base = "" in let l = t in List.fold_left f base l;;

*)

(* changed spans
(7,31)-(7,40)
(7,31)-(7,42)
*)

(* type error slice
(2,3)-(7,71)
(2,18)-(7,69)
(3,2)-(7,69)
(3,2)-(7,69)
(6,22)-(6,31)
(6,23)-(6,26)
(6,27)-(6,28)
(7,31)-(7,40)
(7,31)-(7,42)
(7,41)-(7,42)
*)

(* all spans
(2,18)-(7,69)
(2,22)-(7,69)
(3,2)-(7,69)
(3,8)-(3,10)
(4,10)-(4,12)
(6,6)-(7,69)
(6,12)-(6,31)
(6,14)-(6,31)
(6,18)-(6,31)
(6,20)-(6,21)
(6,18)-(6,19)
(6,22)-(6,31)
(6,27)-(6,28)
(6,23)-(6,26)
(6,29)-(6,30)
(7,6)-(7,69)
(7,17)-(7,19)
(7,23)-(7,69)
(7,31)-(7,42)
(7,31)-(7,40)
(7,41)-(7,42)
(7,46)-(7,69)
(7,46)-(7,60)
(7,61)-(7,62)
(7,63)-(7,67)
(7,68)-(7,69)
*)

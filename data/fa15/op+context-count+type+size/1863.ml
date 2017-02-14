
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = h ^ (sep ^ t) in
      let base = h in let l = t in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

*)

(* changed spans
(6,19)-(6,20)
(6,30)-(6,31)
*)

(* type error slice
(3,3)-(7,59)
(3,3)-(7,59)
(6,24)-(6,31)
(6,28)-(6,29)
(6,30)-(6,31)
*)

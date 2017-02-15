
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sepConcat sep x) in
      let base = "" in let l = t in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ sep in
      let base = h in let l = t in List.fold_left f base l;;

*)

(* changed spans
(6,22)-(6,39)
(6,23)-(6,32)
(6,37)-(6,38)
(7,17)-(7,19)
(7,23)-(7,59)
(7,31)-(7,32)
*)

(* type error slice
(2,3)-(7,61)
(2,18)-(7,59)
(2,22)-(7,59)
(3,2)-(7,59)
(3,2)-(7,59)
(3,8)-(3,10)
(6,6)-(7,59)
(6,12)-(6,39)
(6,14)-(6,39)
(6,22)-(6,39)
(6,23)-(6,32)
(6,37)-(6,38)
(7,23)-(7,59)
(7,31)-(7,32)
(7,36)-(7,50)
(7,36)-(7,59)
(7,51)-(7,52)
(7,58)-(7,59)
*)

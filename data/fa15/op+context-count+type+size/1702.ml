
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = match x with | [] -> a | hd::tl -> a ^ (sep ^ hd) in
      let base = h in let l = t in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = x in let base = h in let l = t in List.fold_left f base l;;

*)

(* changed spans
(6,19)-(6,67)
(6,40)-(6,41)
(6,54)-(6,55)
(6,54)-(6,67)
(6,56)-(6,57)
(6,59)-(6,62)
(6,59)-(6,67)
(6,63)-(6,64)
(6,65)-(6,67)
(7,7)-(7,59)
*)

(* type error slice
(3,3)-(7,59)
(3,3)-(7,59)
(6,7)-(7,59)
(6,13)-(6,67)
(6,15)-(6,67)
(6,19)-(6,67)
(6,19)-(6,67)
(6,25)-(6,26)
(6,54)-(6,55)
(6,54)-(6,67)
(6,56)-(6,57)
(7,7)-(7,59)
(7,18)-(7,19)
(7,23)-(7,59)
(7,31)-(7,32)
(7,36)-(7,50)
(7,36)-(7,59)
(7,51)-(7,52)
(7,53)-(7,57)
(7,58)-(7,59)
*)
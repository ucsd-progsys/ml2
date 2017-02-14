
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = sepConcat (";", (List.map (f, l)));;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = sepConcat "; " l;;

*)

(* changed spans
(9,24)-(9,55)
(9,35)-(9,38)
(9,35)-(9,55)
(9,41)-(9,55)
*)

(* type error slice
(2,4)-(7,61)
(2,19)-(7,59)
(6,24)-(6,27)
(6,24)-(6,31)
(6,28)-(6,29)
(9,24)-(9,33)
(9,24)-(9,55)
(9,35)-(9,55)
(9,41)-(9,49)
(9,41)-(9,55)
(9,51)-(9,55)
*)
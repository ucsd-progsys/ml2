
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = "[" ^ ((sepConcat (";" List.map (f l))) ^ "]");;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = sepConcat ";" (List.map f l);;

*)

(* changed spans
(9,24)-(9,27)
(9,28)-(9,29)
(9,32)-(9,60)
(9,32)-(9,69)
(9,43)-(9,60)
(9,64)-(9,65)
(9,66)-(9,69)
*)

(* type error slice
(2,4)-(7,61)
(2,19)-(7,59)
(2,23)-(7,59)
(9,32)-(9,41)
(9,32)-(9,60)
(9,32)-(9,69)
(9,43)-(9,46)
(9,43)-(9,60)
(9,64)-(9,65)
*)

let sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = List.map (sepConcat ";" l);;


(* fix

let sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = sepConcat ";" (List.map f l);;

*)

(* changed spans
(9,24)-(9,32)
(9,24)-(9,49)
(9,48)-(9,49)
*)

(* type error slice
(2,4)-(7,61)
(2,15)-(7,59)
(2,19)-(7,59)
(3,3)-(7,59)
(4,11)-(4,13)
(9,24)-(9,32)
(9,24)-(9,49)
(9,34)-(9,43)
(9,34)-(9,49)
*)
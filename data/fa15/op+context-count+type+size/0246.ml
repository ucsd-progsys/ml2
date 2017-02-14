
let sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ x in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = "[" ^ ((sepConcat (List.map f l)) ^ "]");;


(* fix

let sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ x in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = "[" ^ ((sepConcat "" (List.map f l)) ^ "]");;

*)

(* changed spans
(9,32)-(9,55)
(9,43)-(9,55)
*)

(* type error slice
(2,4)-(7,61)
(2,15)-(7,59)
(2,19)-(7,59)
(9,32)-(9,41)
(9,32)-(9,55)
(9,32)-(9,63)
(9,58)-(9,59)
*)

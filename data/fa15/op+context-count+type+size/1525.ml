
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = x ^ a in
      let base = if (List.length t) <> 0 then "" else sep in
      let l = if (List.length t) <> 0 then t else h in
      List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = x ^ a in
      let base = if (List.length t) <> 0 then "" else sep in
      let l = if (List.length t) <> 0 then t else [h] in
      List.fold_left f base l;;

*)

(* changed spans
(8,50)-(8,51)
*)

(* type error slice
(3,2)-(9,29)
(3,2)-(9,29)
(8,14)-(8,51)
(8,14)-(8,51)
(8,43)-(8,44)
(8,50)-(8,51)
*)

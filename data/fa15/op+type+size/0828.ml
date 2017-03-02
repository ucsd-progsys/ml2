
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = h in
        let rest' = if ((List.mem seen'), seen) then t else seen' @ seen in
        helper (seen', rest') in
  List.rev (helper ([], l));;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if List.mem h seen then seen else h :: seen in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans
(7,20)-(7,21)
(8,8)-(9,29)
(8,23)-(8,47)
(8,24)-(8,40)
(8,34)-(8,39)
(8,53)-(8,54)
(8,60)-(8,65)
(8,60)-(8,72)
(8,66)-(8,67)
(9,8)-(9,29)
*)

(* type error slice
(4,4)-(9,29)
(4,4)-(9,29)
(7,8)-(9,29)
(7,20)-(7,21)
(8,20)-(8,72)
(8,20)-(8,72)
(8,20)-(8,72)
(8,23)-(8,47)
(8,53)-(8,54)
(8,60)-(8,65)
(8,60)-(8,72)
(8,66)-(8,67)
*)

(* all spans
(2,21)-(10,27)
(3,2)-(10,27)
(3,18)-(9,29)
(4,4)-(9,29)
(4,10)-(4,14)
(5,12)-(5,16)
(7,8)-(9,29)
(7,20)-(7,21)
(8,8)-(9,29)
(8,20)-(8,72)
(8,23)-(8,47)
(8,24)-(8,40)
(8,25)-(8,33)
(8,34)-(8,39)
(8,42)-(8,46)
(8,53)-(8,54)
(8,60)-(8,72)
(8,66)-(8,67)
(8,60)-(8,65)
(8,68)-(8,72)
(9,8)-(9,29)
(9,8)-(9,14)
(9,15)-(9,29)
(9,16)-(9,21)
(9,23)-(9,28)
(10,2)-(10,27)
(10,2)-(10,10)
(10,11)-(10,27)
(10,12)-(10,18)
(10,19)-(10,26)
(10,20)-(10,22)
(10,24)-(10,25)
*)

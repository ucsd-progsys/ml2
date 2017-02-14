
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if List.mem h seen then h @ seen in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if (List.mem h seen) = false then [h] @ seen else seen in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans
(7,21)-(7,53)
(7,24)-(7,39)
(7,45)-(7,46)
(7,45)-(7,53)
(9,21)-(9,23)
(9,25)-(9,26)
*)

(* type error slice
(7,24)-(7,32)
(7,24)-(7,39)
(7,33)-(7,34)
(7,35)-(7,39)
(7,45)-(7,46)
(7,45)-(7,53)
(7,47)-(7,48)
(7,49)-(7,53)
*)
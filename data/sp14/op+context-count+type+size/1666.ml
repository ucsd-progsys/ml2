
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if !(List.mem h seen) then h :: seen in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if List.mem h seen then h :: seen else h :: seen in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans
(7,21)-(7,57)
(7,24)-(7,25)
(7,24)-(7,41)
(8,9)-(8,46)
*)

(* type error slice
(7,21)-(7,57)
(7,21)-(7,57)
(7,21)-(7,57)
(7,24)-(7,25)
(7,24)-(7,41)
(7,26)-(7,34)
(7,26)-(7,41)
(7,48)-(7,57)
*)

let rec sumList xs = match xs with | [] -> 0 | (h::t)::[] -> h + (sumList t);;


(* fix

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

*)

(* changed spans
(2,21)-(2,76)
*)

(* type error slice
(2,3)-(2,78)
(2,16)-(2,76)
(2,21)-(2,76)
(2,21)-(2,76)
(2,21)-(2,76)
(2,27)-(2,29)
(2,65)-(2,76)
(2,66)-(2,73)
(2,74)-(2,75)
*)

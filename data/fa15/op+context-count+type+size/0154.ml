
let rec sumList xs = match xs with | [] -> 0 | h::t -> h +. (sumList t);;


(* fix

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

*)

(* changed spans
(2,56)-(2,71)
*)

(* type error slice
(2,4)-(2,74)
(2,17)-(2,71)
(2,22)-(2,71)
(2,22)-(2,71)
(2,44)-(2,45)
(2,56)-(2,71)
(2,56)-(2,71)
(2,62)-(2,69)
(2,62)-(2,71)
*)
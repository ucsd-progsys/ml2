
let rec assoc (d,k,l) =
  match l with | [] -> d | (s,i)::t -> if s = k then true else assoc (d k t);;


(* fix

let rec assoc (d,k,l) =
  match l with
  | [] -> d
  | h::t -> if (fst h) = k then snd h else assoc (d, k, t);;

*)

(* changed spans
(3,2)-(3,76)
(3,42)-(3,43)
(3,46)-(3,47)
(3,53)-(3,57)
(3,63)-(3,68)
(3,69)-(3,76)
*)

(* type error slice
(3,2)-(3,76)
(3,2)-(3,76)
(3,23)-(3,24)
(3,39)-(3,76)
(3,53)-(3,57)
(3,69)-(3,76)
(3,70)-(3,71)
*)

(* all spans
(2,15)-(3,76)
(3,2)-(3,76)
(3,8)-(3,9)
(3,23)-(3,24)
(3,39)-(3,76)
(3,42)-(3,47)
(3,42)-(3,43)
(3,46)-(3,47)
(3,53)-(3,57)
(3,63)-(3,76)
(3,63)-(3,68)
(3,69)-(3,76)
(3,70)-(3,71)
(3,72)-(3,73)
(3,74)-(3,75)
*)

let rec digitsOfInt n = match n with | [] -> [] | h::t -> if n < 0 then [];;


(* fix

let rec digitsOfInt n = match n with | _ when n < 0 -> [];;

*)

(* changed spans
(2,24)-(2,74)
(2,58)-(2,74)
*)

(* type error slice
(2,24)-(2,74)
(2,24)-(2,74)
(2,24)-(2,74)
(2,24)-(2,74)
(2,30)-(2,31)
(2,58)-(2,74)
(2,58)-(2,74)
(2,58)-(2,74)
(2,61)-(2,62)
(2,61)-(2,66)
(2,61)-(2,66)
(2,65)-(2,66)
(2,72)-(2,74)
*)

(* all spans
(2,20)-(2,74)
(2,24)-(2,74)
(2,30)-(2,31)
(2,45)-(2,47)
(2,58)-(2,74)
(2,61)-(2,66)
(2,61)-(2,62)
(2,65)-(2,66)
(2,72)-(2,74)
(2,58)-(2,74)
*)
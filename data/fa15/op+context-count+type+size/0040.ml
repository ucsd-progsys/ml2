
let rec listReverse l =
  match l with | [] -> [] | t -> t | h::t -> [h] @ (listReverse [t]);;


(* fix

let rec listReverse l =
  match l with | [] -> [] | t -> t | h::t -> t @ (listReverse [h]);;

*)

(* changed spans
(3,45)-(3,48)
(3,46)-(3,47)
(3,65)-(3,66)
*)

(* type error slice
(2,3)-(3,70)
(2,20)-(3,68)
(3,2)-(3,68)
(3,2)-(3,68)
(3,8)-(3,9)
(3,51)-(3,68)
(3,52)-(3,63)
(3,64)-(3,67)
(3,64)-(3,67)
(3,65)-(3,66)
*)

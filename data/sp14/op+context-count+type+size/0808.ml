
let rec wwhile (f,b) =
  let y = f b in match y with | (b',c') -> if c' then b' else f b';;


(* fix

let rec wwhile (f,b) =
  let y = f b in match y with | (b',c') -> if c' then b' else wwhile (f, b');;

*)

(* changed spans
(3,62)-(3,63)
*)

(* type error slice
(3,2)-(3,66)
(3,10)-(3,11)
(3,10)-(3,13)
(3,17)-(3,66)
(3,23)-(3,24)
(3,43)-(3,66)
(3,43)-(3,66)
(3,54)-(3,56)
(3,62)-(3,63)
(3,62)-(3,66)
*)

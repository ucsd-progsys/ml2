
let stringOfList f l = "[" ^ ((List.map f l) ^ "]");;


(* fix

let stringOfList f l = "[" ^ ("List.map f l" ^ "]");;

*)

(* changed spans
(2,32)-(2,40)
(2,32)-(2,44)
(2,41)-(2,42)
(2,43)-(2,44)
*)

(* type error slice
(2,32)-(2,40)
(2,32)-(2,44)
(2,32)-(2,51)
(2,46)-(2,47)
*)

let rec wwhile (f,b) =
  match f b with | (h1,h2) -> if h2 then wwhile (f, h1) else h1;;

let fixpoint (f,b) = wwhile ((let f' f b = (f b) = b in f'), b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (h1,h2) -> if h2 then wwhile (f, h1) else h1;;

let fixpoint (f,b) =
  wwhile
    ((let f' b = if (f b) = b then (b, true) else ((f b), false) in f'), b);;

*)

(* changed spans
(5,37)-(5,52)
(5,43)-(5,52)
(5,56)-(5,58)
*)

(* type error slice
(3,2)-(3,63)
(3,8)-(3,9)
(3,8)-(3,11)
(3,41)-(3,47)
(3,41)-(3,55)
(3,48)-(3,55)
(3,49)-(3,50)
(5,21)-(5,27)
(5,21)-(5,63)
(5,28)-(5,63)
(5,29)-(5,59)
(5,29)-(5,59)
(5,37)-(5,52)
(5,39)-(5,52)
(5,56)-(5,58)
*)

(* all spans
(2,16)-(3,63)
(3,2)-(3,63)
(3,8)-(3,11)
(3,8)-(3,9)
(3,10)-(3,11)
(3,30)-(3,63)
(3,33)-(3,35)
(3,41)-(3,55)
(3,41)-(3,47)
(3,48)-(3,55)
(3,49)-(3,50)
(3,52)-(3,54)
(3,61)-(3,63)
(5,14)-(5,63)
(5,21)-(5,63)
(5,21)-(5,27)
(5,28)-(5,63)
(5,29)-(5,59)
(5,37)-(5,52)
(5,39)-(5,52)
(5,43)-(5,52)
(5,43)-(5,48)
(5,44)-(5,45)
(5,46)-(5,47)
(5,51)-(5,52)
(5,56)-(5,58)
(5,61)-(5,62)
*)

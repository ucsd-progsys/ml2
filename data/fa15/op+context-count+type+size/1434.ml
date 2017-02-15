
let rec wwhile (f,b) =
  let (b',c') = f b in if c' = true then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((fun x  -> if b f b then b else f b), b);;


(* fix

let rec wwhile (f,b) =
  let (b',c') = f b in if c' = true then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((fun x  -> ((f b), ((f b) = b))), b);;

*)

(* changed spans
(5,40)-(5,64)
(5,43)-(5,44)
(5,43)-(5,48)
(5,45)-(5,46)
(5,54)-(5,55)
*)

(* type error slice
(3,2)-(3,63)
(3,16)-(3,17)
(3,16)-(3,19)
(3,41)-(3,47)
(3,41)-(3,55)
(3,48)-(3,55)
(3,49)-(3,50)
(5,21)-(5,27)
(5,21)-(5,69)
(5,28)-(5,69)
(5,29)-(5,65)
(5,40)-(5,64)
(5,43)-(5,44)
(5,43)-(5,48)
(5,47)-(5,48)
(5,54)-(5,55)
*)

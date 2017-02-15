
let rec wwhile (f,b) =
  let (b',c) = f b in if not c then b' else wwhile (f, b');;

let fixpoint (f,b) = wwhile ((f (f b)), b);;


(* fix

let rec wwhile (f,b) =
  let (b',c) = f b in if not c then b' else wwhile (f, b');;

let fixpoint (f,b) = wwhile ((let f' b = ((f b), (b = (f b))) in f'), b);;

*)

(* changed spans
(5,29)-(5,38)
(5,30)-(5,31)
(5,32)-(5,37)
(5,40)-(5,41)
*)

(* type error slice
(3,2)-(3,58)
(3,15)-(3,16)
(3,15)-(3,18)
(3,44)-(3,50)
(3,44)-(3,58)
(3,51)-(3,58)
(3,52)-(3,53)
(3,55)-(3,57)
(5,21)-(5,27)
(5,21)-(5,42)
(5,28)-(5,42)
(5,29)-(5,38)
(5,30)-(5,31)
(5,32)-(5,37)
(5,33)-(5,34)
(5,35)-(5,36)
(5,40)-(5,41)
*)

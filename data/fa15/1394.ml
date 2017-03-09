
let rec wwhile (f,b) =
  let (b',c) = f b in if not c then b' else wwhile (f, b');;

let fixpoint (f,b) =
  wwhile (let f' b = ((f b), (b = (f b))) in ((f' (f, b)), b));;


(* fix

let rec wwhile (f,b) =
  let (b',c) = f b in if not c then b' else wwhile (f, b');;

let fixpoint (f,b) = wwhile ((let f' b = ((f b), (b = (f b))) in f'), b);;

*)

(* changed spans
(6,9)-(6,62)
(6,17)-(6,41)
(6,45)-(6,61)
(6,46)-(6,57)
(6,50)-(6,56)
(6,51)-(6,52)
(6,59)-(6,60)
*)

(* type error slice
(6,9)-(6,62)
(6,17)-(6,41)
(6,34)-(6,39)
(6,35)-(6,36)
(6,37)-(6,38)
(6,46)-(6,57)
(6,47)-(6,49)
(6,50)-(6,56)
(6,51)-(6,52)
*)

(* all spans
(2,16)-(3,58)
(3,2)-(3,58)
(3,15)-(3,18)
(3,15)-(3,16)
(3,17)-(3,18)
(3,22)-(3,58)
(3,25)-(3,30)
(3,25)-(3,28)
(3,29)-(3,30)
(3,36)-(3,38)
(3,44)-(3,58)
(3,44)-(3,50)
(3,51)-(3,58)
(3,52)-(3,53)
(3,55)-(3,57)
(5,14)-(6,62)
(6,2)-(6,62)
(6,2)-(6,8)
(6,9)-(6,62)
(6,17)-(6,41)
(6,21)-(6,41)
(6,22)-(6,27)
(6,23)-(6,24)
(6,25)-(6,26)
(6,29)-(6,40)
(6,30)-(6,31)
(6,34)-(6,39)
(6,35)-(6,36)
(6,37)-(6,38)
(6,45)-(6,61)
(6,46)-(6,57)
(6,47)-(6,49)
(6,50)-(6,56)
(6,51)-(6,52)
(6,54)-(6,55)
(6,59)-(6,60)
*)

let wwhile (f,b) =
  let rec helper (f,b) (x,y) =
    match y with | true  -> helper (f, x) (f b) | false  -> x in
  helper (f, b) (b, true);;

let fixpoint (f,b) =
  if b != (f b) then let f = (f, true) in wwhile (f, (f b)) else b;;


(* fix

let wwhile (f,b) =
  let rec helper (f,b) (x,y) =
    match y with | true  -> helper (f, x) (f b) | false  -> x in
  helper (f, b) (b, true);;

let fixpoint (f,b) =
  if b = (f b) then f b else (let g b = ((f b), true) in wwhile (g, (f b)));;

*)

(* changed spans
(8,5)-(8,15)
(8,21)-(8,59)
(8,29)-(8,38)
(8,30)-(8,31)
(8,33)-(8,37)
(8,50)-(8,51)
(8,65)-(8,66)
*)

(* type error slice
(2,3)-(5,27)
(2,12)-(5,25)
(4,28)-(4,34)
(4,28)-(4,47)
(4,35)-(4,41)
(4,36)-(4,37)
(4,42)-(4,47)
(4,43)-(4,44)
(5,2)-(5,8)
(5,2)-(5,25)
(5,9)-(5,15)
(5,10)-(5,11)
(8,21)-(8,59)
(8,29)-(8,38)
(8,42)-(8,48)
(8,42)-(8,59)
(8,49)-(8,59)
(8,50)-(8,51)
(8,53)-(8,58)
(8,54)-(8,55)
*)

(* all spans
(2,12)-(5,25)
(3,2)-(5,25)
(3,18)-(4,61)
(3,24)-(4,61)
(4,4)-(4,61)
(4,10)-(4,11)
(4,28)-(4,47)
(4,28)-(4,34)
(4,35)-(4,41)
(4,36)-(4,37)
(4,39)-(4,40)
(4,42)-(4,47)
(4,43)-(4,44)
(4,45)-(4,46)
(4,60)-(4,61)
(5,2)-(5,25)
(5,2)-(5,8)
(5,9)-(5,15)
(5,10)-(5,11)
(5,13)-(5,14)
(5,16)-(5,25)
(5,17)-(5,18)
(5,20)-(5,24)
(7,14)-(8,66)
(8,2)-(8,66)
(8,5)-(8,15)
(8,5)-(8,6)
(8,10)-(8,15)
(8,11)-(8,12)
(8,13)-(8,14)
(8,21)-(8,59)
(8,29)-(8,38)
(8,30)-(8,31)
(8,33)-(8,37)
(8,42)-(8,59)
(8,42)-(8,48)
(8,49)-(8,59)
(8,50)-(8,51)
(8,53)-(8,58)
(8,54)-(8,55)
(8,56)-(8,57)
(8,65)-(8,66)
*)

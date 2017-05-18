
let rec wwhile (f,b) =
  let rec wwhelper f b =
    let (b',c') = f b in if c' = false then b' else wwhelper f b' in
  wwhelper f b;;

let fixpoint (f,b) =
  ((wwhile (let helper x = (f x) != (f b) in helper b)), b);;


(* fix

let rec wwhile (f,b) =
  let rec wwhelper f b =
    let (b',c') = f b in if c' = false then b' else wwhelper f b' in
  wwhelper f b;;

let fixpoint (f,b) =
  wwhile ((let helper x = ((f x), ((f x) = (f b))) in helper), b);;

*)

(* changed spans
(8,2)-(8,59)
(8,11)-(8,54)
(8,27)-(8,41)
(8,36)-(8,41)
(8,39)-(8,40)
(8,45)-(8,51)
(8,57)-(8,58)
*)

(* type error slice
(2,3)-(5,16)
(2,16)-(5,14)
(8,3)-(8,55)
(8,4)-(8,10)
(8,11)-(8,54)
(8,11)-(8,54)
(8,23)-(8,41)
(8,27)-(8,41)
(8,45)-(8,51)
(8,45)-(8,53)
*)

(* all spans
(2,16)-(5,14)
(3,2)-(5,14)
(3,19)-(4,65)
(3,21)-(4,65)
(4,4)-(4,65)
(4,18)-(4,21)
(4,18)-(4,19)
(4,20)-(4,21)
(4,25)-(4,65)
(4,28)-(4,38)
(4,28)-(4,30)
(4,33)-(4,38)
(4,44)-(4,46)
(4,52)-(4,65)
(4,52)-(4,60)
(4,61)-(4,62)
(4,63)-(4,65)
(5,2)-(5,14)
(5,2)-(5,10)
(5,11)-(5,12)
(5,13)-(5,14)
(7,14)-(8,59)
(8,2)-(8,59)
(8,3)-(8,55)
(8,4)-(8,10)
(8,11)-(8,54)
(8,23)-(8,41)
(8,27)-(8,41)
(8,27)-(8,32)
(8,28)-(8,29)
(8,30)-(8,31)
(8,36)-(8,41)
(8,37)-(8,38)
(8,39)-(8,40)
(8,45)-(8,53)
(8,45)-(8,51)
(8,52)-(8,53)
(8,57)-(8,58)
*)

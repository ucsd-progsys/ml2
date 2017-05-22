
let rec clone x n =
  if n <= 0 then [] else if n = 1 then [x] else [x] @ (clone x (n - 1));;

let padZero l1 l2 =
  let n = (List.length l1) - (List.length l2) in
  if n < 0 then (((clone 0 (- n)) @ l1), l2) else (l1, ((clone 0 n) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = let (x1,x2) = x in (0, (x1 + x2)) :: a in
    let base = [(0, 0)] in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n =
  if n <= 0 then [] else if n = 1 then [x] else [x] @ (clone x (n - 1));;

let padZero l1 l2 =
  let n = (List.length l1) - (List.length l2) in
  if n < 0 then (((clone 0 (- n)) @ l1), l2) else (l1, ((clone 0 n) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (a1,a2) = a in
      ((if ((a1 + x1) + x2) >= 10 then 1 else 0), (((a1 + x1) + x2) :: a2)) in
    let base = (0, [0]) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(14,35)-(14,49)
(14,35)-(14,54)
(14,36)-(14,37)
(14,39)-(14,48)
(14,40)-(14,42)
(14,53)-(14,54)
(15,15)-(15,23)
(15,20)-(15,21)
*)

(* type error slice
(14,4)-(17,51)
(14,10)-(14,54)
(14,35)-(14,54)
(14,53)-(14,54)
(17,4)-(17,51)
(17,18)-(17,32)
(17,18)-(17,44)
(17,33)-(17,34)
*)

(* all spans
(2,14)-(3,71)
(2,16)-(3,71)
(3,2)-(3,71)
(3,5)-(3,11)
(3,5)-(3,6)
(3,10)-(3,11)
(3,17)-(3,19)
(3,25)-(3,71)
(3,28)-(3,33)
(3,28)-(3,29)
(3,32)-(3,33)
(3,39)-(3,42)
(3,40)-(3,41)
(3,48)-(3,71)
(3,52)-(3,53)
(3,48)-(3,51)
(3,49)-(3,50)
(3,54)-(3,71)
(3,55)-(3,60)
(3,61)-(3,62)
(3,63)-(3,70)
(3,64)-(3,65)
(3,68)-(3,69)
(5,12)-(7,74)
(5,15)-(7,74)
(6,2)-(7,74)
(6,10)-(6,45)
(6,10)-(6,26)
(6,11)-(6,22)
(6,23)-(6,25)
(6,29)-(6,45)
(6,30)-(6,41)
(6,42)-(6,44)
(7,2)-(7,74)
(7,5)-(7,10)
(7,5)-(7,6)
(7,9)-(7,10)
(7,16)-(7,44)
(7,17)-(7,39)
(7,34)-(7,35)
(7,18)-(7,33)
(7,19)-(7,24)
(7,25)-(7,26)
(7,27)-(7,32)
(7,30)-(7,31)
(7,36)-(7,38)
(7,41)-(7,43)
(7,50)-(7,74)
(7,51)-(7,53)
(7,55)-(7,73)
(7,68)-(7,69)
(7,56)-(7,67)
(7,57)-(7,62)
(7,63)-(7,64)
(7,65)-(7,66)
(7,70)-(7,72)
(9,19)-(10,69)
(10,2)-(10,69)
(10,8)-(10,9)
(10,23)-(10,25)
(10,36)-(10,69)
(10,39)-(10,44)
(10,39)-(10,40)
(10,43)-(10,44)
(10,50)-(10,62)
(10,50)-(10,60)
(10,61)-(10,62)
(10,68)-(10,69)
(12,11)-(18,34)
(12,14)-(18,34)
(13,2)-(18,34)
(13,11)-(17,51)
(14,4)-(17,51)
(14,10)-(14,54)
(14,12)-(14,54)
(14,16)-(14,54)
(14,30)-(14,31)
(14,35)-(14,54)
(14,35)-(14,49)
(14,36)-(14,37)
(14,39)-(14,48)
(14,40)-(14,42)
(14,45)-(14,47)
(14,53)-(14,54)
(15,4)-(17,51)
(15,15)-(15,23)
(15,16)-(15,22)
(15,17)-(15,18)
(15,20)-(15,21)
(16,4)-(17,51)
(16,15)-(16,33)
(16,15)-(16,27)
(16,28)-(16,30)
(16,31)-(16,33)
(17,4)-(17,51)
(17,18)-(17,44)
(17,18)-(17,32)
(17,33)-(17,34)
(17,35)-(17,39)
(17,40)-(17,44)
(17,48)-(17,51)
(18,2)-(18,34)
(18,2)-(18,12)
(18,13)-(18,34)
(18,14)-(18,17)
(18,18)-(18,33)
(18,19)-(18,26)
(18,27)-(18,29)
(18,30)-(18,32)
*)

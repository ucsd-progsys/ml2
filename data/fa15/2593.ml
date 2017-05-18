
let rec clone x n = if n < 1 then [] else [x] @ (clone x (n - 1));;

let padZero l1 l2 =
  let length1 = List.length l1 in
  let length2 = List.length l2 in
  if length1 < length2
  then (((clone 0 (length2 - length1)) @ l1), l2)
  else
    if length2 < length1
    then (l1, ((clone 0 (length1 - length2)) @ l2))
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else [h] @ t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (j,k) = x in
      let (carry,rest) = a in
      ((((j + k) + carry) / 10), ([((j + k) + carry) mod 10] @ rest)) in
    let base = (0, []) in
    let args = List.combine (List.rev l1) (List.rev l2) in
    let (car,res) = List.fold_left f base args in [car] @ res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  if i < 2
  then l
  else (let total = bigAdd l l in (total + (mulByDigit i)) - (1 l));;


(* fix

let rec clone x n = if n < 1 then [] else [x] @ (clone x (n - 1));;

let padZero l1 l2 =
  let length1 = List.length l1 in
  let length2 = List.length l2 in
  if length1 < length2
  then (((clone 0 (length2 - length1)) @ l1), l2)
  else
    if length2 < length1
    then (l1, ((clone 0 (length1 - length2)) @ l2))
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else [h] @ t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (j,k) = x in
      let (carry,rest) = a in
      ((((j + k) + carry) / 10), ([((j + k) + carry) mod 10] @ rest)) in
    let base = (0, []) in
    let args = List.combine (List.rev l1) (List.rev l2) in
    let (car,res) = List.fold_left f base args in [car] @ res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  if i < 2
  then l
  else (let total = bigAdd l l in bigAdd total (mulByDigit (i - 1) l));;

*)

(* changed spans
(31,34)-(31,58)
(31,34)-(31,66)
(31,35)-(31,40)
(31,43)-(31,57)
(31,55)-(31,56)
(31,61)-(31,66)
*)

(* type error slice
(4,3)-(12,19)
(4,12)-(12,17)
(8,8)-(8,44)
(8,39)-(8,40)
(8,41)-(8,43)
(15,36)-(15,75)
(15,36)-(15,75)
(15,50)-(15,60)
(15,50)-(15,62)
(15,68)-(15,75)
(15,72)-(15,73)
(17,3)-(26,36)
(17,11)-(26,34)
(17,14)-(26,34)
(18,2)-(26,34)
(26,2)-(26,12)
(26,2)-(26,34)
(26,18)-(26,33)
(26,19)-(26,26)
(26,27)-(26,29)
(28,3)-(31,69)
(28,19)-(31,67)
(28,21)-(31,67)
(29,2)-(31,67)
(29,2)-(31,67)
(30,7)-(30,8)
(31,7)-(31,67)
(31,7)-(31,67)
(31,20)-(31,26)
(31,20)-(31,30)
(31,27)-(31,28)
(31,34)-(31,58)
(31,34)-(31,58)
(31,34)-(31,66)
(31,35)-(31,40)
(31,43)-(31,57)
(31,44)-(31,54)
(31,61)-(31,66)
(31,62)-(31,63)
*)

(* all spans
(2,14)-(2,65)
(2,16)-(2,65)
(2,20)-(2,65)
(2,23)-(2,28)
(2,23)-(2,24)
(2,27)-(2,28)
(2,34)-(2,36)
(2,42)-(2,65)
(2,46)-(2,47)
(2,42)-(2,45)
(2,43)-(2,44)
(2,48)-(2,65)
(2,49)-(2,54)
(2,55)-(2,56)
(2,57)-(2,64)
(2,58)-(2,59)
(2,62)-(2,63)
(4,12)-(12,17)
(4,15)-(12,17)
(5,2)-(12,17)
(5,16)-(5,30)
(5,16)-(5,27)
(5,28)-(5,30)
(6,2)-(12,17)
(6,16)-(6,30)
(6,16)-(6,27)
(6,28)-(6,30)
(7,2)-(12,17)
(7,5)-(7,22)
(7,5)-(7,12)
(7,15)-(7,22)
(8,7)-(8,49)
(8,8)-(8,44)
(8,39)-(8,40)
(8,9)-(8,38)
(8,10)-(8,15)
(8,16)-(8,17)
(8,18)-(8,37)
(8,19)-(8,26)
(8,29)-(8,36)
(8,41)-(8,43)
(8,46)-(8,48)
(10,4)-(12,17)
(10,7)-(10,24)
(10,7)-(10,14)
(10,17)-(10,24)
(11,9)-(11,51)
(11,10)-(11,12)
(11,14)-(11,50)
(11,45)-(11,46)
(11,15)-(11,44)
(11,16)-(11,21)
(11,22)-(11,23)
(11,24)-(11,43)
(11,25)-(11,32)
(11,35)-(11,42)
(11,47)-(11,49)
(12,9)-(12,17)
(12,10)-(12,12)
(12,14)-(12,16)
(14,19)-(15,75)
(15,2)-(15,75)
(15,8)-(15,9)
(15,23)-(15,25)
(15,36)-(15,75)
(15,39)-(15,44)
(15,39)-(15,40)
(15,43)-(15,44)
(15,50)-(15,62)
(15,50)-(15,60)
(15,61)-(15,62)
(15,68)-(15,75)
(15,72)-(15,73)
(15,68)-(15,71)
(15,69)-(15,70)
(15,74)-(15,75)
(17,11)-(26,34)
(17,14)-(26,34)
(18,2)-(26,34)
(18,11)-(25,61)
(19,4)-(25,61)
(19,10)-(22,69)
(19,12)-(22,69)
(20,6)-(22,69)
(20,18)-(20,19)
(21,6)-(22,69)
(21,25)-(21,26)
(22,6)-(22,69)
(22,7)-(22,31)
(22,8)-(22,25)
(22,9)-(22,16)
(22,10)-(22,11)
(22,14)-(22,15)
(22,19)-(22,24)
(22,28)-(22,30)
(22,33)-(22,68)
(22,61)-(22,62)
(22,34)-(22,60)
(22,35)-(22,59)
(22,35)-(22,52)
(22,36)-(22,43)
(22,37)-(22,38)
(22,41)-(22,42)
(22,46)-(22,51)
(22,57)-(22,59)
(22,63)-(22,67)
(23,4)-(25,61)
(23,15)-(23,22)
(23,16)-(23,17)
(23,19)-(23,21)
(24,4)-(25,61)
(24,15)-(24,55)
(24,15)-(24,27)
(24,28)-(24,41)
(24,29)-(24,37)
(24,38)-(24,40)
(24,42)-(24,55)
(24,43)-(24,51)
(24,52)-(24,54)
(25,4)-(25,61)
(25,20)-(25,46)
(25,20)-(25,34)
(25,35)-(25,36)
(25,37)-(25,41)
(25,42)-(25,46)
(25,50)-(25,61)
(25,56)-(25,57)
(25,50)-(25,55)
(25,51)-(25,54)
(25,58)-(25,61)
(26,2)-(26,34)
(26,2)-(26,12)
(26,13)-(26,34)
(26,14)-(26,17)
(26,18)-(26,33)
(26,19)-(26,26)
(26,27)-(26,29)
(26,30)-(26,32)
(28,19)-(31,67)
(28,21)-(31,67)
(29,2)-(31,67)
(29,5)-(29,10)
(29,5)-(29,6)
(29,9)-(29,10)
(30,7)-(30,8)
(31,7)-(31,67)
(31,20)-(31,30)
(31,20)-(31,26)
(31,27)-(31,28)
(31,29)-(31,30)
(31,34)-(31,66)
(31,34)-(31,58)
(31,35)-(31,40)
(31,43)-(31,57)
(31,44)-(31,54)
(31,55)-(31,56)
(31,61)-(31,66)
(31,62)-(31,63)
(31,64)-(31,65)
*)


let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then
    let n = (List.length l2) - (List.length l1) in (((clone 0 n) @ l1), l2)
  else
    if (List.length l2) < (List.length l1)
    then
      (let n = (List.length l1) - (List.length l2) in
       (l1, ((clone 0 n) @ l2)))
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> l | h::t -> if h = 0 then removeZero t else l;;

let sumHelper sum =
  let newCarry = sum / 10 in
  let nextDigit = sum mod 10 in (newCarry, nextDigit);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (val1,val2) = x in
      let (lastCarry,lastTupleSum) = a in
      let tupleSum = (val1 + val2) + lastCarry in
      let (newCarry,nextDigit) = sumHelper tupleSum in
      (newCarry, (nextDigit :: lastTupleSum)) in
    let base = (0, []) in
    let args = List.rev (List.combine (0 :: l1) (0 :: l2)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  if i = 0 then 0 else if i = 1 then l else bigAdd l mulByDigit ((i - 1), l);;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then
    let n = (List.length l2) - (List.length l1) in (((clone 0 n) @ l1), l2)
  else
    if (List.length l2) < (List.length l1)
    then
      (let n = (List.length l1) - (List.length l2) in
       (l1, ((clone 0 n) @ l2)))
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> l | h::t -> if h = 0 then removeZero t else l;;

let sumHelper sum =
  let newCarry = sum / 10 in
  let nextDigit = sum mod 10 in (newCarry, nextDigit);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (val1,val2) = x in
      let (lastCarry,lastTupleSum) = a in
      let tupleSum = (val1 + val2) + lastCarry in
      let (newCarry,nextDigit) = sumHelper tupleSum in
      (newCarry, (nextDigit :: lastTupleSum)) in
    let base = (0, []) in
    let args = List.rev (List.combine (0 :: l1) (0 :: l2)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  if i = 0 then [0] else if i = 1 then l else bigAdd l (mulByDigit (i - 1) l);;

*)

(* changed spans
(36,16)-(36,17)
(36,44)-(36,76)
(36,53)-(36,63)
(36,64)-(36,76)
*)

(* type error slice
(16,2)-(16,68)
(16,2)-(16,68)
(16,8)-(16,9)
(16,35)-(16,68)
(16,35)-(16,68)
(16,49)-(16,59)
(16,49)-(16,61)
(16,67)-(16,68)
(22,3)-(33,36)
(22,11)-(33,34)
(22,14)-(33,34)
(23,2)-(33,34)
(33,2)-(33,12)
(33,2)-(33,34)
(36,44)-(36,50)
(36,44)-(36,76)
*)

(* all spans
(2,14)-(2,65)
(2,16)-(2,65)
(2,20)-(2,65)
(2,23)-(2,29)
(2,23)-(2,24)
(2,28)-(2,29)
(2,35)-(2,37)
(2,43)-(2,65)
(2,43)-(2,44)
(2,48)-(2,65)
(2,49)-(2,54)
(2,55)-(2,56)
(2,57)-(2,64)
(2,58)-(2,59)
(2,62)-(2,63)
(4,12)-(13,17)
(4,15)-(13,17)
(5,2)-(13,17)
(5,5)-(5,40)
(5,5)-(5,21)
(5,6)-(5,17)
(5,18)-(5,20)
(5,24)-(5,40)
(5,25)-(5,36)
(5,37)-(5,39)
(7,4)-(7,75)
(7,12)-(7,47)
(7,12)-(7,28)
(7,13)-(7,24)
(7,25)-(7,27)
(7,31)-(7,47)
(7,32)-(7,43)
(7,44)-(7,46)
(7,51)-(7,75)
(7,52)-(7,70)
(7,65)-(7,66)
(7,53)-(7,64)
(7,54)-(7,59)
(7,60)-(7,61)
(7,62)-(7,63)
(7,67)-(7,69)
(7,72)-(7,74)
(9,4)-(13,17)
(9,7)-(9,42)
(9,7)-(9,23)
(9,8)-(9,19)
(9,20)-(9,22)
(9,26)-(9,42)
(9,27)-(9,38)
(9,39)-(9,41)
(11,6)-(12,32)
(11,15)-(11,50)
(11,15)-(11,31)
(11,16)-(11,27)
(11,28)-(11,30)
(11,34)-(11,50)
(11,35)-(11,46)
(11,47)-(11,49)
(12,7)-(12,31)
(12,8)-(12,10)
(12,12)-(12,30)
(12,25)-(12,26)
(12,13)-(12,24)
(12,14)-(12,19)
(12,20)-(12,21)
(12,22)-(12,23)
(12,27)-(12,29)
(13,9)-(13,17)
(13,10)-(13,12)
(13,14)-(13,16)
(15,19)-(16,68)
(16,2)-(16,68)
(16,8)-(16,9)
(16,23)-(16,24)
(16,35)-(16,68)
(16,38)-(16,43)
(16,38)-(16,39)
(16,42)-(16,43)
(16,49)-(16,61)
(16,49)-(16,59)
(16,60)-(16,61)
(16,67)-(16,68)
(18,14)-(20,53)
(19,2)-(20,53)
(19,17)-(19,25)
(19,17)-(19,20)
(19,23)-(19,25)
(20,2)-(20,53)
(20,18)-(20,28)
(20,18)-(20,21)
(20,26)-(20,28)
(20,32)-(20,53)
(20,33)-(20,41)
(20,43)-(20,52)
(22,11)-(33,34)
(22,14)-(33,34)
(23,2)-(33,34)
(23,11)-(32,51)
(24,4)-(32,51)
(24,10)-(29,45)
(24,12)-(29,45)
(25,6)-(29,45)
(25,24)-(25,25)
(26,6)-(29,45)
(26,37)-(26,38)
(27,6)-(29,45)
(27,21)-(27,46)
(27,21)-(27,34)
(27,22)-(27,26)
(27,29)-(27,33)
(27,37)-(27,46)
(28,6)-(29,45)
(28,33)-(28,51)
(28,33)-(28,42)
(28,43)-(28,51)
(29,6)-(29,45)
(29,7)-(29,15)
(29,17)-(29,44)
(29,18)-(29,27)
(29,31)-(29,43)
(30,4)-(32,51)
(30,15)-(30,22)
(30,16)-(30,17)
(30,19)-(30,21)
(31,4)-(32,51)
(31,15)-(31,58)
(31,15)-(31,23)
(31,24)-(31,58)
(31,25)-(31,37)
(31,38)-(31,47)
(31,39)-(31,40)
(31,44)-(31,46)
(31,48)-(31,57)
(31,49)-(31,50)
(31,54)-(31,56)
(32,4)-(32,51)
(32,18)-(32,44)
(32,18)-(32,32)
(32,33)-(32,34)
(32,35)-(32,39)
(32,40)-(32,44)
(32,48)-(32,51)
(33,2)-(33,34)
(33,2)-(33,12)
(33,13)-(33,34)
(33,14)-(33,17)
(33,18)-(33,33)
(33,19)-(33,26)
(33,27)-(33,29)
(33,30)-(33,32)
(35,19)-(36,76)
(35,21)-(36,76)
(36,2)-(36,76)
(36,5)-(36,10)
(36,5)-(36,6)
(36,9)-(36,10)
(36,16)-(36,17)
(36,23)-(36,76)
(36,26)-(36,31)
(36,26)-(36,27)
(36,30)-(36,31)
(36,37)-(36,38)
(36,44)-(36,76)
(36,44)-(36,50)
(36,51)-(36,52)
(36,53)-(36,63)
(36,64)-(36,76)
(36,65)-(36,72)
(36,66)-(36,67)
(36,70)-(36,71)
(36,74)-(36,75)
*)

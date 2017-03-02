
let rec clone x n =
  if n < 1 then [] else (match n with | _ -> x :: (clone x (n - 1)));;

let padZero l1 l2 =
  let s1 = List.length l1 in
  let s2 = List.length l2 in
  if s1 = s2
  then (l1, l2)
  else
    if s1 > s2
    then (l1, ((clone 0 (s1 - s2)) @ l2))
    else (((clone 0 (s2 - s1)) @ l1), l2);;

let rec removeZero l =
  if l = []
  then []
  else (let h::t = l in match h with | 0 -> removeZero t | _ -> l);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (c,a1::a2) = a in
      let v = (x1 + x2) + c in ((v / 10), ([v / 10] @ ([v mod 10] @ a2))) in
    let base = (0, [0]) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  if i < 1
  then []
  else (match i with | 1 -> l | _ -> bigAdd l (mulByDigit (i - 1) l));;

let bigMul l1 l2 =
  let f a x = (0, (bigAdd (mulByDigit x l2) a)) in
  let base = (0, [0]) in
  let args = l1 in let (_,res) = List.fold_left f base args in res;;


(* fix

let rec clone x n =
  if n < 1 then [] else (match n with | _ -> x :: (clone x (n - 1)));;

let padZero l1 l2 =
  let s1 = List.length l1 in
  let s2 = List.length l2 in
  if s1 = s2
  then (l1, l2)
  else
    if s1 > s2
    then (l1, ((clone 0 (s1 - s2)) @ l2))
    else (((clone 0 (s2 - s1)) @ l1), l2);;

let rec removeZero l =
  if l = []
  then []
  else (let h::t = l in match h with | 0 -> removeZero t | _ -> l);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (c,a1::a2) = a in
      let v = (x1 + x2) + c in ((v / 10), ([v / 10] @ ([v mod 10] @ a2))) in
    let base = (0, [0]) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  if i < 1
  then []
  else
    (match i with
     | 1 -> l
     | 10 -> l @ [0]
     | _ -> bigAdd l (mulByDigit (i - 1) l));;

let bigMul l1 l2 =
  let f a x =
    let (c,a') = a in
    let m = mulByDigit x l2 in let s = bigAdd m a' in ((c + 1), s) in
  let base = (0, [0]) in
  let args = l1 in let (_,res) = List.fold_left f base args in res;;

*)

(* changed spans
(34,7)-(34,69)
(34,37)-(34,43)
(37,2)-(39,66)
(37,14)-(37,47)
(37,15)-(37,16)
(37,18)-(37,46)
(37,19)-(37,25)
(37,26)-(37,43)
(37,44)-(37,45)
(38,2)-(39,66)
(38,13)-(38,21)
(38,14)-(38,15)
(39,2)-(39,66)
(39,19)-(39,66)
*)

(* type error slice
(5,3)-(13,43)
(5,12)-(13,41)
(13,10)-(13,36)
(13,31)-(13,32)
(13,33)-(13,35)
(20,3)-(29,36)
(20,11)-(29,34)
(29,18)-(29,33)
(29,19)-(29,26)
(29,27)-(29,29)
(34,37)-(34,43)
(34,37)-(34,68)
(34,46)-(34,68)
(34,47)-(34,57)
(37,2)-(39,66)
(37,8)-(37,47)
(37,10)-(37,47)
(37,14)-(37,47)
(37,18)-(37,46)
(37,19)-(37,25)
(37,26)-(37,43)
(37,27)-(37,37)
(37,44)-(37,45)
(39,33)-(39,47)
(39,33)-(39,59)
(39,48)-(39,49)
*)

(* all spans
(2,14)-(3,68)
(2,16)-(3,68)
(3,2)-(3,68)
(3,5)-(3,10)
(3,5)-(3,6)
(3,9)-(3,10)
(3,16)-(3,18)
(3,24)-(3,68)
(3,31)-(3,32)
(3,45)-(3,67)
(3,45)-(3,46)
(3,50)-(3,67)
(3,51)-(3,56)
(3,57)-(3,58)
(3,59)-(3,66)
(3,60)-(3,61)
(3,64)-(3,65)
(5,12)-(13,41)
(5,15)-(13,41)
(6,2)-(13,41)
(6,11)-(6,25)
(6,11)-(6,22)
(6,23)-(6,25)
(7,2)-(13,41)
(7,11)-(7,25)
(7,11)-(7,22)
(7,23)-(7,25)
(8,2)-(13,41)
(8,5)-(8,12)
(8,5)-(8,7)
(8,10)-(8,12)
(9,7)-(9,15)
(9,8)-(9,10)
(9,12)-(9,14)
(11,4)-(13,41)
(11,7)-(11,14)
(11,7)-(11,9)
(11,12)-(11,14)
(12,9)-(12,41)
(12,10)-(12,12)
(12,14)-(12,40)
(12,35)-(12,36)
(12,15)-(12,34)
(12,16)-(12,21)
(12,22)-(12,23)
(12,24)-(12,33)
(12,25)-(12,27)
(12,30)-(12,32)
(12,37)-(12,39)
(13,9)-(13,41)
(13,10)-(13,36)
(13,31)-(13,32)
(13,11)-(13,30)
(13,12)-(13,17)
(13,18)-(13,19)
(13,20)-(13,29)
(13,21)-(13,23)
(13,26)-(13,28)
(13,33)-(13,35)
(13,38)-(13,40)
(15,19)-(18,66)
(16,2)-(18,66)
(16,5)-(16,11)
(16,5)-(16,6)
(16,9)-(16,11)
(17,7)-(17,9)
(18,7)-(18,66)
(18,19)-(18,20)
(18,24)-(18,65)
(18,30)-(18,31)
(18,44)-(18,56)
(18,44)-(18,54)
(18,55)-(18,56)
(18,64)-(18,65)
(20,11)-(29,34)
(20,14)-(29,34)
(21,2)-(29,34)
(21,11)-(28,51)
(22,4)-(28,51)
(22,10)-(25,73)
(22,12)-(25,73)
(23,6)-(25,73)
(23,20)-(23,21)
(24,6)-(25,73)
(24,23)-(24,24)
(25,6)-(25,73)
(25,14)-(25,27)
(25,14)-(25,23)
(25,15)-(25,17)
(25,20)-(25,22)
(25,26)-(25,27)
(25,31)-(25,73)
(25,32)-(25,40)
(25,33)-(25,34)
(25,37)-(25,39)
(25,42)-(25,72)
(25,52)-(25,53)
(25,43)-(25,51)
(25,44)-(25,50)
(25,44)-(25,45)
(25,48)-(25,50)
(25,54)-(25,71)
(25,66)-(25,67)
(25,55)-(25,65)
(25,56)-(25,64)
(25,56)-(25,57)
(25,62)-(25,64)
(25,68)-(25,70)
(26,4)-(28,51)
(26,15)-(26,23)
(26,16)-(26,17)
(26,19)-(26,22)
(26,20)-(26,21)
(27,4)-(28,51)
(27,15)-(27,44)
(27,15)-(27,23)
(27,24)-(27,44)
(27,25)-(27,37)
(27,38)-(27,40)
(27,41)-(27,43)
(28,4)-(28,51)
(28,18)-(28,44)
(28,18)-(28,32)
(28,33)-(28,34)
(28,35)-(28,39)
(28,40)-(28,44)
(28,48)-(28,51)
(29,2)-(29,34)
(29,2)-(29,12)
(29,13)-(29,34)
(29,14)-(29,17)
(29,18)-(29,33)
(29,19)-(29,26)
(29,27)-(29,29)
(29,30)-(29,32)
(31,19)-(34,69)
(31,21)-(34,69)
(32,2)-(34,69)
(32,5)-(32,10)
(32,5)-(32,6)
(32,9)-(32,10)
(33,7)-(33,9)
(34,7)-(34,69)
(34,14)-(34,15)
(34,28)-(34,29)
(34,37)-(34,68)
(34,37)-(34,43)
(34,44)-(34,45)
(34,46)-(34,68)
(34,47)-(34,57)
(34,58)-(34,65)
(34,59)-(34,60)
(34,63)-(34,64)
(34,66)-(34,67)
(36,11)-(39,66)
(36,14)-(39,66)
(37,2)-(39,66)
(37,8)-(37,47)
(37,10)-(37,47)
(37,14)-(37,47)
(37,15)-(37,16)
(37,18)-(37,46)
(37,19)-(37,25)
(37,26)-(37,43)
(37,27)-(37,37)
(37,38)-(37,39)
(37,40)-(37,42)
(37,44)-(37,45)
(38,2)-(39,66)
(38,13)-(38,21)
(38,14)-(38,15)
(38,17)-(38,20)
(38,18)-(38,19)
(39,2)-(39,66)
(39,13)-(39,15)
(39,19)-(39,66)
(39,33)-(39,59)
(39,33)-(39,47)
(39,48)-(39,49)
(39,50)-(39,54)
(39,55)-(39,59)
(39,63)-(39,66)
*)

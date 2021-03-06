
let rec clone x n =
  if n < 1 then [] else (match n with | _ -> x :: (clone x (n - 1)));;

let c y = y;;

let padZero l1 l2 =
  let s1 = List.length l1 in
  let s2 = List.length l2 in
  if s1 = s2
  then (l1, l2)
  else
    if s1 > s2
    then (l1, ((clone 0 (s1 - s2)) @ l2))
    else (((clone 0 (s2 - s1)) @ l1), l2);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (a1,a2) = a in
      let c::c' = a1 in
      let v = (x1 + x2) + c' in (([c + 1] @ [v / 10]), [v mod 10]) in
    let base = ([0], [5]) in
    let args = List.combine l1 l2 in
    let (duh,res) = List.fold_left f base args in (duh, res) in
  add (padZero l1 l2);;


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

*)

(* changed spans
(5,6)-(5,11)
(5,10)-(5,11)
(17,11)-(27,21)
(21,6)-(23,66)
(22,6)-(23,66)
(22,18)-(22,20)
(23,26)-(23,28)
(23,33)-(23,53)
(23,35)-(23,36)
(23,35)-(23,40)
(23,39)-(23,40)
(23,44)-(23,52)
(23,55)-(23,65)
(24,4)-(26,60)
(24,16)-(24,19)
(24,22)-(24,23)
(25,15)-(25,33)
(26,4)-(26,60)
(26,50)-(26,60)
(26,51)-(26,54)
(27,2)-(27,5)
*)

(* type error slice
(22,6)-(23,66)
(23,14)-(23,28)
(23,26)-(23,28)
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
(5,6)-(5,11)
(5,10)-(5,11)
(7,12)-(15,41)
(7,15)-(15,41)
(8,2)-(15,41)
(8,11)-(8,25)
(8,11)-(8,22)
(8,23)-(8,25)
(9,2)-(15,41)
(9,11)-(9,25)
(9,11)-(9,22)
(9,23)-(9,25)
(10,2)-(15,41)
(10,5)-(10,12)
(10,5)-(10,7)
(10,10)-(10,12)
(11,7)-(11,15)
(11,8)-(11,10)
(11,12)-(11,14)
(13,4)-(15,41)
(13,7)-(13,14)
(13,7)-(13,9)
(13,12)-(13,14)
(14,9)-(14,41)
(14,10)-(14,12)
(14,14)-(14,40)
(14,35)-(14,36)
(14,15)-(14,34)
(14,16)-(14,21)
(14,22)-(14,23)
(14,24)-(14,33)
(14,25)-(14,27)
(14,30)-(14,32)
(14,37)-(14,39)
(15,9)-(15,41)
(15,10)-(15,36)
(15,31)-(15,32)
(15,11)-(15,30)
(15,12)-(15,17)
(15,18)-(15,19)
(15,20)-(15,29)
(15,21)-(15,23)
(15,26)-(15,28)
(15,33)-(15,35)
(15,38)-(15,40)
(17,11)-(27,21)
(17,14)-(27,21)
(18,2)-(27,21)
(18,11)-(26,60)
(19,4)-(26,60)
(19,10)-(23,66)
(19,12)-(23,66)
(20,6)-(23,66)
(20,20)-(20,21)
(21,6)-(23,66)
(21,20)-(21,21)
(22,6)-(23,66)
(22,18)-(22,20)
(23,6)-(23,66)
(23,14)-(23,28)
(23,14)-(23,23)
(23,15)-(23,17)
(23,20)-(23,22)
(23,26)-(23,28)
(23,32)-(23,66)
(23,33)-(23,53)
(23,42)-(23,43)
(23,34)-(23,41)
(23,35)-(23,40)
(23,35)-(23,36)
(23,39)-(23,40)
(23,44)-(23,52)
(23,45)-(23,51)
(23,45)-(23,46)
(23,49)-(23,51)
(23,55)-(23,65)
(23,56)-(23,64)
(23,56)-(23,57)
(23,62)-(23,64)
(24,4)-(26,60)
(24,15)-(24,25)
(24,16)-(24,19)
(24,17)-(24,18)
(24,21)-(24,24)
(24,22)-(24,23)
(25,4)-(26,60)
(25,15)-(25,33)
(25,15)-(25,27)
(25,28)-(25,30)
(25,31)-(25,33)
(26,4)-(26,60)
(26,20)-(26,46)
(26,20)-(26,34)
(26,35)-(26,36)
(26,37)-(26,41)
(26,42)-(26,46)
(26,50)-(26,60)
(26,51)-(26,54)
(26,56)-(26,59)
(27,2)-(27,21)
(27,2)-(27,5)
(27,6)-(27,21)
(27,7)-(27,14)
(27,15)-(27,17)
(27,18)-(27,20)
*)


let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let first = List.length l1 in
  let sec = List.length l2 in
  if first < sec
  then ((List.append (clone 0 (sec - first)) l1), l2)
  else
    if first > sec
    then (l1, (List.append (clone 0 (first - sec)) l2))
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (i,j) = x in
      let (s,t) = a in ((((i + j) + s) / 10), ((((i + j) + s) mod 10) :: t)) in
    let base = (0, []) in
    let args = List.combine ((List.rev l1) :: 0) ((List.rev l2) :: 0) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let first = List.length l1 in
  let sec = List.length l2 in
  if first < sec
  then ((List.append (clone 0 (sec - first)) l1), l2)
  else
    if first > sec
    then (l1, (List.append (clone 0 (first - sec)) l2))
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (i,j) = x in
      let (s,t) = a in ((((i + j) + s) / 10), ((((i + j) + s) mod 10) :: t)) in
    let base = (0, []) in
    let args = List.combine (List.rev (0 :: l1)) (List.rev (0 :: l2)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(23,28)-(23,48)
(23,39)-(23,41)
(23,46)-(23,47)
(23,50)-(23,63)
(23,60)-(23,62)
(24,4)-(24,51)
*)

(* type error slice
(19,4)-(24,51)
(19,10)-(21,76)
(19,12)-(21,76)
(20,6)-(21,76)
(20,18)-(20,19)
(21,26)-(21,33)
(21,31)-(21,32)
(23,4)-(24,51)
(23,15)-(23,27)
(23,15)-(23,69)
(23,28)-(23,48)
(23,46)-(23,47)
(23,49)-(23,69)
(23,49)-(23,69)
(23,49)-(23,69)
(23,50)-(23,63)
(23,51)-(23,59)
(23,67)-(23,68)
(24,18)-(24,32)
(24,18)-(24,44)
(24,33)-(24,34)
(24,40)-(24,44)
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
(4,12)-(12,17)
(4,15)-(12,17)
(5,2)-(12,17)
(5,14)-(5,28)
(5,14)-(5,25)
(5,26)-(5,28)
(6,2)-(12,17)
(6,12)-(6,26)
(6,12)-(6,23)
(6,24)-(6,26)
(7,2)-(12,17)
(7,5)-(7,16)
(7,5)-(7,10)
(7,13)-(7,16)
(8,7)-(8,53)
(8,8)-(8,48)
(8,9)-(8,20)
(8,21)-(8,44)
(8,22)-(8,27)
(8,28)-(8,29)
(8,30)-(8,43)
(8,31)-(8,34)
(8,37)-(8,42)
(8,45)-(8,47)
(8,50)-(8,52)
(10,4)-(12,17)
(10,7)-(10,18)
(10,7)-(10,12)
(10,15)-(10,18)
(11,9)-(11,55)
(11,10)-(11,12)
(11,14)-(11,54)
(11,15)-(11,26)
(11,27)-(11,50)
(11,28)-(11,33)
(11,34)-(11,35)
(11,36)-(11,49)
(11,37)-(11,42)
(11,45)-(11,48)
(11,51)-(11,53)
(12,9)-(12,17)
(12,10)-(12,12)
(12,14)-(12,16)
(14,19)-(15,69)
(15,2)-(15,69)
(15,8)-(15,9)
(15,23)-(15,25)
(15,36)-(15,69)
(15,39)-(15,44)
(15,39)-(15,40)
(15,43)-(15,44)
(15,50)-(15,62)
(15,50)-(15,60)
(15,61)-(15,62)
(15,68)-(15,69)
(17,11)-(25,34)
(17,14)-(25,34)
(18,2)-(25,34)
(18,11)-(24,51)
(19,4)-(24,51)
(19,10)-(21,76)
(19,12)-(21,76)
(20,6)-(21,76)
(20,18)-(20,19)
(21,6)-(21,76)
(21,18)-(21,19)
(21,23)-(21,76)
(21,24)-(21,44)
(21,25)-(21,38)
(21,26)-(21,33)
(21,27)-(21,28)
(21,31)-(21,32)
(21,36)-(21,37)
(21,41)-(21,43)
(21,46)-(21,75)
(21,47)-(21,69)
(21,48)-(21,61)
(21,49)-(21,56)
(21,50)-(21,51)
(21,54)-(21,55)
(21,59)-(21,60)
(21,66)-(21,68)
(21,73)-(21,74)
(22,4)-(24,51)
(22,15)-(22,22)
(22,16)-(22,17)
(22,19)-(22,21)
(23,4)-(24,51)
(23,15)-(23,69)
(23,15)-(23,27)
(23,28)-(23,48)
(23,29)-(23,42)
(23,30)-(23,38)
(23,39)-(23,41)
(23,46)-(23,47)
(23,49)-(23,69)
(23,50)-(23,63)
(23,51)-(23,59)
(23,60)-(23,62)
(23,67)-(23,68)
(24,4)-(24,51)
(24,18)-(24,44)
(24,18)-(24,32)
(24,33)-(24,34)
(24,35)-(24,39)
(24,40)-(24,44)
(24,48)-(24,51)
(25,2)-(25,34)
(25,2)-(25,12)
(25,13)-(25,34)
(25,14)-(25,17)
(25,18)-(25,33)
(25,19)-(25,26)
(25,27)-(25,29)
(25,30)-(25,32)
*)

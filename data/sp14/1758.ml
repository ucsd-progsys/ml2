
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
      if (i + j) > 9 then (1, ((i + j) - 10)) else (0, (i + j)) in
    let base = [] in
    let args = List.combine (List.rev l1) (List.rev l2) in
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
    let args = List.combine (List.rev l1) (List.rev l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(21,6)-(21,63)
(21,9)-(21,16)
(21,9)-(21,20)
(21,10)-(21,11)
(21,14)-(21,15)
(21,19)-(21,20)
(21,26)-(21,45)
(21,27)-(21,28)
(21,30)-(21,44)
(21,32)-(21,33)
(21,41)-(21,43)
(21,51)-(21,63)
(21,52)-(21,53)
(21,55)-(21,62)
(21,56)-(21,57)
(22,4)-(24,51)
(22,15)-(22,17)
*)

(* type error slice
(19,4)-(24,51)
(19,10)-(21,63)
(19,12)-(21,63)
(20,6)-(21,63)
(21,6)-(21,63)
(21,51)-(21,63)
(22,4)-(24,51)
(22,15)-(22,17)
(24,18)-(24,32)
(24,18)-(24,44)
(24,33)-(24,34)
(24,35)-(24,39)
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
(19,10)-(21,63)
(19,12)-(21,63)
(20,6)-(21,63)
(20,18)-(20,19)
(21,6)-(21,63)
(21,9)-(21,20)
(21,9)-(21,16)
(21,10)-(21,11)
(21,14)-(21,15)
(21,19)-(21,20)
(21,26)-(21,45)
(21,27)-(21,28)
(21,30)-(21,44)
(21,31)-(21,38)
(21,32)-(21,33)
(21,36)-(21,37)
(21,41)-(21,43)
(21,51)-(21,63)
(21,52)-(21,53)
(21,55)-(21,62)
(21,56)-(21,57)
(21,60)-(21,61)
(22,4)-(24,51)
(22,15)-(22,17)
(23,4)-(24,51)
(23,15)-(23,55)
(23,15)-(23,27)
(23,28)-(23,41)
(23,29)-(23,37)
(23,38)-(23,40)
(23,42)-(23,55)
(23,43)-(23,51)
(23,52)-(23,54)
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

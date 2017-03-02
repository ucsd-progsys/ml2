
let rec clone x n =
  match n with | n when n <= 0 -> [] | _ -> x :: (clone x (n - 1));;

let padZero l1 l2 =
  let x = List.length l1 in
  let y = List.length l2 in
  if x > y
  then let z = x - y in (l1, ((clone 0 z) @ l2))
  else (let z = y - x in (((clone 0 z) @ l1), l2));;

let rec removeZero l =
  match l with
  | [] -> []
  | h::t -> (match h with | 0 -> removeZero t | _ -> h :: t);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (y,z) = a in
      let (r,s) = x in let m = (r + s) + y in ((m / 10), ((m mod 10) :: z)) in
    let base = (0, []) in
    let args = List.combine (List.rev (0 :: l1)) (List.rev (0 :: l2)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  match i with | 0 -> [0] | _ -> bigAdd l (mulByDigit (i - 1) l);;

let bigMul l1 l2 =
  let f a x =
    let (b,c) = a in
    let (o,p) = x in
    let r = (mulByDigit o p) + b in ((r / 10), ((r mod 10) :: b)) in
  let base = (0, []) in
  let args = List.combine (List.rev l1) (List.rev l2) in
  let (_,res) = List.fold_left f base args in res;;


(* fix

let rec clone x n =
  match n with | n when n <= 0 -> [] | _ -> x :: (clone x (n - 1));;

let padZero l1 l2 =
  let x = List.length l1 in
  let y = List.length l2 in
  if x > y
  then let z = x - y in (l1, ((clone 0 z) @ l2))
  else (let z = y - x in (((clone 0 z) @ l1), l2));;

let rec removeZero l =
  match l with
  | [] -> []
  | h::t -> (match h with | 0 -> removeZero t | _ -> h :: t);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (y,z) = a in
      let (r,s) = x in let m = (r + s) + y in ((m / 10), ((m mod 10) :: z)) in
    let base = (0, []) in
    let args = List.combine (List.rev (0 :: l1)) (List.rev (0 :: l2)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  match i with | 0 -> [0] | _ -> bigAdd l (mulByDigit (i - 1) l);;

let bigMul l1 l2 =
  let f a x =
    let (b,c) = a in
    let r = bigAdd (mulByDigit x (List.rev l2)) [b] in
    match r with | [] -> (0, (0 :: c)) | h::t -> (h, ((List.hd t) :: c)) in
  let base = (0, []) in
  let args = List.rev l1 in let (_,res) = List.fold_left f base args in res;;

*)

(* changed spans
(33,4)-(34,65)
(33,16)-(33,17)
(34,4)-(34,65)
(34,12)-(34,32)
(34,13)-(34,23)
(34,24)-(34,25)
(34,26)-(34,27)
(34,31)-(34,32)
(34,36)-(34,65)
(34,37)-(34,45)
(34,42)-(34,44)
(34,47)-(34,64)
(34,48)-(34,58)
(34,49)-(34,50)
(34,55)-(34,57)
(34,62)-(34,63)
(35,2)-(37,49)
(36,13)-(36,25)
(36,13)-(36,53)
(36,40)-(36,53)
(36,41)-(36,49)
(36,50)-(36,52)
(37,2)-(37,49)
*)

(* type error slice
(5,3)-(10,52)
(5,12)-(10,50)
(5,15)-(10,50)
(9,29)-(9,47)
(9,42)-(9,43)
(9,44)-(9,46)
(17,3)-(25,36)
(17,11)-(25,34)
(17,14)-(25,34)
(25,18)-(25,33)
(25,19)-(25,26)
(25,30)-(25,32)
(28,33)-(28,39)
(28,33)-(28,64)
(28,42)-(28,64)
(28,43)-(28,53)
(34,12)-(34,28)
(34,12)-(34,32)
(34,12)-(34,32)
(34,13)-(34,23)
(34,31)-(34,32)
(34,47)-(34,64)
(34,62)-(34,63)
*)

(* all spans
(2,14)-(3,66)
(2,16)-(3,66)
(3,2)-(3,66)
(3,8)-(3,9)
(3,34)-(3,36)
(3,44)-(3,66)
(3,44)-(3,45)
(3,49)-(3,66)
(3,50)-(3,55)
(3,56)-(3,57)
(3,58)-(3,65)
(3,59)-(3,60)
(3,63)-(3,64)
(5,12)-(10,50)
(5,15)-(10,50)
(6,2)-(10,50)
(6,10)-(6,24)
(6,10)-(6,21)
(6,22)-(6,24)
(7,2)-(10,50)
(7,10)-(7,24)
(7,10)-(7,21)
(7,22)-(7,24)
(8,2)-(10,50)
(8,5)-(8,10)
(8,5)-(8,6)
(8,9)-(8,10)
(9,7)-(9,48)
(9,15)-(9,20)
(9,15)-(9,16)
(9,19)-(9,20)
(9,24)-(9,48)
(9,25)-(9,27)
(9,29)-(9,47)
(9,42)-(9,43)
(9,30)-(9,41)
(9,31)-(9,36)
(9,37)-(9,38)
(9,39)-(9,40)
(9,44)-(9,46)
(10,7)-(10,50)
(10,16)-(10,21)
(10,16)-(10,17)
(10,20)-(10,21)
(10,25)-(10,49)
(10,26)-(10,44)
(10,39)-(10,40)
(10,27)-(10,38)
(10,28)-(10,33)
(10,34)-(10,35)
(10,36)-(10,37)
(10,41)-(10,43)
(10,46)-(10,48)
(12,19)-(15,60)
(13,2)-(15,60)
(13,8)-(13,9)
(14,10)-(14,12)
(15,12)-(15,60)
(15,19)-(15,20)
(15,33)-(15,45)
(15,33)-(15,43)
(15,44)-(15,45)
(15,53)-(15,59)
(15,53)-(15,54)
(15,58)-(15,59)
(17,11)-(25,34)
(17,14)-(25,34)
(18,2)-(25,34)
(18,11)-(24,51)
(19,4)-(24,51)
(19,10)-(21,75)
(19,12)-(21,75)
(20,6)-(21,75)
(20,18)-(20,19)
(21,6)-(21,75)
(21,18)-(21,19)
(21,23)-(21,75)
(21,31)-(21,42)
(21,31)-(21,38)
(21,32)-(21,33)
(21,36)-(21,37)
(21,41)-(21,42)
(21,46)-(21,75)
(21,47)-(21,55)
(21,48)-(21,49)
(21,52)-(21,54)
(21,57)-(21,74)
(21,58)-(21,68)
(21,59)-(21,60)
(21,65)-(21,67)
(21,72)-(21,73)
(22,4)-(24,51)
(22,15)-(22,22)
(22,16)-(22,17)
(22,19)-(22,21)
(23,4)-(24,51)
(23,15)-(23,69)
(23,15)-(23,27)
(23,28)-(23,48)
(23,29)-(23,37)
(23,38)-(23,47)
(23,39)-(23,40)
(23,44)-(23,46)
(23,49)-(23,69)
(23,50)-(23,58)
(23,59)-(23,68)
(23,60)-(23,61)
(23,65)-(23,67)
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
(27,19)-(28,64)
(27,21)-(28,64)
(28,2)-(28,64)
(28,8)-(28,9)
(28,22)-(28,25)
(28,23)-(28,24)
(28,33)-(28,64)
(28,33)-(28,39)
(28,40)-(28,41)
(28,42)-(28,64)
(28,43)-(28,53)
(28,54)-(28,61)
(28,55)-(28,56)
(28,59)-(28,60)
(28,62)-(28,63)
(30,11)-(37,49)
(30,14)-(37,49)
(31,2)-(37,49)
(31,8)-(34,65)
(31,10)-(34,65)
(32,4)-(34,65)
(32,16)-(32,17)
(33,4)-(34,65)
(33,16)-(33,17)
(34,4)-(34,65)
(34,12)-(34,32)
(34,12)-(34,28)
(34,13)-(34,23)
(34,24)-(34,25)
(34,26)-(34,27)
(34,31)-(34,32)
(34,36)-(34,65)
(34,37)-(34,45)
(34,38)-(34,39)
(34,42)-(34,44)
(34,47)-(34,64)
(34,48)-(34,58)
(34,49)-(34,50)
(34,55)-(34,57)
(34,62)-(34,63)
(35,2)-(37,49)
(35,13)-(35,20)
(35,14)-(35,15)
(35,17)-(35,19)
(36,2)-(37,49)
(36,13)-(36,53)
(36,13)-(36,25)
(36,26)-(36,39)
(36,27)-(36,35)
(36,36)-(36,38)
(36,40)-(36,53)
(36,41)-(36,49)
(36,50)-(36,52)
(37,2)-(37,49)
(37,16)-(37,42)
(37,16)-(37,30)
(37,31)-(37,32)
(37,33)-(37,37)
(37,38)-(37,42)
(37,46)-(37,49)
*)

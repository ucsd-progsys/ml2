
let rec clone x n =
  let accum = [] in
  let rec helper accum n =
    if n < 1 then accum else helper (x :: accum) (n - 1) in
  helper accum n;;

let padZero l1 l2 =
  let (a,b) = ((List.length l1), (List.length l2)) in
  if a < b
  then ((List.append (clone 0 (b - a)) l1), l2)
  else if b < a then (l1, (List.append (clone 0 (a - b)) l2)) else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (h::t,b) = a in
      if (x / h) > 0
      then
        let asd = x / h in
        let asd2 = (x + h) - (asd * 10) in
        let asd3 = asd :: t in (asd3, (padZero (asd3 asd2)))
      else (t, ((x + h) :: b)) in
    let base = ((List.rev l1), []) in
    let args = List.rev l2 in let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n =
  let accum = [] in
  let rec helper accum n =
    if n < 1 then accum else helper (x :: accum) (n - 1) in
  helper accum n;;

let padZero l1 l2 =
  let (a,b) = ((List.length l1), (List.length l2)) in
  if a < b
  then ((List.append (clone 0 (b - a)) l1), l2)
  else if b < a then (l1, (List.append (clone 0 (a - b)) l2)) else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (h::t,b) = a in
      if (x / h) > 0
      then
        let asd = x / h in
        let asd2 = (x + h) - (asd * 10) in
        let asd3 = asd :: t in
        let (_,asd4) = padZero asd3 (asd2 :: b) in (asd3, asd4)
      else (t, ((x + h) :: b)) in
    let base = ((List.rev l1), []) in
    let args = List.rev l2 in let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(25,31)-(25,60)
(25,32)-(25,36)
(25,38)-(25,59)
(25,39)-(25,46)
(25,47)-(25,58)
(25,53)-(25,57)
(26,11)-(26,30)
(26,12)-(26,13)
*)

(* type error slice
(8,3)-(12,77)
(8,12)-(12,75)
(8,15)-(12,75)
(19,4)-(28,77)
(19,10)-(26,30)
(19,12)-(26,30)
(20,6)-(26,30)
(20,6)-(26,30)
(20,21)-(20,22)
(21,6)-(26,30)
(21,6)-(26,30)
(23,8)-(25,60)
(24,8)-(25,60)
(25,8)-(25,60)
(25,8)-(25,60)
(25,19)-(25,27)
(25,31)-(25,60)
(25,38)-(25,59)
(25,39)-(25,46)
(25,47)-(25,58)
(25,48)-(25,52)
(26,11)-(26,30)
(26,15)-(26,29)
(26,15)-(26,29)
(26,27)-(26,28)
(28,44)-(28,58)
(28,44)-(28,70)
(28,59)-(28,60)
*)

(* all spans
(2,14)-(6,16)
(2,16)-(6,16)
(3,2)-(6,16)
(3,14)-(3,16)
(4,2)-(6,16)
(4,17)-(5,56)
(4,23)-(5,56)
(5,4)-(5,56)
(5,7)-(5,12)
(5,7)-(5,8)
(5,11)-(5,12)
(5,18)-(5,23)
(5,29)-(5,56)
(5,29)-(5,35)
(5,36)-(5,48)
(5,37)-(5,38)
(5,42)-(5,47)
(5,49)-(5,56)
(5,50)-(5,51)
(5,54)-(5,55)
(6,2)-(6,16)
(6,2)-(6,8)
(6,9)-(6,14)
(6,15)-(6,16)
(8,12)-(12,75)
(8,15)-(12,75)
(9,2)-(12,75)
(9,14)-(9,50)
(9,15)-(9,31)
(9,16)-(9,27)
(9,28)-(9,30)
(9,33)-(9,49)
(9,34)-(9,45)
(9,46)-(9,48)
(10,2)-(12,75)
(10,5)-(10,10)
(10,5)-(10,6)
(10,9)-(10,10)
(11,7)-(11,47)
(11,8)-(11,42)
(11,9)-(11,20)
(11,21)-(11,38)
(11,22)-(11,27)
(11,28)-(11,29)
(11,30)-(11,37)
(11,31)-(11,32)
(11,35)-(11,36)
(11,39)-(11,41)
(11,44)-(11,46)
(12,7)-(12,75)
(12,10)-(12,15)
(12,10)-(12,11)
(12,14)-(12,15)
(12,21)-(12,61)
(12,22)-(12,24)
(12,26)-(12,60)
(12,27)-(12,38)
(12,39)-(12,56)
(12,40)-(12,45)
(12,46)-(12,47)
(12,48)-(12,55)
(12,49)-(12,50)
(12,53)-(12,54)
(12,57)-(12,59)
(12,67)-(12,75)
(12,68)-(12,70)
(12,72)-(12,74)
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
(17,11)-(29,34)
(17,14)-(29,34)
(18,2)-(29,34)
(18,11)-(28,77)
(19,4)-(28,77)
(19,10)-(26,30)
(19,12)-(26,30)
(20,6)-(26,30)
(20,21)-(20,22)
(21,6)-(26,30)
(21,9)-(21,20)
(21,9)-(21,16)
(21,10)-(21,11)
(21,14)-(21,15)
(21,19)-(21,20)
(23,8)-(25,60)
(23,18)-(23,23)
(23,18)-(23,19)
(23,22)-(23,23)
(24,8)-(25,60)
(24,19)-(24,39)
(24,19)-(24,26)
(24,20)-(24,21)
(24,24)-(24,25)
(24,29)-(24,39)
(24,30)-(24,33)
(24,36)-(24,38)
(25,8)-(25,60)
(25,19)-(25,27)
(25,19)-(25,22)
(25,26)-(25,27)
(25,31)-(25,60)
(25,32)-(25,36)
(25,38)-(25,59)
(25,39)-(25,46)
(25,47)-(25,58)
(25,48)-(25,52)
(25,53)-(25,57)
(26,11)-(26,30)
(26,12)-(26,13)
(26,15)-(26,29)
(26,16)-(26,23)
(26,17)-(26,18)
(26,21)-(26,22)
(26,27)-(26,28)
(27,4)-(28,77)
(27,15)-(27,34)
(27,16)-(27,29)
(27,17)-(27,25)
(27,26)-(27,28)
(27,31)-(27,33)
(28,4)-(28,77)
(28,15)-(28,26)
(28,15)-(28,23)
(28,24)-(28,26)
(28,30)-(28,77)
(28,44)-(28,70)
(28,44)-(28,58)
(28,59)-(28,60)
(28,61)-(28,65)
(28,66)-(28,70)
(28,74)-(28,77)
(29,2)-(29,34)
(29,2)-(29,12)
(29,13)-(29,34)
(29,14)-(29,17)
(29,18)-(29,33)
(29,19)-(29,26)
(29,27)-(29,29)
(29,30)-(29,32)
*)


let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let lenl1 = List.length l1 in
  let lenl2 = List.length l2 in
  if lenl1 > lenl2
  then (l1, ((clone 0 (lenl1 - lenl2)) @ l2))
  else (((clone 0 (lenl2 - lenl1)) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (rem,acc) = a in
      if
        (List.length acc) =
          ((List.length (List.combine (padZero l1 l2))) - 1)
      then (if rem = 1 then (0, ([1; 0] @ acc)) else (0, acc))
      else
        (let (el1,el2) = x in
         let new_sum = (rem + el1) + el2 in
         let new_rem = if new_sum > 9 then 1 else 0 in
         let norm_sum = if new_sum > 9 then new_sum - 10 else new_sum in
         (new_rem, (norm_sum :: acc))) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let lenl1 = List.length l1 in
  let lenl2 = List.length l2 in
  if lenl1 > lenl2
  then (l1, ((clone 0 (lenl1 - lenl2)) @ l2))
  else (((clone 0 (lenl2 - lenl1)) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (rem,acc) = a in
      let larger = if (List.length l1) > (List.length l2) then l1 else l2 in
      if (List.length acc) = (List.length larger)
      then (if rem = 1 then (0, ([1; 0] @ acc)) else (0, acc))
      else
        (let (el1,el2) = x in
         let new_sum = (rem + el1) + el2 in
         let new_rem = if new_sum > 9 then 1 else 0 in
         let norm_sum = if new_sum > 9 then new_sum - 10 else new_sum in
         (new_rem, (norm_sum :: acc))) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(18,6)-(27,38)
(19,8)-(20,60)
(19,21)-(19,24)
(20,10)-(20,60)
(20,24)-(20,54)
(20,25)-(20,37)
(20,38)-(20,53)
(20,39)-(20,46)
(20,58)-(20,59)
(21,15)-(21,18)
(23,8)-(27,38)
(24,9)-(27,37)
(25,9)-(27,37)
(26,9)-(27,37)
(28,4)-(30,51)
(29,4)-(30,51)
(30,4)-(30,51)
*)

(* type error slice
(4,3)-(9,47)
(4,12)-(9,45)
(4,15)-(9,45)
(5,2)-(9,45)
(6,2)-(9,45)
(7,2)-(9,45)
(8,7)-(8,45)
(20,24)-(20,54)
(20,25)-(20,37)
(20,38)-(20,53)
(20,39)-(20,46)
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
(4,12)-(9,45)
(4,15)-(9,45)
(5,2)-(9,45)
(5,14)-(5,28)
(5,14)-(5,25)
(5,26)-(5,28)
(6,2)-(9,45)
(6,14)-(6,28)
(6,14)-(6,25)
(6,26)-(6,28)
(7,2)-(9,45)
(7,5)-(7,18)
(7,5)-(7,10)
(7,13)-(7,18)
(8,7)-(8,45)
(8,8)-(8,10)
(8,12)-(8,44)
(8,39)-(8,40)
(8,13)-(8,38)
(8,14)-(8,19)
(8,20)-(8,21)
(8,22)-(8,37)
(8,23)-(8,28)
(8,31)-(8,36)
(8,41)-(8,43)
(9,7)-(9,45)
(9,8)-(9,40)
(9,35)-(9,36)
(9,9)-(9,34)
(9,10)-(9,15)
(9,16)-(9,17)
(9,18)-(9,33)
(9,19)-(9,24)
(9,27)-(9,32)
(9,37)-(9,39)
(9,42)-(9,44)
(11,19)-(12,74)
(12,2)-(12,74)
(12,8)-(12,9)
(12,23)-(12,25)
(12,36)-(12,74)
(12,39)-(12,44)
(12,39)-(12,40)
(12,43)-(12,44)
(12,50)-(12,62)
(12,50)-(12,60)
(12,61)-(12,62)
(12,68)-(12,74)
(12,68)-(12,69)
(12,73)-(12,74)
(14,11)-(31,34)
(14,14)-(31,34)
(15,2)-(31,34)
(15,11)-(30,51)
(16,4)-(30,51)
(16,10)-(27,38)
(16,12)-(27,38)
(17,6)-(27,38)
(17,22)-(17,23)
(18,6)-(27,38)
(19,8)-(20,60)
(19,8)-(19,25)
(19,9)-(19,20)
(19,21)-(19,24)
(20,10)-(20,60)
(20,11)-(20,55)
(20,12)-(20,23)
(20,24)-(20,54)
(20,25)-(20,37)
(20,38)-(20,53)
(20,39)-(20,46)
(20,47)-(20,49)
(20,50)-(20,52)
(20,58)-(20,59)
(21,11)-(21,62)
(21,15)-(21,22)
(21,15)-(21,18)
(21,21)-(21,22)
(21,28)-(21,47)
(21,29)-(21,30)
(21,32)-(21,46)
(21,40)-(21,41)
(21,33)-(21,39)
(21,34)-(21,35)
(21,37)-(21,38)
(21,42)-(21,45)
(21,53)-(21,61)
(21,54)-(21,55)
(21,57)-(21,60)
(23,8)-(27,38)
(23,25)-(23,26)
(24,9)-(27,37)
(24,23)-(24,40)
(24,23)-(24,34)
(24,24)-(24,27)
(24,30)-(24,33)
(24,37)-(24,40)
(25,9)-(27,37)
(25,23)-(25,51)
(25,26)-(25,37)
(25,26)-(25,33)
(25,36)-(25,37)
(25,43)-(25,44)
(25,50)-(25,51)
(26,9)-(27,37)
(26,24)-(26,69)
(26,27)-(26,38)
(26,27)-(26,34)
(26,37)-(26,38)
(26,44)-(26,56)
(26,44)-(26,51)
(26,54)-(26,56)
(26,62)-(26,69)
(27,9)-(27,37)
(27,10)-(27,17)
(27,19)-(27,36)
(27,20)-(27,28)
(27,32)-(27,35)
(28,4)-(30,51)
(28,15)-(28,22)
(28,16)-(28,17)
(28,19)-(28,21)
(29,4)-(30,51)
(29,15)-(29,44)
(29,15)-(29,23)
(29,24)-(29,44)
(29,25)-(29,37)
(29,38)-(29,40)
(29,41)-(29,43)
(30,4)-(30,51)
(30,18)-(30,44)
(30,18)-(30,32)
(30,33)-(30,34)
(30,35)-(30,39)
(30,40)-(30,44)
(30,48)-(30,51)
(31,2)-(31,34)
(31,2)-(31,12)
(31,13)-(31,34)
(31,14)-(31,17)
(31,18)-(31,33)
(31,19)-(31,26)
(31,27)-(31,29)
(31,30)-(31,32)
*)

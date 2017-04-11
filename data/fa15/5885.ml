
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
      let (a1,a2) = a in
      ([((x1 + x2) + a1) / 10], (a @ [((x1 + x2) + a1) mod 10])) in
    let base = ([], []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


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
    let f a x = let (x1,x2) = x in ([(x1 + x2) / 10], [(x1 + x2) mod 10]) in
    let base = ([], []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(24,6)-(25,64)
(24,20)-(24,21)
(25,9)-(25,18)
(25,21)-(25,23)
(25,32)-(25,63)
(25,33)-(25,34)
(25,35)-(25,36)
(25,39)-(25,48)
(25,51)-(25,53)
*)

(* type error slice
(22,4)-(28,51)
(22,10)-(25,64)
(22,12)-(25,64)
(23,6)-(25,64)
(24,6)-(25,64)
(24,6)-(25,64)
(24,20)-(24,21)
(25,6)-(25,64)
(25,7)-(25,30)
(25,8)-(25,24)
(25,21)-(25,23)
(25,32)-(25,63)
(25,33)-(25,34)
(25,35)-(25,36)
(28,18)-(28,32)
(28,18)-(28,44)
(28,33)-(28,34)
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
(22,10)-(25,64)
(22,12)-(25,64)
(23,6)-(25,64)
(23,20)-(23,21)
(24,6)-(25,64)
(24,20)-(24,21)
(25,6)-(25,64)
(25,7)-(25,30)
(25,8)-(25,29)
(25,8)-(25,24)
(25,9)-(25,18)
(25,10)-(25,12)
(25,15)-(25,17)
(25,21)-(25,23)
(25,27)-(25,29)
(25,32)-(25,63)
(25,35)-(25,36)
(25,33)-(25,34)
(25,37)-(25,62)
(25,38)-(25,61)
(25,38)-(25,54)
(25,39)-(25,48)
(25,40)-(25,42)
(25,45)-(25,47)
(25,51)-(25,53)
(25,59)-(25,61)
(26,4)-(28,51)
(26,15)-(26,23)
(26,16)-(26,18)
(26,20)-(26,22)
(27,4)-(28,51)
(27,15)-(27,33)
(27,15)-(27,27)
(27,28)-(27,30)
(27,31)-(27,33)
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
*)

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
    let f a x = let (x1,x2) = x in (x1, x2) in
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
    let f a x = let (x1,x2) = x in ([x1 + x2], [x2]) in
    let base = ([], []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(22,37)-(22,39)
(23,5)-(25,52)
(26,20)-(26,27)
(26,28)-(26,30)
(26,31)-(26,33)
*)

(* type error slice
(3,46)-(3,47)
(3,46)-(3,66)
(3,46)-(3,66)
(3,52)-(3,57)
(3,52)-(3,66)
(3,58)-(3,59)
(5,4)-(13,44)
(5,13)-(13,41)
(5,16)-(13,41)
(6,3)-(13,41)
(7,3)-(13,41)
(8,3)-(13,41)
(9,9)-(9,15)
(9,13)-(9,15)
(12,17)-(12,22)
(12,17)-(12,33)
(12,17)-(12,40)
(12,23)-(12,24)
(12,36)-(12,37)
(12,38)-(12,40)
(21,3)-(26,33)
(21,12)-(25,52)
(22,5)-(25,52)
(22,11)-(22,43)
(22,13)-(22,43)
(22,17)-(22,43)
(22,17)-(22,43)
(22,31)-(22,32)
(22,37)-(22,43)
(22,41)-(22,43)
(23,5)-(25,52)
(23,17)-(23,23)
(23,21)-(23,23)
(24,5)-(25,52)
(24,16)-(24,28)
(24,16)-(24,34)
(24,32)-(24,34)
(25,19)-(25,33)
(25,19)-(25,45)
(25,34)-(25,35)
(25,36)-(25,40)
(25,41)-(25,45)
(26,15)-(26,18)
(26,15)-(26,33)
(26,20)-(26,27)
(26,20)-(26,33)
*)
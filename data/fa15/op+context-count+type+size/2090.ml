
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

let rec removeZero l =
  if l = []
  then []
  else (let h::t = l in match h with | 0 -> removeZero t | _ -> l);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (a1,a2) = a in let v = x1 + x2 in ((a1 @ [c + 1]), (a2 @ [c + 1])) in
    let base = ([0], [5]) in
    let args = List.combine l1 l2 in
    let (duh,res) = List.fold_left f base args in (duh, res) in
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
(5,7)-(5,12)
(5,11)-(5,12)
(8,3)-(15,41)
(9,3)-(15,41)
(20,9)-(20,66)
(23,3)-(30,33)
(24,5)-(29,60)
(25,7)-(26,75)
(26,7)-(26,75)
(26,26)-(26,75)
(26,34)-(26,36)
(26,47)-(26,49)
(26,47)-(26,59)
(26,47)-(26,75)
(26,53)-(26,54)
(26,53)-(26,58)
(26,57)-(26,58)
(26,63)-(26,65)
(26,63)-(26,75)
(26,69)-(26,70)
(26,69)-(26,74)
(26,73)-(26,74)
(27,5)-(29,60)
(27,17)-(27,20)
(27,17)-(27,25)
(27,23)-(27,24)
(28,5)-(29,60)
(28,16)-(28,34)
(29,5)-(29,60)
(29,52)-(29,55)
(29,52)-(29,60)
*)

(* type error slice
(5,4)-(5,14)
(5,7)-(5,12)
(20,9)-(20,66)
(20,9)-(20,66)
(20,45)-(20,55)
(20,45)-(20,57)
(20,56)-(20,57)
(23,3)-(30,33)
(23,12)-(29,60)
(24,5)-(29,60)
(26,53)-(26,54)
(26,53)-(26,58)
(26,69)-(26,70)
(26,69)-(26,74)
(27,5)-(29,60)
(28,5)-(29,60)
(29,5)-(29,60)
(29,52)-(29,60)
(30,3)-(30,13)
(30,3)-(30,33)
(30,15)-(30,18)
(30,15)-(30,33)
*)
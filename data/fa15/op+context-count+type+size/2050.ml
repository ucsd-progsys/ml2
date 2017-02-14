
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
      let (x1,x2) = x in let (a1,a2) = a in ((a1 @ [x1 + x2]), (a2 @ [x1])) in
    let base = [] in
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
(23,7)-(23,74)
(23,26)-(23,74)
(23,40)-(23,41)
(23,47)-(23,49)
(23,47)-(23,61)
(23,50)-(23,51)
(23,65)-(23,67)
(23,65)-(23,74)
(23,68)-(23,69)
(23,71)-(23,73)
(24,5)-(26,52)
(24,16)-(24,18)
(25,5)-(26,52)
(25,16)-(25,34)
(26,5)-(26,52)
*)

(* type error slice
(22,5)-(26,52)
(22,11)-(23,74)
(23,26)-(23,74)
(23,40)-(23,41)
(24,5)-(26,52)
(24,16)-(24,18)
(26,19)-(26,33)
(26,19)-(26,45)
(26,34)-(26,35)
(26,36)-(26,40)
*)
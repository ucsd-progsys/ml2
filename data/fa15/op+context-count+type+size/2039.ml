
let rec clone x n =
  if n < 1 then [] else (match n with | _ -> [x] @ (clone x (n - 1)));;

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
      let (y,z)::[] = x in let b::b' = y in let c::c' = z in [b + c] @ a in
    let base = ([], []) in
    let args = padZero l1 l2 in
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
(3,46)-(3,49)
(3,46)-(3,67)
(3,50)-(3,51)
(5,7)-(5,12)
(5,11)-(5,12)
(8,3)-(15,41)
(9,3)-(15,41)
(20,9)-(20,66)
(23,3)-(29,33)
(24,5)-(28,52)
(25,7)-(25,73)
(25,28)-(25,73)
(25,40)-(25,41)
(25,45)-(25,73)
(25,57)-(25,58)
(25,62)-(25,73)
(25,63)-(25,64)
(25,67)-(25,68)
(25,70)-(25,71)
(25,72)-(25,73)
(26,5)-(28,52)
(26,17)-(26,23)
(27,5)-(28,52)
(27,16)-(27,23)
(28,5)-(28,52)
*)

(* type error slice
(24,5)-(28,52)
(24,11)-(25,73)
(25,62)-(25,73)
(25,70)-(25,71)
(25,72)-(25,73)
(26,5)-(28,52)
(26,17)-(26,23)
(28,19)-(28,33)
(28,19)-(28,45)
(28,34)-(28,35)
(28,36)-(28,40)
*)
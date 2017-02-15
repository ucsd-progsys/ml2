
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

let bigMul l1 l2 =
  let f a x =
    let (x1,x2) = x in
    let (c,a1::a2) = a in
    let v = (x1 * x2) + c in ((v / 10), ([v / 10] @ ([v mod 10] @ a2))) in
  let base = (0, [0]) in
  let args =
    let (ar1,ar2) = padZero (l1 l2) in List.rev (List.combine ar1 ar2) in
  let (_,res) = List.fold_left f base args in res;;


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

let rec mulByDigit i l =
  if i < 1
  then []
  else
    (match i with
     | 1 -> l
     | 10 -> l @ [0]
     | _ -> bigAdd l (mulByDigit (i - 1) l));;

let bigMul l1 l2 =
  let f a x =
    let (c,a') = a in
    let m = mulByDigit x l2 in let s = bigAdd m a' in ((c + 1), s) in
  let base = (0, [0]) in
  let args = l1 in let (_,res) = List.fold_left f base args in res;;

*)

(* changed spans
(15,11)-(23,49)
(16,2)-(23,49)
(16,8)-(19,71)
(17,4)-(19,71)
(18,4)-(19,71)
(19,4)-(19,71)
(19,12)-(19,21)
(20,2)-(23,49)
(21,2)-(23,49)
(22,4)-(22,70)
(22,20)-(22,27)
(22,20)-(22,35)
(22,28)-(22,35)
(22,29)-(22,31)
(22,32)-(22,34)
(22,62)-(22,65)
(22,66)-(22,69)
(23,2)-(23,49)
(23,16)-(23,30)
(23,16)-(23,42)
(23,31)-(23,32)
(23,33)-(23,37)
(23,38)-(23,42)
(23,46)-(23,49)
*)

(* type error slice
(5,3)-(13,43)
(5,12)-(13,41)
(5,15)-(13,41)
(22,4)-(22,70)
(22,20)-(22,27)
(22,20)-(22,35)
*)

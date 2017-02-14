
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
  else (match i with | 1 -> l | _ -> bigAdd l (mulByDigit (i - 1) l));;

let bigMul l1 l2 =
  let f a x = bigAdd (mulByDigit x l2) a in
  let base = [0] in
  let args = l1 in let (_,res) = List.fold_left f base args in res;;


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
(34,9)-(34,68)
(34,38)-(34,44)
(37,3)-(39,67)
(37,15)-(37,21)
(37,15)-(37,41)
(37,23)-(37,38)
(37,40)-(37,41)
(38,3)-(39,67)
(38,14)-(38,17)
(38,15)-(38,16)
(39,3)-(39,67)
(39,14)-(39,16)
(39,20)-(39,67)
(39,34)-(39,48)
(39,34)-(39,60)
(39,49)-(39,50)
(39,51)-(39,55)
(39,56)-(39,60)
(39,64)-(39,67)
*)

(* type error slice
(18,9)-(18,66)
(18,9)-(18,66)
(18,20)-(18,21)
(18,25)-(18,66)
(18,25)-(18,66)
(18,45)-(18,55)
(18,45)-(18,57)
(18,65)-(18,66)
(20,4)-(29,37)
(20,12)-(29,33)
(20,15)-(29,33)
(21,3)-(29,33)
(29,3)-(29,13)
(29,3)-(29,33)
(37,3)-(39,67)
(37,9)-(37,41)
(37,11)-(37,41)
(37,15)-(37,21)
(37,15)-(37,41)
(39,20)-(39,67)
(39,34)-(39,48)
(39,34)-(39,60)
(39,49)-(39,50)
*)
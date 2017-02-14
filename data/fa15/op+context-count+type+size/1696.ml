
let rec clone x n = if n <= 0 then [] else List.append [x] (clone x (n - 1));;

let padZero l1 l2 =
  let x = List.length l1 in
  let y = List.length l2 in
  if x > y
  then (l1, (List.append (clone 0 (x - y)) l2))
  else if x < y then ((List.append (clone 0 (y - x)) l1), l2) else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (lh1,lh2) = x in
      let (carry,res) = a in
      let num = (lh1 + lh2) + carry in ((num / 10), ((num mod 10) :: res)) in
    let base = (0, []) in
    let args = List.rev (List.combine (0 :: l1) (0 :: l2)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  if i <= 0 then [] else bigAdd l (mulByDigit (i - 1) l);;

let bigMul l1 l2 =
  let f a x =
    let (place,res) = a in
    if place <= 0
    then ((place + 1), (res + (mulByDigit x res)))
    else ((place + 1), (mulByDigit ((x * 10) * place) res)) in
  let base = (0, []) in
  let args = List.rev l1 in let (_,res) = List.fold_left f base args in res;;


(* fix

let rec clone x n = if n <= 0 then [] else List.append [x] (clone x (n - 1));;

let padZero l1 l2 =
  let x = List.length l1 in
  let y = List.length l2 in
  if x > y
  then (l1, (List.append (clone 0 (x - y)) l2))
  else if x < y then ((List.append (clone 0 (y - x)) l1), l2) else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (lh1,lh2) = x in
      let (carry,res) = a in
      let num = (lh1 + lh2) + carry in ((num / 10), ((num mod 10) :: res)) in
    let base = (0, []) in
    let args = List.rev (List.combine (0 :: l1) (0 :: l2)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  if i <= 0 then [] else bigAdd l (mulByDigit (i - 1) l);;

let bigMul l1 l2 =
  let f a x =
    let (place,res) = a in
    if place <= 0
    then ((place + 1), (mulByDigit x res))
    else ((place + 1), (mulByDigit ((x * 10) * place) res)) in
  let base = (0, []) in
  let args = List.rev l1 in let (_,res) = List.fold_left f base args in res;;

*)

(* changed spans
(32,25)-(32,28)
(32,25)-(32,48)
*)

(* type error slice
(4,4)-(9,78)
(4,13)-(9,75)
(4,16)-(9,75)
(8,14)-(8,25)
(8,14)-(8,46)
(8,44)-(8,46)
(9,24)-(9,35)
(9,24)-(9,56)
(9,54)-(9,56)
(14,4)-(23,37)
(14,12)-(23,33)
(14,15)-(23,33)
(23,20)-(23,27)
(23,20)-(23,33)
(23,28)-(23,30)
(23,31)-(23,33)
(26,26)-(26,32)
(26,26)-(26,56)
(26,33)-(26,34)
(26,36)-(26,46)
(26,36)-(26,56)
(26,55)-(26,56)
(29,3)-(35,76)
(29,9)-(33,58)
(29,11)-(33,58)
(30,5)-(33,58)
(30,5)-(33,58)
(30,23)-(30,24)
(31,5)-(33,58)
(31,5)-(33,58)
(32,12)-(32,48)
(32,25)-(32,28)
(32,25)-(32,48)
(32,25)-(32,48)
(32,25)-(32,48)
(32,32)-(32,42)
(32,32)-(32,48)
(32,45)-(32,48)
(33,12)-(33,58)
(33,25)-(33,35)
(33,25)-(33,58)
(35,43)-(35,57)
(35,43)-(35,69)
(35,58)-(35,59)
*)

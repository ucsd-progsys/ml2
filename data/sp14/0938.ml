
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let leng1 = List.length l1 in
  let leng2 = List.length l2 in
  (((clone 0 (leng2 - leng1)) @ l1), ((clone 0 (leng1 - leng2)) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let digitSum = ((fst x) + (snd x)) + (fst a) in
      ((digitSum / 10), ((digitSum mod 10) :: (snd a))) in
    let base = (0, []) in
    let args = List.rev ((0, 0) :: (List.combine l1 l2)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  let f x a =
    let digitRes = (x * i) + (fst a) in
    ((digitRes / 10), ((digitRes mod 10) :: (snd a))) in
  let base = (0, []) in
  let (_,result) = List.fold_right f (0 :: l) base in removeZero result;;

let bigMul l1 l2 =
  let f a x =
    let value = mulByDigit x l1 in (0, ((bigAdd value x) :: (snd a))) in
  let base = (0, []) in
  let args = List.rev l2 in let (_,res) = List.fold_left f base args in res;;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let leng1 = List.length l1 in
  let leng2 = List.length l2 in
  (((clone 0 (leng2 - leng1)) @ l1), ((clone 0 (leng1 - leng2)) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let digitSum = ((fst x) + (snd x)) + (fst a) in
      ((digitSum / 10), ((digitSum mod 10) :: (snd a))) in
    let base = (0, []) in
    let args = List.rev ((0, 0) :: (List.combine l1 l2)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  let f x a =
    let digitRes = (x * i) + (fst a) in
    ((digitRes / 10), ((digitRes mod 10) :: (snd a))) in
  let base = (0, []) in
  let (_,result) = List.fold_right f (0 :: l) base in removeZero result;;

let bigMul l1 l2 =
  let f a x = let value = mulByDigit x l1 in (0, (bigAdd value (snd a))) in
  let base = (0, []) in
  let args = List.rev l2 in let (_,res) = List.fold_left f base args in res;;

*)

(* changed spans
(31,39)-(31,68)
(31,54)-(31,55)
*)

(* type error slice
(4,3)-(7,72)
(4,12)-(7,70)
(4,15)-(7,70)
(7,37)-(7,69)
(7,64)-(7,65)
(7,66)-(7,68)
(12,3)-(20,36)
(12,11)-(20,34)
(12,14)-(20,34)
(20,18)-(20,33)
(20,19)-(20,26)
(20,30)-(20,32)
(22,3)-(27,73)
(22,19)-(27,71)
(24,19)-(24,26)
(24,24)-(24,25)
(31,16)-(31,26)
(31,16)-(31,31)
(31,27)-(31,28)
(31,40)-(31,56)
(31,41)-(31,47)
(31,54)-(31,55)
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
(4,12)-(7,70)
(4,15)-(7,70)
(5,2)-(7,70)
(5,14)-(5,28)
(5,14)-(5,25)
(5,26)-(5,28)
(6,2)-(7,70)
(6,14)-(6,28)
(6,14)-(6,25)
(6,26)-(6,28)
(7,2)-(7,70)
(7,3)-(7,35)
(7,30)-(7,31)
(7,4)-(7,29)
(7,5)-(7,10)
(7,11)-(7,12)
(7,13)-(7,28)
(7,14)-(7,19)
(7,22)-(7,27)
(7,32)-(7,34)
(7,37)-(7,69)
(7,64)-(7,65)
(7,38)-(7,63)
(7,39)-(7,44)
(7,45)-(7,46)
(7,47)-(7,62)
(7,48)-(7,53)
(7,56)-(7,61)
(7,66)-(7,68)
(9,19)-(10,69)
(10,2)-(10,69)
(10,8)-(10,9)
(10,23)-(10,25)
(10,36)-(10,69)
(10,39)-(10,44)
(10,39)-(10,40)
(10,43)-(10,44)
(10,50)-(10,62)
(10,50)-(10,60)
(10,61)-(10,62)
(10,68)-(10,69)
(12,11)-(20,34)
(12,14)-(20,34)
(13,2)-(20,34)
(13,11)-(19,51)
(14,4)-(19,51)
(14,10)-(16,55)
(14,12)-(16,55)
(15,6)-(16,55)
(15,21)-(15,50)
(15,21)-(15,40)
(15,22)-(15,29)
(15,23)-(15,26)
(15,27)-(15,28)
(15,32)-(15,39)
(15,33)-(15,36)
(15,37)-(15,38)
(15,43)-(15,50)
(15,44)-(15,47)
(15,48)-(15,49)
(16,6)-(16,55)
(16,7)-(16,22)
(16,8)-(16,16)
(16,19)-(16,21)
(16,24)-(16,54)
(16,25)-(16,42)
(16,26)-(16,34)
(16,39)-(16,41)
(16,46)-(16,53)
(16,47)-(16,50)
(16,51)-(16,52)
(17,4)-(19,51)
(17,15)-(17,22)
(17,16)-(17,17)
(17,19)-(17,21)
(18,4)-(19,51)
(18,15)-(18,56)
(18,15)-(18,23)
(18,24)-(18,56)
(18,25)-(18,31)
(18,26)-(18,27)
(18,29)-(18,30)
(18,35)-(18,55)
(18,36)-(18,48)
(18,49)-(18,51)
(18,52)-(18,54)
(19,4)-(19,51)
(19,18)-(19,44)
(19,18)-(19,32)
(19,33)-(19,34)
(19,35)-(19,39)
(19,40)-(19,44)
(19,48)-(19,51)
(20,2)-(20,34)
(20,2)-(20,12)
(20,13)-(20,34)
(20,14)-(20,17)
(20,18)-(20,33)
(20,19)-(20,26)
(20,27)-(20,29)
(20,30)-(20,32)
(22,19)-(27,71)
(22,21)-(27,71)
(23,2)-(27,71)
(23,8)-(25,53)
(23,10)-(25,53)
(24,4)-(25,53)
(24,19)-(24,36)
(24,19)-(24,26)
(24,20)-(24,21)
(24,24)-(24,25)
(24,29)-(24,36)
(24,30)-(24,33)
(24,34)-(24,35)
(25,4)-(25,53)
(25,5)-(25,20)
(25,6)-(25,14)
(25,17)-(25,19)
(25,22)-(25,52)
(25,23)-(25,40)
(25,24)-(25,32)
(25,37)-(25,39)
(25,44)-(25,51)
(25,45)-(25,48)
(25,49)-(25,50)
(26,2)-(27,71)
(26,13)-(26,20)
(26,14)-(26,15)
(26,17)-(26,19)
(27,2)-(27,71)
(27,19)-(27,50)
(27,19)-(27,34)
(27,35)-(27,36)
(27,37)-(27,45)
(27,38)-(27,39)
(27,43)-(27,44)
(27,46)-(27,50)
(27,54)-(27,71)
(27,54)-(27,64)
(27,65)-(27,71)
(29,11)-(33,75)
(29,14)-(33,75)
(30,2)-(33,75)
(30,8)-(31,69)
(30,10)-(31,69)
(31,4)-(31,69)
(31,16)-(31,31)
(31,16)-(31,26)
(31,27)-(31,28)
(31,29)-(31,31)
(31,35)-(31,69)
(31,36)-(31,37)
(31,39)-(31,68)
(31,40)-(31,56)
(31,41)-(31,47)
(31,48)-(31,53)
(31,54)-(31,55)
(31,60)-(31,67)
(31,61)-(31,64)
(31,65)-(31,66)
(32,2)-(33,75)
(32,13)-(32,20)
(32,14)-(32,15)
(32,17)-(32,19)
(33,2)-(33,75)
(33,13)-(33,24)
(33,13)-(33,21)
(33,22)-(33,24)
(33,28)-(33,75)
(33,42)-(33,68)
(33,42)-(33,56)
(33,57)-(33,58)
(33,59)-(33,63)
(33,64)-(33,68)
(33,72)-(33,75)
*)

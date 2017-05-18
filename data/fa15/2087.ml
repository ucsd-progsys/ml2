
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let len = (List.length l1) - (List.length l2) in
  if len <= 0
  then (((clone 0 ((-1) * len)) @ l1), l2)
  else (l1, ((clone 0 len) @ l2));;

let rec removeZero l =
  match l with
  | [] -> []
  | x::l' -> (match x with | 0 -> removeZero l' | _ -> x :: l');;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (o,r) = a in
      ((((x1 + x2) + o) / 10), ((((x1 + x2) + o) mod 10) :: r)) in
    let base = (0, []) in
    let args = List.rev ((0, 0) :: (List.combine l1 l2)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  match i with | 0 -> [0] | 1 -> l | _ -> bigAdd l mulByDigit (i - 1) l;;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let len = (List.length l1) - (List.length l2) in
  if len <= 0
  then (((clone 0 ((-1) * len)) @ l1), l2)
  else (l1, ((clone 0 len) @ l2));;

let rec removeZero l =
  match l with
  | [] -> []
  | x::l' -> (match x with | 0 -> removeZero l' | _ -> x :: l');;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (o,r) = a in
      ((((x1 + x2) + o) / 10), ((((x1 + x2) + o) mod 10) :: r)) in
    let base = (0, []) in
    let args = List.rev ((0, 0) :: (List.combine l1 l2)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  match i with | 0 -> [0] | 1 -> l | _ -> bigAdd l (mulByDigit (i - 1) l);;

*)

(* changed spans
(27,42)-(27,71)
(27,51)-(27,61)
*)

(* type error slice
(13,13)-(13,63)
(13,13)-(13,63)
(13,34)-(13,44)
(13,34)-(13,47)
(13,55)-(13,62)
(15,3)-(24,36)
(15,11)-(24,34)
(15,14)-(24,34)
(16,2)-(24,34)
(24,2)-(24,12)
(24,2)-(24,34)
(27,42)-(27,48)
(27,42)-(27,71)
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
(4,12)-(8,33)
(4,15)-(8,33)
(5,2)-(8,33)
(5,12)-(5,47)
(5,12)-(5,28)
(5,13)-(5,24)
(5,25)-(5,27)
(5,31)-(5,47)
(5,32)-(5,43)
(5,44)-(5,46)
(6,2)-(8,33)
(6,5)-(6,13)
(6,5)-(6,8)
(6,12)-(6,13)
(7,7)-(7,42)
(7,8)-(7,37)
(7,32)-(7,33)
(7,9)-(7,31)
(7,10)-(7,15)
(7,16)-(7,17)
(7,18)-(7,30)
(7,19)-(7,23)
(7,26)-(7,29)
(7,34)-(7,36)
(7,39)-(7,41)
(8,7)-(8,33)
(8,8)-(8,10)
(8,12)-(8,32)
(8,27)-(8,28)
(8,13)-(8,26)
(8,14)-(8,19)
(8,20)-(8,21)
(8,22)-(8,25)
(8,29)-(8,31)
(10,19)-(13,63)
(11,2)-(13,63)
(11,8)-(11,9)
(12,10)-(12,12)
(13,13)-(13,63)
(13,20)-(13,21)
(13,34)-(13,47)
(13,34)-(13,44)
(13,45)-(13,47)
(13,55)-(13,62)
(13,55)-(13,56)
(13,60)-(13,62)
(15,11)-(24,34)
(15,14)-(24,34)
(16,2)-(24,34)
(16,11)-(23,51)
(17,4)-(23,51)
(17,10)-(20,63)
(17,12)-(20,63)
(18,6)-(20,63)
(18,20)-(18,21)
(19,6)-(20,63)
(19,18)-(19,19)
(20,6)-(20,63)
(20,7)-(20,29)
(20,8)-(20,23)
(20,9)-(20,18)
(20,10)-(20,12)
(20,15)-(20,17)
(20,21)-(20,22)
(20,26)-(20,28)
(20,31)-(20,62)
(20,32)-(20,56)
(20,33)-(20,48)
(20,34)-(20,43)
(20,35)-(20,37)
(20,40)-(20,42)
(20,46)-(20,47)
(20,53)-(20,55)
(20,60)-(20,61)
(21,4)-(23,51)
(21,15)-(21,22)
(21,16)-(21,17)
(21,19)-(21,21)
(22,4)-(23,51)
(22,15)-(22,56)
(22,15)-(22,23)
(22,24)-(22,56)
(22,25)-(22,31)
(22,26)-(22,27)
(22,29)-(22,30)
(22,35)-(22,55)
(22,36)-(22,48)
(22,49)-(22,51)
(22,52)-(22,54)
(23,4)-(23,51)
(23,18)-(23,44)
(23,18)-(23,32)
(23,33)-(23,34)
(23,35)-(23,39)
(23,40)-(23,44)
(23,48)-(23,51)
(24,2)-(24,34)
(24,2)-(24,12)
(24,13)-(24,34)
(24,14)-(24,17)
(24,18)-(24,33)
(24,19)-(24,26)
(24,27)-(24,29)
(24,30)-(24,32)
(26,19)-(27,71)
(26,21)-(27,71)
(27,2)-(27,71)
(27,8)-(27,9)
(27,22)-(27,25)
(27,23)-(27,24)
(27,33)-(27,34)
(27,42)-(27,71)
(27,42)-(27,48)
(27,49)-(27,50)
(27,51)-(27,61)
(27,62)-(27,69)
(27,63)-(27,64)
(27,67)-(27,68)
(27,70)-(27,71)
*)

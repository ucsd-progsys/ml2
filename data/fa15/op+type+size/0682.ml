
let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let rec mulByDigit i l =
  let f a x =
    let y = i * x in
    match a with
    | h::t -> ((h + y) / 10) :: ((h + y) mod 10) :: t
    | _ -> [y / 10; y mod 10] in
  let base = [] in removeZero (List.fold_left f base (List.rev l));;

let bigMul l1 l2 =
  let f a x = ((mulByDigit x l1) @ (clone 0 (List.length a))) :: a in
  let base = (0, []) in
  let args = List.rev l2 in
  let (carry,res) = List.fold_left f base args in carry :: res;;


(* fix

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let rec mulByDigit i l =
  let f a x =
    let y = i * x in
    match a with
    | h::t -> ((h + y) / 10) :: ((h + y) mod 10) :: t
    | _ -> [y / 10; y mod 10] in
  let base = [] in removeZero (List.fold_left f base (List.rev l));;

let bigMul l1 l2 =
  let f a x = ((mulByDigit x l1) @ (clone 0 (List.length a))) @ a in
  let base = [] in
  let args = List.rev l2 in let res = List.fold_left f base args in res;;

*)

(* changed spans
(16,14)-(16,66)
(16,16)-(16,26)
(17,13)-(17,20)
(17,14)-(17,15)
(19,2)-(19,62)
(19,50)-(19,55)
(19,50)-(19,62)
*)

(* type error slice
(16,2)-(19,62)
(16,8)-(16,66)
(16,44)-(16,59)
(16,45)-(16,56)
(16,57)-(16,58)
(17,2)-(19,62)
(17,13)-(17,20)
(19,20)-(19,34)
(19,20)-(19,46)
(19,35)-(19,36)
(19,37)-(19,41)
*)

(* all spans
(2,19)-(3,69)
(3,2)-(3,69)
(3,8)-(3,9)
(3,23)-(3,25)
(3,36)-(3,69)
(3,39)-(3,44)
(3,39)-(3,40)
(3,43)-(3,44)
(3,50)-(3,62)
(3,50)-(3,60)
(3,61)-(3,62)
(3,68)-(3,69)
(5,14)-(5,65)
(5,16)-(5,65)
(5,20)-(5,65)
(5,23)-(5,29)
(5,23)-(5,24)
(5,28)-(5,29)
(5,35)-(5,37)
(5,43)-(5,65)
(5,43)-(5,44)
(5,48)-(5,65)
(5,49)-(5,54)
(5,55)-(5,56)
(5,57)-(5,64)
(5,58)-(5,59)
(5,62)-(5,63)
(7,19)-(13,66)
(7,21)-(13,66)
(8,2)-(13,66)
(8,8)-(12,29)
(8,10)-(12,29)
(9,4)-(12,29)
(9,12)-(9,17)
(9,12)-(9,13)
(9,16)-(9,17)
(10,4)-(12,29)
(10,10)-(10,11)
(11,14)-(11,53)
(11,14)-(11,28)
(11,15)-(11,22)
(11,16)-(11,17)
(11,20)-(11,21)
(11,25)-(11,27)
(11,32)-(11,53)
(11,32)-(11,48)
(11,33)-(11,40)
(11,34)-(11,35)
(11,38)-(11,39)
(11,45)-(11,47)
(11,52)-(11,53)
(12,11)-(12,29)
(12,12)-(12,18)
(12,12)-(12,13)
(12,16)-(12,18)
(12,20)-(12,28)
(12,20)-(12,21)
(12,26)-(12,28)
(13,2)-(13,66)
(13,13)-(13,15)
(13,19)-(13,66)
(13,19)-(13,29)
(13,30)-(13,66)
(13,31)-(13,45)
(13,46)-(13,47)
(13,48)-(13,52)
(13,53)-(13,65)
(13,54)-(13,62)
(13,63)-(13,64)
(15,11)-(19,62)
(15,14)-(19,62)
(16,2)-(19,62)
(16,8)-(16,66)
(16,10)-(16,66)
(16,14)-(16,66)
(16,14)-(16,61)
(16,33)-(16,34)
(16,15)-(16,32)
(16,16)-(16,26)
(16,27)-(16,28)
(16,29)-(16,31)
(16,35)-(16,60)
(16,36)-(16,41)
(16,42)-(16,43)
(16,44)-(16,59)
(16,45)-(16,56)
(16,57)-(16,58)
(16,65)-(16,66)
(17,2)-(19,62)
(17,13)-(17,20)
(17,14)-(17,15)
(17,17)-(17,19)
(18,2)-(19,62)
(18,13)-(18,24)
(18,13)-(18,21)
(18,22)-(18,24)
(19,2)-(19,62)
(19,20)-(19,46)
(19,20)-(19,34)
(19,35)-(19,36)
(19,37)-(19,41)
(19,42)-(19,46)
(19,50)-(19,62)
(19,50)-(19,55)
(19,59)-(19,62)
*)

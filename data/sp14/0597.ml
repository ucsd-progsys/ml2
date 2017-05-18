
let rec clone x n =
  match n with | n when n <= 0 -> [] | _ -> x :: (clone x (n - 1));;

let rec padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
  else (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x c =
      let (s,t) = x in
      let sum = (c + s) + t in ((sum / 10), ((sum mod 10) :: a)) in
    let base = (0, [0]) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n =
  match n with | n when n <= 0 -> [] | _ -> x :: (clone x (n - 1));;

let rec padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
  else (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x',x'') = x in
      let (c,s) = a in
      ((((c + x') + x'') / 10), ((((c + x') + x'') mod 10) :: s)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(15,14)-(17,64)
(16,6)-(17,64)
(17,6)-(17,64)
(17,21)-(17,22)
(17,26)-(17,27)
(17,31)-(17,64)
(17,32)-(17,42)
(17,33)-(17,36)
(17,44)-(17,63)
(17,46)-(17,49)
(17,61)-(17,62)
(18,19)-(18,22)
(18,20)-(18,21)
*)

(* type error slice
(15,4)-(20,51)
(15,10)-(17,64)
(15,12)-(17,64)
(15,14)-(17,64)
(17,44)-(17,63)
(17,61)-(17,62)
(20,18)-(20,32)
(20,18)-(20,44)
(20,33)-(20,34)
*)

(* all spans
(2,14)-(3,66)
(2,16)-(3,66)
(3,2)-(3,66)
(3,8)-(3,9)
(3,24)-(3,30)
(3,24)-(3,25)
(3,29)-(3,30)
(3,34)-(3,36)
(3,44)-(3,66)
(3,44)-(3,45)
(3,49)-(3,66)
(3,50)-(3,55)
(3,56)-(3,57)
(3,58)-(3,65)
(3,59)-(3,60)
(3,63)-(3,64)
(5,16)-(8,67)
(5,19)-(8,67)
(6,2)-(8,67)
(6,5)-(6,40)
(6,5)-(6,21)
(6,6)-(6,17)
(6,18)-(6,20)
(6,24)-(6,40)
(6,25)-(6,36)
(6,37)-(6,39)
(7,7)-(7,67)
(7,8)-(7,10)
(7,12)-(7,66)
(7,61)-(7,62)
(7,13)-(7,60)
(7,14)-(7,19)
(7,20)-(7,21)
(7,22)-(7,59)
(7,23)-(7,39)
(7,24)-(7,35)
(7,36)-(7,38)
(7,42)-(7,58)
(7,43)-(7,54)
(7,55)-(7,57)
(7,63)-(7,65)
(8,7)-(8,67)
(8,8)-(8,62)
(8,57)-(8,58)
(8,9)-(8,56)
(8,10)-(8,15)
(8,16)-(8,17)
(8,18)-(8,55)
(8,19)-(8,35)
(8,20)-(8,31)
(8,32)-(8,34)
(8,38)-(8,54)
(8,39)-(8,50)
(8,51)-(8,53)
(8,59)-(8,61)
(8,64)-(8,66)
(10,19)-(11,69)
(11,2)-(11,69)
(11,8)-(11,9)
(11,23)-(11,25)
(11,36)-(11,69)
(11,39)-(11,44)
(11,39)-(11,40)
(11,43)-(11,44)
(11,50)-(11,62)
(11,50)-(11,60)
(11,61)-(11,62)
(11,68)-(11,69)
(13,11)-(21,34)
(13,14)-(21,34)
(14,2)-(21,34)
(14,11)-(20,51)
(15,4)-(20,51)
(15,10)-(17,64)
(15,12)-(17,64)
(15,14)-(17,64)
(16,6)-(17,64)
(16,18)-(16,19)
(17,6)-(17,64)
(17,16)-(17,27)
(17,16)-(17,23)
(17,17)-(17,18)
(17,21)-(17,22)
(17,26)-(17,27)
(17,31)-(17,64)
(17,32)-(17,42)
(17,33)-(17,36)
(17,39)-(17,41)
(17,44)-(17,63)
(17,45)-(17,57)
(17,46)-(17,49)
(17,54)-(17,56)
(17,61)-(17,62)
(18,4)-(20,51)
(18,15)-(18,23)
(18,16)-(18,17)
(18,19)-(18,22)
(18,20)-(18,21)
(19,4)-(20,51)
(19,15)-(19,44)
(19,15)-(19,23)
(19,24)-(19,44)
(19,25)-(19,37)
(19,38)-(19,40)
(19,41)-(19,43)
(20,4)-(20,51)
(20,18)-(20,44)
(20,18)-(20,32)
(20,33)-(20,34)
(20,35)-(20,39)
(20,40)-(20,44)
(20,48)-(20,51)
(21,2)-(21,34)
(21,2)-(21,12)
(21,13)-(21,34)
(21,14)-(21,17)
(21,18)-(21,33)
(21,19)-(21,26)
(21,27)-(21,29)
(21,30)-(21,32)
*)

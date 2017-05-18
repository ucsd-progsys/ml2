
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let sizDif = (List.length l1) - (List.length l2) in
  if sizDif > 0
  then let pad = clone 0 sizDif in (l1, (pad @ l2))
  else (let pad = clone 0 (- sizDif) in ((pad @ l1), l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h == 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (j,k) -> if (j + k) > 10 then (1, ((j + k) - 10)) else (0, (j + k)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let sizDif = (List.length l1) - (List.length l2) in
  if sizDif > 0
  then let pad = clone 0 sizDif in (l1, (pad @ l2))
  else (let pad = clone 0 (- sizDif) in ((pad @ l1), l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h == 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (a1,a2) = a in
      if (x1 + x2) > 10
      then (1, ((((x1 + x2) + a1) - 10) :: a2))
      else (0, (((x1 + x2) + a1) :: a2)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(16,6)-(17,75)
(17,17)-(17,75)
(17,21)-(17,22)
(17,25)-(17,26)
(17,30)-(17,32)
(17,42)-(17,56)
(17,44)-(17,45)
(17,48)-(17,49)
(17,53)-(17,55)
(17,63)-(17,75)
(17,67)-(17,74)
(17,68)-(17,69)
(17,72)-(17,73)
(18,4)-(20,51)
*)

(* type error slice
(15,4)-(20,51)
(15,10)-(17,75)
(15,12)-(17,75)
(16,6)-(17,75)
(17,17)-(17,75)
(17,38)-(17,57)
(17,42)-(17,56)
(18,4)-(20,51)
(18,15)-(18,22)
(18,19)-(18,21)
(20,18)-(20,32)
(20,18)-(20,44)
(20,33)-(20,34)
(20,35)-(20,39)
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
(4,12)-(8,57)
(4,15)-(8,57)
(5,2)-(8,57)
(5,15)-(5,50)
(5,15)-(5,31)
(5,16)-(5,27)
(5,28)-(5,30)
(5,34)-(5,50)
(5,35)-(5,46)
(5,47)-(5,49)
(6,2)-(8,57)
(6,5)-(6,15)
(6,5)-(6,11)
(6,14)-(6,15)
(7,7)-(7,51)
(7,17)-(7,31)
(7,17)-(7,22)
(7,23)-(7,24)
(7,25)-(7,31)
(7,35)-(7,51)
(7,36)-(7,38)
(7,40)-(7,50)
(7,45)-(7,46)
(7,41)-(7,44)
(7,47)-(7,49)
(8,7)-(8,57)
(8,18)-(8,36)
(8,18)-(8,23)
(8,24)-(8,25)
(8,26)-(8,36)
(8,29)-(8,35)
(8,40)-(8,56)
(8,41)-(8,51)
(8,46)-(8,47)
(8,42)-(8,45)
(8,48)-(8,50)
(8,53)-(8,55)
(10,19)-(11,75)
(11,2)-(11,75)
(11,8)-(11,9)
(11,23)-(11,25)
(11,36)-(11,75)
(11,39)-(11,45)
(11,39)-(11,40)
(11,44)-(11,45)
(11,51)-(11,63)
(11,51)-(11,61)
(11,62)-(11,63)
(11,69)-(11,75)
(11,69)-(11,70)
(11,74)-(11,75)
(13,11)-(21,34)
(13,14)-(21,34)
(14,2)-(21,34)
(14,11)-(20,51)
(15,4)-(20,51)
(15,10)-(17,75)
(15,12)-(17,75)
(16,6)-(17,75)
(16,12)-(16,13)
(17,17)-(17,75)
(17,20)-(17,32)
(17,20)-(17,27)
(17,21)-(17,22)
(17,25)-(17,26)
(17,30)-(17,32)
(17,38)-(17,57)
(17,39)-(17,40)
(17,42)-(17,56)
(17,43)-(17,50)
(17,44)-(17,45)
(17,48)-(17,49)
(17,53)-(17,55)
(17,63)-(17,75)
(17,64)-(17,65)
(17,67)-(17,74)
(17,68)-(17,69)
(17,72)-(17,73)
(18,4)-(20,51)
(18,15)-(18,22)
(18,16)-(18,17)
(18,19)-(18,21)
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


let rec clone x n =
  if n < 1 then [] else if n = 1 then [x] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
  else (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2);;

let rec removeZero l =
  match l with
  | [] -> []
  | h::t -> (match h with | 0 -> removeZero t | _ -> h :: t);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = match l1 with | [] -> (0, []) | h::t -> (0, ((x + h) :: a)) in
    let base = (0, []) in
    let args = l2 in let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero (List.rev l1) (List.rev l2)));;


(* fix

let rec clone x n =
  if n < 1 then [] else if n = 1 then [x] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
  else (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2);;

let rec removeZero l =
  match l with
  | [] -> []
  | h::t -> (match h with | 0 -> removeZero t | _ -> h :: t);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let sum = (fst x) + (snd x) in
      if sum > 9
      then (1, (((sum - 10) + (fst a)) :: (snd a)))
      else (0, ((sum + (fst a)) :: (snd a))) in
    let base = (0, []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero (List.rev l1) (List.rev l2)));;

*)

(* changed spans
(17,16)-(17,75)
(17,22)-(17,24)
(17,38)-(17,45)
(17,39)-(17,40)
(17,42)-(17,44)
(17,56)-(17,75)
(17,62)-(17,63)
(17,66)-(17,67)
(17,72)-(17,73)
(18,4)-(19,68)
(19,15)-(19,17)
*)

(* type error slice
(17,4)-(19,68)
(17,10)-(17,75)
(17,12)-(17,75)
(17,16)-(17,75)
(17,56)-(17,75)
(17,60)-(17,74)
(17,72)-(17,73)
(19,35)-(19,49)
(19,35)-(19,61)
(19,50)-(19,51)
*)

(* all spans
(2,14)-(3,69)
(2,16)-(3,69)
(3,2)-(3,69)
(3,5)-(3,10)
(3,5)-(3,6)
(3,9)-(3,10)
(3,16)-(3,18)
(3,24)-(3,69)
(3,27)-(3,32)
(3,27)-(3,28)
(3,31)-(3,32)
(3,38)-(3,41)
(3,39)-(3,40)
(3,47)-(3,69)
(3,47)-(3,48)
(3,52)-(3,69)
(3,53)-(3,58)
(3,59)-(3,60)
(3,61)-(3,68)
(3,62)-(3,63)
(3,66)-(3,67)
(5,12)-(8,67)
(5,15)-(8,67)
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
(10,19)-(13,60)
(11,2)-(13,60)
(11,8)-(11,9)
(12,10)-(12,12)
(13,12)-(13,60)
(13,19)-(13,20)
(13,33)-(13,45)
(13,33)-(13,43)
(13,44)-(13,45)
(13,53)-(13,59)
(13,53)-(13,54)
(13,58)-(13,59)
(15,11)-(20,56)
(15,14)-(20,56)
(16,2)-(20,56)
(16,11)-(19,68)
(17,4)-(19,68)
(17,10)-(17,75)
(17,12)-(17,75)
(17,16)-(17,75)
(17,22)-(17,24)
(17,38)-(17,45)
(17,39)-(17,40)
(17,42)-(17,44)
(17,56)-(17,75)
(17,57)-(17,58)
(17,60)-(17,74)
(17,61)-(17,68)
(17,62)-(17,63)
(17,66)-(17,67)
(17,72)-(17,73)
(18,4)-(19,68)
(18,15)-(18,22)
(18,16)-(18,17)
(18,19)-(18,21)
(19,4)-(19,68)
(19,15)-(19,17)
(19,21)-(19,68)
(19,35)-(19,61)
(19,35)-(19,49)
(19,50)-(19,51)
(19,52)-(19,56)
(19,57)-(19,61)
(19,65)-(19,68)
(20,2)-(20,56)
(20,2)-(20,12)
(20,13)-(20,56)
(20,14)-(20,17)
(20,18)-(20,55)
(20,19)-(20,26)
(20,27)-(20,40)
(20,28)-(20,36)
(20,37)-(20,39)
(20,41)-(20,54)
(20,42)-(20,50)
(20,51)-(20,53)
*)

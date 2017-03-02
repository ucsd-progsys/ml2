
let rec clone x n = if n > 0 then x :: (clone x (n - 1)) else [];;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2)
  else (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match a with
      | (lh1::lt1,lh2::lt2) ->
          (match x with
           | (h1,h2) ->
               (((((h1 + h2) + lh1) / 10) :: lt1),
                 ((((h1 + h2) + lh1) mod 10) :: lt2))
           | ([],[]) ->
               (match x with
                | (h1,h2) -> ([(h1 + h2) / 10], [(h1 + h2) mod 10]))) in
    let base = ([], []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n > 0 then x :: (clone x (n - 1)) else [];;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2)
  else (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = match x with | (v1,v2) -> ([v1], [v2]) in
    let base = ([], []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(15,6)-(23,69)
(15,12)-(15,13)
(17,10)-(23,69)
(17,17)-(17,18)
(19,15)-(20,53)
(19,16)-(19,49)
(19,17)-(19,41)
(19,18)-(19,35)
(19,19)-(19,28)
(19,20)-(19,22)
(19,25)-(19,27)
(19,31)-(19,34)
(19,38)-(19,40)
(19,45)-(19,48)
(20,17)-(20,52)
(20,18)-(20,44)
(20,19)-(20,36)
(20,20)-(20,29)
(20,21)-(20,23)
(20,26)-(20,28)
(20,32)-(20,35)
(20,41)-(20,43)
(20,48)-(20,51)
(22,15)-(23,68)
(23,31)-(23,40)
(23,31)-(23,45)
(23,32)-(23,34)
(23,37)-(23,39)
(23,43)-(23,45)
(23,49)-(23,58)
(23,49)-(23,65)
(23,50)-(23,52)
(23,55)-(23,57)
(23,63)-(23,65)
(24,4)-(26,51)
(24,15)-(24,23)
(25,4)-(26,51)
(26,4)-(26,51)
*)

(* type error slice
(17,10)-(23,69)
(17,10)-(23,69)
(17,17)-(17,18)
(22,15)-(23,68)
(22,22)-(22,23)
(23,31)-(23,40)
(23,32)-(23,34)
*)

(* all spans
(2,14)-(2,64)
(2,16)-(2,64)
(2,20)-(2,64)
(2,23)-(2,28)
(2,23)-(2,24)
(2,27)-(2,28)
(2,34)-(2,56)
(2,34)-(2,35)
(2,39)-(2,56)
(2,40)-(2,45)
(2,46)-(2,47)
(2,48)-(2,55)
(2,49)-(2,50)
(2,53)-(2,54)
(2,62)-(2,64)
(4,12)-(7,77)
(4,15)-(7,77)
(5,2)-(7,77)
(5,5)-(5,40)
(5,5)-(5,21)
(5,6)-(5,17)
(5,18)-(5,20)
(5,24)-(5,40)
(5,25)-(5,36)
(5,37)-(5,39)
(6,7)-(6,77)
(6,8)-(6,72)
(6,9)-(6,20)
(6,21)-(6,68)
(6,22)-(6,27)
(6,28)-(6,29)
(6,30)-(6,67)
(6,31)-(6,47)
(6,32)-(6,43)
(6,44)-(6,46)
(6,50)-(6,66)
(6,51)-(6,62)
(6,63)-(6,65)
(6,69)-(6,71)
(6,74)-(6,76)
(7,7)-(7,77)
(7,8)-(7,10)
(7,12)-(7,76)
(7,13)-(7,24)
(7,25)-(7,72)
(7,26)-(7,31)
(7,32)-(7,33)
(7,34)-(7,71)
(7,35)-(7,51)
(7,36)-(7,47)
(7,48)-(7,50)
(7,54)-(7,70)
(7,55)-(7,66)
(7,67)-(7,69)
(7,73)-(7,75)
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
(12,11)-(27,34)
(12,14)-(27,34)
(13,2)-(27,34)
(13,11)-(26,51)
(14,4)-(26,51)
(14,10)-(23,69)
(14,12)-(23,69)
(15,6)-(23,69)
(15,12)-(15,13)
(17,10)-(23,69)
(17,17)-(17,18)
(19,15)-(20,53)
(19,16)-(19,49)
(19,17)-(19,41)
(19,18)-(19,35)
(19,19)-(19,28)
(19,20)-(19,22)
(19,25)-(19,27)
(19,31)-(19,34)
(19,38)-(19,40)
(19,45)-(19,48)
(20,17)-(20,52)
(20,18)-(20,44)
(20,19)-(20,36)
(20,20)-(20,29)
(20,21)-(20,23)
(20,26)-(20,28)
(20,32)-(20,35)
(20,41)-(20,43)
(20,48)-(20,51)
(22,15)-(23,68)
(22,22)-(22,23)
(23,29)-(23,67)
(23,30)-(23,46)
(23,31)-(23,45)
(23,31)-(23,40)
(23,32)-(23,34)
(23,37)-(23,39)
(23,43)-(23,45)
(23,48)-(23,66)
(23,49)-(23,65)
(23,49)-(23,58)
(23,50)-(23,52)
(23,55)-(23,57)
(23,63)-(23,65)
(24,4)-(26,51)
(24,15)-(24,23)
(24,16)-(24,18)
(24,20)-(24,22)
(25,4)-(26,51)
(25,15)-(25,33)
(25,15)-(25,27)
(25,28)-(25,30)
(25,31)-(25,33)
(26,4)-(26,51)
(26,18)-(26,44)
(26,18)-(26,32)
(26,33)-(26,34)
(26,35)-(26,39)
(26,40)-(26,44)
(26,48)-(26,51)
(27,2)-(27,34)
(27,2)-(27,12)
(27,13)-(27,34)
(27,14)-(27,17)
(27,18)-(27,33)
(27,19)-(27,26)
(27,27)-(27,29)
(27,30)-(27,32)
*)

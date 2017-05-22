
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then (clone 0 ((List.length l2) - (List.length l1))) @ l1
  else (clone 0 ((List.length l1) - (List.length l2))) @ l2;;

let rec removeZero l =
  let f a x =
    if (List.length a) = 0 then (if x = 0 then [] else [x]) else a @ [x] in
  let base = [] in List.fold_left f base l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = match x with | (l1e,l2e) -> let num = l1e + l2e in (num, [7]) in
    let base = (0, []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add ((if l1 > l2 then l1 else l2) (padZero l1 l2)));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then (clone 0 ((List.length l2) - (List.length l1))) @ l1
  else (clone 0 ((List.length l1) - (List.length l2))) @ l2;;

let rec removeZero l =
  let f a x =
    if (List.length a) = 0 then (if x = 0 then [] else [x]) else a @ [x] in
  let base = [] in List.fold_left f base l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (l1e,l2e) ->
          (match a with
           | (carry,list) ->
               let num = (l1e + l2e) + carry in ((num mod 9), ([7] @ list))) in
    let base = (0, []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add ((padZero l1 l2), l2));;

*)

(* changed spans
(16,44)-(16,77)
(16,54)-(16,57)
(16,67)-(16,77)
(16,68)-(16,71)
(16,73)-(16,76)
(17,4)-(19,51)
(20,18)-(20,64)
(20,19)-(20,47)
(20,23)-(20,25)
(20,23)-(20,30)
(20,28)-(20,30)
(20,36)-(20,38)
(20,44)-(20,46)
*)

(* type error slice
(4,3)-(7,61)
(4,12)-(7,59)
(6,36)-(6,52)
(6,37)-(6,48)
(6,49)-(6,51)
(20,18)-(20,64)
(20,19)-(20,47)
(20,36)-(20,38)
(20,48)-(20,63)
(20,49)-(20,56)
(20,57)-(20,59)
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
(4,12)-(7,59)
(4,15)-(7,59)
(5,2)-(7,59)
(5,5)-(5,40)
(5,5)-(5,21)
(5,6)-(5,17)
(5,18)-(5,20)
(5,24)-(5,40)
(5,25)-(5,36)
(5,37)-(5,39)
(6,7)-(6,59)
(6,55)-(6,56)
(6,7)-(6,54)
(6,8)-(6,13)
(6,14)-(6,15)
(6,16)-(6,53)
(6,17)-(6,33)
(6,18)-(6,29)
(6,30)-(6,32)
(6,36)-(6,52)
(6,37)-(6,48)
(6,49)-(6,51)
(6,57)-(6,59)
(7,7)-(7,59)
(7,55)-(7,56)
(7,7)-(7,54)
(7,8)-(7,13)
(7,14)-(7,15)
(7,16)-(7,53)
(7,17)-(7,33)
(7,18)-(7,29)
(7,30)-(7,32)
(7,36)-(7,52)
(7,37)-(7,48)
(7,49)-(7,51)
(7,57)-(7,59)
(9,19)-(12,42)
(10,2)-(12,42)
(10,8)-(11,72)
(10,10)-(11,72)
(11,4)-(11,72)
(11,7)-(11,26)
(11,7)-(11,22)
(11,8)-(11,19)
(11,20)-(11,21)
(11,25)-(11,26)
(11,32)-(11,59)
(11,36)-(11,41)
(11,36)-(11,37)
(11,40)-(11,41)
(11,47)-(11,49)
(11,55)-(11,58)
(11,56)-(11,57)
(11,65)-(11,72)
(11,67)-(11,68)
(11,65)-(11,66)
(11,69)-(11,72)
(11,70)-(11,71)
(12,2)-(12,42)
(12,13)-(12,15)
(12,19)-(12,42)
(12,19)-(12,33)
(12,34)-(12,35)
(12,36)-(12,40)
(12,41)-(12,42)
(14,11)-(20,65)
(14,14)-(20,65)
(15,2)-(20,65)
(15,11)-(19,51)
(16,4)-(19,51)
(16,10)-(16,77)
(16,12)-(16,77)
(16,16)-(16,77)
(16,22)-(16,23)
(16,44)-(16,77)
(16,54)-(16,63)
(16,54)-(16,57)
(16,60)-(16,63)
(16,67)-(16,77)
(16,68)-(16,71)
(16,73)-(16,76)
(16,74)-(16,75)
(17,4)-(19,51)
(17,15)-(17,22)
(17,16)-(17,17)
(17,19)-(17,21)
(18,4)-(19,51)
(18,15)-(18,33)
(18,15)-(18,27)
(18,28)-(18,30)
(18,31)-(18,33)
(19,4)-(19,51)
(19,18)-(19,44)
(19,18)-(19,32)
(19,33)-(19,34)
(19,35)-(19,39)
(19,40)-(19,44)
(19,48)-(19,51)
(20,2)-(20,65)
(20,2)-(20,12)
(20,13)-(20,65)
(20,14)-(20,17)
(20,18)-(20,64)
(20,19)-(20,47)
(20,23)-(20,30)
(20,23)-(20,25)
(20,28)-(20,30)
(20,36)-(20,38)
(20,44)-(20,46)
(20,48)-(20,63)
(20,49)-(20,56)
(20,57)-(20,59)
(20,60)-(20,62)
*)

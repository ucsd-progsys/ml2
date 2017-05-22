
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let ll1 = List.length l1
  and ll2 = List.length l2 in
  if ll1 > ll2
  then (l1, ((clone 0 (ll1 - ll2)) @ l2))
  else (((clone 0 (ll2 - ll1)) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = "" in
    let base = (0, []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let ll1 = List.length l1
  and ll2 = List.length l2 in
  if ll1 > ll2
  then (l1, ((clone 0 (ll1 - ll2)) @ l2))
  else (((clone 0 (ll2 - ll1)) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (cin,res) = a
      and (d1,d2) = x in
      ((((cin + d1) + d2) mod 10), (((cin + d1) + d2) :: res)) in
    let base = (0, []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(16,16)-(16,18)
(17,4)-(19,51)
*)

(* type error slice
(16,4)-(19,51)
(16,10)-(16,18)
(16,12)-(16,18)
(16,16)-(16,18)
(17,4)-(19,51)
(17,15)-(17,22)
(19,18)-(19,32)
(19,18)-(19,44)
(19,33)-(19,34)
(19,35)-(19,39)
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
(4,12)-(9,41)
(4,15)-(9,41)
(5,2)-(9,41)
(5,12)-(5,26)
(5,12)-(5,23)
(5,24)-(5,26)
(6,12)-(6,26)
(6,12)-(6,23)
(6,24)-(6,26)
(7,2)-(9,41)
(7,5)-(7,14)
(7,5)-(7,8)
(7,11)-(7,14)
(8,7)-(8,41)
(8,8)-(8,10)
(8,12)-(8,40)
(8,35)-(8,36)
(8,13)-(8,34)
(8,14)-(8,19)
(8,20)-(8,21)
(8,22)-(8,33)
(8,23)-(8,26)
(8,29)-(8,32)
(8,37)-(8,39)
(9,7)-(9,41)
(9,8)-(9,36)
(9,31)-(9,32)
(9,9)-(9,30)
(9,10)-(9,15)
(9,16)-(9,17)
(9,18)-(9,29)
(9,19)-(9,22)
(9,25)-(9,28)
(9,33)-(9,35)
(9,38)-(9,40)
(11,19)-(12,69)
(12,2)-(12,69)
(12,8)-(12,9)
(12,23)-(12,25)
(12,36)-(12,69)
(12,39)-(12,44)
(12,39)-(12,40)
(12,43)-(12,44)
(12,50)-(12,62)
(12,50)-(12,60)
(12,61)-(12,62)
(12,68)-(12,69)
(14,11)-(20,34)
(14,14)-(20,34)
(15,2)-(20,34)
(15,11)-(19,51)
(16,4)-(19,51)
(16,10)-(16,18)
(16,12)-(16,18)
(16,16)-(16,18)
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
(20,2)-(20,34)
(20,2)-(20,12)
(20,13)-(20,34)
(20,14)-(20,17)
(20,18)-(20,33)
(20,19)-(20,26)
(20,27)-(20,29)
(20,30)-(20,32)
*)


let clone x n =
  let rec helper x n acc =
    if n <= 0 then acc else helper x (n - 1) (x :: acc) in
  helper x n [];;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
  else ([l1], ((clone 0 ((List.length l1) - (List.length l2))) @ l2));;


(* fix

let clone x n =
  let rec helper x n acc =
    if n <= 0 then acc else helper x (n - 1) (x :: acc) in
  helper x n [];;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
  else (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2));;

*)

(* changed spans
(10,8)-(10,12)
*)

(* type error slice
(8,2)-(10,69)
(9,7)-(9,67)
(9,8)-(9,62)
(9,57)-(9,58)
(9,59)-(9,61)
(10,7)-(10,69)
(10,8)-(10,12)
(10,9)-(10,11)
*)

(* all spans
(2,10)-(5,15)
(2,12)-(5,15)
(3,2)-(5,15)
(3,17)-(4,55)
(3,19)-(4,55)
(3,21)-(4,55)
(4,4)-(4,55)
(4,7)-(4,13)
(4,7)-(4,8)
(4,12)-(4,13)
(4,19)-(4,22)
(4,28)-(4,55)
(4,28)-(4,34)
(4,35)-(4,36)
(4,37)-(4,44)
(4,38)-(4,39)
(4,42)-(4,43)
(4,45)-(4,55)
(4,46)-(4,47)
(4,51)-(4,54)
(5,2)-(5,15)
(5,2)-(5,8)
(5,9)-(5,10)
(5,11)-(5,12)
(5,13)-(5,15)
(7,12)-(10,69)
(7,15)-(10,69)
(8,2)-(10,69)
(8,5)-(8,40)
(8,5)-(8,21)
(8,6)-(8,17)
(8,18)-(8,20)
(8,24)-(8,40)
(8,25)-(8,36)
(8,37)-(8,39)
(9,7)-(9,67)
(9,8)-(9,62)
(9,57)-(9,58)
(9,9)-(9,56)
(9,10)-(9,15)
(9,16)-(9,17)
(9,18)-(9,55)
(9,19)-(9,35)
(9,20)-(9,31)
(9,32)-(9,34)
(9,38)-(9,54)
(9,39)-(9,50)
(9,51)-(9,53)
(9,59)-(9,61)
(9,64)-(9,66)
(10,7)-(10,69)
(10,8)-(10,12)
(10,9)-(10,11)
(10,14)-(10,68)
(10,63)-(10,64)
(10,15)-(10,62)
(10,16)-(10,21)
(10,22)-(10,23)
(10,24)-(10,61)
(10,25)-(10,41)
(10,26)-(10,37)
(10,38)-(10,40)
(10,44)-(10,60)
(10,45)-(10,56)
(10,57)-(10,59)
(10,65)-(10,67)
*)

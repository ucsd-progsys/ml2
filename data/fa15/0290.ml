
let rec cloneHelper x n l =
  if n <= 0 then l else cloneHelper x (n - 1) (x :: l);;

let padZero l1 l2 =
  let diff = (List.length l1) - (List.length l2) in
  if diff < 0
  then cloneHelper 0 (((-1) * diff) - 1) l1
  else if diff > 0 then cloneHelper 0 diff l2 else l1 l2;;


(* fix

let rec cloneHelper x n l =
  if n <= 0 then l else cloneHelper x (n - 1) (x :: l);;

let rec clone x n = if n < 1 then [] else cloneHelper x n [];;

let padZero l1 l2 =
  let diff = (List.length l1) - (List.length l2) in
  if diff < 0
  then ((l1 @ (clone 0 diff)), l2)
  else if diff > 0 then (l1, (l2 @ (clone 0 diff))) else (l1, l2);;

*)

(* changed spans
(5,12)-(9,56)
(8,7)-(8,18)
(8,7)-(8,43)
(8,19)-(8,20)
(8,21)-(8,40)
(8,22)-(8,35)
(8,23)-(8,27)
(8,38)-(8,39)
(8,41)-(8,43)
(9,24)-(9,35)
(9,24)-(9,45)
(9,36)-(9,37)
(9,43)-(9,45)
(9,51)-(9,56)
*)

(* type error slice
(6,13)-(6,29)
(6,14)-(6,25)
(6,26)-(6,28)
(9,51)-(9,53)
(9,51)-(9,56)
*)

(* all spans
(2,20)-(3,54)
(2,22)-(3,54)
(2,24)-(3,54)
(3,2)-(3,54)
(3,5)-(3,11)
(3,5)-(3,6)
(3,10)-(3,11)
(3,17)-(3,18)
(3,24)-(3,54)
(3,24)-(3,35)
(3,36)-(3,37)
(3,38)-(3,45)
(3,39)-(3,40)
(3,43)-(3,44)
(3,46)-(3,54)
(3,47)-(3,48)
(3,52)-(3,53)
(5,12)-(9,56)
(5,15)-(9,56)
(6,2)-(9,56)
(6,13)-(6,48)
(6,13)-(6,29)
(6,14)-(6,25)
(6,26)-(6,28)
(6,32)-(6,48)
(6,33)-(6,44)
(6,45)-(6,47)
(7,2)-(9,56)
(7,5)-(7,13)
(7,5)-(7,9)
(7,12)-(7,13)
(8,7)-(8,43)
(8,7)-(8,18)
(8,19)-(8,20)
(8,21)-(8,40)
(8,22)-(8,35)
(8,23)-(8,27)
(8,30)-(8,34)
(8,38)-(8,39)
(8,41)-(8,43)
(9,7)-(9,56)
(9,10)-(9,18)
(9,10)-(9,14)
(9,17)-(9,18)
(9,24)-(9,45)
(9,24)-(9,35)
(9,36)-(9,37)
(9,38)-(9,42)
(9,43)-(9,45)
(9,51)-(9,56)
(9,51)-(9,53)
(9,54)-(9,56)
*)

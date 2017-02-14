
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
(5,13)-(9,57)
(6,3)-(9,57)
(8,8)-(8,19)
(8,8)-(8,44)
(8,20)-(8,21)
(8,25)-(8,27)
(8,25)-(8,35)
(8,25)-(8,40)
(8,31)-(8,35)
(8,39)-(8,40)
(8,42)-(8,44)
(9,8)-(9,57)
(9,11)-(9,15)
(9,11)-(9,19)
(9,18)-(9,19)
(9,25)-(9,36)
(9,25)-(9,46)
(9,37)-(9,38)
(9,52)-(9,54)
(9,52)-(9,57)
(9,55)-(9,57)
*)

(* type error slice
(6,15)-(6,26)
(6,15)-(6,29)
(6,27)-(6,29)
(9,52)-(9,54)
(9,52)-(9,57)
*)


let padZero l1 l2 =
  if (List.length l1) = (List.length l2)
  then (l1, l2)
  else
    if (List.length l1) < (List.length l2)
    then ((0 :: l1), (0 :: l2))
    else ([l1], [l2]);;


(* fix

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, (0 :: l2))
  else
    if (List.length l1) < (List.length l2) then ((0 :: l1), l2) else (l1, l2);;

*)

(* changed spans
(3,5)-(3,40)
(4,12)-(4,14)
(7,21)-(7,30)
(7,22)-(7,23)
(8,10)-(8,14)
(8,16)-(8,20)
*)

(* type error slice
(6,4)-(8,21)
(7,9)-(7,31)
(7,21)-(7,30)
(7,27)-(7,29)
(8,9)-(8,21)
(8,16)-(8,20)
(8,17)-(8,19)
*)

(* all spans
(2,12)-(8,21)
(2,15)-(8,21)
(3,2)-(8,21)
(3,5)-(3,40)
(3,5)-(3,21)
(3,6)-(3,17)
(3,18)-(3,20)
(3,24)-(3,40)
(3,25)-(3,36)
(3,37)-(3,39)
(4,7)-(4,15)
(4,8)-(4,10)
(4,12)-(4,14)
(6,4)-(8,21)
(6,7)-(6,42)
(6,7)-(6,23)
(6,8)-(6,19)
(6,20)-(6,22)
(6,26)-(6,42)
(6,27)-(6,38)
(6,39)-(6,41)
(7,9)-(7,31)
(7,10)-(7,19)
(7,11)-(7,12)
(7,16)-(7,18)
(7,21)-(7,30)
(7,22)-(7,23)
(7,27)-(7,29)
(8,9)-(8,21)
(8,10)-(8,14)
(8,11)-(8,13)
(8,16)-(8,20)
(8,17)-(8,19)
*)

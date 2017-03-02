
let padZero l1 l2 =
  let difference1 = (List.length l1) - (List.length l2) in
  let difference2 = (List.length l2) - (List.length l1) in
  let retTuple = l1 * l2 in if difference1 > 0 then retTuple;;


(* fix

let padZero l1 l2 =
  let difference1 = (List.length l1) - (List.length l2) in
  let difference2 = (List.length l2) - (List.length l1) in
  let retTuple = (l1, l2) in retTuple;;

*)

(* changed spans
(5,17)-(5,24)
(5,28)-(5,60)
(5,31)-(5,42)
(5,31)-(5,46)
(5,45)-(5,46)
*)

(* type error slice
(4,20)-(4,36)
(4,21)-(4,32)
(4,33)-(4,35)
(4,39)-(4,55)
(4,40)-(4,51)
(4,52)-(4,54)
(5,2)-(5,60)
(5,17)-(5,19)
(5,17)-(5,24)
(5,17)-(5,24)
(5,17)-(5,24)
(5,22)-(5,24)
(5,28)-(5,60)
(5,28)-(5,60)
(5,28)-(5,60)
(5,52)-(5,60)
*)

(* all spans
(2,12)-(5,60)
(2,15)-(5,60)
(3,2)-(5,60)
(3,20)-(3,55)
(3,20)-(3,36)
(3,21)-(3,32)
(3,33)-(3,35)
(3,39)-(3,55)
(3,40)-(3,51)
(3,52)-(3,54)
(4,2)-(5,60)
(4,20)-(4,55)
(4,20)-(4,36)
(4,21)-(4,32)
(4,33)-(4,35)
(4,39)-(4,55)
(4,40)-(4,51)
(4,52)-(4,54)
(5,2)-(5,60)
(5,17)-(5,24)
(5,17)-(5,19)
(5,22)-(5,24)
(5,28)-(5,60)
(5,31)-(5,46)
(5,31)-(5,42)
(5,45)-(5,46)
(5,52)-(5,60)
(5,28)-(5,60)
*)

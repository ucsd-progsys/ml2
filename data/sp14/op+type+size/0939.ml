
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let length1 = List.fold_left (fun acc  -> fun x  -> acc + 1) 0 l1 in
  let length2 = List.fold_left (fun acc  -> fun x  -> acc + 1) 0 l2 in
  if length1 < length2
  then clone (length2 - length1) 0
  else if length2 < length1 then clone (length1 - length2) 0;;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let length1 = List.fold_left (fun acc  -> fun x  -> acc + 1) 0 l1 in
  let length2 = List.fold_left (fun acc  -> fun x  -> acc + 1) 0 l2 in
  if length1 = length2
  then (l1, l2)
  else
    if length1 < length2
    then ((List.append (clone 0 (length2 - length1)) l1), l2)
    else (l1, (List.append (clone 0 (length1 - length2)) l2));;

*)

(* changed spans
(7,5)-(7,22)
(8,7)-(8,12)
(8,7)-(8,34)
(8,13)-(8,32)
(8,14)-(8,21)
(8,24)-(8,31)
(9,7)-(9,60)
(9,10)-(9,27)
(9,33)-(9,38)
(9,33)-(9,60)
(9,39)-(9,58)
(9,59)-(9,60)
*)

(* type error slice
(2,43)-(2,65)
(2,48)-(2,65)
(2,49)-(2,54)
(9,7)-(9,60)
(9,7)-(9,60)
(9,7)-(9,60)
(9,33)-(9,38)
(9,33)-(9,60)
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
(4,12)-(9,60)
(4,15)-(9,60)
(5,2)-(9,60)
(5,16)-(5,67)
(5,16)-(5,30)
(5,31)-(5,62)
(5,44)-(5,61)
(5,54)-(5,61)
(5,54)-(5,57)
(5,60)-(5,61)
(5,63)-(5,64)
(5,65)-(5,67)
(6,2)-(9,60)
(6,16)-(6,67)
(6,16)-(6,30)
(6,31)-(6,62)
(6,44)-(6,61)
(6,54)-(6,61)
(6,54)-(6,57)
(6,60)-(6,61)
(6,63)-(6,64)
(6,65)-(6,67)
(7,2)-(9,60)
(7,5)-(7,22)
(7,5)-(7,12)
(7,15)-(7,22)
(8,7)-(8,34)
(8,7)-(8,12)
(8,13)-(8,32)
(8,14)-(8,21)
(8,24)-(8,31)
(8,33)-(8,34)
(9,7)-(9,60)
(9,10)-(9,27)
(9,10)-(9,17)
(9,20)-(9,27)
(9,33)-(9,60)
(9,33)-(9,38)
(9,39)-(9,58)
(9,40)-(9,47)
(9,50)-(9,57)
(9,59)-(9,60)
(9,7)-(9,60)
*)

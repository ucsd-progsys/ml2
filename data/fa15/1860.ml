
let rec intToReverseList n =
  if n <= 0 then [] else (n mod 10) :: (intToReverseList (n / 10));;

let rec listReverseHelper l =
  let rec go i =
    function
    | [] -> i
    | headElement::tailList -> go (headElement :: i) tailList in
  go [] l;;

let rec digitsOfInt n = listReverseHelper (intToReverseList n);;

let digits n = digitsOfInt (abs n);;

let rec sumList xs =
  match xs with | [] -> 0 | head::tail -> head + (sumList tail);;

let rec additivePersistence n =
  let rec count acc n =
    if n < 10 then acc else count (acc + 1) sumList (digits n) in
  count 0 n;;


(* fix

let rec intToReverseList n =
  if n <= 0 then [] else (n mod 10) :: (intToReverseList (n / 10));;

let rec listReverseHelper l =
  let rec go i =
    function
    | [] -> i
    | headElement::tailList -> go (headElement :: i) tailList in
  go [] l;;

let rec digitsOfInt n = listReverseHelper (intToReverseList n);;

let digits n = digitsOfInt (abs n);;

let rec sumList xs =
  match xs with | [] -> 0 | head::tail -> head + (sumList tail);;

let rec additivePersistence n =
  let rec count acc n =
    if n < 10 then acc else count (acc + 1) (sumList (digits n)) in
  count 0 n;;

*)

(* changed spans
(21,28)-(21,62)
(21,44)-(21,51)
*)

(* type error slice
(20,2)-(22,11)
(20,16)-(21,62)
(20,20)-(21,62)
(21,4)-(21,62)
(21,28)-(21,33)
(21,28)-(21,62)
*)

(* all spans
(2,25)-(3,66)
(3,2)-(3,66)
(3,5)-(3,11)
(3,5)-(3,6)
(3,10)-(3,11)
(3,17)-(3,19)
(3,25)-(3,66)
(3,25)-(3,35)
(3,26)-(3,27)
(3,32)-(3,34)
(3,39)-(3,66)
(3,40)-(3,56)
(3,57)-(3,65)
(3,58)-(3,59)
(3,62)-(3,64)
(5,26)-(10,9)
(6,2)-(10,9)
(6,13)-(9,61)
(7,4)-(9,61)
(7,4)-(9,61)
(7,4)-(9,61)
(8,12)-(8,13)
(9,31)-(9,61)
(9,31)-(9,33)
(9,34)-(9,52)
(9,35)-(9,46)
(9,50)-(9,51)
(9,53)-(9,61)
(10,2)-(10,9)
(10,2)-(10,4)
(10,5)-(10,7)
(10,8)-(10,9)
(12,20)-(12,62)
(12,24)-(12,62)
(12,24)-(12,41)
(12,42)-(12,62)
(12,43)-(12,59)
(12,60)-(12,61)
(14,11)-(14,34)
(14,15)-(14,34)
(14,15)-(14,26)
(14,27)-(14,34)
(14,28)-(14,31)
(14,32)-(14,33)
(16,16)-(17,63)
(17,2)-(17,63)
(17,8)-(17,10)
(17,24)-(17,25)
(17,42)-(17,63)
(17,42)-(17,46)
(17,49)-(17,63)
(17,50)-(17,57)
(17,58)-(17,62)
(19,28)-(22,11)
(20,2)-(22,11)
(20,16)-(21,62)
(20,20)-(21,62)
(21,4)-(21,62)
(21,7)-(21,13)
(21,7)-(21,8)
(21,11)-(21,13)
(21,19)-(21,22)
(21,28)-(21,62)
(21,28)-(21,33)
(21,34)-(21,43)
(21,35)-(21,38)
(21,41)-(21,42)
(21,44)-(21,51)
(21,52)-(21,62)
(21,53)-(21,59)
(21,60)-(21,61)
(22,2)-(22,11)
(22,2)-(22,7)
(22,8)-(22,9)
(22,10)-(22,11)
*)

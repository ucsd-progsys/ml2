
let rec digitsOfInt n =
  if n <= 0
  then []
  else List.rev ((n mod 10) :: (List.rev (digitsOfInt (n / 10))));;

let rec sumList xs =
  match xs with | [] -> 0 | h::t -> h + (sumList t) | _ -> (-1);;

let x = [0];;

let rec additivePersistence n =
  if (sumList (digitsOfInt n)) < 9
  then (1 :: x; additivePersistence (sumList (digitsOfInt n)))
  else 1 :: x;
  sumList x;;


(* fix

let rec digitsOfInt n =
  if n <= 0
  then []
  else List.rev ((n mod 10) :: (List.rev (digitsOfInt (n / 10))));;

let rec sumList xs =
  match xs with | [] -> 0 | h::t -> h + (sumList t) | _ -> (-1);;

let x = [0];;

let rec additivePersistence n =
  if (sumList (digitsOfInt n)) < 9
  then (1 :: x; additivePersistence (sumList (digitsOfInt n)))
  else sumList x;;

*)

(* changed spans
(13,2)-(16,11)
(15,7)-(15,8)
(15,7)-(15,13)
(15,12)-(15,13)
*)

(* type error slice
(8,36)-(8,51)
(8,40)-(8,51)
(8,41)-(8,48)
(12,3)-(16,13)
(12,28)-(16,11)
(13,2)-(15,13)
(13,2)-(16,11)
(14,7)-(14,62)
(14,8)-(14,14)
(14,16)-(14,35)
(14,16)-(14,61)
(15,7)-(15,13)
(16,2)-(16,9)
(16,2)-(16,11)
*)

(* all spans
(2,20)-(5,65)
(3,2)-(5,65)
(3,5)-(3,11)
(3,5)-(3,6)
(3,10)-(3,11)
(4,7)-(4,9)
(5,7)-(5,65)
(5,7)-(5,15)
(5,16)-(5,65)
(5,17)-(5,27)
(5,18)-(5,19)
(5,24)-(5,26)
(5,31)-(5,64)
(5,32)-(5,40)
(5,41)-(5,63)
(5,42)-(5,53)
(5,54)-(5,62)
(5,55)-(5,56)
(5,59)-(5,61)
(7,16)-(8,63)
(8,2)-(8,63)
(8,8)-(8,10)
(8,24)-(8,25)
(8,36)-(8,51)
(8,36)-(8,37)
(8,40)-(8,51)
(8,41)-(8,48)
(8,49)-(8,50)
(8,59)-(8,63)
(10,8)-(10,11)
(10,9)-(10,10)
(12,28)-(16,11)
(13,2)-(16,11)
(13,2)-(15,13)
(13,5)-(13,34)
(13,5)-(13,30)
(13,6)-(13,13)
(13,14)-(13,29)
(13,15)-(13,26)
(13,27)-(13,28)
(13,33)-(13,34)
(14,7)-(14,62)
(14,8)-(14,14)
(14,8)-(14,9)
(14,13)-(14,14)
(14,16)-(14,61)
(14,16)-(14,35)
(14,36)-(14,61)
(14,37)-(14,44)
(14,45)-(14,60)
(14,46)-(14,57)
(14,58)-(14,59)
(15,7)-(15,13)
(15,7)-(15,8)
(15,12)-(15,13)
(16,2)-(16,11)
(16,2)-(16,9)
(16,10)-(16,11)
*)

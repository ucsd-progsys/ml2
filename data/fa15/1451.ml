
let rec removeZero l =
  match l with
  | [] -> []
  | _ -> let h::t = l in (match h with | 0 -> removeZero t | _ -> l);;

let rec mulByDigit i l =
  let mul (i,l) =
    let f a x =
      let (a1,a2) = a in
      let val1 = (x * i) + a1 in
      if val1 > 9
      then ((val1 / 10), ((val1 mod 10) :: a2))
      else (0, (val1 :: a2)) in
    let base = (0, []) in
    let args = List.rev (0 :: l) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (mul i l);;


(* fix

let rec removeZero l =
  match l with
  | [] -> []
  | _ -> let h::t = l in (match h with | 0 -> removeZero t | _ -> l);;

let rec mulByDigit i l =
  let mul (i,l) =
    let f a x =
      let (a1,a2) = a in
      let val1 = (x * i) + a1 in
      if val1 > 9
      then ((val1 / 10), ((val1 mod 10) :: a2))
      else (0, (val1 :: a2)) in
    let base = (0, []) in
    let args = List.rev (0 :: l) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (mul (i, l));;

*)

(* changed spans
(18,13)-(18,22)
(18,18)-(18,19)
*)

(* type error slice
(8,2)-(18,22)
(8,11)-(17,51)
(9,4)-(17,51)
(9,4)-(17,51)
(9,10)-(14,28)
(10,6)-(14,28)
(10,20)-(10,21)
(13,25)-(13,46)
(13,43)-(13,45)
(15,4)-(17,51)
(16,4)-(17,51)
(17,4)-(17,51)
(17,4)-(17,51)
(17,18)-(17,32)
(17,18)-(17,44)
(17,33)-(17,34)
(17,48)-(17,51)
(18,13)-(18,22)
(18,14)-(18,17)
*)

(* all spans
(2,19)-(5,68)
(3,2)-(5,68)
(3,8)-(3,9)
(4,10)-(4,12)
(5,9)-(5,68)
(5,20)-(5,21)
(5,25)-(5,68)
(5,32)-(5,33)
(5,46)-(5,58)
(5,46)-(5,56)
(5,57)-(5,58)
(5,66)-(5,67)
(7,19)-(18,22)
(7,21)-(18,22)
(8,2)-(18,22)
(8,11)-(17,51)
(9,4)-(17,51)
(9,10)-(14,28)
(9,12)-(14,28)
(10,6)-(14,28)
(10,20)-(10,21)
(11,6)-(14,28)
(11,17)-(11,29)
(11,17)-(11,24)
(11,18)-(11,19)
(11,22)-(11,23)
(11,27)-(11,29)
(12,6)-(14,28)
(12,9)-(12,17)
(12,9)-(12,13)
(12,16)-(12,17)
(13,11)-(13,47)
(13,12)-(13,23)
(13,13)-(13,17)
(13,20)-(13,22)
(13,25)-(13,46)
(13,26)-(13,39)
(13,27)-(13,31)
(13,36)-(13,38)
(13,43)-(13,45)
(14,11)-(14,28)
(14,12)-(14,13)
(14,15)-(14,27)
(14,16)-(14,20)
(14,24)-(14,26)
(15,4)-(17,51)
(15,15)-(15,22)
(15,16)-(15,17)
(15,19)-(15,21)
(16,4)-(17,51)
(16,15)-(16,32)
(16,15)-(16,23)
(16,24)-(16,32)
(16,25)-(16,26)
(16,30)-(16,31)
(17,4)-(17,51)
(17,18)-(17,44)
(17,18)-(17,32)
(17,33)-(17,34)
(17,35)-(17,39)
(17,40)-(17,44)
(17,48)-(17,51)
(18,2)-(18,22)
(18,2)-(18,12)
(18,13)-(18,22)
(18,14)-(18,17)
(18,18)-(18,19)
(18,20)-(18,21)
*)
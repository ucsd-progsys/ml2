
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let l = (List.length l1) - (List.length l2) in
  if l < 0
  then (((clone 0 ((-1) * l)) @ l1), l2)
  else (l1, ((clone 0 l) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with | _ -> [a mod 10] | h::t -> ((a + h) mod 10) :: t in
    let base = [] in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let l = (List.length l1) - (List.length l2) in
  if l < 0
  then (((clone 0 ((-1) * l)) @ l1), l2)
  else (l1, ((clone 0 l) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let carry = match a with | (x,y) -> x in
      match x with
      | (add1,add2) ->
          let new_carry = ((carry + add1) + add2) / 10 in
          let digit = ((carry + add1) + add2) mod 10 in
          (match a with | (x,y) -> (new_carry, (digit :: y))) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(16,6)-(16,68)
(16,12)-(16,13)
(16,26)-(16,36)
(16,27)-(16,28)
(16,27)-(16,35)
(16,33)-(16,35)
(16,47)-(16,68)
(16,49)-(16,50)
(16,53)-(16,54)
(16,60)-(16,62)
(16,67)-(16,68)
(17,4)-(19,51)
(17,15)-(17,17)
(18,4)-(19,51)
(18,15)-(18,33)
(19,4)-(19,51)
*)

(* type error slice
(15,4)-(19,51)
(15,10)-(16,68)
(15,12)-(16,68)
(16,6)-(16,68)
(16,26)-(16,36)
(16,27)-(16,28)
(16,27)-(16,35)
(19,18)-(19,32)
(19,18)-(19,44)
(19,33)-(19,34)
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
(4,12)-(8,31)
(4,15)-(8,31)
(5,2)-(8,31)
(5,10)-(5,45)
(5,10)-(5,26)
(5,11)-(5,22)
(5,23)-(5,25)
(5,29)-(5,45)
(5,30)-(5,41)
(5,42)-(5,44)
(6,2)-(8,31)
(6,5)-(6,10)
(6,5)-(6,6)
(6,9)-(6,10)
(7,7)-(7,40)
(7,8)-(7,35)
(7,30)-(7,31)
(7,9)-(7,29)
(7,10)-(7,15)
(7,16)-(7,17)
(7,18)-(7,28)
(7,19)-(7,23)
(7,26)-(7,27)
(7,32)-(7,34)
(7,37)-(7,39)
(8,7)-(8,31)
(8,8)-(8,10)
(8,12)-(8,30)
(8,25)-(8,26)
(8,13)-(8,24)
(8,14)-(8,19)
(8,20)-(8,21)
(8,22)-(8,23)
(8,27)-(8,29)
(10,19)-(11,74)
(11,2)-(11,74)
(11,8)-(11,9)
(11,23)-(11,25)
(11,36)-(11,74)
(11,39)-(11,44)
(11,39)-(11,40)
(11,43)-(11,44)
(11,50)-(11,62)
(11,50)-(11,60)
(11,61)-(11,62)
(11,68)-(11,74)
(11,68)-(11,69)
(11,73)-(11,74)
(13,11)-(20,34)
(13,14)-(20,34)
(14,2)-(20,34)
(14,11)-(19,51)
(15,4)-(19,51)
(15,10)-(16,68)
(15,12)-(16,68)
(16,6)-(16,68)
(16,12)-(16,13)
(16,26)-(16,36)
(16,27)-(16,35)
(16,27)-(16,28)
(16,33)-(16,35)
(16,47)-(16,68)
(16,47)-(16,63)
(16,48)-(16,55)
(16,49)-(16,50)
(16,53)-(16,54)
(16,60)-(16,62)
(16,67)-(16,68)
(17,4)-(19,51)
(17,15)-(17,17)
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

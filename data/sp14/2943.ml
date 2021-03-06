
let rec clone x n =
  match n with | 0 -> [] | a -> if a < 0 then [] else (clone x (n - 1)) @ [x];;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2))
  else ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2);;

let rec removeZero l =
  match l with | [] -> l | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let carry = match a with | (f,[]) -> f | (f',g'::h) -> g' in
      let newc =
        match x with | (f,g) -> if ((f + g) + carry) > 9 then 1 else 0 in
      let digit = match x with | (f,g) -> ((f + g) + carry) mod 10 in
      match a with
      | (o,p::q) -> (0, (newc :: digit :: q))
      | (o,p) -> (0, (newc :: digit :: p)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  if i = 0
  then l
  else
    (let a = [i] in bigAdd ((mulByDigit i) - (1 l)) ((mulByDigit i) - (1 l)));;


(* fix

let rec clone x n =
  match n with | 0 -> [] | a -> if a < 0 then [] else (clone x (n - 1)) @ [x];;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2))
  else ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2);;

let rec removeZero l =
  match l with | [] -> l | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let carry = match a with | (f,[]) -> f | (f',g'::h) -> g' in
      let newc =
        match x with | (f,g) -> if ((f + g) + carry) > 9 then 1 else 0 in
      let digit = match x with | (f,g) -> ((f + g) + carry) mod 10 in
      match a with
      | (o,p::q) -> (0, (newc :: digit :: q))
      | (o,p) -> (0, (newc :: digit :: p)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  if i = 0
  then l
  else (let a = [i] in bigAdd (mulByDigit (i - 1) l) (mulByDigit (i - 1) l));;

*)

(* changed spans
(32,27)-(32,51)
(32,28)-(32,42)
(32,40)-(32,41)
(32,45)-(32,50)
(32,52)-(32,76)
(32,53)-(32,67)
(32,65)-(32,66)
(32,70)-(32,75)
*)

(* type error slice
(5,3)-(8,79)
(5,12)-(8,77)
(8,50)-(8,66)
(8,51)-(8,62)
(8,63)-(8,65)
(13,3)-(26,36)
(13,11)-(26,34)
(26,18)-(26,33)
(26,19)-(26,26)
(26,27)-(26,29)
(28,3)-(32,79)
(28,19)-(32,77)
(28,21)-(32,77)
(32,20)-(32,26)
(32,20)-(32,76)
(32,27)-(32,51)
(32,28)-(32,42)
(32,29)-(32,39)
(32,45)-(32,50)
(32,46)-(32,47)
(32,70)-(32,75)
(32,71)-(32,72)
*)

(* all spans
(2,14)-(3,77)
(2,16)-(3,77)
(3,2)-(3,77)
(3,8)-(3,9)
(3,22)-(3,24)
(3,32)-(3,77)
(3,35)-(3,40)
(3,35)-(3,36)
(3,39)-(3,40)
(3,46)-(3,48)
(3,54)-(3,77)
(3,72)-(3,73)
(3,54)-(3,71)
(3,55)-(3,60)
(3,61)-(3,62)
(3,63)-(3,70)
(3,64)-(3,65)
(3,68)-(3,69)
(3,74)-(3,77)
(3,75)-(3,76)
(5,12)-(8,77)
(5,15)-(8,77)
(6,2)-(8,77)
(6,5)-(6,40)
(6,5)-(6,21)
(6,6)-(6,17)
(6,18)-(6,20)
(6,24)-(6,40)
(6,25)-(6,36)
(6,37)-(6,39)
(7,7)-(7,77)
(7,8)-(7,10)
(7,12)-(7,76)
(7,13)-(7,24)
(7,25)-(7,72)
(7,26)-(7,31)
(7,32)-(7,33)
(7,34)-(7,71)
(7,35)-(7,51)
(7,36)-(7,47)
(7,48)-(7,50)
(7,54)-(7,70)
(7,55)-(7,66)
(7,67)-(7,69)
(7,73)-(7,75)
(8,7)-(8,77)
(8,8)-(8,72)
(8,9)-(8,20)
(8,21)-(8,68)
(8,22)-(8,27)
(8,28)-(8,29)
(8,30)-(8,67)
(8,31)-(8,47)
(8,32)-(8,43)
(8,44)-(8,46)
(8,50)-(8,66)
(8,51)-(8,62)
(8,63)-(8,65)
(8,69)-(8,71)
(8,74)-(8,76)
(10,19)-(11,68)
(11,2)-(11,68)
(11,8)-(11,9)
(11,23)-(11,24)
(11,35)-(11,68)
(11,38)-(11,43)
(11,38)-(11,39)
(11,42)-(11,43)
(11,49)-(11,61)
(11,49)-(11,59)
(11,60)-(11,61)
(11,67)-(11,68)
(13,11)-(26,34)
(13,14)-(26,34)
(14,2)-(26,34)
(14,11)-(25,51)
(15,4)-(25,51)
(15,10)-(22,42)
(15,12)-(22,42)
(16,6)-(22,42)
(16,18)-(16,63)
(16,24)-(16,25)
(16,43)-(16,44)
(16,61)-(16,63)
(17,6)-(22,42)
(18,8)-(18,70)
(18,14)-(18,15)
(18,32)-(18,70)
(18,35)-(18,56)
(18,35)-(18,52)
(18,36)-(18,43)
(18,37)-(18,38)
(18,41)-(18,42)
(18,46)-(18,51)
(18,55)-(18,56)
(18,62)-(18,63)
(18,69)-(18,70)
(19,6)-(22,42)
(19,18)-(19,66)
(19,24)-(19,25)
(19,42)-(19,66)
(19,42)-(19,59)
(19,43)-(19,50)
(19,44)-(19,45)
(19,48)-(19,49)
(19,53)-(19,58)
(19,64)-(19,66)
(20,6)-(22,42)
(20,12)-(20,13)
(21,20)-(21,45)
(21,21)-(21,22)
(21,24)-(21,44)
(21,25)-(21,29)
(21,33)-(21,43)
(21,33)-(21,38)
(21,42)-(21,43)
(22,17)-(22,42)
(22,18)-(22,19)
(22,21)-(22,41)
(22,22)-(22,26)
(22,30)-(22,40)
(22,30)-(22,35)
(22,39)-(22,40)
(23,4)-(25,51)
(23,15)-(23,22)
(23,16)-(23,17)
(23,19)-(23,21)
(24,4)-(25,51)
(24,15)-(24,44)
(24,15)-(24,23)
(24,24)-(24,44)
(24,25)-(24,37)
(24,38)-(24,40)
(24,41)-(24,43)
(25,4)-(25,51)
(25,18)-(25,44)
(25,18)-(25,32)
(25,33)-(25,34)
(25,35)-(25,39)
(25,40)-(25,44)
(25,48)-(25,51)
(26,2)-(26,34)
(26,2)-(26,12)
(26,13)-(26,34)
(26,14)-(26,17)
(26,18)-(26,33)
(26,19)-(26,26)
(26,27)-(26,29)
(26,30)-(26,32)
(28,19)-(32,77)
(28,21)-(32,77)
(29,2)-(32,77)
(29,5)-(29,10)
(29,5)-(29,6)
(29,9)-(29,10)
(30,7)-(30,8)
(32,4)-(32,77)
(32,13)-(32,16)
(32,14)-(32,15)
(32,20)-(32,76)
(32,20)-(32,26)
(32,27)-(32,51)
(32,28)-(32,42)
(32,29)-(32,39)
(32,40)-(32,41)
(32,45)-(32,50)
(32,46)-(32,47)
(32,48)-(32,49)
(32,52)-(32,76)
(32,53)-(32,67)
(32,54)-(32,64)
(32,65)-(32,66)
(32,70)-(32,75)
(32,71)-(32,72)
(32,73)-(32,74)
*)


let rec clone x n =
  match n with | 0 -> [] | n -> if n < 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  match (List.length l1) - (List.length l2) with
  | 0 -> (l1, l2)
  | n ->
      if n < 0
      then (((clone 0 (n * (-1))) @ l1), l2)
      else (((clone 0 n) @ l2), l1);;

let rec removeZero l =
  match l with | [] -> l | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (b,c) -> if (b + c) > 9 then (((b + c) - 10), 1) else ((b + c), 0) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n =
  match n with | 0 -> [] | n -> if n < 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  match (List.length l1) - (List.length l2) with
  | 0 -> (l1, l2)
  | n ->
      if n < 0
      then (((clone 0 (n * (-1))) @ l1), l2)
      else (((clone 0 n) @ l2), l1);;

let rec removeZero l =
  match l with | [] -> l | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (fst,sec) = x in
      let (fst',sec') =
        if (fst + sec) > 9 then (((fst + sec) - 10), 1) else ((fst + sec), 0) in
      let (carry,digits) = a in
      let (carry',digits') =
        if sec' = 1 then (1, (digits @ [fst'])) else (0, (digits @ [fst'])) in
      (carry', digits') in
    let base = (0, []) in
    let args = (List.rev (List.combine l1 l2)) @ [(0, 0)] in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(19,6)-(20,74)
(20,17)-(20,74)
(20,21)-(20,22)
(20,25)-(20,26)
(20,30)-(20,31)
(20,40)-(20,41)
(20,44)-(20,45)
(20,49)-(20,51)
(20,64)-(20,65)
(20,68)-(20,69)
(20,72)-(20,73)
(21,4)-(23,51)
(21,15)-(21,22)
(21,16)-(21,17)
(21,19)-(21,21)
(22,4)-(23,51)
(22,15)-(22,44)
(23,4)-(23,51)
(23,18)-(23,44)
*)

(* type error slice
(18,4)-(23,51)
(18,10)-(20,74)
(18,12)-(20,74)
(19,6)-(20,74)
(20,17)-(20,74)
(20,37)-(20,56)
(20,54)-(20,55)
(21,4)-(23,51)
(21,15)-(21,22)
(21,19)-(21,21)
(23,18)-(23,32)
(23,18)-(23,44)
(23,33)-(23,34)
(23,35)-(23,39)
*)

(* all spans
(2,14)-(3,76)
(2,16)-(3,76)
(3,2)-(3,76)
(3,8)-(3,9)
(3,22)-(3,24)
(3,32)-(3,76)
(3,35)-(3,40)
(3,35)-(3,36)
(3,39)-(3,40)
(3,46)-(3,48)
(3,54)-(3,76)
(3,54)-(3,55)
(3,59)-(3,76)
(3,60)-(3,65)
(3,66)-(3,67)
(3,68)-(3,75)
(3,69)-(3,70)
(3,73)-(3,74)
(5,12)-(11,35)
(5,15)-(11,35)
(6,2)-(11,35)
(6,8)-(6,43)
(6,8)-(6,24)
(6,9)-(6,20)
(6,21)-(6,23)
(6,27)-(6,43)
(6,28)-(6,39)
(6,40)-(6,42)
(7,9)-(7,17)
(7,10)-(7,12)
(7,14)-(7,16)
(9,6)-(11,35)
(9,9)-(9,14)
(9,9)-(9,10)
(9,13)-(9,14)
(10,11)-(10,44)
(10,12)-(10,39)
(10,34)-(10,35)
(10,13)-(10,33)
(10,14)-(10,19)
(10,20)-(10,21)
(10,22)-(10,32)
(10,23)-(10,24)
(10,27)-(10,31)
(10,36)-(10,38)
(10,41)-(10,43)
(11,11)-(11,35)
(11,12)-(11,30)
(11,25)-(11,26)
(11,13)-(11,24)
(11,14)-(11,19)
(11,20)-(11,21)
(11,22)-(11,23)
(11,27)-(11,29)
(11,32)-(11,34)
(13,19)-(14,68)
(14,2)-(14,68)
(14,8)-(14,9)
(14,23)-(14,24)
(14,35)-(14,68)
(14,38)-(14,43)
(14,38)-(14,39)
(14,42)-(14,43)
(14,49)-(14,61)
(14,49)-(14,59)
(14,60)-(14,61)
(14,67)-(14,68)
(16,11)-(24,34)
(16,14)-(24,34)
(17,2)-(24,34)
(17,11)-(23,51)
(18,4)-(23,51)
(18,10)-(20,74)
(18,12)-(20,74)
(19,6)-(20,74)
(19,12)-(19,13)
(20,17)-(20,74)
(20,20)-(20,31)
(20,20)-(20,27)
(20,21)-(20,22)
(20,25)-(20,26)
(20,30)-(20,31)
(20,37)-(20,56)
(20,38)-(20,52)
(20,39)-(20,46)
(20,40)-(20,41)
(20,44)-(20,45)
(20,49)-(20,51)
(20,54)-(20,55)
(20,62)-(20,74)
(20,63)-(20,70)
(20,64)-(20,65)
(20,68)-(20,69)
(20,72)-(20,73)
(21,4)-(23,51)
(21,15)-(21,22)
(21,16)-(21,17)
(21,19)-(21,21)
(22,4)-(23,51)
(22,15)-(22,44)
(22,15)-(22,23)
(22,24)-(22,44)
(22,25)-(22,37)
(22,38)-(22,40)
(22,41)-(22,43)
(23,4)-(23,51)
(23,18)-(23,44)
(23,18)-(23,32)
(23,33)-(23,34)
(23,35)-(23,39)
(23,40)-(23,44)
(23,48)-(23,51)
(24,2)-(24,34)
(24,2)-(24,12)
(24,13)-(24,34)
(24,14)-(24,17)
(24,18)-(24,33)
(24,19)-(24,26)
(24,27)-(24,29)
(24,30)-(24,32)
*)

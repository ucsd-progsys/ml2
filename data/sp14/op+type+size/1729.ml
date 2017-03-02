
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let x1 = List.length l1 in
  let x2 = List.length l2 in
  if x1 < x2
  then (((clone 0 (x2 - x1)) @ l1), l2)
  else (l1, ((clone 0 (x1 - x2)) @ l2));;

let rec removeZero l =
  match l with
  | [] -> []
  | h::[] -> if h <> 0 then l else []
  | h::t -> if h <> 0 then l else removeZero t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (carry,res) = a in
      let tens = (x1 + x2) + (carry / 10) in
      let ones = (x1 + x2) + (carry mod 10) in
      ([tens], (tens :: ones :: res)) in
    let base = ([0], [0]) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let x1 = List.length l1 in
  let x2 = List.length l2 in
  if x1 < x2
  then (((clone 0 (x2 - x1)) @ l1), l2)
  else (l1, ((clone 0 (x1 - x2)) @ l2));;

let rec removeZero l =
  match l with
  | [] -> []
  | h::[] -> if h <> 0 then l else []
  | h::t -> if h <> 0 then l else removeZero t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (carry,res) = a in
      if carry <> []
      then
        let ch::_ = carry in
        let tens = ((x1 + x2) + ch) / 10 in
        let ones = ((x1 + x2) + ch) mod 10 in ([tens], (tens :: ones :: res))
      else
        (let tens = (x1 + x2) / 10 in
         let ones = (x1 + x2) mod 10 in ([tens], (tens :: ones :: res))) in
    let base = ([], []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(22,6)-(24,37)
(22,17)-(22,41)
(22,29)-(22,41)
(22,30)-(22,35)
(23,6)-(24,37)
(23,17)-(23,43)
(23,29)-(23,43)
(23,30)-(23,35)
(25,4)-(27,51)
(25,15)-(25,25)
(25,17)-(25,18)
(25,21)-(25,24)
(25,22)-(25,23)
(26,4)-(27,51)
(26,15)-(26,44)
(27,4)-(27,51)
*)

(* type error slice
(19,4)-(27,51)
(19,10)-(24,37)
(19,12)-(24,37)
(20,6)-(24,37)
(21,6)-(24,37)
(21,6)-(24,37)
(21,24)-(21,25)
(22,6)-(24,37)
(22,29)-(22,41)
(22,30)-(22,35)
(23,6)-(24,37)
(24,6)-(24,37)
(24,7)-(24,13)
(27,18)-(27,32)
(27,18)-(27,44)
(27,33)-(27,34)
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
(4,12)-(9,39)
(4,15)-(9,39)
(5,2)-(9,39)
(5,11)-(5,25)
(5,11)-(5,22)
(5,23)-(5,25)
(6,2)-(9,39)
(6,11)-(6,25)
(6,11)-(6,22)
(6,23)-(6,25)
(7,2)-(9,39)
(7,5)-(7,12)
(7,5)-(7,7)
(7,10)-(7,12)
(8,7)-(8,39)
(8,8)-(8,34)
(8,29)-(8,30)
(8,9)-(8,28)
(8,10)-(8,15)
(8,16)-(8,17)
(8,18)-(8,27)
(8,19)-(8,21)
(8,24)-(8,26)
(8,31)-(8,33)
(8,36)-(8,38)
(9,7)-(9,39)
(9,8)-(9,10)
(9,12)-(9,38)
(9,33)-(9,34)
(9,13)-(9,32)
(9,14)-(9,19)
(9,20)-(9,21)
(9,22)-(9,31)
(9,23)-(9,25)
(9,28)-(9,30)
(9,35)-(9,37)
(11,19)-(15,46)
(12,2)-(15,46)
(12,8)-(12,9)
(13,10)-(13,12)
(14,13)-(14,37)
(14,16)-(14,22)
(14,16)-(14,17)
(14,21)-(14,22)
(14,28)-(14,29)
(14,35)-(14,37)
(15,12)-(15,46)
(15,15)-(15,21)
(15,15)-(15,16)
(15,20)-(15,21)
(15,27)-(15,28)
(15,34)-(15,46)
(15,34)-(15,44)
(15,45)-(15,46)
(17,11)-(28,34)
(17,14)-(28,34)
(18,2)-(28,34)
(18,11)-(27,51)
(19,4)-(27,51)
(19,10)-(24,37)
(19,12)-(24,37)
(20,6)-(24,37)
(20,20)-(20,21)
(21,6)-(24,37)
(21,24)-(21,25)
(22,6)-(24,37)
(22,17)-(22,41)
(22,17)-(22,26)
(22,18)-(22,20)
(22,23)-(22,25)
(22,29)-(22,41)
(22,30)-(22,35)
(22,38)-(22,40)
(23,6)-(24,37)
(23,17)-(23,43)
(23,17)-(23,26)
(23,18)-(23,20)
(23,23)-(23,25)
(23,29)-(23,43)
(23,30)-(23,35)
(23,40)-(23,42)
(24,6)-(24,37)
(24,7)-(24,13)
(24,8)-(24,12)
(24,15)-(24,36)
(24,16)-(24,20)
(24,24)-(24,35)
(24,24)-(24,28)
(24,32)-(24,35)
(25,4)-(27,51)
(25,15)-(25,25)
(25,16)-(25,19)
(25,17)-(25,18)
(25,21)-(25,24)
(25,22)-(25,23)
(26,4)-(27,51)
(26,15)-(26,44)
(26,15)-(26,23)
(26,24)-(26,44)
(26,25)-(26,37)
(26,38)-(26,40)
(26,41)-(26,43)
(27,4)-(27,51)
(27,18)-(27,44)
(27,18)-(27,32)
(27,33)-(27,34)
(27,35)-(27,39)
(27,40)-(27,44)
(27,48)-(27,51)
(28,2)-(28,34)
(28,2)-(28,12)
(28,13)-(28,34)
(28,14)-(28,17)
(28,18)-(28,33)
(28,19)-(28,26)
(28,27)-(28,29)
(28,30)-(28,32)
*)

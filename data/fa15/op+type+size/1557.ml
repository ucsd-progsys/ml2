
let rec clone x n = if n < 1 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
  else
    if (List.length l1) > (List.length l2)
    then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (i,j) = x in
      match a with
      | (c,d) ->
          if ((i + j) + c) > 9
          then (1, ((((i + j) + c) mod 10) :: d))
          else (0, ((((i + j) + c) mod 10) :: d)) in
    let base = (0, []) in
    let args = (List.rev (List.combine l1 l2)) @ [(0, 0)] in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  if i > 0 then bigAdd l (mulByDigit (i - 1) l) else [];;

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let bigMul l1 l2 =
  let f a x =
    let (s,t) = x in
    match a with
    | (r,v) ->
        let sum =
          int_of_string
            (sepConcat "" (mulByDigit (int_of_string (sepConcat "" l1)) s)) in
        if (sum + r) > 9
        then (((sum + r) / 10), (((sum + r) mod 10) :: v))
        else (0, (((sum + r) mod 10) :: v)) in
  let base = (0, []) in
  let args = List.rev (List.combine l2 l2) in
  let (_,res) = List.fold_left f base args in res;;


(* fix

let rec clone x n = if n < 1 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
  else
    if (List.length l1) > (List.length l2)
    then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (i,j) = x in
      match a with
      | (c,d) ->
          if ((i + j) + c) > 9
          then (1, ((((i + j) + c) mod 10) :: d))
          else (0, ((((i + j) + c) mod 10) :: d)) in
    let base = (0, []) in
    let args = (List.rev (List.combine l1 l2)) @ [(0, 0)] in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let intListToInt l = int_of_string (sepConcat "" (List.map string_of_int l));;

let rec mulByDigit i l =
  if i > 0 then bigAdd l (mulByDigit (i - 1) l) else [];;

let bigMul l1 l2 =
  let f a x =
    let (s,t) = x in
    match a with
    | (r,v) ->
        let sum = intListToInt (mulByDigit (intListToInt l1) [s]) in
        if (sum + r) > 9
        then (((sum + r) / 10), (((sum + r) mod 10) :: v))
        else (0, (((sum + r) mod 10) :: v)) in
  let base = (0, []) in
  let args = List.combine l2 l2 in
  let (_,res) = List.fold_left f base args in res;;

*)

(* changed spans
(29,19)-(30,55)
(29,21)-(30,55)
(30,2)-(30,55)
(30,5)-(30,6)
(30,5)-(30,10)
(30,9)-(30,10)
(30,16)-(30,22)
(30,16)-(30,47)
(30,23)-(30,24)
(30,25)-(30,47)
(30,26)-(30,36)
(30,37)-(30,44)
(30,38)-(30,39)
(30,42)-(30,43)
(30,45)-(30,46)
(30,53)-(30,55)
(36,6)-(37,58)
(37,6)-(37,58)
(37,22)-(37,58)
(39,11)-(52,49)
(40,2)-(52,49)
(41,4)-(49,43)
(44,8)-(49,43)
(45,10)-(45,23)
(46,12)-(46,75)
(46,13)-(46,22)
(46,23)-(46,25)
(46,39)-(46,52)
(46,53)-(46,70)
(46,54)-(46,63)
(46,64)-(46,66)
(46,72)-(46,73)
(51,13)-(51,21)
(51,13)-(51,42)
*)

(* type error slice
(2,42)-(2,43)
(2,42)-(2,64)
(2,42)-(2,64)
(2,47)-(2,64)
(2,48)-(2,53)
(2,54)-(2,55)
(4,3)-(10,19)
(4,12)-(10,17)
(4,15)-(10,17)
(6,9)-(6,56)
(6,10)-(6,15)
(6,16)-(6,17)
(9,14)-(9,68)
(9,15)-(9,62)
(9,16)-(9,21)
(9,63)-(9,64)
(9,65)-(9,67)
(15,3)-(27,36)
(15,11)-(27,34)
(15,14)-(27,34)
(27,18)-(27,33)
(27,19)-(27,26)
(27,30)-(27,32)
(30,16)-(30,22)
(30,16)-(30,47)
(30,25)-(30,47)
(30,26)-(30,36)
(32,3)-(37,60)
(32,18)-(37,58)
(32,22)-(37,58)
(33,2)-(37,58)
(33,2)-(37,58)
(33,8)-(33,10)
(36,6)-(37,58)
(36,12)-(36,31)
(36,18)-(36,19)
(36,18)-(36,31)
(36,20)-(36,21)
(37,6)-(37,58)
(37,17)-(37,18)
(37,35)-(37,49)
(37,35)-(37,58)
(37,50)-(37,51)
(37,52)-(37,56)
(46,12)-(46,75)
(46,13)-(46,22)
(46,26)-(46,74)
(46,27)-(46,37)
*)

(* all spans
(2,14)-(2,64)
(2,16)-(2,64)
(2,20)-(2,64)
(2,23)-(2,28)
(2,23)-(2,24)
(2,27)-(2,28)
(2,34)-(2,36)
(2,42)-(2,64)
(2,42)-(2,43)
(2,47)-(2,64)
(2,48)-(2,53)
(2,54)-(2,55)
(2,56)-(2,63)
(2,57)-(2,58)
(2,61)-(2,62)
(4,12)-(10,17)
(4,15)-(10,17)
(5,2)-(10,17)
(5,5)-(5,40)
(5,5)-(5,21)
(5,6)-(5,17)
(5,18)-(5,20)
(5,24)-(5,40)
(5,25)-(5,36)
(5,37)-(5,39)
(6,7)-(6,67)
(6,8)-(6,62)
(6,57)-(6,58)
(6,9)-(6,56)
(6,10)-(6,15)
(6,16)-(6,17)
(6,18)-(6,55)
(6,19)-(6,35)
(6,20)-(6,31)
(6,32)-(6,34)
(6,38)-(6,54)
(6,39)-(6,50)
(6,51)-(6,53)
(6,59)-(6,61)
(6,64)-(6,66)
(8,4)-(10,17)
(8,7)-(8,42)
(8,7)-(8,23)
(8,8)-(8,19)
(8,20)-(8,22)
(8,26)-(8,42)
(8,27)-(8,38)
(8,39)-(8,41)
(9,9)-(9,69)
(9,10)-(9,12)
(9,14)-(9,68)
(9,63)-(9,64)
(9,15)-(9,62)
(9,16)-(9,21)
(9,22)-(9,23)
(9,24)-(9,61)
(9,25)-(9,41)
(9,26)-(9,37)
(9,38)-(9,40)
(9,44)-(9,60)
(9,45)-(9,56)
(9,57)-(9,59)
(9,65)-(9,67)
(10,9)-(10,17)
(10,10)-(10,12)
(10,14)-(10,16)
(12,19)-(13,69)
(13,2)-(13,69)
(13,8)-(13,9)
(13,23)-(13,25)
(13,36)-(13,69)
(13,39)-(13,44)
(13,39)-(13,40)
(13,43)-(13,44)
(13,50)-(13,62)
(13,50)-(13,60)
(13,61)-(13,62)
(13,68)-(13,69)
(15,11)-(27,34)
(15,14)-(27,34)
(16,2)-(27,34)
(16,11)-(26,51)
(17,4)-(26,51)
(17,10)-(23,49)
(17,12)-(23,49)
(18,6)-(23,49)
(18,18)-(18,19)
(19,6)-(23,49)
(19,12)-(19,13)
(21,10)-(23,49)
(21,13)-(21,30)
(21,13)-(21,26)
(21,14)-(21,21)
(21,15)-(21,16)
(21,19)-(21,20)
(21,24)-(21,25)
(21,29)-(21,30)
(22,15)-(22,49)
(22,16)-(22,17)
(22,19)-(22,48)
(22,20)-(22,42)
(22,21)-(22,34)
(22,22)-(22,29)
(22,23)-(22,24)
(22,27)-(22,28)
(22,32)-(22,33)
(22,39)-(22,41)
(22,46)-(22,47)
(23,15)-(23,49)
(23,16)-(23,17)
(23,19)-(23,48)
(23,20)-(23,42)
(23,21)-(23,34)
(23,22)-(23,29)
(23,23)-(23,24)
(23,27)-(23,28)
(23,32)-(23,33)
(23,39)-(23,41)
(23,46)-(23,47)
(24,4)-(26,51)
(24,15)-(24,22)
(24,16)-(24,17)
(24,19)-(24,21)
(25,4)-(26,51)
(25,15)-(25,57)
(25,47)-(25,48)
(25,15)-(25,46)
(25,16)-(25,24)
(25,25)-(25,45)
(25,26)-(25,38)
(25,39)-(25,41)
(25,42)-(25,44)
(25,49)-(25,57)
(25,50)-(25,56)
(25,51)-(25,52)
(25,54)-(25,55)
(26,4)-(26,51)
(26,18)-(26,44)
(26,18)-(26,32)
(26,33)-(26,34)
(26,35)-(26,39)
(26,40)-(26,44)
(26,48)-(26,51)
(27,2)-(27,34)
(27,2)-(27,12)
(27,13)-(27,34)
(27,14)-(27,17)
(27,18)-(27,33)
(27,19)-(27,26)
(27,27)-(27,29)
(27,30)-(27,32)
(29,19)-(30,55)
(29,21)-(30,55)
(30,2)-(30,55)
(30,5)-(30,10)
(30,5)-(30,6)
(30,9)-(30,10)
(30,16)-(30,47)
(30,16)-(30,22)
(30,23)-(30,24)
(30,25)-(30,47)
(30,26)-(30,36)
(30,37)-(30,44)
(30,38)-(30,39)
(30,42)-(30,43)
(30,45)-(30,46)
(30,53)-(30,55)
(32,18)-(37,58)
(32,22)-(37,58)
(33,2)-(37,58)
(33,8)-(33,10)
(34,10)-(34,12)
(36,6)-(37,58)
(36,12)-(36,31)
(36,14)-(36,31)
(36,18)-(36,31)
(36,20)-(36,21)
(36,18)-(36,19)
(36,22)-(36,31)
(36,27)-(36,28)
(36,23)-(36,26)
(36,29)-(36,30)
(37,6)-(37,58)
(37,17)-(37,18)
(37,22)-(37,58)
(37,30)-(37,31)
(37,35)-(37,58)
(37,35)-(37,49)
(37,50)-(37,51)
(37,52)-(37,56)
(37,57)-(37,58)
(39,11)-(52,49)
(39,14)-(52,49)
(40,2)-(52,49)
(40,8)-(49,43)
(40,10)-(49,43)
(41,4)-(49,43)
(41,16)-(41,17)
(42,4)-(49,43)
(42,10)-(42,11)
(44,8)-(49,43)
(45,10)-(46,75)
(45,10)-(45,23)
(46,12)-(46,75)
(46,13)-(46,22)
(46,23)-(46,25)
(46,26)-(46,74)
(46,27)-(46,37)
(46,38)-(46,71)
(46,39)-(46,52)
(46,53)-(46,70)
(46,54)-(46,63)
(46,64)-(46,66)
(46,67)-(46,69)
(46,72)-(46,73)
(47,8)-(49,43)
(47,11)-(47,24)
(47,11)-(47,20)
(47,12)-(47,15)
(47,18)-(47,19)
(47,23)-(47,24)
(48,13)-(48,58)
(48,14)-(48,30)
(48,15)-(48,24)
(48,16)-(48,19)
(48,22)-(48,23)
(48,27)-(48,29)
(48,32)-(48,57)
(48,33)-(48,51)
(48,34)-(48,43)
(48,35)-(48,38)
(48,41)-(48,42)
(48,48)-(48,50)
(48,55)-(48,56)
(49,13)-(49,43)
(49,14)-(49,15)
(49,17)-(49,42)
(49,18)-(49,36)
(49,19)-(49,28)
(49,20)-(49,23)
(49,26)-(49,27)
(49,33)-(49,35)
(49,40)-(49,41)
(50,2)-(52,49)
(50,13)-(50,20)
(50,14)-(50,15)
(50,17)-(50,19)
(51,2)-(52,49)
(51,13)-(51,42)
(51,13)-(51,21)
(51,22)-(51,42)
(51,23)-(51,35)
(51,36)-(51,38)
(51,39)-(51,41)
(52,2)-(52,49)
(52,16)-(52,42)
(52,16)-(52,30)
(52,31)-(52,32)
(52,33)-(52,37)
(52,38)-(52,42)
(52,46)-(52,49)
*)

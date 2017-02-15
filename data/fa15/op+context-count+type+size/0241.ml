
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let sizDif = (List.length l1) - (List.length l2) in
  if sizDif > 0
  then let pad = clone 0 sizDif in (l1, (pad @ l2))
  else (let pad = clone 0 (- sizDif) in ((pad @ l1), l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h == 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (a1,a2) = a in
      if ((x1 + x2) + a1) >= 10
      then (1, ((((x1 + x2) + a1) - 10) :: a2))
      else (0, (((x1 + x2) + a1) :: a2)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (carry,res) = List.fold_left f base args in carry :: res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  let f a x = bigAdd [a] x in
  let base = 0 in let args = List.rev l in List.fold_left f base args;;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let sizDif = (List.length l1) - (List.length l2) in
  if sizDif > 0
  then let pad = clone 0 sizDif in (l1, (pad @ l2))
  else (let pad = clone 0 (- sizDif) in ((pad @ l1), l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h == 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (a1,a2) = a in
      if ((x1 + x2) + a1) >= 10
      then (1, ((((x1 + x2) + a1) - 10) :: a2))
      else (0, (((x1 + x2) + a1) :: a2)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (carry,res) = List.fold_left f base args in carry :: res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l = if i > 0 then mulByDigit (i - 1) (bigAdd l l) else l;;

*)

(* changed spans
(27,2)-(28,69)
(27,8)-(27,26)
(27,10)-(27,26)
(27,14)-(27,20)
(27,14)-(27,26)
(27,21)-(27,24)
(27,22)-(27,23)
(27,25)-(27,26)
(28,2)-(28,69)
(28,13)-(28,14)
(28,18)-(28,69)
(28,29)-(28,37)
(28,29)-(28,39)
(28,43)-(28,57)
(28,43)-(28,69)
*)

(* type error slice
(2,43)-(2,44)
(2,43)-(2,65)
(2,43)-(2,65)
(2,48)-(2,65)
(2,49)-(2,54)
(2,55)-(2,56)
(4,3)-(8,59)
(4,12)-(8,57)
(7,17)-(7,22)
(7,17)-(7,31)
(7,23)-(7,24)
(8,7)-(8,57)
(8,18)-(8,23)
(8,18)-(8,36)
(8,41)-(8,51)
(8,42)-(8,45)
(8,46)-(8,47)
(8,48)-(8,50)
(11,36)-(11,75)
(11,36)-(11,75)
(11,51)-(11,61)
(11,51)-(11,63)
(11,69)-(11,75)
(13,3)-(24,36)
(13,11)-(24,34)
(13,14)-(24,34)
(14,2)-(24,34)
(24,2)-(24,12)
(24,2)-(24,34)
(24,18)-(24,33)
(24,19)-(24,26)
(24,27)-(24,29)
(27,2)-(28,69)
(27,8)-(27,26)
(27,10)-(27,26)
(27,14)-(27,20)
(27,14)-(27,26)
(27,21)-(27,24)
(27,21)-(27,24)
(27,22)-(27,23)
(28,43)-(28,57)
(28,43)-(28,69)
(28,58)-(28,59)
*)

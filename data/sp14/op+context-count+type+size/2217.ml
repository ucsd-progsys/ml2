
let x x = x;;

let clone x n =
  let rec helper x n acc =
    if n <= 0 then acc else helper x (n - 1) (x :: acc) in
  helper x n [];;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2)
  else (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2));;

let rec removeZero l =
  match l with | [] -> [] | x::xs -> if x = 0 then removeZero xs else x :: xs;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = a + x in
    let base = 0 in
    let args = [l1] in let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let l1 = [0; 0; 9; 9];;

let l2 = [1; 0; 0; 2];;

let x = (3, 3) :: (List.rev (List.combine l1 l2));;

let clone x n =
  let rec helper x n acc =
    if n <= 0 then acc else helper x (n - 1) (x :: acc) in
  helper x n [];;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2)
  else (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2));;

let rec removeZero l =
  match l with | [] -> [] | x::xs -> if x = 0 then removeZero xs else x :: xs;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = x in
    let base = (0, []) in
    let args = [(0, [])] in let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(2,6)-(2,11)
(2,10)-(2,11)
(4,10)-(7,15)
(5,2)-(7,15)
(18,2)-(22,34)
(19,4)-(21,70)
(19,16)-(19,17)
(19,16)-(19,21)
(20,4)-(21,70)
(20,15)-(20,16)
(21,4)-(21,70)
(21,15)-(21,19)
(21,16)-(21,18)
(21,23)-(21,70)
(21,37)-(21,51)
(21,37)-(21,63)
(21,52)-(21,53)
(21,54)-(21,58)
(21,59)-(21,63)
(21,67)-(21,70)
(22,2)-(22,12)
(22,2)-(22,34)
(22,13)-(22,34)
(22,14)-(22,17)
(22,18)-(22,33)
(22,19)-(22,26)
(22,27)-(22,29)
(22,30)-(22,32)
*)

(* type error slice
(19,4)-(21,70)
(19,10)-(19,21)
(19,16)-(19,17)
(19,16)-(19,21)
(21,23)-(21,70)
(21,37)-(21,51)
(21,37)-(21,63)
(21,52)-(21,53)
*)

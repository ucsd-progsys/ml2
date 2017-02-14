
let rec clone x n =
  match n with | n when n <= 0 -> [] | _ -> x :: (clone x (n - 1));;

let padZero l1 l2 =
  let x = List.length l1 in
  let y = List.length l2 in
  if x > y
  then let z = x - y in (l1, ((clone 0 z) @ l2))
  else (let z = y - x in (((clone 0 z) @ l1), l2));;

let rec removeZero l =
  match l with
  | [] -> []
  | h::t -> (match h with | 0 -> removeZero t | _ -> h :: t);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (y,z) = a in
      let (r,s) = x in let m = (r + s) + y in ((m / 10), ((m mod 10) :: z)) in
    let base = (0, []) in
    let args = (List.combine (List.rev l1)) :: (0 (List.rev l2)) :: 0 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n =
  match n with | n when n <= 0 -> [] | _ -> x :: (clone x (n - 1));;

let padZero l1 l2 =
  let x = List.length l1 in
  let y = List.length l2 in
  if x > y
  then let z = x - y in (l1, ((clone 0 z) @ l2))
  else (let z = y - x in (((clone 0 z) @ l1), l2));;

let rec removeZero l =
  match l with
  | [] -> []
  | h::t -> (match h with | 0 -> removeZero t | _ -> h :: t);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (y,z) = a in
      let (r,s) = x in let m = (r + s) + y in ((m / 10), ((m mod 10) :: z)) in
    let base = (0, []) in
    let args = List.combine (List.rev (0 :: l1)) (List.rev (0 :: l2)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(23,17)-(23,42)
(23,17)-(23,70)
(23,40)-(23,42)
(23,49)-(23,63)
(23,52)-(23,63)
(23,61)-(23,63)
(24,5)-(24,52)
*)

(* type error slice
(19,5)-(24,52)
(19,11)-(21,74)
(19,13)-(21,74)
(21,7)-(21,74)
(21,19)-(21,20)
(23,5)-(24,52)
(23,17)-(23,29)
(23,17)-(23,42)
(23,17)-(23,70)
(23,17)-(23,70)
(23,49)-(23,50)
(23,49)-(23,63)
(23,49)-(23,70)
(23,69)-(23,70)
(24,19)-(24,33)
(24,19)-(24,45)
(24,34)-(24,35)
(24,41)-(24,45)
*)

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then (clone 0 ((List.length l2) - (List.length l1))) @ l1
  else (clone 0 ((List.length l1) - (List.length l2))) @ l2;;

let rec removeZero l =
  let f a x =
    if (List.length a) = 0 then (if x = 0 then [] else [x]) else a @ [x] in
  let base = [] in List.fold_left f base l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (l1e,l2e) ->
          (match a with
           | (carry,list) ->
               let num = (l1e + l2e) + carry in
               if num < 10
               then (0, ([num] @ list))
               else
                 if num = 10
                 then (1, ([0] @ list))
                 else ((num / 10), ([num mod 10] @ list))) in
    let base = (0, []) in
    let args = List.combine (List.rev ([0] @ l1)) (List.rev ([0] @ l2)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero
    (add
       ((padZero l1 l2),
         (if (List.length l1) > (List.length l2) then l1 else l2)));;

let rec mulByDigit i l =
  if i < 1 then [] else (bigAdd l) + (mulByDigit (i - (1 l)));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then (clone 0 ((List.length l2) - (List.length l1))) @ l1
  else (clone 0 ((List.length l1) - (List.length l2))) @ l2;;

let rec removeZero l =
  let f a x =
    if (List.length a) = 0 then (if x = 0 then [] else [x]) else a @ [x] in
  let base = [] in List.fold_left f base l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (l1e,l2e) ->
          (match a with
           | (carry,list) ->
               let num = (l1e + l2e) + carry in
               if num < 10
               then (0, ([num] @ list))
               else
                 if num = 10
                 then (1, ([0] @ list))
                 else ((num / 10), ([num mod 10] @ list))) in
    let base = (0, []) in
    let args = List.combine (List.rev ([0] @ l1)) (List.rev ([0] @ l2)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero
    (add
       ((padZero l1 l2),
         (if (List.length l1) > (List.length l2) then l1 else l2)));;

let rec mulByDigit i l =
  if i <= 1 then l else bigAdd l (mulByDigit (i - 1) l);;

*)

(* changed spans
(37,6)-(37,11)
(37,17)-(37,19)
(37,26)-(37,32)
(37,26)-(37,34)
(37,26)-(37,59)
(37,39)-(37,59)
(37,56)-(37,59)
*)

(* type error slice
(14,4)-(34,70)
(14,12)-(34,65)
(14,15)-(34,65)
(36,4)-(37,64)
(36,20)-(37,59)
(36,22)-(37,59)
(37,3)-(37,59)
(37,3)-(37,59)
(37,17)-(37,19)
(37,26)-(37,32)
(37,26)-(37,34)
(37,26)-(37,59)
(37,26)-(37,59)
(37,26)-(37,59)
(37,39)-(37,49)
(37,39)-(37,59)
(37,56)-(37,57)
(37,56)-(37,59)
*)
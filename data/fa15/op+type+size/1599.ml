
let rec rmzhelp l =
  match l with | [] -> [] | x::xs' -> if x = 0 then rmzhelp xs' else x :: xs';;

let rec foldr f b x n = if n > 0 then f x (foldr f b x (n - 1)) else b;;

let rec clone x n = foldr (fun y  -> fun m  -> y :: m) [] x n;;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (clone 0 ((List.length l1) - (List.length l2))) @ l2
  else (clone 0 ((List.length l2) - (List.length l1))) @ l1;;

let rec removeZero l = rmzhelp l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = a + x in
    let base = [] in
    let args = failwith "to be implemented" in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec rmzhelp l =
  match l with | [] -> [] | x::xs' -> if x = 0 then rmzhelp xs' else x :: xs';;

let rec foldr f b x n = if n > 0 then f x (foldr f b x (n - 1)) else b;;

let rec clone x n = foldr (fun y  -> fun m  -> y :: m) [] x n;;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
  else (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | x::xs' -> if x = 0 then rmzhelp xs' else x :: xs';;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (c,d) ->
          (match a with
           | (n,listSum) ->
               (match listSum with
                | [] ->
                    if ((n + c) + d) < 10
                    then (0, ([n] @ [(n + c) + d]))
                    else ((n + 1), ([n + 1] @ [((n + c) + d) mod 10]))
                | h::t ->
                    if ((n + c) + d) < 10
                    then (0, ([0] @ ([(c + d) + h] @ t)))
                    else
                      ((n + 1),
                        ([((h + c) + d) / 10] @ ([((h + c) + d) mod 10] @ t))))) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(11,7)-(11,59)
(12,7)-(12,59)
(14,19)-(14,32)
(14,23)-(14,32)
(14,31)-(14,32)
(16,11)-(22,34)
(17,2)-(22,34)
(18,4)-(21,51)
(18,16)-(18,17)
(18,16)-(18,21)
(19,4)-(21,51)
(19,15)-(19,17)
(20,4)-(21,51)
(20,15)-(20,23)
(20,24)-(20,43)
(21,4)-(21,51)
(21,18)-(21,44)
*)

(* type error slice
(9,3)-(12,61)
(9,12)-(12,59)
(9,15)-(12,59)
(10,2)-(12,59)
(11,7)-(11,59)
(11,55)-(11,56)
(17,2)-(22,34)
(17,11)-(21,51)
(18,4)-(21,51)
(18,10)-(18,21)
(18,16)-(18,17)
(18,16)-(18,21)
(19,4)-(21,51)
(19,15)-(19,17)
(21,18)-(21,32)
(21,18)-(21,44)
(21,33)-(21,34)
(21,35)-(21,39)
(22,13)-(22,34)
(22,14)-(22,17)
(22,18)-(22,33)
(22,19)-(22,26)
*)

(* all spans
(2,16)-(3,77)
(3,2)-(3,77)
(3,8)-(3,9)
(3,23)-(3,25)
(3,38)-(3,77)
(3,41)-(3,46)
(3,41)-(3,42)
(3,45)-(3,46)
(3,52)-(3,63)
(3,52)-(3,59)
(3,60)-(3,63)
(3,69)-(3,77)
(3,69)-(3,70)
(3,74)-(3,77)
(5,14)-(5,70)
(5,16)-(5,70)
(5,18)-(5,70)
(5,20)-(5,70)
(5,24)-(5,70)
(5,27)-(5,32)
(5,27)-(5,28)
(5,31)-(5,32)
(5,38)-(5,63)
(5,38)-(5,39)
(5,40)-(5,41)
(5,42)-(5,63)
(5,43)-(5,48)
(5,49)-(5,50)
(5,51)-(5,52)
(5,53)-(5,54)
(5,55)-(5,62)
(5,56)-(5,57)
(5,60)-(5,61)
(5,69)-(5,70)
(7,14)-(7,61)
(7,16)-(7,61)
(7,20)-(7,61)
(7,20)-(7,25)
(7,26)-(7,54)
(7,37)-(7,53)
(7,47)-(7,53)
(7,47)-(7,48)
(7,52)-(7,53)
(7,55)-(7,57)
(7,58)-(7,59)
(7,60)-(7,61)
(9,12)-(12,59)
(9,15)-(12,59)
(10,2)-(12,59)
(10,5)-(10,40)
(10,5)-(10,21)
(10,6)-(10,17)
(10,18)-(10,20)
(10,24)-(10,40)
(10,25)-(10,36)
(10,37)-(10,39)
(11,7)-(11,59)
(11,55)-(11,56)
(11,7)-(11,54)
(11,8)-(11,13)
(11,14)-(11,15)
(11,16)-(11,53)
(11,17)-(11,33)
(11,18)-(11,29)
(11,30)-(11,32)
(11,36)-(11,52)
(11,37)-(11,48)
(11,49)-(11,51)
(11,57)-(11,59)
(12,7)-(12,59)
(12,55)-(12,56)
(12,7)-(12,54)
(12,8)-(12,13)
(12,14)-(12,15)
(12,16)-(12,53)
(12,17)-(12,33)
(12,18)-(12,29)
(12,30)-(12,32)
(12,36)-(12,52)
(12,37)-(12,48)
(12,49)-(12,51)
(12,57)-(12,59)
(14,19)-(14,32)
(14,23)-(14,32)
(14,23)-(14,30)
(14,31)-(14,32)
(16,11)-(22,34)
(16,14)-(22,34)
(17,2)-(22,34)
(17,11)-(21,51)
(18,4)-(21,51)
(18,10)-(18,21)
(18,12)-(18,21)
(18,16)-(18,21)
(18,16)-(18,17)
(18,20)-(18,21)
(19,4)-(21,51)
(19,15)-(19,17)
(20,4)-(21,51)
(20,15)-(20,43)
(20,15)-(20,23)
(20,24)-(20,43)
(21,4)-(21,51)
(21,18)-(21,44)
(21,18)-(21,32)
(21,33)-(21,34)
(21,35)-(21,39)
(21,40)-(21,44)
(21,48)-(21,51)
(22,2)-(22,34)
(22,2)-(22,12)
(22,13)-(22,34)
(22,14)-(22,17)
(22,18)-(22,33)
(22,19)-(22,26)
(22,27)-(22,29)
(22,30)-(22,32)
*)

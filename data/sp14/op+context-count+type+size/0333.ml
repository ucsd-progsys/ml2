
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
    let f a x = a + x in
    let base = 0 in
    let args = [] in let (_,res) = List.fold_left f base args in res in
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
(15,16)-(15,17)
(15,16)-(15,21)
(16,4)-(17,68)
(16,15)-(16,16)
(17,4)-(17,68)
(17,15)-(17,17)
(17,21)-(17,68)
(17,35)-(17,49)
(17,35)-(17,61)
(17,50)-(17,51)
(17,52)-(17,56)
(17,57)-(17,61)
(17,65)-(17,68)
(18,2)-(18,12)
(18,2)-(18,34)
(18,13)-(18,34)
(18,14)-(18,17)
(18,18)-(18,33)
(18,19)-(18,26)
(18,27)-(18,29)
(18,30)-(18,32)
*)

(* type error slice
(15,4)-(17,68)
(15,10)-(15,21)
(15,16)-(15,17)
(15,16)-(15,21)
(17,21)-(17,68)
(17,35)-(17,49)
(17,35)-(17,61)
(17,50)-(17,51)
*)

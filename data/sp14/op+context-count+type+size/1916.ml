
let rec clone x n =
  if n < 0
  then []
  else (match n with | 0 -> [] | _ -> (clone x (n - 1)) @ [x]);;

let padZero l1 l2 =
  let num1 = (List.length l2) - (List.length l1) in
  let num2 = (List.length l1) - (List.length l2) in
  (((clone 0 num1) @ l1), ((clone 0 num2) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let rec intlist x =
        if x < 10 then [x] else [intlist (x / 10); x mod 10] in
      match x with
      | (z,y) ->
          (match a with
           | h -> let sum = (h + z) + y in intlist sum
           | h::t -> let sum = (h + z) + y in (intlist sum) :: t) in
    let base = [] in
    let args = List.combine l1 l2 in
    let res = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n =
  if n < 0
  then []
  else (match n with | 0 -> [] | _ -> (clone x (n - 1)) @ [x]);;

let padZero l1 l2 =
  let num1 = (List.length l2) - (List.length l1) in
  let num2 = (List.length l1) - (List.length l2) in
  (((clone 0 num1) @ l1), ((clone 0 num2) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let rec intlist x =
        if x < 10 then [x] else (intlist (x / 10)) @ [x mod 10] in
      match x with
      | (z,y) ->
          (match a with
           | [] -> let sum = z + y in intlist sum
           | h::t -> let sum = (h + z) + y in (intlist sum) @ t) in
    let base = [] in
    let args = List.combine l1 l2 in
    let res = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(19,33)-(19,61)
(19,34)-(19,49)
(19,52)-(19,60)
(22,12)-(24,65)
(23,19)-(23,55)
(23,30)-(23,31)
(23,30)-(23,40)
(24,48)-(24,59)
(24,48)-(24,65)
*)

(* type error slice
(17,5)-(27,48)
(17,11)-(24,65)
(18,7)-(24,65)
(18,23)-(19,61)
(19,9)-(19,61)
(19,24)-(19,27)
(19,33)-(19,61)
(19,33)-(19,61)
(19,34)-(19,41)
(19,34)-(19,49)
(19,52)-(19,60)
(22,12)-(24,65)
(22,12)-(24,65)
(22,12)-(24,65)
(22,12)-(24,65)
(22,12)-(24,65)
(22,18)-(22,19)
(23,19)-(23,55)
(23,30)-(23,31)
(23,30)-(23,35)
(23,44)-(23,51)
(23,44)-(23,55)
(24,22)-(24,65)
(24,48)-(24,55)
(24,48)-(24,59)
(24,48)-(24,65)
(24,48)-(24,65)
(25,5)-(27,48)
(25,16)-(25,18)
(27,15)-(27,29)
(27,15)-(27,41)
(27,30)-(27,31)
(27,32)-(27,36)
*)
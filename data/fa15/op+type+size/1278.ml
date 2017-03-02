
let rec clone x n = if n > 0 then [x] @ (clone x (n - 1)) else [];;

let carry x y = (x * y) / 10;;

let padZero l1 l2 =
  let len1 = List.length l1 in
  let len2 = List.length l2 in
  if len1 > len2
  then (l1, ((clone 0 (len1 - len2)) @ l2))
  else (((clone 0 (len2 - len1)) @ l1), l2);;

let remain x = x mod 10;;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (x1,x2) ->
          (match a with
           | (car,cur) ->
               (match cur with
                | [] ->
                    if ((car + x1) + x2) > 10
                    then
                      ((car + 1), ([car + 1] @ [remain ((car + x1) + x2)]))
                    else (0, ([car] @ [(car + x1) + x2]))
                | h::t ->
                    if ((x1 + x2) + h) < 10
                    then (0, ([0] @ ([(x1 + x2) + h] @ t)))
                    else
                      ((car + 1),
                        ([carry ((h + x1) + x2)] @
                           ([((h + x1) + x2) mod 10] @ t))))) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n > 0 then [x] @ (clone x (n - 1)) else [];;

let padZero l1 l2 =
  let len1 = List.length l1 in
  let len2 = List.length l2 in
  if len1 > len2
  then (l1, ((clone 0 (len1 - len2)) @ l2))
  else (((clone 0 (len2 - len1)) @ l1), l2);;

let remain x = x mod 10;;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (x1,x2) ->
          (match a with
           | (car,cur) ->
               (match cur with
                | [] ->
                    if ((car + x1) + x2) > 10
                    then
                      ((car + 1), ([car + 1] @ [remain ((car + x1) + x2)]))
                    else (0, ([car] @ [(car + x1) + x2]))
                | h::t ->
                    if ((x1 + x2) + h) < 10
                    then (0, ([0] @ ([(x1 + x2) + h] @ t)))
                    else
                      ((car + 1),
                        ([((h + x1) + x2) / 10] @
                           ([((h + x1) + x2) mod 10] @ t))))) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(4,10)-(4,28)
(4,12)-(4,28)
(4,16)-(4,23)
(4,16)-(4,28)
(4,17)-(4,18)
(4,21)-(4,22)
(4,26)-(4,28)
(7,2)-(11,43)
(8,2)-(11,43)
(19,2)-(41,34)
(20,4)-(40,51)
(36,26)-(36,31)
(36,26)-(36,47)
(37,27)-(37,57)
(38,4)-(40,51)
(39,4)-(40,51)
(40,4)-(40,51)
*)

(* type error slice
(4,3)-(4,30)
(4,10)-(4,28)
(4,12)-(4,28)
(36,24)-(37,58)
(36,25)-(36,48)
(36,25)-(36,48)
(36,26)-(36,31)
(36,26)-(36,47)
(36,49)-(36,50)
(37,27)-(37,57)
(37,28)-(37,52)
(37,28)-(37,52)
(37,29)-(37,51)
(37,53)-(37,54)
*)

(* all spans
(2,14)-(2,65)
(2,16)-(2,65)
(2,20)-(2,65)
(2,23)-(2,28)
(2,23)-(2,24)
(2,27)-(2,28)
(2,34)-(2,57)
(2,38)-(2,39)
(2,34)-(2,37)
(2,35)-(2,36)
(2,40)-(2,57)
(2,41)-(2,46)
(2,47)-(2,48)
(2,49)-(2,56)
(2,50)-(2,51)
(2,54)-(2,55)
(2,63)-(2,65)
(4,10)-(4,28)
(4,12)-(4,28)
(4,16)-(4,28)
(4,16)-(4,23)
(4,17)-(4,18)
(4,21)-(4,22)
(4,26)-(4,28)
(6,12)-(11,43)
(6,15)-(11,43)
(7,2)-(11,43)
(7,13)-(7,27)
(7,13)-(7,24)
(7,25)-(7,27)
(8,2)-(11,43)
(8,13)-(8,27)
(8,13)-(8,24)
(8,25)-(8,27)
(9,2)-(11,43)
(9,5)-(9,16)
(9,5)-(9,9)
(9,12)-(9,16)
(10,7)-(10,43)
(10,8)-(10,10)
(10,12)-(10,42)
(10,37)-(10,38)
(10,13)-(10,36)
(10,14)-(10,19)
(10,20)-(10,21)
(10,22)-(10,35)
(10,23)-(10,27)
(10,30)-(10,34)
(10,39)-(10,41)
(11,7)-(11,43)
(11,8)-(11,38)
(11,33)-(11,34)
(11,9)-(11,32)
(11,10)-(11,15)
(11,16)-(11,17)
(11,18)-(11,31)
(11,19)-(11,23)
(11,26)-(11,30)
(11,35)-(11,37)
(11,40)-(11,42)
(13,11)-(13,23)
(13,15)-(13,23)
(13,15)-(13,16)
(13,21)-(13,23)
(15,19)-(16,69)
(16,2)-(16,69)
(16,8)-(16,9)
(16,23)-(16,25)
(16,36)-(16,69)
(16,39)-(16,44)
(16,39)-(16,40)
(16,43)-(16,44)
(16,50)-(16,62)
(16,50)-(16,60)
(16,61)-(16,62)
(16,68)-(16,69)
(18,11)-(41,34)
(18,14)-(41,34)
(19,2)-(41,34)
(19,11)-(40,51)
(20,4)-(40,51)
(20,10)-(37,61)
(20,12)-(37,61)
(21,6)-(37,61)
(21,12)-(21,13)
(23,10)-(37,61)
(23,17)-(23,18)
(25,15)-(37,60)
(25,22)-(25,25)
(27,20)-(30,57)
(27,23)-(27,45)
(27,23)-(27,40)
(27,24)-(27,34)
(27,25)-(27,28)
(27,31)-(27,33)
(27,37)-(27,39)
(27,43)-(27,45)
(29,22)-(29,75)
(29,23)-(29,32)
(29,24)-(29,27)
(29,30)-(29,31)
(29,34)-(29,74)
(29,45)-(29,46)
(29,35)-(29,44)
(29,36)-(29,43)
(29,36)-(29,39)
(29,42)-(29,43)
(29,47)-(29,73)
(29,48)-(29,72)
(29,48)-(29,54)
(29,55)-(29,72)
(29,56)-(29,66)
(29,57)-(29,60)
(29,63)-(29,65)
(29,69)-(29,71)
(30,25)-(30,57)
(30,26)-(30,27)
(30,29)-(30,56)
(30,36)-(30,37)
(30,30)-(30,35)
(30,31)-(30,34)
(30,38)-(30,55)
(30,39)-(30,54)
(30,39)-(30,49)
(30,40)-(30,43)
(30,46)-(30,48)
(30,52)-(30,54)
(32,20)-(37,59)
(32,23)-(32,43)
(32,23)-(32,38)
(32,24)-(32,33)
(32,25)-(32,27)
(32,30)-(32,32)
(32,36)-(32,37)
(32,41)-(32,43)
(33,25)-(33,59)
(33,26)-(33,27)
(33,29)-(33,58)
(33,34)-(33,35)
(33,30)-(33,33)
(33,31)-(33,32)
(33,36)-(33,57)
(33,53)-(33,54)
(33,37)-(33,52)
(33,38)-(33,51)
(33,38)-(33,47)
(33,39)-(33,41)
(33,44)-(33,46)
(33,50)-(33,51)
(33,55)-(33,56)
(35,22)-(37,59)
(35,23)-(35,32)
(35,24)-(35,27)
(35,30)-(35,31)
(36,24)-(37,58)
(36,49)-(36,50)
(36,25)-(36,48)
(36,26)-(36,47)
(36,26)-(36,31)
(36,32)-(36,47)
(36,33)-(36,41)
(36,34)-(36,35)
(36,38)-(36,40)
(36,44)-(36,46)
(37,27)-(37,57)
(37,53)-(37,54)
(37,28)-(37,52)
(37,29)-(37,51)
(37,29)-(37,44)
(37,30)-(37,38)
(37,31)-(37,32)
(37,35)-(37,37)
(37,41)-(37,43)
(37,49)-(37,51)
(37,55)-(37,56)
(38,4)-(40,51)
(38,15)-(38,22)
(38,16)-(38,17)
(38,19)-(38,21)
(39,4)-(40,51)
(39,15)-(39,44)
(39,15)-(39,23)
(39,24)-(39,44)
(39,25)-(39,37)
(39,38)-(39,40)
(39,41)-(39,43)
(40,4)-(40,51)
(40,18)-(40,44)
(40,18)-(40,32)
(40,33)-(40,34)
(40,35)-(40,39)
(40,40)-(40,44)
(40,48)-(40,51)
(41,2)-(41,34)
(41,2)-(41,12)
(41,13)-(41,34)
(41,14)-(41,17)
(41,18)-(41,33)
(41,19)-(41,26)
(41,27)-(41,29)
(41,30)-(41,32)
*)

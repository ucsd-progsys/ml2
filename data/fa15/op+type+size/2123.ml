
let getHead h = match h with | [] -> [] | h::t -> h;;

let getTail t = match t with | [] -> [] | h::t -> t;;

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec matchHeads x =
  match x with
  | [] -> true
  | h::t ->
      if (getHead x) = (getHead (listReverse x))
      then matchHeads (getTail (listReverse t))
      else false;;

let palindrome w =
  match explode w with | [] -> true | h::t -> matchHeads (h :: t);;


(* fix

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec matchHeads x = match x with | [] -> true | h::t -> false;;

let palindrome w =
  match explode w with | [] -> true | h::t -> matchHeads (explode w);;

*)

(* changed spans
(2,12)-(2,51)
(2,16)-(2,51)
(2,22)-(2,23)
(2,37)-(2,39)
(2,50)-(2,51)
(4,12)-(4,51)
(4,16)-(4,51)
(4,22)-(4,23)
(4,37)-(4,39)
(4,50)-(4,51)
(6,20)-(7,57)
(7,2)-(7,57)
(7,8)-(7,9)
(7,23)-(7,25)
(7,36)-(7,51)
(7,36)-(7,57)
(7,37)-(7,48)
(7,49)-(7,50)
(7,52)-(7,53)
(7,54)-(7,57)
(7,55)-(7,56)
(10,2)-(12,6)
(12,2)-(12,4)
(12,5)-(12,6)
(14,19)-(20,16)
*)

(* type error slice
(2,3)-(2,53)
(2,12)-(2,51)
(2,16)-(2,51)
(2,16)-(2,51)
(2,16)-(2,51)
(2,16)-(2,51)
(2,22)-(2,23)
(2,37)-(2,39)
(2,50)-(2,51)
(4,3)-(4,53)
(4,12)-(4,51)
(4,16)-(4,51)
(4,16)-(4,51)
(4,16)-(4,51)
(4,22)-(4,23)
(4,50)-(4,51)
(7,2)-(7,57)
(7,2)-(7,57)
(7,36)-(7,51)
(7,36)-(7,57)
(7,37)-(7,48)
(7,49)-(7,50)
(7,52)-(7,53)
(7,54)-(7,57)
(7,54)-(7,57)
(7,55)-(7,56)
(9,3)-(12,8)
(9,12)-(12,6)
(10,2)-(12,6)
(11,43)-(11,50)
(11,43)-(11,66)
(11,43)-(11,66)
(11,44)-(11,49)
(11,54)-(11,66)
(11,55)-(11,57)
(12,2)-(12,4)
(12,2)-(12,6)
(18,9)-(18,20)
(18,10)-(18,17)
(18,18)-(18,19)
(18,32)-(18,47)
(18,33)-(18,44)
(18,45)-(18,46)
(19,11)-(19,21)
(19,11)-(19,47)
(19,22)-(19,47)
(19,23)-(19,30)
(19,31)-(19,46)
(19,32)-(19,43)
(23,2)-(23,65)
(23,2)-(23,65)
(23,8)-(23,15)
(23,8)-(23,17)
(23,46)-(23,56)
(23,46)-(23,65)
(23,57)-(23,65)
(23,57)-(23,65)
(23,58)-(23,59)
*)

(* all spans
(2,12)-(2,51)
(2,16)-(2,51)
(2,22)-(2,23)
(2,37)-(2,39)
(2,50)-(2,51)
(4,12)-(4,51)
(4,16)-(4,51)
(4,22)-(4,23)
(4,37)-(4,39)
(4,50)-(4,51)
(6,20)-(7,57)
(7,2)-(7,57)
(7,8)-(7,9)
(7,23)-(7,25)
(7,36)-(7,57)
(7,52)-(7,53)
(7,36)-(7,51)
(7,37)-(7,48)
(7,49)-(7,50)
(7,54)-(7,57)
(7,55)-(7,56)
(9,12)-(12,6)
(10,2)-(12,6)
(10,13)-(11,66)
(11,4)-(11,66)
(11,7)-(11,29)
(11,7)-(11,8)
(11,12)-(11,29)
(11,13)-(11,26)
(11,27)-(11,28)
(11,35)-(11,37)
(11,43)-(11,66)
(11,43)-(11,50)
(11,44)-(11,49)
(11,44)-(11,45)
(11,47)-(11,48)
(11,54)-(11,66)
(11,55)-(11,57)
(11,58)-(11,65)
(11,59)-(11,60)
(11,63)-(11,64)
(12,2)-(12,6)
(12,2)-(12,4)
(12,5)-(12,6)
(14,19)-(20,16)
(15,2)-(20,16)
(15,8)-(15,9)
(16,10)-(16,14)
(18,6)-(20,16)
(18,9)-(18,48)
(18,9)-(18,20)
(18,10)-(18,17)
(18,18)-(18,19)
(18,23)-(18,48)
(18,24)-(18,31)
(18,32)-(18,47)
(18,33)-(18,44)
(18,45)-(18,46)
(19,11)-(19,47)
(19,11)-(19,21)
(19,22)-(19,47)
(19,23)-(19,30)
(19,31)-(19,46)
(19,32)-(19,43)
(19,44)-(19,45)
(20,11)-(20,16)
(22,15)-(23,65)
(23,2)-(23,65)
(23,8)-(23,17)
(23,8)-(23,15)
(23,16)-(23,17)
(23,31)-(23,35)
(23,46)-(23,65)
(23,46)-(23,56)
(23,57)-(23,65)
(23,58)-(23,59)
(23,63)-(23,64)
*)
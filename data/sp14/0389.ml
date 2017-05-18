
let rec concat w = match w with | [] -> "" | h::t -> h ^ (concat t);;

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let palindrome w = (concat (listReverse (explode w))) == w;;


(* fix

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let palindrome w = (listReverse (explode w)) == (explode w);;

*)

(* changed spans
(2,15)-(2,67)
(2,19)-(2,67)
(2,25)-(2,26)
(2,40)-(2,42)
(2,53)-(2,54)
(2,53)-(2,67)
(2,55)-(2,56)
(2,57)-(2,67)
(2,58)-(2,64)
(2,65)-(2,66)
(12,20)-(12,26)
(12,27)-(12,52)
(12,57)-(12,58)
*)

(* type error slice
(2,19)-(2,67)
(2,19)-(2,67)
(2,53)-(2,54)
(2,53)-(2,67)
(2,55)-(2,56)
(2,57)-(2,67)
(2,58)-(2,64)
(2,65)-(2,66)
(4,3)-(7,8)
(4,12)-(7,6)
(5,2)-(7,6)
(6,43)-(6,50)
(6,43)-(6,66)
(6,43)-(6,66)
(6,44)-(6,49)
(6,54)-(6,66)
(6,55)-(6,57)
(7,2)-(7,4)
(7,2)-(7,6)
(10,2)-(10,57)
(10,2)-(10,57)
(10,36)-(10,51)
(10,36)-(10,57)
(10,37)-(10,48)
(10,49)-(10,50)
(10,52)-(10,53)
(10,54)-(10,57)
(10,54)-(10,57)
(10,55)-(10,56)
(12,19)-(12,53)
(12,20)-(12,26)
(12,27)-(12,52)
(12,28)-(12,39)
(12,40)-(12,51)
(12,41)-(12,48)
*)

(* all spans
(2,15)-(2,67)
(2,19)-(2,67)
(2,25)-(2,26)
(2,40)-(2,42)
(2,53)-(2,67)
(2,55)-(2,56)
(2,53)-(2,54)
(2,57)-(2,67)
(2,58)-(2,64)
(2,65)-(2,66)
(4,12)-(7,6)
(5,2)-(7,6)
(5,13)-(6,66)
(6,4)-(6,66)
(6,7)-(6,29)
(6,7)-(6,8)
(6,12)-(6,29)
(6,13)-(6,26)
(6,27)-(6,28)
(6,35)-(6,37)
(6,43)-(6,66)
(6,43)-(6,50)
(6,44)-(6,49)
(6,44)-(6,45)
(6,47)-(6,48)
(6,54)-(6,66)
(6,55)-(6,57)
(6,58)-(6,65)
(6,59)-(6,60)
(6,63)-(6,64)
(7,2)-(7,6)
(7,2)-(7,4)
(7,5)-(7,6)
(9,20)-(10,57)
(10,2)-(10,57)
(10,8)-(10,9)
(10,23)-(10,25)
(10,36)-(10,57)
(10,52)-(10,53)
(10,36)-(10,51)
(10,37)-(10,48)
(10,49)-(10,50)
(10,54)-(10,57)
(10,55)-(10,56)
(12,15)-(12,58)
(12,19)-(12,58)
(12,19)-(12,53)
(12,20)-(12,26)
(12,27)-(12,52)
(12,28)-(12,39)
(12,40)-(12,51)
(12,41)-(12,48)
(12,49)-(12,50)
(12,57)-(12,58)
*)

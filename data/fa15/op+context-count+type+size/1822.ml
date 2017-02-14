
let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let palindrome w = (explode w) = (listReverse w);;


(* fix

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let palindrome w = (explode w) = (listReverse (explode w));;

*)

(* changed spans
(10,47)-(10,48)
*)

(* type error slice
(2,4)-(5,9)
(2,13)-(5,7)
(4,14)-(4,27)
(4,14)-(4,29)
(4,28)-(4,29)
(8,3)-(8,58)
(8,3)-(8,58)
(8,38)-(8,49)
(8,38)-(8,51)
(8,50)-(8,51)
(10,21)-(10,28)
(10,21)-(10,30)
(10,29)-(10,30)
(10,35)-(10,46)
(10,35)-(10,48)
(10,47)-(10,48)
*)

let rec clone x n = if n < 0 then [] else clone (x, (n - 1));;


(* fix

let rec clone x n =
  let rec cloneHelper (x,n,acc) =
    if n < 0 then acc else cloneHelper (x, (n - 1), (x :: acc)) in
  cloneHelper (x, n, []);;

*)

(* changed spans
(2,20)-(2,60)
(2,34)-(2,36)
(2,42)-(2,47)
(2,48)-(2,60)
(2,49)-(2,50)
*)

(* type error slice
(2,3)-(2,62)
(2,14)-(2,60)
(2,42)-(2,47)
(2,42)-(2,60)
(2,48)-(2,60)
(2,49)-(2,50)
*)

(* all spans
(2,14)-(2,60)
(2,16)-(2,60)
(2,20)-(2,60)
(2,23)-(2,28)
(2,23)-(2,24)
(2,27)-(2,28)
(2,34)-(2,36)
(2,42)-(2,60)
(2,42)-(2,47)
(2,48)-(2,60)
(2,49)-(2,50)
(2,52)-(2,59)
(2,53)-(2,54)
(2,57)-(2,58)
*)

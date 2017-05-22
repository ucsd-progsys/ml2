
let cout (x,y) = (x * y) mod 10;;

let rec mulByDigit i l =
  let f a x =
    let c = cout (i, x) in
    match a with | hd::tl -> (cout (hd, i)) @ (mulByDigit i tl) in
  let base = [] in
  let args = List.rev l in let res = List.fold_left f base args in res;;


(* fix

let cout (x,y) = (x * y) mod 10;;

let rec mulByDigit i l =
  let f a x =
    let c = cout (i, x) in
    match a with | hd::tl -> [cout (hd, i)] @ (mulByDigit i tl) in
  let base = [] in
  let args = List.rev l in let res = List.fold_left f base args in res;;

*)

(* changed spans
(7,29)-(7,43)
*)

(* type error slice
(2,3)-(2,33)
(2,10)-(2,31)
(2,17)-(2,31)
(7,29)-(7,43)
(7,29)-(7,63)
(7,30)-(7,34)
(7,44)-(7,45)
*)

(* all spans
(2,10)-(2,31)
(2,17)-(2,31)
(2,17)-(2,24)
(2,18)-(2,19)
(2,22)-(2,23)
(2,29)-(2,31)
(4,19)-(9,70)
(4,21)-(9,70)
(5,2)-(9,70)
(5,8)-(7,63)
(5,10)-(7,63)
(6,4)-(7,63)
(6,12)-(6,23)
(6,12)-(6,16)
(6,17)-(6,23)
(6,18)-(6,19)
(6,21)-(6,22)
(7,4)-(7,63)
(7,10)-(7,11)
(7,29)-(7,63)
(7,44)-(7,45)
(7,29)-(7,43)
(7,30)-(7,34)
(7,35)-(7,42)
(7,36)-(7,38)
(7,40)-(7,41)
(7,46)-(7,63)
(7,47)-(7,57)
(7,58)-(7,59)
(7,60)-(7,62)
(8,2)-(9,70)
(8,13)-(8,15)
(9,2)-(9,70)
(9,13)-(9,23)
(9,13)-(9,21)
(9,22)-(9,23)
(9,27)-(9,70)
(9,37)-(9,63)
(9,37)-(9,51)
(9,52)-(9,53)
(9,54)-(9,58)
(9,59)-(9,63)
(9,67)-(9,70)
*)

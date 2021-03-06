
let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t -> [mulByDigit i (List.rev l); h * i];;


(* fix

let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t -> (mulByDigit i (List.rev l)) @ [h * i];;

*)

(* changed spans
(5,12)-(5,46)
(5,13)-(5,23)
(5,40)-(5,45)
*)

(* type error slice
(2,3)-(5,48)
(2,19)-(5,46)
(2,21)-(5,46)
(3,2)-(5,46)
(5,12)-(5,46)
(5,13)-(5,23)
(5,13)-(5,38)
*)

(* all spans
(2,19)-(5,46)
(2,21)-(5,46)
(3,2)-(5,46)
(3,8)-(3,18)
(3,8)-(3,16)
(3,17)-(3,18)
(4,10)-(4,12)
(5,12)-(5,46)
(5,13)-(5,38)
(5,13)-(5,23)
(5,24)-(5,25)
(5,26)-(5,38)
(5,27)-(5,35)
(5,36)-(5,37)
(5,40)-(5,45)
(5,40)-(5,41)
(5,44)-(5,45)
*)


let rec digitsOfInt n =
  match n <= 0 with
  | true  -> []
  | false  -> ((digitsOfInt n) / 10) :: (n mod 10);;


(* fix

let rec digitsOfInt n =
  match n <= 0 with
  | true  -> []
  | false  -> (n mod 10) :: (digitsOfInt (n / 10));;

*)

(* changed spans
(5,14)-(5,36)
(5,15)-(5,30)
(5,16)-(5,27)
(5,40)-(5,50)
(5,41)-(5,42)
*)

(* type error slice
(2,3)-(5,52)
(2,20)-(5,50)
(3,2)-(5,50)
(5,14)-(5,36)
(5,14)-(5,50)
(5,14)-(5,50)
(5,15)-(5,30)
(5,16)-(5,27)
(5,40)-(5,50)
*)

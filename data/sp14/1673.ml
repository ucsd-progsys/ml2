
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e1 -> sin (eval (e1, x, y))
  | Cosine e1 -> cos (eval (e1, x, y))
  | Average (e1,e2) -> (eval (e1, x, y)) +. ((eval (e2, x, y)) /. 2);;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e1 -> sin (eval (e1, x, y))
  | Cosine e1 -> cos (eval (e1, x, y))
  | Average (e1,e2) -> (eval (e1, x, y)) +. ((eval (e2, x, y)) /. 2.0);;

*)

(* changed spans
(17,66)-(17,67)
*)

(* type error slice
(17,44)-(17,68)
(17,66)-(17,67)
*)

(* all spans
(11,14)-(17,68)
(12,2)-(17,68)
(12,8)-(12,9)
(13,13)-(13,14)
(14,13)-(14,14)
(15,15)-(15,36)
(15,15)-(15,18)
(15,19)-(15,36)
(15,20)-(15,24)
(15,25)-(15,35)
(15,26)-(15,28)
(15,30)-(15,31)
(15,33)-(15,34)
(16,17)-(16,38)
(16,17)-(16,20)
(16,21)-(16,38)
(16,22)-(16,26)
(16,27)-(16,37)
(16,28)-(16,30)
(16,32)-(16,33)
(16,35)-(16,36)
(17,23)-(17,68)
(17,23)-(17,40)
(17,24)-(17,28)
(17,29)-(17,39)
(17,30)-(17,32)
(17,34)-(17,35)
(17,37)-(17,38)
(17,44)-(17,68)
(17,45)-(17,62)
(17,46)-(17,50)
(17,51)-(17,61)
(17,52)-(17,54)
(17,56)-(17,57)
(17,59)-(17,60)
(17,66)-(17,67)
*)

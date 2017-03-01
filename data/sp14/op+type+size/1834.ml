
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> float_of_int x
  | VarY  -> float_of_int y
  | Sine e -> sin (pi *. (eval (e, x, y)))
  | Cosine e -> cos (pi *. (eval (e, x, y)))
  | Average (e1,e2) ->
      (float_of_int ((eval (e1, x, y)) + (eval (e2, x, y)))) / 2;;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e -> sin (pi *. (eval (e, x, y)))
  | Cosine e -> cos (pi *. (eval (e, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.;;

*)

(* changed spans
(15,13)-(15,25)
(15,13)-(15,27)
(16,13)-(16,25)
(16,13)-(16,27)
(20,6)-(20,60)
(20,6)-(20,64)
(20,7)-(20,19)
(20,20)-(20,59)
(20,21)-(20,38)
(20,52)-(20,53)
(20,63)-(20,64)
*)

(* type error slice
(14,2)-(20,64)
(14,2)-(20,64)
(15,13)-(15,25)
(15,13)-(15,27)
(17,18)-(17,42)
(17,25)-(17,41)
(17,26)-(17,30)
(20,6)-(20,60)
(20,6)-(20,64)
(20,6)-(20,64)
(20,7)-(20,19)
(20,20)-(20,59)
(20,20)-(20,59)
(20,21)-(20,38)
(20,22)-(20,26)
(20,41)-(20,58)
(20,42)-(20,46)
*)

(* all spans
(11,9)-(11,26)
(11,9)-(11,12)
(11,16)-(11,26)
(11,17)-(11,21)
(11,22)-(11,25)
(13,14)-(20,64)
(14,2)-(20,64)
(14,8)-(14,9)
(15,13)-(15,27)
(15,13)-(15,25)
(15,26)-(15,27)
(16,13)-(16,27)
(16,13)-(16,25)
(16,26)-(16,27)
(17,14)-(17,42)
(17,14)-(17,17)
(17,18)-(17,42)
(17,19)-(17,21)
(17,25)-(17,41)
(17,26)-(17,30)
(17,31)-(17,40)
(17,32)-(17,33)
(17,35)-(17,36)
(17,38)-(17,39)
(18,16)-(18,44)
(18,16)-(18,19)
(18,20)-(18,44)
(18,21)-(18,23)
(18,27)-(18,43)
(18,28)-(18,32)
(18,33)-(18,42)
(18,34)-(18,35)
(18,37)-(18,38)
(18,40)-(18,41)
(20,6)-(20,64)
(20,6)-(20,60)
(20,7)-(20,19)
(20,20)-(20,59)
(20,21)-(20,38)
(20,22)-(20,26)
(20,27)-(20,37)
(20,28)-(20,30)
(20,32)-(20,33)
(20,35)-(20,36)
(20,41)-(20,58)
(20,42)-(20,46)
(20,47)-(20,57)
(20,48)-(20,50)
(20,52)-(20,53)
(20,55)-(20,56)
(20,63)-(20,64)
*)
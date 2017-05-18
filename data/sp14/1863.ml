
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
  | Sine e' -> sin (pi *. (eval (e', x, y)))
  | Cosine e' -> cos (pi *. (eval (e', x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) / 2
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y);;


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
  | Sine e' -> sin (pi *. (eval (e', x, y)))
  | Cosine e' -> cos (pi *. (eval (e', x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y);;

*)

(* changed spans
(19,23)-(19,67)
(19,66)-(19,67)
*)

(* type error slice
(14,2)-(24,26)
(14,2)-(24,26)
(17,15)-(17,18)
(17,15)-(17,44)
(19,23)-(19,63)
(19,23)-(19,67)
(19,23)-(19,67)
*)

(* all spans
(11,9)-(11,26)
(11,9)-(11,12)
(11,16)-(11,26)
(11,17)-(11,21)
(11,22)-(11,25)
(13,14)-(24,26)
(14,2)-(24,26)
(14,8)-(14,9)
(15,13)-(15,14)
(16,13)-(16,14)
(17,15)-(17,44)
(17,15)-(17,18)
(17,19)-(17,44)
(17,20)-(17,22)
(17,26)-(17,43)
(17,27)-(17,31)
(17,32)-(17,42)
(17,33)-(17,35)
(17,37)-(17,38)
(17,40)-(17,41)
(18,17)-(18,46)
(18,17)-(18,20)
(18,21)-(18,46)
(18,22)-(18,24)
(18,28)-(18,45)
(18,29)-(18,33)
(18,34)-(18,44)
(18,35)-(18,37)
(18,39)-(18,40)
(18,42)-(18,43)
(19,23)-(19,67)
(19,23)-(19,63)
(19,24)-(19,41)
(19,25)-(19,29)
(19,30)-(19,40)
(19,31)-(19,33)
(19,35)-(19,36)
(19,38)-(19,39)
(19,45)-(19,62)
(19,46)-(19,50)
(19,51)-(19,61)
(19,52)-(19,54)
(19,56)-(19,57)
(19,59)-(19,60)
(19,66)-(19,67)
(20,21)-(20,59)
(20,21)-(20,38)
(20,22)-(20,26)
(20,27)-(20,37)
(20,28)-(20,30)
(20,32)-(20,33)
(20,35)-(20,36)
(20,42)-(20,59)
(20,43)-(20,47)
(20,48)-(20,58)
(20,49)-(20,51)
(20,53)-(20,54)
(20,56)-(20,57)
(22,6)-(24,26)
(22,9)-(22,46)
(22,9)-(22,26)
(22,10)-(22,14)
(22,15)-(22,25)
(22,16)-(22,18)
(22,20)-(22,21)
(22,23)-(22,24)
(22,29)-(22,46)
(22,30)-(22,34)
(22,35)-(22,45)
(22,36)-(22,38)
(22,40)-(22,41)
(22,43)-(22,44)
(23,11)-(23,26)
(23,11)-(23,15)
(23,16)-(23,26)
(23,17)-(23,19)
(23,21)-(23,22)
(23,24)-(23,25)
(24,11)-(24,26)
(24,11)-(24,15)
(24,16)-(24,26)
(24,17)-(24,19)
(24,21)-(24,22)
(24,24)-(24,25)
*)

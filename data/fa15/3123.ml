
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Op1 of expr
  | Op2 of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e1 -> sin (pi *. (eval (e1, x, y)))
  | Cosine e1 -> cos (pi *. (eval (e1, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y)
  | Op1 e1 -> (eval (e1, x, y)) /. ((eval (e1, x, y)) *. (eval (e1, x, y)))
  | Op2 (e1,e2,e3) -> 1.0 /. (((eval e1) +. (eval e2)) +. (eval e3));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Op1 of expr
  | Op2 of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e1 -> sin (pi *. (eval (e1, x, y)))
  | Cosine e1 -> cos (pi *. (eval (e1, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y)
  | Op1 e1 -> (eval (e1, x, y)) /. ((eval (e1, x, y)) *. (eval (e1, x, y)))
  | Op2 (e1,e2,e3) ->
      1.0 /. (((eval (e1, x, y)) +. (eval (e2, x, y))) +. (eval (e3, x, y)));;

*)

(* changed spans
(28,37)-(28,39)
(28,44)-(28,53)
(28,50)-(28,52)
(28,58)-(28,67)
(28,64)-(28,66)
*)

(* type error slice
(16,2)-(28,68)
(16,2)-(28,68)
(16,2)-(28,68)
(19,26)-(19,43)
(19,27)-(19,31)
(19,32)-(19,42)
(28,31)-(28,40)
(28,32)-(28,36)
(28,37)-(28,39)
(28,44)-(28,53)
(28,45)-(28,49)
(28,50)-(28,52)
(28,58)-(28,67)
(28,59)-(28,63)
(28,64)-(28,66)
*)

(* all spans
(13,9)-(13,26)
(13,9)-(13,12)
(13,16)-(13,26)
(13,17)-(13,21)
(13,22)-(13,25)
(15,14)-(28,68)
(16,2)-(28,68)
(16,8)-(16,9)
(17,13)-(17,14)
(18,13)-(18,14)
(19,15)-(19,44)
(19,15)-(19,18)
(19,19)-(19,44)
(19,20)-(19,22)
(19,26)-(19,43)
(19,27)-(19,31)
(19,32)-(19,42)
(19,33)-(19,35)
(19,37)-(19,38)
(19,40)-(19,41)
(20,17)-(20,46)
(20,17)-(20,20)
(20,21)-(20,46)
(20,22)-(20,24)
(20,28)-(20,45)
(20,29)-(20,33)
(20,34)-(20,44)
(20,35)-(20,37)
(20,39)-(20,40)
(20,42)-(20,43)
(21,23)-(21,70)
(21,23)-(21,63)
(21,24)-(21,41)
(21,25)-(21,29)
(21,30)-(21,40)
(21,31)-(21,33)
(21,35)-(21,36)
(21,38)-(21,39)
(21,45)-(21,62)
(21,46)-(21,50)
(21,51)-(21,61)
(21,52)-(21,54)
(21,56)-(21,57)
(21,59)-(21,60)
(21,67)-(21,70)
(22,21)-(22,59)
(22,21)-(22,38)
(22,22)-(22,26)
(22,27)-(22,37)
(22,28)-(22,30)
(22,32)-(22,33)
(22,35)-(22,36)
(22,42)-(22,59)
(22,43)-(22,47)
(22,48)-(22,58)
(22,49)-(22,51)
(22,53)-(22,54)
(22,56)-(22,57)
(24,6)-(26,26)
(24,9)-(24,46)
(24,9)-(24,26)
(24,10)-(24,14)
(24,15)-(24,25)
(24,16)-(24,18)
(24,20)-(24,21)
(24,23)-(24,24)
(24,29)-(24,46)
(24,30)-(24,34)
(24,35)-(24,45)
(24,36)-(24,38)
(24,40)-(24,41)
(24,43)-(24,44)
(25,11)-(25,26)
(25,11)-(25,15)
(25,16)-(25,26)
(25,17)-(25,19)
(25,21)-(25,22)
(25,24)-(25,25)
(26,11)-(26,26)
(26,11)-(26,15)
(26,16)-(26,26)
(26,17)-(26,19)
(26,21)-(26,22)
(26,24)-(26,25)
(27,14)-(27,75)
(27,14)-(27,31)
(27,15)-(27,19)
(27,20)-(27,30)
(27,21)-(27,23)
(27,25)-(27,26)
(27,28)-(27,29)
(27,35)-(27,75)
(27,36)-(27,53)
(27,37)-(27,41)
(27,42)-(27,52)
(27,43)-(27,45)
(27,47)-(27,48)
(27,50)-(27,51)
(27,57)-(27,74)
(27,58)-(27,62)
(27,63)-(27,73)
(27,64)-(27,66)
(27,68)-(27,69)
(27,71)-(27,72)
(28,22)-(28,68)
(28,22)-(28,25)
(28,29)-(28,68)
(28,30)-(28,54)
(28,31)-(28,40)
(28,32)-(28,36)
(28,37)-(28,39)
(28,44)-(28,53)
(28,45)-(28,49)
(28,50)-(28,52)
(28,58)-(28,67)
(28,59)-(28,63)
(28,64)-(28,66)
*)

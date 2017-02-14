
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
  | Sine var1 -> sin (pi * (eval (var1, x, y)))
  | Cosine var2 -> cos (pi * (eval (var2, x, y)))
  | Average (var3,var4) -> ((eval (var3, x, y)) + (eval (var4, x, y))) / 2
  | Times (var5,var6) -> (eval (var5, x, y)) * (eval (var6, x, y))
  | Thresh (var7,var8,var9,var0) ->
      if (eval (var7, x, y)) < (eval (var8, x, y))
      then eval (var9, x, y)
      else eval (var0, x, y);;


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
  | Sine var1 -> sin (pi *. (eval (var1, x, y)))
  | Cosine var2 -> cos (pi *. (eval (var2, x, y)))
  | Average (var3,var4) ->
      ((eval (var3, x, y)) +. (eval (var4, x, y))) /. 2.0
  | Times (var5,var6) -> (eval (var5, x, y)) *. (eval (var6, x, y))
  | Thresh (var7,var8,var9,var0) ->
      if (eval (var7, x, y)) < (eval (var8, x, y))
      then eval (var9, x, y)
      else eval (var0, x, y);;

*)

(* changed spans
(17,23)-(17,45)
(18,25)-(18,47)
(19,30)-(19,46)
(19,30)-(19,68)
(19,30)-(19,75)
(19,74)-(19,75)
(20,27)-(20,43)
(20,27)-(20,65)
*)

(* type error slice
(11,4)-(11,29)
(11,10)-(11,26)
(17,18)-(17,21)
(17,18)-(17,45)
(17,23)-(17,25)
(17,23)-(17,45)
(17,23)-(17,45)
(18,20)-(18,23)
(18,20)-(18,47)
(18,25)-(18,27)
(18,25)-(18,47)
(18,25)-(18,47)
*)
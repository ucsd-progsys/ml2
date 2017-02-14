
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Foo of expr* expr
  | Clamp of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine a -> sin ((eval (a, x, y)) *. pi)
  | Cosine a -> cos ((eval (a, x, y)) *. pi)
  | Average (a,b) -> ((eval (a, x, y)) +. (eval (b, x, y))) /. 2.
  | Times (a,b) -> (eval (a, x, y)) *. (eval (b, x, y))
  | Thresh (a,b,c,d) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (c, x, y)
      else eval (d, x, y)
  | Foo (a,b) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then 0.9 *. (eval (a, x, y))
      else (eval 0.1) *. (a, x, y)
  | Clamp (a,b,c) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (b, x, y)
      else
        if (eval (a, x, y)) > (eval (c, x, y))
        then eval (c, x, y)
        else eval (a, x, y);;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Foo of expr* expr
  | Clamp of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine a -> sin ((eval (a, x, y)) *. pi)
  | Cosine a -> cos ((eval (a, x, y)) *. pi)
  | Average (a,b) -> ((eval (a, x, y)) +. (eval (b, x, y))) /. 2.
  | Times (a,b) -> (eval (a, x, y)) *. (eval (b, x, y))
  | Thresh (a,b,c,d) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (c, x, y)
      else eval (d, x, y)
  | Foo (a,b) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then 0.9 *. (eval (a, x, y))
      else 0.1 *. (eval (a, x, y))
  | Clamp (a,b,c) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (b, x, y)
      else
        if (eval (a, x, y)) > (eval (c, x, y))
        then eval (c, x, y)
        else eval (a, x, y);;

*)

(* changed spans
(30,13)-(30,21)
(30,18)-(30,21)
*)

(* type error slice
(19,21)-(19,25)
(19,21)-(19,34)
(19,27)-(19,34)
(30,13)-(30,17)
(30,13)-(30,21)
(30,13)-(30,34)
(30,18)-(30,21)
(30,27)-(30,34)
*)
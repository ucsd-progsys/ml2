
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Mirana of expr
  | Darius of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e -> sin (pi *. (eval (e, x, y)))
  | Cosine e -> cos (pi *. (eval (e, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y)
  | Mirana e -> abs_float (eval (e, x, y))
  | Darius (e1,e2,e3) ->
      ((eval (e1, x, y)) + (eval (e2, x, y))) mod (eval (e3, x, y));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Mirana of expr
  | Darius of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e -> sin (pi *. (eval (e, x, y)))
  | Cosine e -> cos (pi *. (eval (e, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y)
  | Mirana e -> abs_float (eval (e, x, y))
  | Darius (e1,e2,e3) ->
      let comb = (eval (e1, x, y)) +. (eval (e2, x, y)) in
      mod_float comb (eval (e3, x, y));;

*)

(* changed spans
(29,6)-(29,45)
(29,6)-(29,67)
(29,7)-(29,24)
(29,50)-(29,67)
*)

(* type error slice
(19,18)-(19,42)
(19,25)-(19,41)
(19,26)-(19,30)
(29,6)-(29,45)
(29,6)-(29,45)
(29,6)-(29,67)
(29,7)-(29,24)
(29,8)-(29,12)
(29,27)-(29,44)
(29,28)-(29,32)
(29,50)-(29,67)
(29,51)-(29,55)
*)

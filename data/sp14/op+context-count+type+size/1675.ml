
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
  | VarX  -> x +. 0.0
  | VarY  -> y +. 0.0
  | Sine s1 -> sin s1
  | Average (a1,a2) -> (eval (VarX, x, y)) +. (eval (VarY, x, y));;


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
  | VarX  -> x +. 0.0
  | VarY  -> y +. 0.0
  | Sine s1 -> sin (eval (s1, x, y))
  | Average (a1,a2) -> (eval (VarX, x, y)) +. (eval (VarY, x, y));;

*)

(* changed spans
(15,20)-(15,22)
(16,25)-(16,64)
(16,54)-(16,58)
(16,60)-(16,61)
(16,63)-(16,64)
*)

(* type error slice
(12,3)-(16,64)
(15,16)-(15,19)
(15,16)-(15,22)
(15,20)-(15,22)
*)

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec exprToString e =
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine expr -> "sin(" ^ ((exprToString expr) ^ ")")
  | Cosine expr -> "cos(" ^ ((exprToString expr) ^ ")")
  | Average (expr,expr) ->
      "(" ^ ((exprToString expr) ^ ("+" ^ ((exprToString expr) ^ ")/2)")))
  | Times (expr,expr) ->
      "(" ^ ((exprToString expr) ^ ("*" ^ ((exprToString expr) ^ ")")))
  | Thresh (expr,expr,expr,expr) ->
      "(" ^ (expr ^ ("<" ^ (expr ^ ("?" ^ (expr ^ (":" ^ (expr ^ ")")))))));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec exprToString e =
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine expr0 -> "sin(" ^ ((exprToString expr0) ^ ")")
  | Cosine expr0 -> "cos(" ^ ((exprToString expr0) ^ ")")
  | Average (expr0,expr1) ->
      "(" ^ ((exprToString expr0) ^ ("+" ^ ((exprToString expr1) ^ ")/2)")))
  | Times (expr0,expr1) ->
      "(" ^ ((exprToString expr0) ^ ("*" ^ ((exprToString expr1) ^ ")")))
  | Thresh (expr0,expr1,expr2,expr3) ->
      "(" ^
        ((exprToString expr0) ^
           ("<" ^
              ((exprToString expr1) ^
                 ("?" ^
                    ((exprToString expr2) ^
                       (":" ^ ((exprToString expr3) ^ ")")))))));;

*)

(* changed spans
(12,2)-(22,75)
(15,41)-(15,45)
(16,43)-(16,47)
(18,27)-(18,31)
(18,57)-(18,61)
(20,27)-(20,31)
(20,57)-(20,61)
(22,13)-(22,17)
(22,20)-(22,74)
(22,28)-(22,32)
(22,35)-(22,72)
(22,43)-(22,47)
(22,50)-(22,70)
(22,58)-(22,62)
(22,65)-(22,68)
*)

(* type error slice
(12,2)-(22,75)
(22,12)-(22,75)
(22,13)-(22,17)
(22,18)-(22,19)
(22,27)-(22,73)
(22,28)-(22,32)
(22,33)-(22,34)
(22,42)-(22,71)
(22,43)-(22,47)
(22,48)-(22,49)
(22,57)-(22,69)
(22,58)-(22,62)
(22,63)-(22,64)
*)

(* all spans
(11,21)-(22,75)
(12,2)-(22,75)
(12,8)-(12,9)
(13,13)-(13,16)
(14,13)-(14,16)
(15,17)-(15,53)
(15,24)-(15,25)
(15,17)-(15,23)
(15,26)-(15,53)
(15,47)-(15,48)
(15,27)-(15,46)
(15,28)-(15,40)
(15,41)-(15,45)
(15,49)-(15,52)
(16,19)-(16,55)
(16,26)-(16,27)
(16,19)-(16,25)
(16,28)-(16,55)
(16,49)-(16,50)
(16,29)-(16,48)
(16,30)-(16,42)
(16,43)-(16,47)
(16,51)-(16,54)
(18,6)-(18,74)
(18,10)-(18,11)
(18,6)-(18,9)
(18,12)-(18,74)
(18,33)-(18,34)
(18,13)-(18,32)
(18,14)-(18,26)
(18,27)-(18,31)
(18,35)-(18,73)
(18,40)-(18,41)
(18,36)-(18,39)
(18,42)-(18,72)
(18,63)-(18,64)
(18,43)-(18,62)
(18,44)-(18,56)
(18,57)-(18,61)
(18,65)-(18,71)
(20,6)-(20,71)
(20,10)-(20,11)
(20,6)-(20,9)
(20,12)-(20,71)
(20,33)-(20,34)
(20,13)-(20,32)
(20,14)-(20,26)
(20,27)-(20,31)
(20,35)-(20,70)
(20,40)-(20,41)
(20,36)-(20,39)
(20,42)-(20,69)
(20,63)-(20,64)
(20,43)-(20,62)
(20,44)-(20,56)
(20,57)-(20,61)
(20,65)-(20,68)
(22,6)-(22,75)
(22,10)-(22,11)
(22,6)-(22,9)
(22,12)-(22,75)
(22,18)-(22,19)
(22,13)-(22,17)
(22,20)-(22,74)
(22,25)-(22,26)
(22,21)-(22,24)
(22,27)-(22,73)
(22,33)-(22,34)
(22,28)-(22,32)
(22,35)-(22,72)
(22,40)-(22,41)
(22,36)-(22,39)
(22,42)-(22,71)
(22,48)-(22,49)
(22,43)-(22,47)
(22,50)-(22,70)
(22,55)-(22,56)
(22,51)-(22,54)
(22,57)-(22,69)
(22,63)-(22,64)
(22,58)-(22,62)
(22,65)-(22,68)
*)

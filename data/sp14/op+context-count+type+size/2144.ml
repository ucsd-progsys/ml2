
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
  | Sine e -> "sin(" ^ (e ^ ")")
  | Cosine e -> "cos(" ^ (e ^ ")")
  | Average (e1,e2) -> e1 ^ ("+" ^ (e2 ^ "/2"))
  | Times (e1,e2) -> e1 ^ ("*" ^ e2)
  | Thresh (e1,e2,e3,e4) -> e1 ^ ("<" ^ (e2 ^ ("?" ^ (e3 ^ (":" ^ e4)))));;


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
  | Sine e -> "sin(" ^ ((exprToString e) ^ ")")
  | Cosine e -> "cos(" ^ ((exprToString e) ^ ")")
  | Average (e1,e2) -> (exprToString e1) ^ ("+" ^ ((exprToString e2) ^ "/2"))
  | Times (e1,e2) -> (exprToString e1) ^ ("*" ^ (exprToString e2))
  | Thresh (e1,e2,e3,e4) ->
      (exprToString e1) ^
        ("<" ^
           ((exprToString e2) ^
              ("?" ^ ((exprToString e3) ^ (":" ^ (exprToString e4))))));;

*)

(* changed spans
(15,24)-(15,25)
(16,26)-(16,27)
(17,23)-(17,25)
(17,36)-(17,38)
(18,21)-(18,23)
(18,33)-(18,35)
(19,28)-(19,30)
(19,41)-(19,43)
(19,44)-(19,45)
(19,46)-(19,71)
(19,47)-(19,50)
(19,51)-(19,52)
(19,53)-(19,70)
(19,54)-(19,56)
(19,57)-(19,58)
(19,59)-(19,69)
(19,60)-(19,63)
(19,64)-(19,65)
(19,66)-(19,68)
*)

(* type error slice
(12,2)-(19,73)
(12,2)-(19,73)
(12,2)-(19,73)
(12,2)-(19,73)
(12,2)-(19,73)
(12,2)-(19,73)
(12,2)-(19,73)
(12,2)-(19,73)
(12,2)-(19,73)
(12,2)-(19,73)
(15,23)-(15,32)
(15,24)-(15,25)
(15,26)-(15,27)
(16,25)-(16,34)
(16,26)-(16,27)
(16,28)-(16,29)
(17,23)-(17,25)
(17,23)-(17,47)
(17,26)-(17,27)
(17,35)-(17,46)
(17,36)-(17,38)
(17,39)-(17,40)
(18,21)-(18,23)
(18,21)-(18,36)
(18,24)-(18,25)
(18,26)-(18,36)
(18,31)-(18,32)
(18,33)-(18,35)
(19,28)-(19,30)
(19,28)-(19,73)
(19,31)-(19,32)
(19,40)-(19,72)
(19,41)-(19,43)
(19,44)-(19,45)
(19,53)-(19,70)
(19,54)-(19,56)
(19,57)-(19,58)
(19,59)-(19,69)
(19,64)-(19,65)
(19,66)-(19,68)
*)

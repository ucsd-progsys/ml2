
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Squares of expr
  | Volume of expr* expr* expr;;

let rec exprToString e =
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine e -> "sin(pi*" ^ ((exprToString e) ^ ")")
  | Cosine e -> "cos(pi*" ^ ((exprToString e) ^ ")")
  | Average (x,y) ->
      "((" ^ ((exprToString y) ^ ("+" ^ ((exprToString y) ^ ")/2)")))
  | Times (x,y) -> (exprToString x) ^ ("*" ^ (exprToString y))
  | Thresh (w,x,y,z) ->
      "(" ^
        ((exprToString w) ^
           ("<" ^
              ((exprToString x) ^
                 ("?" ^ ((exprToString y) ^ (":" ^ (exprToString z)))))))
  | Squares e -> (exprToString e) ^ ("*" ^ (exprToString e))
  | Volume (j,k,l) ->
      (exprToString e) ^ ("*" ^ (exprToString e "*" exprToString e));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Squares of expr
  | Volume of expr* expr* expr;;

let rec exprToString e =
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine e -> "sin(pi*" ^ ((exprToString e) ^ ")")
  | Cosine e -> "cos(pi*" ^ ((exprToString e) ^ ")")
  | Average (x,y) ->
      "((" ^ ((exprToString y) ^ ("+" ^ ((exprToString y) ^ ")/2)")))
  | Times (x,y) -> (exprToString x) ^ ("*" ^ (exprToString y))
  | Thresh (w,x,y,z) ->
      "(" ^
        ((exprToString w) ^
           ("<" ^
              ((exprToString x) ^
                 ("?" ^ ((exprToString y) ^ (":" ^ (exprToString z)))))))
  | Squares e -> (exprToString e) ^ ("*" ^ (exprToString e))
  | Volume (j,k,l) ->
      (exprToString e) ^
        ("*" ^ ((exprToString e) ^ ("*" ^ (exprToString e))));;

*)

(* changed spans
(30,34)-(30,46)
(30,34)-(30,67)
(30,49)-(30,52)
(30,53)-(30,65)
(30,66)-(30,67)
*)

(* type error slice
(17,29)-(17,41)
(17,29)-(17,43)
(17,29)-(17,50)
(17,45)-(17,46)
(30,34)-(30,46)
(30,34)-(30,67)
*)

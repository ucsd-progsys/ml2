
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Cube of expr
  | Addition of expr* expr;;

let rec exprToString e =
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine a -> "sin(pi*" ^ ((exprToString a) ^ ")")
  | Cosine a -> "cos(pi*" ^ ((exprToString a) ^ ")")
  | Average (a,b) ->
      "((" ^ ((exprToString a) ^ ("+" ^ ((exprToString b) ^ ")/2)")))
  | Times (a,b) -> (exprToString a) ^ ("*" ^ (exprToString b))
  | Thresh (a,b,c,d) ->
      "(" ^
        ((exprToString a) ^
           ("<" ^
              ((exprToString b) ^
                 ("?" ^ ((exprToString c) ^ (":" ^ ((exprToString d) ^ ")")))))))
  | _ -> "_"
  | Cube a ->
      "(" ^
        ((exprToString a) ^
           ("*" ^ ((exprToString a) ^ ("*" ^ ((exprToString a) ^ ")")))))
  | Addition (a,b) ->
      "(" ^ ((exprToString a) ^ ("+" ^ ((exprToString b) ")")));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Cube of expr
  | Addition of expr* expr;;

let rec exprToString e =
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine a -> "sin(pi*" ^ ((exprToString a) ^ ")")
  | Cosine a -> "cos(pi*" ^ ((exprToString a) ^ ")")
  | Average (a,b) ->
      "((" ^ ((exprToString a) ^ ("+" ^ ((exprToString b) ^ ")/2)")))
  | Times (a,b) -> (exprToString a) ^ ("*" ^ (exprToString b))
  | Thresh (a,b,c,d) ->
      "(" ^
        ((exprToString a) ^
           ("<" ^
              ((exprToString b) ^
                 ("?" ^ ((exprToString c) ^ (":" ^ ((exprToString d) ^ ")")))))))
  | _ -> "_"
  | Cube a ->
      "(" ^
        ((exprToString a) ^
           ("*" ^ ((exprToString a) ^ ("*" ^ ((exprToString a) ^ ")")))))
  | Addition (a,b) ->
      "(" ^ ((exprToString a) ^ ("+" ^ ((exprToString b) ^ ")")));;

*)

(* changed spans
(34,42)-(34,56)
(34,42)-(34,61)
*)

(* type error slice
(17,29)-(17,41)
(17,29)-(17,43)
(17,29)-(17,50)
(17,45)-(17,46)
(34,42)-(34,54)
(34,42)-(34,56)
(34,42)-(34,61)
*)
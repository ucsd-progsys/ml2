
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Circ of expr* expr
  | NatLog of expr;;

let rec exprToString e =
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine sine -> "sin(pi*" ^ ((exprToString sine) ^ ")")
  | Cosine cosine -> "cos(pi*" ^ ((exprToString cosine) ^ ")")
  | Average (e1,e2) ->
      "((" ^ ((exprToString e1) ^ ("+" ^ ((exprToString e2) ^ ")/2)")))
  | Times (t1,t2) -> (exprToString t1) ^ ("*" ^ (exprToString t2))
  | Thresh (th1,th2,th3,th4) ->
      "(" ^
        ((exprToString th1) ^
           ("<" ^
              ((exprToString th2) ^
                 ("?" ^
                    ((exprToString th3) ^ (":" ^ ((exprToString th4) ^ ")")))))))
  | Circ (circ1,circ2) ->
      "(" ^ ((exprToString circ1) ^ ("^2+" ^ ((exprToString circ2) ^ ")")))
  | NatLog nlog -> "ln(" ^ (nlog ^ ")");;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Circ of expr* expr
  | NatLog of expr;;

let rec exprToString e =
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine sine -> "sin(pi*" ^ ((exprToString sine) ^ ")")
  | Cosine cosine -> "cos(pi*" ^ ((exprToString cosine) ^ ")")
  | Average (e1,e2) ->
      "((" ^ ((exprToString e1) ^ ("+" ^ ((exprToString e2) ^ ")/2)")))
  | Times (t1,t2) -> (exprToString t1) ^ ("*" ^ (exprToString t2))
  | Thresh (th1,th2,th3,th4) ->
      "(" ^
        ((exprToString th1) ^
           ("<" ^
              ((exprToString th2) ^
                 ("?" ^
                    ((exprToString th3) ^ (":" ^ ((exprToString th4) ^ ")")))))))
  | Circ (circ1,circ2) ->
      "(" ^ ((exprToString circ1) ^ ("^2+" ^ ((exprToString circ2) ^ ")")))
  | NatLog nlog -> "ln(" ^ ((exprToString nlog) ^ ")");;

*)

(* changed spans
(31,28)-(31,32)
*)

(* type error slice
(14,2)-(31,39)
(31,27)-(31,39)
(31,28)-(31,32)
(31,33)-(31,34)
*)

(* all spans
(13,21)-(31,39)
(14,2)-(31,39)
(14,8)-(14,9)
(15,13)-(15,16)
(16,13)-(16,16)
(17,17)-(17,56)
(17,27)-(17,28)
(17,17)-(17,26)
(17,29)-(17,56)
(17,50)-(17,51)
(17,30)-(17,49)
(17,31)-(17,43)
(17,44)-(17,48)
(17,52)-(17,55)
(18,21)-(18,62)
(18,31)-(18,32)
(18,21)-(18,30)
(18,33)-(18,62)
(18,56)-(18,57)
(18,34)-(18,55)
(18,35)-(18,47)
(18,48)-(18,54)
(18,58)-(18,61)
(20,6)-(20,71)
(20,11)-(20,12)
(20,6)-(20,10)
(20,13)-(20,71)
(20,32)-(20,33)
(20,14)-(20,31)
(20,15)-(20,27)
(20,28)-(20,30)
(20,34)-(20,70)
(20,39)-(20,40)
(20,35)-(20,38)
(20,41)-(20,69)
(20,60)-(20,61)
(20,42)-(20,59)
(20,43)-(20,55)
(20,56)-(20,58)
(20,62)-(20,68)
(21,21)-(21,66)
(21,39)-(21,40)
(21,21)-(21,38)
(21,22)-(21,34)
(21,35)-(21,37)
(21,41)-(21,66)
(21,46)-(21,47)
(21,42)-(21,45)
(21,48)-(21,65)
(21,49)-(21,61)
(21,62)-(21,64)
(23,6)-(28,81)
(23,10)-(23,11)
(23,6)-(23,9)
(24,8)-(28,81)
(24,28)-(24,29)
(24,9)-(24,27)
(24,10)-(24,22)
(24,23)-(24,26)
(25,11)-(28,80)
(25,16)-(25,17)
(25,12)-(25,15)
(26,14)-(28,79)
(26,34)-(26,35)
(26,15)-(26,33)
(26,16)-(26,28)
(26,29)-(26,32)
(27,17)-(28,78)
(27,22)-(27,23)
(27,18)-(27,21)
(28,20)-(28,77)
(28,40)-(28,41)
(28,21)-(28,39)
(28,22)-(28,34)
(28,35)-(28,38)
(28,42)-(28,76)
(28,47)-(28,48)
(28,43)-(28,46)
(28,49)-(28,75)
(28,69)-(28,70)
(28,50)-(28,68)
(28,51)-(28,63)
(28,64)-(28,67)
(28,71)-(28,74)
(30,6)-(30,75)
(30,10)-(30,11)
(30,6)-(30,9)
(30,12)-(30,75)
(30,34)-(30,35)
(30,13)-(30,33)
(30,14)-(30,26)
(30,27)-(30,32)
(30,36)-(30,74)
(30,43)-(30,44)
(30,37)-(30,42)
(30,45)-(30,73)
(30,67)-(30,68)
(30,46)-(30,66)
(30,47)-(30,59)
(30,60)-(30,65)
(30,69)-(30,72)
(31,19)-(31,39)
(31,25)-(31,26)
(31,19)-(31,24)
(31,27)-(31,39)
(31,33)-(31,34)
(31,28)-(31,32)
(31,35)-(31,38)
*)

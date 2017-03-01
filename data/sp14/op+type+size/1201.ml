
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec exprToString ex =
  match ex with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine e -> "sin(pi*" ^ ((exprToString e) ^ ")")
  | Cosine e -> "cos(pi*" ^ ((exprToString e) ^ ")")
  | Average (e1,e2) ->
      "((" ^ ((exprToString e1) ^ (" + " ^ ((exprToString e2) ^ ")/2)")))
  | Times (e1,e2) -> (exprToString e1) ^ ("*" ^ (exprToString e2))
  | Thresh (e1,e2,e3,e4) ->
      "(" ^
        ((exprToString e1) ^
           ("<" ^
              ((exprToString e2) ^
                 ("?" ^
                    ((exprToString e3) ^ (":" ^ ((exprToString e4) ^ ")")))))))
  | _ -> "" ^ (ex ^ "");;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec exprToString ex =
  match ex with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine e -> "sin(pi*" ^ ((exprToString e) ^ ")")
  | Cosine e -> "cos(pi*" ^ ((exprToString e) ^ ")")
  | Average (e1,e2) ->
      "((" ^ ((exprToString e1) ^ (" + " ^ ((exprToString e2) ^ ")/2)")))
  | Times (e1,e2) -> (exprToString e1) ^ ("*" ^ (exprToString e2))
  | Thresh (e1,e2,e3,e4) ->
      "(" ^
        ((exprToString e1) ^
           ("<" ^
              ((exprToString e2) ^
                 ("?" ^
                    ((exprToString e3) ^ (":" ^ ((exprToString e4) ^ ")")))))))
  | _ -> "";;

*)

(* changed spans
(27,9)-(27,23)
(27,12)-(27,13)
(27,14)-(27,23)
*)

(* type error slice
(11,3)-(27,25)
(11,21)-(27,23)
(12,2)-(27,23)
(12,2)-(27,23)
(12,2)-(27,23)
(12,2)-(27,23)
(12,2)-(27,23)
(12,2)-(27,23)
(12,2)-(27,23)
(12,2)-(27,23)
(12,2)-(27,23)
(12,2)-(27,23)
(12,2)-(27,23)
(12,2)-(27,23)
(12,2)-(27,23)
(12,2)-(27,23)
(12,2)-(27,23)
(12,8)-(12,10)
(15,27)-(15,43)
(15,28)-(15,40)
(15,41)-(15,42)
(27,14)-(27,23)
(27,15)-(27,17)
(27,18)-(27,19)
*)

(* all spans
(11,21)-(27,23)
(12,2)-(27,23)
(12,8)-(12,10)
(13,13)-(13,16)
(14,13)-(14,16)
(15,14)-(15,50)
(15,24)-(15,25)
(15,14)-(15,23)
(15,26)-(15,50)
(15,44)-(15,45)
(15,27)-(15,43)
(15,28)-(15,40)
(15,41)-(15,42)
(15,46)-(15,49)
(16,16)-(16,52)
(16,26)-(16,27)
(16,16)-(16,25)
(16,28)-(16,52)
(16,46)-(16,47)
(16,29)-(16,45)
(16,30)-(16,42)
(16,43)-(16,44)
(16,48)-(16,51)
(18,6)-(18,73)
(18,11)-(18,12)
(18,6)-(18,10)
(18,13)-(18,73)
(18,32)-(18,33)
(18,14)-(18,31)
(18,15)-(18,27)
(18,28)-(18,30)
(18,34)-(18,72)
(18,41)-(18,42)
(18,35)-(18,40)
(18,43)-(18,71)
(18,62)-(18,63)
(18,44)-(18,61)
(18,45)-(18,57)
(18,58)-(18,60)
(18,64)-(18,70)
(19,21)-(19,66)
(19,39)-(19,40)
(19,21)-(19,38)
(19,22)-(19,34)
(19,35)-(19,37)
(19,41)-(19,66)
(19,46)-(19,47)
(19,42)-(19,45)
(19,48)-(19,65)
(19,49)-(19,61)
(19,62)-(19,64)
(21,6)-(26,79)
(21,10)-(21,11)
(21,6)-(21,9)
(22,8)-(26,79)
(22,27)-(22,28)
(22,9)-(22,26)
(22,10)-(22,22)
(22,23)-(22,25)
(23,11)-(26,78)
(23,16)-(23,17)
(23,12)-(23,15)
(24,14)-(26,77)
(24,33)-(24,34)
(24,15)-(24,32)
(24,16)-(24,28)
(24,29)-(24,31)
(25,17)-(26,76)
(25,22)-(25,23)
(25,18)-(25,21)
(26,20)-(26,75)
(26,39)-(26,40)
(26,21)-(26,38)
(26,22)-(26,34)
(26,35)-(26,37)
(26,41)-(26,74)
(26,46)-(26,47)
(26,42)-(26,45)
(26,48)-(26,73)
(26,67)-(26,68)
(26,49)-(26,66)
(26,50)-(26,62)
(26,63)-(26,65)
(26,69)-(26,72)
(27,9)-(27,23)
(27,12)-(27,13)
(27,9)-(27,11)
(27,14)-(27,23)
(27,18)-(27,19)
(27,15)-(27,17)
(27,20)-(27,22)
*)

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | CosE of expr* expr* expr;;

let e_num = 2.718281828;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine x1 -> sin (pi *. (eval (x1, x, y)))
  | Cosine x1 -> cos (pi *. (eval (x1, x, y)))
  | Average (x1,x2) -> ((eval (x1, x, y)) +. (eval (x2, x, y))) /. 2.
  | Times (x1,x2) -> (eval (x1, x, y)) *. (eval (x2, x, y))
  | Thresh (x1,x2,x3,x4) ->
      if (eval (x1, x, y)) < (eval (x2, x, y))
      then eval (x3, x, y)
      else eval (x4, x, y)
  | CosE (x1,x2,x3) ->
      (cos ((pi *. (eval (x1, x, y))) *. (eval (x2, x, y)))) *.
        (e_num ** ((- pi) *. ((eval (x3, x, y)) ** 2.)));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | CosE of expr* expr* expr;;

let e_num = 2.718281828;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine x1 -> sin (pi *. (eval (x1, x, y)))
  | Cosine x1 -> cos (pi *. (eval (x1, x, y)))
  | Average (x1,x2) -> ((eval (x1, x, y)) +. (eval (x2, x, y))) /. 2.
  | Times (x1,x2) -> (eval (x1, x, y)) *. (eval (x2, x, y))
  | Thresh (x1,x2,x3,x4) ->
      if (eval (x1, x, y)) < (eval (x2, x, y))
      then eval (x3, x, y)
      else eval (x4, x, y)
  | CosE (x1,x2,x3) ->
      (cos ((pi *. (eval (x1, x, y))) *. (eval (x2, x, y)))) *.
        (e_num ** ((-. pi) *. ((eval (x3, x, y)) ** 2.)));;

*)

(* changed spans
(30,19)-(30,25)
*)

(* type error slice
(14,3)-(14,28)
(14,9)-(14,26)
(30,18)-(30,55)
(30,19)-(30,25)
(30,19)-(30,25)
(30,22)-(30,24)
*)

(* all spans
(12,12)-(12,23)
(14,9)-(14,26)
(14,9)-(14,12)
(14,16)-(14,26)
(14,17)-(14,21)
(14,22)-(14,25)
(16,14)-(30,56)
(17,2)-(30,56)
(17,8)-(17,9)
(18,13)-(18,14)
(19,13)-(19,14)
(20,15)-(20,44)
(20,15)-(20,18)
(20,19)-(20,44)
(20,20)-(20,22)
(20,26)-(20,43)
(20,27)-(20,31)
(20,32)-(20,42)
(20,33)-(20,35)
(20,37)-(20,38)
(20,40)-(20,41)
(21,17)-(21,46)
(21,17)-(21,20)
(21,21)-(21,46)
(21,22)-(21,24)
(21,28)-(21,45)
(21,29)-(21,33)
(21,34)-(21,44)
(21,35)-(21,37)
(21,39)-(21,40)
(21,42)-(21,43)
(22,23)-(22,69)
(22,23)-(22,63)
(22,24)-(22,41)
(22,25)-(22,29)
(22,30)-(22,40)
(22,31)-(22,33)
(22,35)-(22,36)
(22,38)-(22,39)
(22,45)-(22,62)
(22,46)-(22,50)
(22,51)-(22,61)
(22,52)-(22,54)
(22,56)-(22,57)
(22,59)-(22,60)
(22,67)-(22,69)
(23,21)-(23,59)
(23,21)-(23,38)
(23,22)-(23,26)
(23,27)-(23,37)
(23,28)-(23,30)
(23,32)-(23,33)
(23,35)-(23,36)
(23,42)-(23,59)
(23,43)-(23,47)
(23,48)-(23,58)
(23,49)-(23,51)
(23,53)-(23,54)
(23,56)-(23,57)
(25,6)-(27,26)
(25,9)-(25,46)
(25,9)-(25,26)
(25,10)-(25,14)
(25,15)-(25,25)
(25,16)-(25,18)
(25,20)-(25,21)
(25,23)-(25,24)
(25,29)-(25,46)
(25,30)-(25,34)
(25,35)-(25,45)
(25,36)-(25,38)
(25,40)-(25,41)
(25,43)-(25,44)
(26,11)-(26,26)
(26,11)-(26,15)
(26,16)-(26,26)
(26,17)-(26,19)
(26,21)-(26,22)
(26,24)-(26,25)
(27,11)-(27,26)
(27,11)-(27,15)
(27,16)-(27,26)
(27,17)-(27,19)
(27,21)-(27,22)
(27,24)-(27,25)
(29,6)-(30,56)
(29,6)-(29,60)
(29,7)-(29,10)
(29,11)-(29,59)
(29,12)-(29,37)
(29,13)-(29,15)
(29,19)-(29,36)
(29,20)-(29,24)
(29,25)-(29,35)
(29,26)-(29,28)
(29,30)-(29,31)
(29,33)-(29,34)
(29,41)-(29,58)
(29,42)-(29,46)
(29,47)-(29,57)
(29,48)-(29,50)
(29,52)-(29,53)
(29,55)-(29,56)
(30,8)-(30,56)
(30,15)-(30,17)
(30,9)-(30,14)
(30,18)-(30,55)
(30,19)-(30,25)
(30,22)-(30,24)
(30,29)-(30,54)
(30,48)-(30,50)
(30,30)-(30,47)
(30,31)-(30,35)
(30,36)-(30,46)
(30,37)-(30,39)
(30,41)-(30,42)
(30,44)-(30,45)
(30,51)-(30,53)
*)

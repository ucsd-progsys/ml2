
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Inverse of expr
  | Max of expr* expr
  | Range of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine a -> sin (pi *. (eval (a, x, y)))
  | Cosine a -> cos (pi *. (eval (a, x, y)))
  | Average (a,b) -> ((eval (a, x, y)) +. (eval (b, x, y))) /. 2.
  | Times (a,b) -> (eval (a, x, y)) *. (eval (b, x, y))
  | Thresh (a,b,c,d) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (c, x, y)
      else eval (d, x, y)
  | Inverse a ->
      let result = eval a in if result = 0. then 0 else 1 /. result
  | Max (a,b) ->
      let aResult = eval a in
      let bResult = eval b in if aResult > bResult then aResult else bResult
  | Range (a,b,c) ->
      let aResult = eval a in
      let bResult = eval b in
      let cResult = eval c in
      if aResult < bResult
      then bResult
      else if aResult < cResult then cResult else aResult;;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Inverse of expr
  | Max of expr* expr
  | Range of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine a -> sin (pi *. (eval (a, x, y)))
  | Cosine a -> cos (pi *. (eval (a, x, y)))
  | Average (a,b) -> ((eval (a, x, y)) +. (eval (b, x, y))) /. 2.
  | Times (a,b) -> (eval (a, x, y)) *. (eval (b, x, y))
  | Thresh (a,b,c,d) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (c, x, y)
      else eval (d, x, y)
  | Inverse a ->
      let result = eval (a, x, y) in if result = 0. then 0. else 1. /. result
  | Max (a,b) ->
      let aResult = eval (a, x, y) in
      let bResult = eval (b, x, y) in
      if aResult > bResult then aResult else bResult
  | Range (a,b,c) ->
      let aResult = eval (a, x, y) in
      let bResult = eval (b, x, y) in
      let cResult = eval (c, x, y) in
      if aResult < bResult
      then bResult
      else if aResult < cResult then cResult else aResult;;

*)

(* changed spans
(29,24)-(29,25)
(29,29)-(29,67)
(29,49)-(29,50)
(29,56)-(29,57)
(31,25)-(31,26)
(32,6)-(32,76)
(32,25)-(32,26)
(32,30)-(32,76)
(34,6)-(39,57)
(34,25)-(34,26)
(35,6)-(39,57)
(35,20)-(35,26)
(35,25)-(35,26)
(36,6)-(39,57)
(36,20)-(36,26)
(36,25)-(36,26)
(37,6)-(39,57)
*)

(* type error slice
(17,2)-(39,57)
(17,2)-(39,57)
(17,2)-(39,57)
(17,2)-(39,57)
(17,2)-(39,57)
(17,2)-(39,57)
(17,2)-(39,57)
(17,2)-(39,57)
(20,14)-(20,17)
(20,14)-(20,42)
(20,25)-(20,41)
(20,26)-(20,30)
(20,31)-(20,40)
(29,6)-(29,67)
(29,19)-(29,23)
(29,19)-(29,25)
(29,24)-(29,25)
(29,29)-(29,67)
(29,29)-(29,67)
(29,49)-(29,50)
(29,56)-(29,57)
(29,56)-(29,67)
(29,56)-(29,67)
(31,20)-(31,24)
(31,20)-(31,26)
(31,25)-(31,26)
(32,20)-(32,24)
(32,20)-(32,26)
(32,25)-(32,26)
(34,20)-(34,24)
(34,20)-(34,26)
(34,25)-(34,26)
(35,20)-(35,24)
(35,20)-(35,26)
(35,25)-(35,26)
(36,20)-(36,24)
(36,20)-(36,26)
(36,25)-(36,26)
*)

(* all spans
(14,9)-(14,26)
(14,9)-(14,12)
(14,16)-(14,26)
(14,17)-(14,21)
(14,22)-(14,25)
(16,14)-(39,57)
(17,2)-(39,57)
(17,8)-(17,9)
(18,13)-(18,14)
(19,13)-(19,14)
(20,14)-(20,42)
(20,14)-(20,17)
(20,18)-(20,42)
(20,19)-(20,21)
(20,25)-(20,41)
(20,26)-(20,30)
(20,31)-(20,40)
(20,32)-(20,33)
(20,35)-(20,36)
(20,38)-(20,39)
(21,16)-(21,44)
(21,16)-(21,19)
(21,20)-(21,44)
(21,21)-(21,23)
(21,27)-(21,43)
(21,28)-(21,32)
(21,33)-(21,42)
(21,34)-(21,35)
(21,37)-(21,38)
(21,40)-(21,41)
(22,21)-(22,65)
(22,21)-(22,59)
(22,22)-(22,38)
(22,23)-(22,27)
(22,28)-(22,37)
(22,29)-(22,30)
(22,32)-(22,33)
(22,35)-(22,36)
(22,42)-(22,58)
(22,43)-(22,47)
(22,48)-(22,57)
(22,49)-(22,50)
(22,52)-(22,53)
(22,55)-(22,56)
(22,63)-(22,65)
(23,19)-(23,55)
(23,19)-(23,35)
(23,20)-(23,24)
(23,25)-(23,34)
(23,26)-(23,27)
(23,29)-(23,30)
(23,32)-(23,33)
(23,39)-(23,55)
(23,40)-(23,44)
(23,45)-(23,54)
(23,46)-(23,47)
(23,49)-(23,50)
(23,52)-(23,53)
(25,6)-(27,25)
(25,9)-(25,44)
(25,9)-(25,25)
(25,10)-(25,14)
(25,15)-(25,24)
(25,16)-(25,17)
(25,19)-(25,20)
(25,22)-(25,23)
(25,28)-(25,44)
(25,29)-(25,33)
(25,34)-(25,43)
(25,35)-(25,36)
(25,38)-(25,39)
(25,41)-(25,42)
(26,11)-(26,25)
(26,11)-(26,15)
(26,16)-(26,25)
(26,17)-(26,18)
(26,20)-(26,21)
(26,23)-(26,24)
(27,11)-(27,25)
(27,11)-(27,15)
(27,16)-(27,25)
(27,17)-(27,18)
(27,20)-(27,21)
(27,23)-(27,24)
(29,6)-(29,67)
(29,19)-(29,25)
(29,19)-(29,23)
(29,24)-(29,25)
(29,29)-(29,67)
(29,32)-(29,43)
(29,32)-(29,38)
(29,41)-(29,43)
(29,49)-(29,50)
(29,56)-(29,67)
(29,56)-(29,57)
(29,61)-(29,67)
(31,6)-(32,76)
(31,20)-(31,26)
(31,20)-(31,24)
(31,25)-(31,26)
(32,6)-(32,76)
(32,20)-(32,26)
(32,20)-(32,24)
(32,25)-(32,26)
(32,30)-(32,76)
(32,33)-(32,50)
(32,33)-(32,40)
(32,43)-(32,50)
(32,56)-(32,63)
(32,69)-(32,76)
(34,6)-(39,57)
(34,20)-(34,26)
(34,20)-(34,24)
(34,25)-(34,26)
(35,6)-(39,57)
(35,20)-(35,26)
(35,20)-(35,24)
(35,25)-(35,26)
(36,6)-(39,57)
(36,20)-(36,26)
(36,20)-(36,24)
(36,25)-(36,26)
(37,6)-(39,57)
(37,9)-(37,26)
(37,9)-(37,16)
(37,19)-(37,26)
(38,11)-(38,18)
(39,11)-(39,57)
(39,14)-(39,31)
(39,14)-(39,21)
(39,24)-(39,31)
(39,37)-(39,44)
(39,50)-(39,57)
*)

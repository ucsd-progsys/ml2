
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | ECosSin of expr* expr
  | SinLog of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine i -> sin (pi *. (eval (i, x, y)))
  | Cosine i -> cos (pi *. (eval (i, x, y)))
  | Average (i1,i2) -> ((eval (i1, x, y)) +. (eval (i2, x, y))) /. 2.0
  | Times (i1,i2) -> (eval (i1, x, y)) *. (eval (i2, x, y))
  | Thresh (i1,i2,i3,i4) ->
      if (eval (i1, x, y)) < (eval (i2, x, y))
      then eval (i3, x, y)
      else eval (i4, x, y)
  | ECosSin (a,b) ->
      (2.71 **
         (((sin (pi *. (eval (a, x, y)))) +. (cos (pi *. (eval (b, x, y)))))
            -. 1.0))
        -. 1.0
  | SinLog (a',b',c) ->
      let a = abs_float (eval (a', x, y)) in
      let b = abs_float (eval (b', x, y)) in
      let my_log l' = let l = min 0.1 l' in (log l) / (log 10.0) in
      if (eval (c, x, y)) < 0.0
      then ((my_log (a *. 100.0)) ** (sin ((pi *. b) *. 100.0))) -. 1.0
      else
        (-1.0) *.
          (((my_log (b *. 100.0)) ** (pi *. (sin (a *. 100.0)))) -. 1.0);;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | ECosSin of expr* expr
  | SinLog of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine i -> sin (pi *. (eval (i, x, y)))
  | Cosine i -> cos (pi *. (eval (i, x, y)))
  | Average (i1,i2) -> ((eval (i1, x, y)) +. (eval (i2, x, y))) /. 2.0
  | Times (i1,i2) -> (eval (i1, x, y)) *. (eval (i2, x, y))
  | Thresh (i1,i2,i3,i4) ->
      if (eval (i1, x, y)) < (eval (i2, x, y))
      then eval (i3, x, y)
      else eval (i4, x, y)
  | ECosSin (a,b) ->
      (2.71 **
         (((sin (pi *. (eval (a, x, y)))) +. (cos (pi *. (eval (b, x, y)))))
            -. 1.0))
        -. 1.0
  | SinLog (a',b',c) ->
      let a = abs_float (eval (a', x, y)) in
      let b = abs_float (eval (b', x, y)) in
      let my_log l' = let l = min 0.1 l' in (log l) /. (log 10.0) in
      if (eval (c, x, y)) < 0.0
      then ((my_log (a *. 100.0)) ** (sin ((pi *. b) *. 100.0))) -. 1.0
      else
        (-1.0) *.
          (((my_log (b *. 100.0)) ** (pi *. (sin (a *. 100.0)))) -. 1.0);;

*)

(* changed spans
(35,44)-(35,64)
*)

(* type error slice
(35,6)-(40,72)
(35,17)-(35,64)
(35,22)-(35,64)
(35,44)-(35,51)
(35,44)-(35,64)
(35,45)-(35,48)
(35,54)-(35,64)
(35,55)-(35,58)
(37,11)-(37,64)
(37,12)-(37,33)
(37,13)-(37,19)
(37,34)-(37,36)
(39,8)-(39,14)
(39,8)-(40,72)
(39,10)-(39,13)
(40,11)-(40,64)
(40,12)-(40,33)
(40,13)-(40,19)
(40,34)-(40,36)
*)

(* all spans
(13,9)-(13,26)
(13,9)-(13,12)
(13,16)-(13,26)
(13,17)-(13,21)
(13,22)-(13,25)
(15,14)-(40,72)
(16,2)-(40,72)
(16,8)-(16,9)
(17,13)-(17,14)
(18,13)-(18,14)
(19,14)-(19,42)
(19,14)-(19,17)
(19,18)-(19,42)
(19,19)-(19,21)
(19,25)-(19,41)
(19,26)-(19,30)
(19,31)-(19,40)
(19,32)-(19,33)
(19,35)-(19,36)
(19,38)-(19,39)
(20,16)-(20,44)
(20,16)-(20,19)
(20,20)-(20,44)
(20,21)-(20,23)
(20,27)-(20,43)
(20,28)-(20,32)
(20,33)-(20,42)
(20,34)-(20,35)
(20,37)-(20,38)
(20,40)-(20,41)
(21,23)-(21,70)
(21,23)-(21,63)
(21,24)-(21,41)
(21,25)-(21,29)
(21,30)-(21,40)
(21,31)-(21,33)
(21,35)-(21,36)
(21,38)-(21,39)
(21,45)-(21,62)
(21,46)-(21,50)
(21,51)-(21,61)
(21,52)-(21,54)
(21,56)-(21,57)
(21,59)-(21,60)
(21,67)-(21,70)
(22,21)-(22,59)
(22,21)-(22,38)
(22,22)-(22,26)
(22,27)-(22,37)
(22,28)-(22,30)
(22,32)-(22,33)
(22,35)-(22,36)
(22,42)-(22,59)
(22,43)-(22,47)
(22,48)-(22,58)
(22,49)-(22,51)
(22,53)-(22,54)
(22,56)-(22,57)
(24,6)-(26,26)
(24,9)-(24,46)
(24,9)-(24,26)
(24,10)-(24,14)
(24,15)-(24,25)
(24,16)-(24,18)
(24,20)-(24,21)
(24,23)-(24,24)
(24,29)-(24,46)
(24,30)-(24,34)
(24,35)-(24,45)
(24,36)-(24,38)
(24,40)-(24,41)
(24,43)-(24,44)
(25,11)-(25,26)
(25,11)-(25,15)
(25,16)-(25,26)
(25,17)-(25,19)
(25,21)-(25,22)
(25,24)-(25,25)
(26,11)-(26,26)
(26,11)-(26,15)
(26,16)-(26,26)
(26,17)-(26,19)
(26,21)-(26,22)
(26,24)-(26,25)
(28,6)-(31,14)
(28,6)-(30,20)
(28,12)-(28,14)
(28,7)-(28,11)
(29,9)-(30,19)
(29,10)-(29,76)
(29,11)-(29,41)
(29,12)-(29,15)
(29,16)-(29,40)
(29,17)-(29,19)
(29,23)-(29,39)
(29,24)-(29,28)
(29,29)-(29,38)
(29,30)-(29,31)
(29,33)-(29,34)
(29,36)-(29,37)
(29,45)-(29,75)
(29,46)-(29,49)
(29,50)-(29,74)
(29,51)-(29,53)
(29,57)-(29,73)
(29,58)-(29,62)
(29,63)-(29,72)
(29,64)-(29,65)
(29,67)-(29,68)
(29,70)-(29,71)
(30,15)-(30,18)
(31,11)-(31,14)
(33,6)-(40,72)
(33,14)-(33,41)
(33,14)-(33,23)
(33,24)-(33,41)
(33,25)-(33,29)
(33,30)-(33,40)
(33,31)-(33,33)
(33,35)-(33,36)
(33,38)-(33,39)
(34,6)-(40,72)
(34,14)-(34,41)
(34,14)-(34,23)
(34,24)-(34,41)
(34,25)-(34,29)
(34,30)-(34,40)
(34,31)-(34,33)
(34,35)-(34,36)
(34,38)-(34,39)
(35,6)-(40,72)
(35,17)-(35,64)
(35,22)-(35,64)
(35,30)-(35,40)
(35,30)-(35,33)
(35,34)-(35,37)
(35,38)-(35,40)
(35,44)-(35,64)
(35,44)-(35,51)
(35,45)-(35,48)
(35,49)-(35,50)
(35,54)-(35,64)
(35,55)-(35,58)
(35,59)-(35,63)
(36,6)-(40,72)
(36,9)-(36,31)
(36,9)-(36,25)
(36,10)-(36,14)
(36,15)-(36,24)
(36,16)-(36,17)
(36,19)-(36,20)
(36,22)-(36,23)
(36,28)-(36,31)
(37,11)-(37,71)
(37,11)-(37,64)
(37,34)-(37,36)
(37,12)-(37,33)
(37,13)-(37,19)
(37,20)-(37,32)
(37,21)-(37,22)
(37,26)-(37,31)
(37,37)-(37,63)
(37,38)-(37,41)
(37,42)-(37,62)
(37,43)-(37,52)
(37,44)-(37,46)
(37,50)-(37,51)
(37,56)-(37,61)
(37,68)-(37,71)
(39,8)-(40,72)
(39,8)-(39,14)
(39,10)-(39,13)
(40,10)-(40,72)
(40,11)-(40,64)
(40,34)-(40,36)
(40,12)-(40,33)
(40,13)-(40,19)
(40,20)-(40,32)
(40,21)-(40,22)
(40,26)-(40,31)
(40,37)-(40,63)
(40,38)-(40,40)
(40,44)-(40,62)
(40,45)-(40,48)
(40,49)-(40,61)
(40,50)-(40,51)
(40,55)-(40,60)
(40,68)-(40,71)
*)

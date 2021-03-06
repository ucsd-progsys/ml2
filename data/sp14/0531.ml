
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
  | SinLog (a,b,c) ->
      if (eval (c, x, y)) < 0.0
      then
        ((log ((eval (a, x, y)) *. 100)) ** (sin ((eval (b, x, y)) *. 100)))
          -. 1.0
      else
        (-1.0) *.
          (((log ((eval (b, x, y)) *. 100)) **
              (sin ((eval (a, x, y)) *. 100)))
             -. 1.0);;


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
  | SinLog (a,b,c) ->
      if (eval (c, x, y)) < 0.0
      then
        ((log ((eval (a, x, y)) *. 100.0)) **
           (sin ((eval (b, x, y)) *. 100.0)))
          -. 1.0
      else
        (-1.0) *.
          (((log ((eval (b, x, y)) *. 100.0)) **
              (sin ((eval (a, x, y)) *. 100.0)))
             -. 1.0);;

*)

(* changed spans
(35,35)-(35,38)
(35,70)-(35,73)
(39,38)-(39,41)
(40,40)-(40,43)
*)

(* type error slice
(35,14)-(35,39)
(35,35)-(35,38)
(35,49)-(35,74)
(35,70)-(35,73)
(38,8)-(38,14)
(38,8)-(41,20)
(38,10)-(38,13)
(39,17)-(39,42)
(39,38)-(39,41)
(40,19)-(40,44)
(40,40)-(40,43)
*)

(* all spans
(13,9)-(13,26)
(13,9)-(13,12)
(13,16)-(13,26)
(13,17)-(13,21)
(13,22)-(13,25)
(15,14)-(41,20)
(16,2)-(41,20)
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
(33,6)-(41,20)
(33,9)-(33,31)
(33,9)-(33,25)
(33,10)-(33,14)
(33,15)-(33,24)
(33,16)-(33,17)
(33,19)-(33,20)
(33,22)-(33,23)
(33,28)-(33,31)
(35,8)-(36,16)
(35,8)-(35,76)
(35,41)-(35,43)
(35,9)-(35,40)
(35,10)-(35,13)
(35,14)-(35,39)
(35,15)-(35,31)
(35,16)-(35,20)
(35,21)-(35,30)
(35,22)-(35,23)
(35,25)-(35,26)
(35,28)-(35,29)
(35,35)-(35,38)
(35,44)-(35,75)
(35,45)-(35,48)
(35,49)-(35,74)
(35,50)-(35,66)
(35,51)-(35,55)
(35,56)-(35,65)
(35,57)-(35,58)
(35,60)-(35,61)
(35,63)-(35,64)
(35,70)-(35,73)
(36,13)-(36,16)
(38,8)-(41,20)
(38,8)-(38,14)
(38,10)-(38,13)
(39,10)-(41,20)
(39,11)-(40,46)
(39,44)-(39,46)
(39,12)-(39,43)
(39,13)-(39,16)
(39,17)-(39,42)
(39,18)-(39,34)
(39,19)-(39,23)
(39,24)-(39,33)
(39,25)-(39,26)
(39,28)-(39,29)
(39,31)-(39,32)
(39,38)-(39,41)
(40,14)-(40,45)
(40,15)-(40,18)
(40,19)-(40,44)
(40,20)-(40,36)
(40,21)-(40,25)
(40,26)-(40,35)
(40,27)-(40,28)
(40,30)-(40,31)
(40,33)-(40,34)
(40,40)-(40,43)
(41,16)-(41,19)
*)


type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCosine e = Cosine e;;

let buildSine e = Sine e;;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildTimes (e1,e2) = Times (e1, e2);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  let expChooser (r,d) =
    match r with
    | 0 -> buildX ()
    | 1 -> buildY ()
    | 2 -> buildSine (build (rand, (d - 1)))
    | 3 -> buildCosine (build (rand, (d - 1)))
    | 4 -> buildAverage ((build (rand, (d - 1))), (build (rand, (d - 1))))
    | 5 -> buildTimes ((build (rand, (d - 1))), (build (rand, (d - 1))))
    | 6 ->
        buildThresh
          ((build (rand, (d - 1))), (build (rand, (d - 1))),
            (build (rand, (d - 1))), (build (rand, (d - 1)))) in
  if depth < 1 then expChooser rand (0, 2) else expChooser rand (2, 7);;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCosine e = Cosine e;;

let buildSine e = Sine e;;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildTimes (e1,e2) = Times (e1, e2);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  let num = if depth < 1 then rand (0, 2) else rand (2, 7) in
  match num with
  | 0 -> buildX ()
  | 1 -> buildY ()
  | 2 -> buildSine (build (rand, (depth - 1)))
  | 3 -> buildCosine (build (rand, (depth - 1)))
  | 4 ->
      buildAverage ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
  | 5 ->
      buildTimes ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
  | 6 ->
      buildThresh
        ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
          (build (rand, (depth - 1))), (build (rand, (depth - 1))));;

*)

(* changed spans
(26,2)-(38,70)
(26,18)-(37,61)
(27,4)-(37,61)
(27,10)-(27,11)
(30,36)-(30,37)
(31,38)-(31,39)
(32,40)-(32,41)
(32,65)-(32,66)
(33,38)-(33,39)
(33,63)-(33,64)
(36,26)-(36,27)
(36,51)-(36,52)
(37,27)-(37,28)
(37,52)-(37,53)
(37,56)-(37,57)
(38,2)-(38,70)
(38,5)-(38,14)
(38,20)-(38,30)
(38,20)-(38,42)
(38,31)-(38,35)
(38,36)-(38,42)
(38,37)-(38,38)
(38,40)-(38,41)
(38,48)-(38,58)
(38,48)-(38,70)
(38,59)-(38,63)
(38,64)-(38,70)
(38,65)-(38,66)
(38,68)-(38,69)
*)

(* type error slice
(21,3)-(21,22)
(21,11)-(21,20)
(21,16)-(21,20)
(26,2)-(38,70)
(26,18)-(37,61)
(27,4)-(37,61)
(28,11)-(28,17)
(28,11)-(28,20)
(38,20)-(38,30)
(38,20)-(38,42)
(38,48)-(38,58)
(38,48)-(38,70)
*)

(* all spans
(11,18)-(11,43)
(11,27)-(11,43)
(11,36)-(11,38)
(11,40)-(11,42)
(13,16)-(13,28)
(13,20)-(13,28)
(13,27)-(13,28)
(15,14)-(15,24)
(15,18)-(15,24)
(15,23)-(15,24)
(17,17)-(17,67)
(17,38)-(17,67)
(17,46)-(17,47)
(17,49)-(17,50)
(17,52)-(17,58)
(17,60)-(17,66)
(19,16)-(19,39)
(19,25)-(19,39)
(19,32)-(19,34)
(19,36)-(19,38)
(21,11)-(21,20)
(21,16)-(21,20)
(23,11)-(23,20)
(23,16)-(23,20)
(25,15)-(38,70)
(26,2)-(38,70)
(26,18)-(37,61)
(27,4)-(37,61)
(27,10)-(27,11)
(28,11)-(28,20)
(28,11)-(28,17)
(28,18)-(28,20)
(29,11)-(29,20)
(29,11)-(29,17)
(29,18)-(29,20)
(30,11)-(30,44)
(30,11)-(30,20)
(30,21)-(30,44)
(30,22)-(30,27)
(30,28)-(30,43)
(30,29)-(30,33)
(30,35)-(30,42)
(30,36)-(30,37)
(30,40)-(30,41)
(31,11)-(31,46)
(31,11)-(31,22)
(31,23)-(31,46)
(31,24)-(31,29)
(31,30)-(31,45)
(31,31)-(31,35)
(31,37)-(31,44)
(31,38)-(31,39)
(31,42)-(31,43)
(32,11)-(32,74)
(32,11)-(32,23)
(32,24)-(32,74)
(32,25)-(32,48)
(32,26)-(32,31)
(32,32)-(32,47)
(32,33)-(32,37)
(32,39)-(32,46)
(32,40)-(32,41)
(32,44)-(32,45)
(32,50)-(32,73)
(32,51)-(32,56)
(32,57)-(32,72)
(32,58)-(32,62)
(32,64)-(32,71)
(32,65)-(32,66)
(32,69)-(32,70)
(33,11)-(33,72)
(33,11)-(33,21)
(33,22)-(33,72)
(33,23)-(33,46)
(33,24)-(33,29)
(33,30)-(33,45)
(33,31)-(33,35)
(33,37)-(33,44)
(33,38)-(33,39)
(33,42)-(33,43)
(33,48)-(33,71)
(33,49)-(33,54)
(33,55)-(33,70)
(33,56)-(33,60)
(33,62)-(33,69)
(33,63)-(33,64)
(33,67)-(33,68)
(35,8)-(37,61)
(35,8)-(35,19)
(36,10)-(37,61)
(36,11)-(36,34)
(36,12)-(36,17)
(36,18)-(36,33)
(36,19)-(36,23)
(36,25)-(36,32)
(36,26)-(36,27)
(36,30)-(36,31)
(36,36)-(36,59)
(36,37)-(36,42)
(36,43)-(36,58)
(36,44)-(36,48)
(36,50)-(36,57)
(36,51)-(36,52)
(36,55)-(36,56)
(37,12)-(37,35)
(37,13)-(37,18)
(37,19)-(37,34)
(37,20)-(37,24)
(37,26)-(37,33)
(37,27)-(37,28)
(37,31)-(37,32)
(37,37)-(37,60)
(37,38)-(37,43)
(37,44)-(37,59)
(37,45)-(37,49)
(37,51)-(37,58)
(37,52)-(37,53)
(37,56)-(37,57)
(38,2)-(38,70)
(38,5)-(38,14)
(38,5)-(38,10)
(38,13)-(38,14)
(38,20)-(38,42)
(38,20)-(38,30)
(38,31)-(38,35)
(38,36)-(38,42)
(38,37)-(38,38)
(38,40)-(38,41)
(38,48)-(38,70)
(38,48)-(38,58)
(38,59)-(38,63)
(38,64)-(38,70)
(38,65)-(38,66)
(38,68)-(38,69)
*)

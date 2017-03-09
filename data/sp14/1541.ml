
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
  if depth = 0
  then match rand (1, 2) with | 1 -> buildX () | 2 -> buildY ()
  else
    (match rand (1, 5) with
     | 1 -> buildSine ((build (rand, (depth - 1))) * (buildY ()))
     | 2 -> buildCosine ((build (rand, (depth - 1))) * (buildX ()))
     | 3 ->
         buildAverage
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 4 ->
         buildTimes
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 5 ->
         buildThresh
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
             (build (rand, (depth - 1))), (build (rand, (depth - 1)))));;


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
  if depth = 0
  then match rand (1, 2) with | 1 -> buildX () | 2 -> buildY ()
  else
    (match rand (1, 5) with
     | 1 -> buildSine (build (rand, (depth - 1)))
     | 2 -> buildCosine (build (rand, (depth - 1)))
     | 3 ->
         buildAverage
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 4 ->
         buildTimes
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 5 ->
         buildThresh
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
             (build (rand, (depth - 1))), (build (rand, (depth - 1)))));;

*)

(* changed spans
(30,22)-(30,65)
(30,54)-(30,60)
(30,61)-(30,63)
(31,12)-(31,67)
(31,24)-(31,67)
(31,56)-(31,62)
(31,63)-(31,65)
(33,9)-(34,69)
*)

(* type error slice
(11,3)-(11,45)
(11,18)-(11,43)
(11,27)-(11,43)
(11,40)-(11,42)
(13,3)-(13,30)
(13,16)-(13,28)
(13,20)-(13,28)
(13,27)-(13,28)
(15,3)-(15,26)
(15,14)-(15,24)
(15,18)-(15,24)
(15,23)-(15,24)
(17,3)-(17,69)
(17,17)-(17,67)
(17,38)-(17,67)
(17,60)-(17,66)
(19,3)-(19,41)
(19,16)-(19,39)
(19,25)-(19,39)
(19,36)-(19,38)
(21,3)-(21,22)
(21,11)-(21,20)
(21,16)-(21,20)
(23,3)-(23,22)
(23,11)-(23,20)
(23,16)-(23,20)
(25,3)-(41,73)
(25,15)-(41,71)
(26,2)-(41,71)
(27,7)-(27,63)
(27,37)-(27,43)
(27,37)-(27,46)
(30,12)-(30,21)
(30,12)-(30,65)
(30,22)-(30,65)
(30,22)-(30,65)
(30,22)-(30,65)
(30,23)-(30,50)
(30,24)-(30,29)
(30,53)-(30,64)
(30,54)-(30,60)
(31,12)-(31,23)
(31,12)-(31,67)
(31,24)-(31,67)
(31,24)-(31,67)
(31,55)-(31,66)
(31,56)-(31,62)
(33,9)-(33,21)
(33,9)-(34,69)
(34,11)-(34,69)
(34,41)-(34,68)
(34,42)-(34,47)
(36,9)-(36,19)
(36,9)-(37,69)
(37,11)-(37,69)
(37,41)-(37,68)
(37,42)-(37,47)
(39,9)-(39,20)
(39,9)-(41,70)
(40,11)-(41,70)
(41,42)-(41,69)
(41,43)-(41,48)
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
(25,15)-(41,71)
(26,2)-(41,71)
(26,5)-(26,14)
(26,5)-(26,10)
(26,13)-(26,14)
(27,7)-(27,63)
(27,13)-(27,24)
(27,13)-(27,17)
(27,18)-(27,24)
(27,19)-(27,20)
(27,22)-(27,23)
(27,37)-(27,46)
(27,37)-(27,43)
(27,44)-(27,46)
(27,54)-(27,63)
(27,54)-(27,60)
(27,61)-(27,63)
(29,4)-(41,71)
(29,11)-(29,22)
(29,11)-(29,15)
(29,16)-(29,22)
(29,17)-(29,18)
(29,20)-(29,21)
(30,12)-(30,65)
(30,12)-(30,21)
(30,22)-(30,65)
(30,23)-(30,50)
(30,24)-(30,29)
(30,30)-(30,49)
(30,31)-(30,35)
(30,37)-(30,48)
(30,38)-(30,43)
(30,46)-(30,47)
(30,53)-(30,64)
(30,54)-(30,60)
(30,61)-(30,63)
(31,12)-(31,67)
(31,12)-(31,23)
(31,24)-(31,67)
(31,25)-(31,52)
(31,26)-(31,31)
(31,32)-(31,51)
(31,33)-(31,37)
(31,39)-(31,50)
(31,40)-(31,45)
(31,48)-(31,49)
(31,55)-(31,66)
(31,56)-(31,62)
(31,63)-(31,65)
(33,9)-(34,69)
(33,9)-(33,21)
(34,11)-(34,69)
(34,12)-(34,39)
(34,13)-(34,18)
(34,19)-(34,38)
(34,20)-(34,24)
(34,26)-(34,37)
(34,27)-(34,32)
(34,35)-(34,36)
(34,41)-(34,68)
(34,42)-(34,47)
(34,48)-(34,67)
(34,49)-(34,53)
(34,55)-(34,66)
(34,56)-(34,61)
(34,64)-(34,65)
(36,9)-(37,69)
(36,9)-(36,19)
(37,11)-(37,69)
(37,12)-(37,39)
(37,13)-(37,18)
(37,19)-(37,38)
(37,20)-(37,24)
(37,26)-(37,37)
(37,27)-(37,32)
(37,35)-(37,36)
(37,41)-(37,68)
(37,42)-(37,47)
(37,48)-(37,67)
(37,49)-(37,53)
(37,55)-(37,66)
(37,56)-(37,61)
(37,64)-(37,65)
(39,9)-(41,70)
(39,9)-(39,20)
(40,11)-(41,70)
(40,12)-(40,39)
(40,13)-(40,18)
(40,19)-(40,38)
(40,20)-(40,24)
(40,26)-(40,37)
(40,27)-(40,32)
(40,35)-(40,36)
(40,41)-(40,68)
(40,42)-(40,47)
(40,48)-(40,67)
(40,49)-(40,53)
(40,55)-(40,66)
(40,56)-(40,61)
(40,64)-(40,65)
(41,13)-(41,40)
(41,14)-(41,19)
(41,20)-(41,39)
(41,21)-(41,25)
(41,27)-(41,38)
(41,28)-(41,33)
(41,36)-(41,37)
(41,42)-(41,69)
(41,43)-(41,48)
(41,49)-(41,68)
(41,50)-(41,54)
(41,56)-(41,67)
(41,57)-(41,62)
(41,65)-(41,66)
*)
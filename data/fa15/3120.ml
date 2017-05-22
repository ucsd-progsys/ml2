
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
  then let r = rand (0, 2) in match r with | 0 -> buildX () | 1 -> buildY ()
  else
    (let r = rand (0, 11) in
     let d = depth - 1 in
     match r with
     | 0 -> buildAverage ((build (rand, d)), (build (rand, d)))
     | 1 -> buildCosine (build (rand, d))
     | 2 -> buildSine (build (rand, d))
     | 3 -> buildTimes ((build (rand, d)), (build (rand, d)))
     | 4 ->
         buildThresh
           ((build (rand, d)), (build (rand, d)), (build (rand, d)),
             (build (rand, d)))
     | 5 -> buildTimes ((build (rand, d)), (build (rand, d)))
     | 6 -> buildSine (build (rand, d))
     | 7 -> buildCosine (build (rand, d))
     | 8 -> buildX (build (rand, d))
     | 9 -> buildSine (build (rand, d))
     | 10 -> buildCosine (build (rand, d)));;


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
  then let r = rand (0, 2) in match r with | 0 -> buildX () | 1 -> buildY ()
  else
    (let r = rand (0, 11) in
     let d = depth - 1 in
     match r with
     | 0 -> buildAverage ((build (rand, d)), (build (rand, d)))
     | 1 -> buildCosine (build (rand, d))
     | 2 -> buildSine (build (rand, d))
     | 3 -> buildTimes ((build (rand, d)), (build (rand, d)))
     | 4 ->
         buildThresh
           ((build (rand, d)), (build (rand, d)), (build (rand, d)),
             (build (rand, d)))
     | 5 -> buildTimes ((build (rand, d)), (build (rand, d)))
     | 6 -> buildSine (build (rand, d))
     | 7 -> buildCosine (build (rand, d))
     | 8 -> buildX ()
     | 9 -> buildSine (build (rand, d))
     | 10 -> buildCosine (build (rand, d)));;

*)

(* changed spans
(43,19)-(43,36)
(43,20)-(43,25)
(43,26)-(43,35)
(43,27)-(43,31)
(43,33)-(43,34)
*)

(* type error slice
(11,3)-(11,45)
(11,18)-(11,43)
(11,27)-(11,43)
(11,40)-(11,42)
(21,3)-(21,22)
(21,11)-(21,20)
(21,11)-(21,20)
(32,12)-(32,24)
(32,12)-(32,63)
(32,25)-(32,63)
(32,45)-(32,62)
(32,46)-(32,51)
(43,12)-(43,18)
(43,12)-(43,36)
(43,19)-(43,36)
(43,20)-(43,25)
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
(25,15)-(45,43)
(26,2)-(45,43)
(26,5)-(26,14)
(26,5)-(26,10)
(26,13)-(26,14)
(27,7)-(27,76)
(27,15)-(27,26)
(27,15)-(27,19)
(27,20)-(27,26)
(27,21)-(27,22)
(27,24)-(27,25)
(27,30)-(27,76)
(27,36)-(27,37)
(27,50)-(27,59)
(27,50)-(27,56)
(27,57)-(27,59)
(27,67)-(27,76)
(27,67)-(27,73)
(27,74)-(27,76)
(29,4)-(45,43)
(29,13)-(29,25)
(29,13)-(29,17)
(29,18)-(29,25)
(29,19)-(29,20)
(29,22)-(29,24)
(30,5)-(45,42)
(30,13)-(30,22)
(30,13)-(30,18)
(30,21)-(30,22)
(31,5)-(45,42)
(31,11)-(31,12)
(32,12)-(32,63)
(32,12)-(32,24)
(32,25)-(32,63)
(32,26)-(32,43)
(32,27)-(32,32)
(32,33)-(32,42)
(32,34)-(32,38)
(32,40)-(32,41)
(32,45)-(32,62)
(32,46)-(32,51)
(32,52)-(32,61)
(32,53)-(32,57)
(32,59)-(32,60)
(33,12)-(33,41)
(33,12)-(33,23)
(33,24)-(33,41)
(33,25)-(33,30)
(33,31)-(33,40)
(33,32)-(33,36)
(33,38)-(33,39)
(34,12)-(34,39)
(34,12)-(34,21)
(34,22)-(34,39)
(34,23)-(34,28)
(34,29)-(34,38)
(34,30)-(34,34)
(34,36)-(34,37)
(35,12)-(35,61)
(35,12)-(35,22)
(35,23)-(35,61)
(35,24)-(35,41)
(35,25)-(35,30)
(35,31)-(35,40)
(35,32)-(35,36)
(35,38)-(35,39)
(35,43)-(35,60)
(35,44)-(35,49)
(35,50)-(35,59)
(35,51)-(35,55)
(35,57)-(35,58)
(37,9)-(39,31)
(37,9)-(37,20)
(38,11)-(39,31)
(38,12)-(38,29)
(38,13)-(38,18)
(38,19)-(38,28)
(38,20)-(38,24)
(38,26)-(38,27)
(38,31)-(38,48)
(38,32)-(38,37)
(38,38)-(38,47)
(38,39)-(38,43)
(38,45)-(38,46)
(38,50)-(38,67)
(38,51)-(38,56)
(38,57)-(38,66)
(38,58)-(38,62)
(38,64)-(38,65)
(39,13)-(39,30)
(39,14)-(39,19)
(39,20)-(39,29)
(39,21)-(39,25)
(39,27)-(39,28)
(40,12)-(40,61)
(40,12)-(40,22)
(40,23)-(40,61)
(40,24)-(40,41)
(40,25)-(40,30)
(40,31)-(40,40)
(40,32)-(40,36)
(40,38)-(40,39)
(40,43)-(40,60)
(40,44)-(40,49)
(40,50)-(40,59)
(40,51)-(40,55)
(40,57)-(40,58)
(41,12)-(41,39)
(41,12)-(41,21)
(41,22)-(41,39)
(41,23)-(41,28)
(41,29)-(41,38)
(41,30)-(41,34)
(41,36)-(41,37)
(42,12)-(42,41)
(42,12)-(42,23)
(42,24)-(42,41)
(42,25)-(42,30)
(42,31)-(42,40)
(42,32)-(42,36)
(42,38)-(42,39)
(43,12)-(43,36)
(43,12)-(43,18)
(43,19)-(43,36)
(43,20)-(43,25)
(43,26)-(43,35)
(43,27)-(43,31)
(43,33)-(43,34)
(44,12)-(44,39)
(44,12)-(44,21)
(44,22)-(44,39)
(44,23)-(44,28)
(44,29)-(44,38)
(44,30)-(44,34)
(44,36)-(44,37)
(45,13)-(45,42)
(45,13)-(45,24)
(45,25)-(45,42)
(45,26)-(45,31)
(45,32)-(45,41)
(45,33)-(45,37)
(45,39)-(45,40)
*)

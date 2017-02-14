
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
  let case = rand (0, 6) in
  if depth = 0
  then
    let case = rand (0, 1) in
    match case with
    | 0 -> buildX
    | 1 -> buildY
    | 2 -> buildSine (build (rand, (depth - 1)))
    | 3 -> buildCosine (build (rand, (depth - 1)))
    | 4 ->
        buildAverage
          ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
    | 5 ->
        buildTimes ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
    | 6 ->
        buildThresh
          ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
            (build (rand, (depth - 1))), (build (rand, (depth - 1))));;


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
  let case = rand (0, 6) in
  match case with
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
(27,3)-(43,66)
(27,6)-(27,11)
(27,6)-(27,15)
(27,14)-(27,15)
(29,5)-(43,66)
(29,16)-(29,20)
(29,16)-(29,26)
(29,22)-(29,23)
(29,22)-(29,26)
(29,25)-(29,26)
(31,12)-(31,18)
(32,12)-(32,18)
(33,12)-(33,46)
*)

(* type error slice
(11,4)-(11,46)
(11,19)-(11,43)
(11,28)-(11,43)
(13,4)-(13,31)
(13,17)-(13,29)
(13,21)-(13,29)
(15,4)-(15,27)
(15,15)-(15,25)
(15,19)-(15,25)
(15,19)-(15,25)
(15,24)-(15,25)
(17,4)-(17,70)
(17,18)-(17,67)
(17,39)-(17,67)
(19,4)-(19,42)
(19,17)-(19,39)
(19,26)-(19,39)
(21,4)-(21,23)
(21,12)-(21,21)
(25,4)-(43,72)
(25,16)-(43,66)
(26,3)-(43,66)
(27,3)-(43,66)
(27,3)-(43,66)
(27,3)-(43,66)
(29,5)-(43,66)
(30,5)-(43,66)
(30,5)-(43,66)
(30,5)-(43,66)
(30,5)-(43,66)
(30,5)-(43,66)
(30,5)-(43,66)
(31,12)-(31,18)
(33,12)-(33,21)
(33,12)-(33,46)
(33,23)-(33,28)
(33,23)-(33,46)
(34,12)-(34,23)
(34,12)-(34,48)
(36,9)-(36,21)
(36,9)-(37,65)
(39,9)-(39,19)
(39,9)-(39,74)
(41,9)-(41,20)
(41,9)-(43,66)
*)
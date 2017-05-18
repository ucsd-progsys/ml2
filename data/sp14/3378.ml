
let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      (match (mulByDigit i (List.rev (List.map (fun x  -> x * 10) t))) @
               [h * i]
       with
       | [] -> []
       | h::t ->
           let f a x = a + x in
           let base = 0 in
           (match [List.fold_left f base (h :: t)] with
            | [] -> []
            | a::b ->
                let rec helper acc v =
                  if v = 0
                  then acc
                  else ((v / 10) mod 10) :: ((v mod 10) :: acc) :: acc in
                helper [] a));;


(* fix

let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      (match (mulByDigit i (List.rev (List.map (fun x  -> x * 10) t))) @
               [h * i]
       with
       | [] -> []
       | h::t ->
           let f a x = a + x in
           let base = 0 in
           (match [List.fold_left f base (h :: t)] with
            | [] -> []
            | a::b ->
                let rec helper acc v =
                  if v = 0
                  then acc
                  else ((v / 10) mod 10) :: (v mod 10) :: acc in
                helper [] a));;

*)

(* changed spans
(19,44)-(19,63)
(19,67)-(19,70)
*)

(* type error slice
(19,44)-(19,63)
(19,44)-(19,63)
(19,44)-(19,70)
(19,44)-(19,70)
(19,59)-(19,62)
(19,67)-(19,70)
*)

(* all spans
(2,19)-(20,29)
(2,21)-(20,29)
(3,2)-(20,29)
(3,8)-(3,18)
(3,8)-(3,16)
(3,17)-(3,18)
(4,10)-(4,12)
(6,6)-(20,29)
(6,13)-(7,22)
(6,71)-(6,72)
(6,13)-(6,70)
(6,14)-(6,24)
(6,25)-(6,26)
(6,27)-(6,69)
(6,28)-(6,36)
(6,37)-(6,68)
(6,38)-(6,46)
(6,47)-(6,65)
(6,58)-(6,64)
(6,58)-(6,59)
(6,62)-(6,64)
(6,66)-(6,67)
(7,15)-(7,22)
(7,16)-(7,21)
(7,16)-(7,17)
(7,20)-(7,21)
(9,15)-(9,17)
(11,11)-(20,28)
(11,17)-(11,28)
(11,19)-(11,28)
(11,23)-(11,28)
(11,23)-(11,24)
(11,27)-(11,28)
(12,11)-(20,28)
(12,22)-(12,23)
(13,11)-(20,28)
(13,18)-(13,50)
(13,19)-(13,49)
(13,19)-(13,33)
(13,34)-(13,35)
(13,36)-(13,40)
(13,41)-(13,49)
(13,42)-(13,43)
(13,47)-(13,48)
(14,20)-(14,22)
(16,16)-(20,27)
(16,31)-(19,70)
(16,35)-(19,70)
(17,18)-(19,70)
(17,21)-(17,26)
(17,21)-(17,22)
(17,25)-(17,26)
(18,23)-(18,26)
(19,23)-(19,70)
(19,23)-(19,40)
(19,24)-(19,32)
(19,25)-(19,26)
(19,29)-(19,31)
(19,37)-(19,39)
(19,44)-(19,70)
(19,44)-(19,63)
(19,45)-(19,55)
(19,46)-(19,47)
(19,52)-(19,54)
(19,59)-(19,62)
(19,67)-(19,70)
(20,16)-(20,27)
(20,16)-(20,22)
(20,23)-(20,25)
(20,26)-(20,27)
*)

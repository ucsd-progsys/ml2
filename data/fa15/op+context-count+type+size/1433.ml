
let remainder x y = if (x * y) > 10 then (x * y) mod 10 else 0;;

let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      (match List.length t with
       | 1 -> [i * h]
       | _ -> [remainder h i] @ (((i * l) / 10) + (mulByDigit i t)));;


(* fix

let remainder x y = if (x * y) > 10 then (x * y) mod 10 else 0;;

let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      (match List.length t with
       | 1 -> [i * h]
       | _ -> (remainder h i) :: (mulByDigit i t));;

*)

(* changed spans
(10,15)-(10,30)
(10,15)-(10,66)
(10,31)-(10,32)
(10,36)-(10,41)
(10,36)-(10,47)
(10,36)-(10,66)
(10,45)-(10,47)
*)

(* type error slice
(4,4)-(10,71)
(4,20)-(10,66)
(4,22)-(10,66)
(5,3)-(10,66)
(5,9)-(5,17)
(5,9)-(5,19)
(5,18)-(5,19)
(8,8)-(10,66)
(9,15)-(9,22)
(10,15)-(10,66)
(10,31)-(10,32)
(10,36)-(10,41)
(10,36)-(10,66)
(10,36)-(10,66)
(10,40)-(10,41)
(10,52)-(10,62)
(10,52)-(10,66)
*)
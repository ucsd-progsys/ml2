
let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let gs x =
    let xx = f x in
    match xx with | xx when (xx - x) > 0 -> (x, b) | _ -> ((f x), b) in
  wwhile (gs, b);;


(* fix

let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let gs x = let xx = f x in (xx, (xx = x)) in wwhile (gs, b);;

*)

(* changed spans
(9,4)-(9,68)
(9,10)-(9,12)
(9,34)-(9,35)
(9,45)-(9,46)
(9,48)-(9,49)
(9,58)-(9,68)
(9,59)-(9,64)
(9,60)-(9,61)
(9,66)-(9,67)
*)

(* type error slice
(3,2)-(4,68)
(3,12)-(3,13)
(3,12)-(3,15)
(4,2)-(4,68)
(4,8)-(4,11)
(4,30)-(4,31)
(4,30)-(4,38)
(4,34)-(4,38)
(4,42)-(4,48)
(4,42)-(4,55)
(4,49)-(4,55)
(4,50)-(4,51)
(4,53)-(4,54)
(7,2)-(10,16)
(7,9)-(9,68)
(8,4)-(9,68)
(9,4)-(9,68)
(9,28)-(9,36)
(9,34)-(9,35)
(9,44)-(9,50)
(9,45)-(9,46)
(9,48)-(9,49)
(10,2)-(10,8)
(10,2)-(10,16)
(10,9)-(10,16)
(10,10)-(10,12)
(10,14)-(10,15)
*)

(* all spans
(2,16)-(4,68)
(3,2)-(4,68)
(3,12)-(3,15)
(3,12)-(3,13)
(3,14)-(3,15)
(4,2)-(4,68)
(4,8)-(4,11)
(4,30)-(4,38)
(4,30)-(4,31)
(4,34)-(4,38)
(4,42)-(4,55)
(4,42)-(4,48)
(4,49)-(4,55)
(4,50)-(4,51)
(4,53)-(4,54)
(4,67)-(4,68)
(6,14)-(10,16)
(7,2)-(10,16)
(7,9)-(9,68)
(8,4)-(9,68)
(8,13)-(8,16)
(8,13)-(8,14)
(8,15)-(8,16)
(9,4)-(9,68)
(9,10)-(9,12)
(9,28)-(9,40)
(9,28)-(9,36)
(9,29)-(9,31)
(9,34)-(9,35)
(9,39)-(9,40)
(9,44)-(9,50)
(9,45)-(9,46)
(9,48)-(9,49)
(9,58)-(9,68)
(9,59)-(9,64)
(9,60)-(9,61)
(9,62)-(9,63)
(9,66)-(9,67)
(10,2)-(10,16)
(10,2)-(10,8)
(10,9)-(10,16)
(10,10)-(10,12)
(10,14)-(10,15)
*)

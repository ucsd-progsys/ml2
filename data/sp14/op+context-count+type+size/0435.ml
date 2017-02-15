
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile
    ((if (f b) = b
      then ((failwith "Asd"), (failwith "asd"))
      else failwith "asd"), b);;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile
    ((if (f b) = b
      then fun b''  -> ((f b), false)
      else (fun b''  -> ((f b), true))), b);;

*)

(* changed spans
(7,11)-(7,47)
(7,13)-(7,21)
(7,22)-(7,27)
(7,30)-(7,46)
(7,31)-(7,39)
(7,40)-(7,45)
(8,11)-(8,19)
(8,11)-(8,25)
(8,20)-(8,25)
*)

(* type error slice
(2,37)-(2,38)
(2,37)-(2,40)
(2,55)-(2,61)
(2,55)-(2,69)
(2,62)-(2,69)
(2,63)-(2,64)
(5,2)-(5,8)
(5,2)-(8,30)
(6,4)-(8,30)
(6,5)-(8,26)
(7,11)-(7,47)
*)

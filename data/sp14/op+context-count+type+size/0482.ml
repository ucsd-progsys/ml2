
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile (((failwith "asd"), (failwith "asd")), b);;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile
    ((if (f b) = b
      then fun b''  -> ((f b), false)
      else (fun b''  -> ((f b), true))), b);;

*)

(* changed spans
(4,32)-(4,40)
(4,32)-(4,46)
(4,32)-(4,64)
(4,41)-(4,46)
(4,50)-(4,58)
(4,50)-(4,64)
(4,59)-(4,64)
(4,68)-(4,69)
*)

(* type error slice
(2,38)-(2,39)
(2,38)-(2,41)
(2,56)-(2,62)
(2,56)-(2,69)
(2,64)-(2,65)
(2,64)-(2,69)
(4,22)-(4,28)
(4,22)-(4,69)
(4,32)-(4,64)
(4,32)-(4,69)
*)
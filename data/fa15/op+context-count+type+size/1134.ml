
let rec wwhile (f,b) =
  let (b',c') = f b in
  match c' with | false  -> (b', c') | true  -> wwhile (f, b');;

let fixpoint (f,b) =
  wwhile
    (let x = f b in match x with | b -> (x, false) | _ -> ((x, true), b));;


(* fix

let rec wwhile (f,b) =
  let (b',c') = f b in match c' with | false  -> b' | true  -> wwhile (f, b');;

let fixpoint (f,b) =
  wwhile
    ((let helper x = let y = f x in if y = x then (y, false) else (y, true) in
      helper), b);;

*)

(* changed spans
(4,30)-(4,36)
(4,34)-(4,36)
(8,6)-(8,72)
(8,14)-(8,17)
(8,16)-(8,17)
(8,21)-(8,72)
(8,42)-(8,43)
(8,42)-(8,50)
(8,45)-(8,50)
(8,61)-(8,62)
(8,61)-(8,68)
(8,71)-(8,72)
*)

(* type error slice
(8,21)-(8,72)
(8,21)-(8,72)
(8,42)-(8,43)
(8,42)-(8,50)
(8,61)-(8,62)
(8,61)-(8,68)
(8,61)-(8,72)
*)
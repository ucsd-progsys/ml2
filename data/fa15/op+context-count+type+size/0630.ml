
let rec wwhile (f,b) =
  let temp = f b in
  match temp with | (a,boolean) -> if boolean then wwhile (f, a) else a;;

let fixpoint (f,b) =
  wwhile (let g x = let xx = f in (xx, (b = (f b))) in (g, b));;


(* fix

let rec wwhile (f,b) =
  let temp = f b in
  match temp with | (a,boolean) -> if boolean then wwhile (f, a) else a;;

let fixpoint (f,b) =
  wwhile (let n x = let ff = f b in (ff, (b = ff)) in (n, b));;

*)

(* changed spans
(7,11)-(7,61)
(7,21)-(7,49)
(7,30)-(7,31)
(7,36)-(7,38)
(7,36)-(7,49)
(7,46)-(7,47)
(7,46)-(7,49)
(7,48)-(7,49)
(7,57)-(7,58)
*)

(* type error slice
(3,3)-(4,72)
(3,14)-(3,15)
(3,14)-(3,17)
(4,3)-(4,72)
(4,9)-(4,13)
(4,52)-(4,58)
(4,52)-(4,64)
(4,60)-(4,61)
(4,60)-(4,64)
(4,63)-(4,64)
(7,3)-(7,9)
(7,3)-(7,61)
(7,11)-(7,61)
(7,11)-(7,61)
(7,17)-(7,49)
(7,21)-(7,49)
(7,21)-(7,49)
(7,30)-(7,31)
(7,36)-(7,38)
(7,36)-(7,49)
(7,46)-(7,47)
(7,46)-(7,49)
(7,48)-(7,49)
(7,57)-(7,58)
(7,57)-(7,61)
(7,60)-(7,61)
*)

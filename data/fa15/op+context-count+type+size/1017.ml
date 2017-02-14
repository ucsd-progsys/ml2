
let stringOfList f l =
  let l' = List.map f l in
  match l' with
  | [] -> []
  | _ ->
      let rec makeString res =
        match res with | [] -> "" | h::t -> h ^ (makeString t) in
      makeString l';;


(* fix

let stringOfList f l =
  let l' = List.map f l in
  match l' with
  | [] -> ""
  | _ ->
      let rec makeString res =
        match res with | [] -> "" | h::t -> h ^ (makeString t) in
      makeString l';;

*)

(* changed spans
(5,11)-(5,13)
*)

(* type error slice
(4,3)-(9,20)
(4,3)-(9,20)
(5,11)-(5,13)
(7,7)-(9,20)
(8,45)-(8,62)
(8,47)-(8,48)
(8,50)-(8,60)
(8,50)-(8,62)
(9,7)-(9,17)
(9,7)-(9,20)
*)
(*  We rewrite the same examples written in lambda-calculus and
    in Javascript in SML
*)

(* M ::= x | fn x => M | M M *)

(*  \x.\y.x+y 
(function (x){return function (y){return x+y;};})
*)

fn x => fn y => x + y ;

(* var f = function (x){return function (y){return x+y;};}  *)

fun f x = fn y => x + y ;

fun f x y = x + y ;  (* currying *)

(* \f.\x. f ( f x)
(function (f){return function (x){return f ( f (x))}})
*)

fn f => fn x => f ( f x);

(* (\f.\x.f ( f x))(\y.y+1) *)

(fn f => fn x => f ( f x))(fn y=> y+1);

(*

var f1 = (function (f){return function (x){return f ( f (x))}})
                              (function (y){return y+1;});
console.log(f1 (9));

*)

val f1 =  (fn f => fn x => f ( f x))(fn y=> y+1);
f1 9;

(* Free variable capture

  Is  \x.(\y.\x.y)x   the same as \x.\x.x 

 *)

 fun g x = (fn y=>fn x=>y) x ;
 fun g_opt x = fn x => x ;

 val test_g = g 1 3;
 val test_g_opt = g_opt 1 3;

 fun g_new x = fn w => x;
 val test_g_new = g 1 3;

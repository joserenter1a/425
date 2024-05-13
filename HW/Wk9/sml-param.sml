(* 
   Understanding paremeter passing in SML.
   In SML variables cannot be assigned except through a reference.

*)

val x = 2;
fun f y = y = 3;
val t1 = f x;
val t2 = x;
(*    "y = 3" is not an assignment, it is a comparison
      y is not in scope here
 *)

val x = 2;
fun f y = let val y = 3 in 25 end;
val t3 = f x;
val t4 = x;
(*    the occurrence of y in the let is not the parameter
      it is a new variable that hides the parameter
 *)

val x = 2;
val r = ref x;
r := 3;
val t5 = x;
val t6 = r;
(*    the occurrence of x argument of ref is a value
      it is exactly the same as 2.
      the referent is only accessed through r
*)

val x = 2;
val r = ref x;
fun f y = y := 3;
val t5 = f r;
val t6 = x;
val t7 = r;
val t8 = !r;
(* r is passed to f by-value. The referent of r is NOT passed to f,
      rather r is.  Any conceivable change to y does not affect r. The
      assignment "y := 3" changes the referent of y, not y itself.
      Variables r and y have the same referent.  Hence, changing the
      referent of y is changing the referent of r.
*)
      
val x = 2;
val r = ref x;
fun f u v = (u := 3; v := 4);
val t9 = f r r;
val t10 = !r;

(* Aliasing: u and v in f have the same referent. *)
      
val x = 2;
val r = ref x;
fun f u = (u := 3; r := 5);
val t11 = f r;
val t12 = !r;

(* aliasing through global access.
   u and r in f have the same referent
*)

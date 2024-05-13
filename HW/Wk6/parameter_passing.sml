(* Example 7.3 .
  y by value - the result is 2
  y by ref   - the result is 1 
  x and y are aliases 
fun f (pass-by-ref x:int, pass-by-value y:int)
    begin
       x := 2
       y := 1
       if x = 1 then return 1 else 2;
     end
   var z : int;
   z:= 0;
   f(z,z);
 *)



fun f (x: int ref, y: int) = let val yy = ref y in
	                            x  := 2;
	                            yy := 1;
	                            if (!x=1) then 1 else 2
	                           end;
val z = ref 0;
val test_by_val = f(z,!z);

(* Aliasing *) 
fun f (x: int ref, y: int ref ) = 
	                            (
	                            x := 2;
	                            y := 1;
	                            if (!x=1) then 1 else 2
	                            );
val z = ref 0;
val test_by_ref=f(z,z);

(* Test for aliasing 

function f (y,z){
	         y := 0;
	         z := 0;
	         y := 1;
	         if z = 1 then y:= 0; return 1
	         	      else y:= 0; return 0
	         }
*)

fun mul (a,b)= if a = 0 then 0
	     else let val aa = ref a
	     	        val result1 = ref 0 in
	     	        while !aa > 0 do
	     	        	    (aa := !aa -1; result1 := !result1 + b);
	     	        	    !result1
             end;

mul(1,2);
mul(2,2);
mul(9,8);

(* Call-by-value - call-by-name - call-by-need 

In call-by-name I substitute the actual parameter for the formal parameter;
this implies that if there are multiple occurrences of the formal
parameter in the body of the function I will evaluate the actual parameter
multiple times. Call-by-need avoids this recomputation: I delay the evaluation of
the actual parameter, but if I need to evaluate it I will memoize the result.
According to the following code, the result of the function call is:
call-by-value (a.k.a CBV)  15
call-by-name (a.k.a. CBN )  16
call-by-need   15
*)

val y = ref 10;
fun f x = x + x + !y;
f (y:= !y + 1; 2);

(* Remember that a program might loop forever in CBV but terminate in CBN. 
The following call  zero(loop 9) will loop forever.  Instead it will produce
0 in both call-by-name and call-by-need
*)
fun loop x = loop x;
fun zero x = 0;
(* 
zero (loop 9);
*)

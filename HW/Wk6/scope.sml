(* Static  : 1
   Dynamic : 99
*)

val test1 = 
let val x = 1
in let fun f z = x
   in let val x = 99
      in f x
      end        
   end
end;

(* Static:   100
   Dynamic:  198
*)
val test2 = let val x = 1
in let fun f z = x
   in let val x = 99
      in (f x) +  x
      end
   end
end;

(* Static:   16
   Dynamic:  uncaught exception UnboundID
*)
val x = 1;
fun f y =
    let
        val z = y+1
        val t = fn w => x + y + w + z
      in t
    end;

val x = 3;
val g = f 4;
val z1 = g 6;



(* Static:    6
   Dynamic:   5
*)
fun f g =
    let
        val x = 3
    in g 2
    end;
val x = 4;
fun h y = x + y ;
val z2 = f h;

(* Are the following two functions the same ?
     Static:  a1 is 9
     Dynamic: a1 is 21

    Static:  a2 is 9
    Dynamic: a2 is 4
*)


fun f1 y =
    let
        val x = y + 1
        val t = fn z => x + y + z
      in t
    end;

fun f2 y =
    let
        val q = y + 1
        val t = fn z => q + y + z
      in t
    end;
val y = 0;
val x = 17 ;
val q = 0;
val r1 = f1 2;
val a1 = r1 4;
val r2 = f2 2;
val a2 = r2 4;

(* f3 and f4 are always the same, no matter
   what argument is passed in
      Static:   a3 is 19
      Dynamic:  a3 is 5

      Static:   a4 is 19
      Dynamic:  a4 is 19

*)

fun f3 g =
    let
        val x = 3
    in
        g 2
    end;

fun f4 g = g 2;


val x = 17;
val a3 = f3 (fn y => x + y) ; (* you notice a difference *)
val a4 = f4 (fn y => x + y) ;(* there is no difference *)


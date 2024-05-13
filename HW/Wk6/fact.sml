
fun fact n = if n = 1 then 1 else fact(n-1) * n;


(* Tail recursive definition *)

fun fact_i (n,a) = if n = 1 then a else fact_i (n-1,n*a);

fact_i (3,1);

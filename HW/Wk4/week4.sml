(* eager vs lazy evaluation *)

fun loop x = (loop x) + 1 ;
(* loop 10; *)
fun zero x = 0;
(* zero (loop 10) *)
(* [1,2,3,loop 10]; *)

(* How do we define infinite structures *)

(* val ones = 1 :: ones; compiler error - ones is unbound *)
(* val rec ones = 1 :: ones; compiler error - recursive binding
                             is only allowed for functions
*)

fun ones x = x :: ones x;
(* val ones = ones 1; loops forever *)

(* We need a new definition for infinite lists *)

datatype int_Seq = Cons of int*(unit -> int_Seq);
(* No base case? *)

val rec ones_gen = fn ()=> Cons(1,ones_gen);
val ones = ones_gen();

fun get (0, Cons(h,t)) = h
|   get (n, Cons(h,t)) = get(n-1,t());

get(100,ones);

(* Compare get to the way we access list *)

fun  get_l  (0, h::t) = h
|    get_l  (n, h::t) = get_l(n-1,t);
get_l(1,2::3::nil);

(* How to define the sequence of natural numbers *)

fun nats x = x :: (nats (x+1));

(* What does "nats 0" returns?   *)

fun nats_gen x = fn () => Cons (x, nats_gen (x+1)) ;
val nats = nats_gen 0 ();
get(100,nats);


(*  Parameter passing teachniques - eager vs lazy  *)
fun f x = x + x ;
f (print("Hi"); 2+2); (* How many times do you 2+2 to be executed?*)

(* What is the result of "zero(loop 10)" *)

(* How to  delay the argument *)
zero(fn()=>loop 10);

fun f x = x() + x() ;
f (fn ()=> (print("Hi"); 2+2));
                       (* How many times do you 2+2 to be executed?*)

fun force thunk = thunk ();
fun f x = force x + force x;
f (fn ()=> (print("Hi"); 2+2));


(* Let's rewrite the code one more time *)
fun delay x = fn ()=> x;
f (delay(print("Hi"); 2+2));
                  (* How many times do you 2+2 to be executed?*)



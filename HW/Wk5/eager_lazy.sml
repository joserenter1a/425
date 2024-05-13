(* Eager vs Lazy evaluation *)

fun loop x = (loop x) + 1 ;

(* The following call
     loop 0; 
   will not terminate
*)

fun zero x = 0;

(* Also, the following invocation
    zero (loop 0); 
   will not terminate, even though the formal
   paramter x is not used
*)

(* The same happens if you define a data structure, such as
   [9,loop 8]; 
*)


(* We might not want to write functions like the zero function
   above. But what if we went to define infinite structures?
*)


fun nats x = x :: (nats (x+1));

(* The invocation
     nats 0 ; 
   conceptually represents the infinite sequence of natural numbers,
   but the problem is that it cannot generate it in finite 
   time!
*)

(* Consider the following expression:*)

2+2;  (* int *) 

(* the addition gets executed right away.  What if we want
    delay its execution? 
*)

val f = fn () => 2+2; (*  unit  -> int   *)

(* with the above definition, we delay the execution of
2+2, which gets executed every time I invoke f 
*)

f();
f();


(* Let's go back to the problem of defining the infinite sequence
   of natural numbers.  We defined a new data type with the promise
   (also called a thunk)  to generate the tail of a list 
*)

(* compare the two definitions of list and int_Seq *)

datatype list = empty | cons of int * list ; 
cons (1, (cons (2, empty))) ;

datatype int_Seq = Cons of int*(unit -> int_Seq);


fun nats x = Cons (x , fn () => nats(x+1));


fun get (1, Cons(h,t)) = h
|   get (n, Cons(h,t)) = get(n-1,t());


get(100, nats 0);

fun evens x = Cons (x, fn ()=>evens (x+2));
get (4,evens 0);


(*  Parameter passing teachniques - eager vs lazy  *)

fun f x = x + x ;   (*   int   ->  int *)
val test1 = f (print("Hi "); 2+2); (* How many times  2+2 is executed?*)


(* How to  delay the argument?  *)


fun f x = x() + x() ;   (* ( unit --> int ) --> int  *)
val test2 = f (fn ()=> (print("Hi "); 2+2));
                       (* How many times 2+2 is executed? *)

fun force thunk = thunk ();
fun f x = force x + force x;
val test2_again=f (fn ()=> (print("Hi "); 2+2));


(* Let's rewrite the code one more time *)
fun delay x = fn ()=> x;
fun f x = force x + force x;   
val test3= f (delay(print("Hi  "); 2+2));
                  (* How many times is 2+2 executed?*)

(*  how to avoid the recomputation *)
(*  need to introduce assignment   *)

(* new type:       t ref where t is a type
   expressions:    ref e - creates a reference with initial content the value of e
                   e1 := e2 - e1 is a reference to say v1, v1 gets updated with the
                              value of e1
                   e! - e is a reference, it returns the value it points to
*)


val a = ref 10;
val b = ref true;
val c = ref "Hi";

!a; !b; !c ;  (* (op !):   'a ref -> 'a    *)

val assignment_type = (op :=); (* 'a ref * 'a -> unit *)

a := 11;   (*   'a ref * 'a -> unit   *)
(op :=)(a,11);

b :=  false ;

c := "Ciao";

!a;

val xx = ref ();
(* this is wrong: xx := 9 ; *)


(* let's go back to the following function definition:  *)
fun f x = x + x;

(* consider the call : *)
f(2+2);

(* In an eager language, 2+2 is executed once, if we delay its
evaluation as we did in lines 94-96, 2+2 gets evaluated twice.

How can we  use assignment to write delay and force in an efficient way?
*)


datatype thunk = Done of int | ToDo of unit -> int;

fun delay f = ref (ToDo f) ;
fun force ref_thunk  =  case !ref_thunk of
                               (Done x) => x
                            |  (ToDo f) =>  let val res = f ()
                                                in 
                                                   ref_thunk := Done res;
                                                   res
                                                end;

fun f x = force x + force x;
val test4 = f (delay (print("Hi  ");fn ()=>2+2));

(* In the above invocation, 2+2 is executed only once! *)

(* Encoding of objects *)

datatype Message = GetBalance | Deposit of int | Withdraw of int ;

fun opening_account init_amt  = let
                                  val amount = ref init_amt
                                in
                                  fn msg => (case msg of
                                     Deposit amt  => (amount := !amount + amt;
                                                     !amount)
                                  |  Withdraw amt => (amount := !amount - amt;
                                                         !amount)
                                  |  GetBalance   => !amount
                                )
                               end;

val checking_account=  opening_account 100;
val b1 = checking_account (Withdraw 100);
val b2 = checking_account (Deposit 50);


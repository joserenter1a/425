(* Now that we understand assignment, we can go back
   to the question of overloading versus polymorphism 

   Uniform representation 
*)

fun swap a b = let val temp = !a
                in (a:= !b; b := temp)
       
                end;
(* How do you compile it?
   What is the type of temp?
*)


(*   What is the difference with C++
C++:
template <typename T>
void swap(T& x, T& y){
T tmp = x; .....   ;
}
*)




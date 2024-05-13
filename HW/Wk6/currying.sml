let fun sum x y = x + y 
 in let val z = sum 1
     in z 3
     end
 end;

(*
{function sum (x){return function (y){return x+y;}}};
  {let z = sum 1;
   z(3);}

 *)
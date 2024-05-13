(* Return functions in output *)


let val x=5
in  let fun f y = let val z = 0
                      fun g w = w+x+y+z
                   in g
                  end
    in let val x = 7
        in let val h = f 3
           in h 2
           end
        end
end
end;

(*
{let   x = 5;
   {function f(y){let  z = 0; return (function (w){return w+x+y+z;});};
      {let x = 7;
        {let h = f(3);
         console.log(h(2))}
      }
}}
*)
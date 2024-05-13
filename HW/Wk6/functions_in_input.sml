
let val x = 4
in let
       fun f y = x*y
    in let 
         fun g h = let val x = 7 in (h 3) + x end
        in g f
        end
    end
end;

(*
{ let x = 4
 { function f(y) { return x * y }
   { function g(h) {
       let x = 7
       { return h(3) + x
       }
     }
     { console.log(g(f))
     }
   }
 }
}
*)

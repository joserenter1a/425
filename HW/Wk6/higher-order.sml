(* Passing functions in input *) 

let val x = 4
	fun f y = x*y
	fun g h = let val x = 7 in (h 3) + x end 
in g f
end;

(* Return functions in output *)


let val x=5
in let fun f y = let val z = [1,2,3]
                     fun g w = w+x+y
                     in g
                  end 
   in let val h = let val x =7
                  in f 3 end
      in h 2
      end
   end
end;

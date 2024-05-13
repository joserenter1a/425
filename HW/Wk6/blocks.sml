(* A language with blocks *) 
let val x = 2
	val z = 5
in let val w = x + z
	   val y = 9
    in let val x = w + 1
    	   val w = y + x
    	in 
    		 x+z+y+w
    	end
    end
end; 


 

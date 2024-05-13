/* Examples written in JavaScript from Chapter "Scope, Functions, and Storage
* Management" in /Concepts in Programming Languages/ by Mitchell.
*/

/* Example 7.1 */
console.log("Example 7.1")
{ let x = 0
 let y = x + 1
 { let z = (x+y) * (x-y)
   console.log(z)
 }
}

/* Example 7.2 */
console.log("\nExample 7.2")
function fact(n) {
 if (n <= 1)
   { return 1 }
 else
   { return n * fact(n-1) }
}
console.log(fact(5))

/* Example 7.3 */
console.log("\nExample 7.3")
{ function f(x, y) {
   x.deref = 2
   y = 1
   if (x.deref == 1)
     { return 1 }
   else
     { return 2 }
 }
 var z = { deref : 0 }
 console.log(f(z,z.deref));
}

/* We can pass-by-reference in JavaScript by wrapping our value in an
* object. This next example is when y is passed by reference too. */

{ function f(x, y) {
   x.deref = 2
   y.deref = 1
   if (x.deref == 1)
     { return 1 }
   else
     { return 2 }
 }
 var z = { deref : 0 }
 console.log(f(z,z));
}

/* Example 7.4 */
console.log("\nExample 7.4")
{ function f(y,z) {
   y.deref = 0
   z.deref = 0
   y.deref = 1
   if (z.deref == 1)
     { y.deref = 0
       return 1  }
   else
     { y.deref = 0
       return 0 }
 }
 var a = { deref : 42 }
 var b = a
 var c = { deref : 42 }
 console.log(f(a,b));
 console.log(f(a,c));
}

/* Example 7.5 */
console.log("\nExample 7.5")
{ let x = 1
 function g(z) { return x + z }
 function f(y) {
   let x = y + 1
   return g(y * x)
 }
 console.log(f(3))
}

/* Example 7.7 */
console.log("\nExample 7.7")
function tlfact(n,a) {
 if (n <= 1)
   { return a }
 else
   { return fact(n-1, n * a) }
}
console.log(fact(5,1))

/* Example 7.8 */
console.log("\nExample 7.8")
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

/* Example 7.9 */
console.log("\nExample 7.9")
{ function make_counter(init) {
   var count = { deref : init }
   function counter(inc) {
     count.deref = count.deref + inc
     return count.deref
   }
   return counter
 }
 var c = make_counter(1)
 console.log(c(2) + c(2))
}

// Currying

// Functions of multiple arguments
// are expressed in terms of functions taking one
// parameter at the time
//


function Add (x,y) {return x+y}
Add(2,3)  //  Add 2 gives an error


function curriedAdd (x){
return function (y){return x + y ;}}

var g = curriedAdd(2);
console.log(g(3));
console.log(g(7));


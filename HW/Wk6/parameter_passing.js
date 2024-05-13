var u = { a:1, b:2 };
var v = { a:3, b:4 };
(function (x,y) {
     var tempA = x.a; var tempB =x.b;  //local variables
     x.a=y.a; x.b=y.b;
     y.a=tempA; y.b=tempB
}) (u,v);
console.log(u);
console.log(v);


exception IndexOutOfBounds;
fun get n nil = raise IndexOutOfBounds
  | get 0 (h::t) = h
  | get n (h::t) = get(n-1) t;

get 1 [1,2];
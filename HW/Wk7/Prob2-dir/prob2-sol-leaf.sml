datatype 'a btbr = leaf of 'a | branch of 'a btbr * 'a btbr;

val sample = branch (leaf 7, branch (leaf 9, leaf 5));

fun addall (leaf x) = x
  | addall (branch (l, r)) = addall l + addall r;

val test = addall sample = 21;


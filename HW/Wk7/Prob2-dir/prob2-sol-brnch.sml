datatype 'a btbr = leaf | branch of 'a * 'a btbr * 'a btbr;

val sample = branch (7, leaf, branch (9, leaf, leaf));

fun addall leaf = 0
  | addall (branch (x, l, r)) = x + addall l + addall r;

val test = addall sample = 16;


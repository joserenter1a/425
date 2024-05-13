(* Encoding of objects *)

datatype Message = GetBalance | Deposit of int | Withdraw of int ;

fun opening_account init_amt  = let
                                  val amount = ref init_amt
                                in
                                  fn msg => (case msg of
                                     Deposit amt  => (amount := !amount + amt;
                                                     !amount)
                                  |  Withdraw amt => (amount := !amount - amt;
                                                         !amount)
                                  |  GetBalance   => !amount
                                )
                               end;

val checking_account_Z=  opening_account 100;
val b1 = checking_account_Z (Withdraw 100);
val b2 = checking_account_Z (Deposit 50);

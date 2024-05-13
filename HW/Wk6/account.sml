datatype Message = GetBalance | Deposit of int | WithDraw of int
fun opening_account init_amt = 
   let val balance = ref init_amt
    in fn msg => (case msg of
                   GetBalance => !balance
                 | Deposit  n => (balance := !balance + n;!balance)
                 | WithDraw n => (balance := !balance - n;!balance)
                 )
end
val account1 = opening_account 10;
val account2 = opening_account 90;
val res1 = account1 (WithDraw 15);
val res2 = account1 (Deposit 100);
val res3 = account2 (WithDraw 20);

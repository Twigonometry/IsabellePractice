theory Calculator
imports Main
begin

(* state is a wrapper for an int
getInt is destructor *)

datatype state = St (getInt:int)

(* calculator functions on state *)

fun clear :: "state => state" where
"clear (St m) = St 0"

fun getResult :: "state => int" where
"getResult (St m) = m"

(* basic arithmetic function definitions
perform an action on a state *)

(*
fun add :: "int => state => state" where
"add m (St n) = St (m + n)"

fun sub :: "int => state => state" where
"sub m (St n) = St (m - n)"

fun mul :: "int \<Rightarrow> state => state" where
"mul m (St n) = St (m * n)"

fun divide :: "int \<Rightarrow> state => state" where
"divide m (St n) = St (m div n)"
*)

fun add :: "int => state => state" where
"add m (St n) = St (m + n)"

fun sub :: "int => state \<Rightarrow> state" where
"sub m (St n) = St (m - n)"

fun mul :: "int => state \<Rightarrow> state" where
"mul m (St n) = St (m * n)"

fun divi :: "int => state \<Rightarrow> state" where
"divi m (St n) = St (m div n)"

(* 
model a 'session' (series of commands in python program)
e.g.
calculator c = new Calculator(); (this will be boilerplate)
c.clear().add(2).clear().getResult();
*)

(*

datatype session = GetResult state | Clear session | Add int session | Sub int session | Mul int session | Div int session

term "GetResult x"

fun eval :: "session \<Rightarrow> state" where
"eval (GetResult x) = x" |
"eval (Add (int x) y) = add (int x) (eval y)"

*)

datatype session = GetResult | Clear session | Add int session | Sub int session | Mul int session | Div int session

(* todo: write evals in terms of arithmetic funcs? *)

value "add 2 (St 3)"

fun eval :: "state \<Rightarrow> session \<Rightarrow> state" where
"eval s GetResult = s" |
"eval (St i) (Clear ses)  = eval (St 0) ses" |
"eval (St j) (Add i ses) = eval (St (add i j)) ses" |
"eval (St j) (Sub i ses) = eval (St (sub i j)) ses" |
"eval (St j) (Mul i ses) = eval (St (mul i j)) ses" |
"eval (St j) (Div i ses) = eval (St (divi i j)) ses"

value "getInt (eval (St 0) (Add 5 GetResult))"

value "getInt (eval (St 0) (Clear (Add 5 GetResult)))"

value "getInt (eval (St 0) (Add 5 (Clear GetResult)))"

value "getInt (eval (St 0) (Add 5 (Clear (Add 3 (Add 4 GetResult)))) )"

end
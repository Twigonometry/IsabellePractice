theory Calculator
imports Main
begin

datatype state = St (getInt:int)

(* calculator functions on state *)

fun clear :: "state => state" where
"clear (St m) = St 0"

fun getResult :: "state => int" where
"getResult (St m) = m"

(* basic arithmetic function definitions
perform an action on a state *)

fun add :: "state => int => state" where
"add (St m) n = St (m + n)"

fun sub :: "state => int => state" where
"sub (St m) n = St (m - n)"

fun mul :: "state \<Rightarrow> int \<Rightarrow> state" where
"mul (St m) n = St (m * n)"

fun divide :: "state \<Rightarrow> int \<Rightarrow> state" where
"divide (St m) n = St (m div n)"

value "add (St 3) 3"

(* 
model a 'session' (series of commands in python program)
e.g.
calculator c = new Calculator(); (this will be boilerplate)
c.clear().add(2).clear().getResult();
*)

datatype session = GetResult | Clear session | Add int session | Sub int session | Mul int session | Div int session

term Add

term "Clear (Add 2 (Clear GetResult))"

value "Add 2 GetResult"

term "Clear (Add 2 (GetResult))"

end
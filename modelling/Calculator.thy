theory Calculator
imports Main
begin

(* basic arithmetic function definitions
defining these for the sake of modelling the Python program as closely as possible *)

fun add :: "nat => nat => nat" where
"add m n = m + n"

fun sub :: "nat => nat => nat" where
"sub m n = m - n"

fun mul :: "nat => nat => nat" where
"mul m n = m * n"

(* / character does not divide, div is builtin *)

fun divide :: "nat => nat => nat" where
"divide m n = m div n"

datatype calc_op = Plus | Minus | Times | Divides

(* Constructors for expression - Basic expression and Compound expression *)

datatype calc_expr = Bexp nat | Cexp calc_expr calc_op calc_expr

(* Use constructor names to pattern match for each case *)

fun calc_eval :: "calc_expr \<Rightarrow> nat" where
"calc_eval (Bexp n) = n" |
"calc_eval (Cexp x Plus y) = add (calc_eval x) (calc_eval y)" |
"calc_eval (Cexp x Minus y) = sub (calc_eval x) (calc_eval y)" |
"calc_eval (Cexp x Times y) = mul (calc_eval y) (calc_eval y)" |
"calc_eval (Cexp x Divides y) = divide (calc_eval x) (calc_eval y)"

value "add 3 3"

(* value "calc_eval Plus 3 3" *)
(* value "calc_eval 3 Plus 3" *)
(* value "calc_eval (Cexp 3 Plus 3)" *)

value "calc_eval (Bexp 3)"

value "calc_eval (Cexp (3 Plus 3))"

end
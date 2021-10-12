theory Calculator
imports Main
begin

(* basic arithmetic function definitions *)

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

datatype calc_expr = nat | calc_expr calc_op calc_expr

fun calc_eval :: calc_expr \<Rightarrow> nat where
"calc_expr Plus calc_expr = (calc_eval calc_expr) add (calc_eval calc_expr)"

end
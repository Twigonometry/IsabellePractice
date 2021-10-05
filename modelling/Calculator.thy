theory Calculator
imports Main
begin

(* basic arithmetic function definitions *)

fun add :: "nat => nat => nat" where
"add m n = m + n"

value "3 add 3"

fun sub :: "nat => nat => nat" where
"sub m n = m - n"

fun mul :: "nat => nat => nat" where
"mul m n = m * n"

(* / character does not divide, div is builtin *)

fun divide :: "nat => nat => nat" where
"divide m n = m div n"

value "(3::nat) add (3::nat)"

end
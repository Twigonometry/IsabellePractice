theory Queue
  imports Main
begin

(* datatype AQueue = a' list a' list *)

datatype 'a queue = AQueue "'a list" "'a list"

definition empty :: "'a queue" where
"empty = AQueue [] []"

primrec enqueue :: "'a \<Rightarrow> 'a queue \<Rightarrow> 'a queue" where
"enqueue x (AQueue xs ys) = AQueue (x # xs) ys"

fun dequeue :: "'a queue \<Rightarrow> 'a option \<times> 'a queue" where
"dequeue (AQueue [] []) = (None, AQueue [] [])"
| "dequeue (AQueue xs (y # ys)) = (Some y, AQueue xs ys)"
| "dequeue (AQueue xs []) =
(case rev xs of y # ys \<Rightarrow> (Some y, AQueue [] ys))"

export_code empty dequeue enqueue in Haskell module_name Queue file_prefix queue

end
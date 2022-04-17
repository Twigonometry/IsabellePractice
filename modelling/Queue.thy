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

value "dequeue (enqueue 1 (queue []))"

export_code empty dequeue enqueue in Haskell module_name Queue file_prefix queue

ML ‹
val gen_files = Generated_Files.get_files (Proof_Context.theory_of @{context})
val output_dir = Path.explode "./generatedHaskellFiles/"
›

ML ‹map (Generated_Files.write_file output_dir) gen_files›

end
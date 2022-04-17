theory Stack
  imports Main
begin

datatype 'a stack = AStack "'a list" "'a list"

definition empty :: "'a stack" where
"empty = AStack [] []"

primrec push :: "'a \<Rightarrow> 'a stack \<Rightarrow> 'a stack" where
"push x (AStack xs ys) = AStack (x # xs) ys"

fun pop :: "'a stack \<Rightarrow> 'a option \<times> 'a stack" where
"pop (AStack [] []) = (None, AStack [] [])"
| "pop (AStack (x # xs) ys) = (Some x, AStack xs ys)"
| "pop (AStack [] xs) =
(case rev xs of y # ys \<Rightarrow> (Some y, AStack ys []))"

value "pop (push 1 (stack []))"

end
theory Exercises
imports Main
begin

(* we are given these definitions *)

datatype 'a list = Nil | Cons 'a "'a list"

fun app :: "'a list => 'a list => 'a list" where
"app Nil ys = ys" |
"app (Cons x xs) ys = Cons x (app xs ys)"

fun rev :: "'a list => 'a list" where
"rev Nil = Nil" |
"rev (Cons x xs) = app (rev xs) (Cons x Nil)"

value "rev(Cons True (Cons False Nil))"

(* exercise 2.1 - expression evaluation *)

value "1 + (2::nat)"

value "1 + (2::int)"

value "1 - (2::nat)" (* evaluates as 0 *)

value "1 - (2::int)"

(* exercise 2.2 - associativity of add *)

fun add :: "nat \<Rightarrow> nat \<Rightarrow> nat" where
"add 0 n = n" |
"add (Suc m) n = Suc(add m n)"

lemma add_assoc [simp]: "add (add xs ys) zs = add xs (add ys zs)"
  apply(induction xs)
  apply (auto)
  done

lemma add_ys_0 [simp]: "add ys 0 = ys"
  apply(induction ys)
   apply auto
  done

lemma suc_add [simp]: "Suc (add ys xs) = add ys (Suc xs)"
  apply(induction ys)
  apply(auto)
  done
                                                         
lemma add_comm [simp]: "add xs ys = add ys xs"
  apply(induction xs)
  apply (auto)
  done

end
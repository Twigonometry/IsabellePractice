{-# LANGUAGE EmptyDataDecls, RankNTypes, ScopedTypeVariables #-}

module Stack(Stack, pop, push, items) where {

import Prelude ((==), (/=), (<), (<=), (>=), (>), (+), (-), (*), (/), (**),
  (>>=), (>>), (=<<), (&&), (||), (^), (^^), (.), ($), ($!), (++), (!!), Eq,
  error, id, return, not, fst, snd, map, filter, concat, concatMap, reverse,
  zip, null, takeWhile, dropWhile, all, any, Integer, negate, abs, divMod,
  String, Bool(True, False), Maybe(Nothing, Just));
import qualified Prelude;

data Stack a = AStack [a] [a];

pop :: forall a. Stack a -> Stack a;
pop (AStack [] []) = AStack [] [];
pop (AStack (x : xs) ys) = AStack xs ys;
pop (AStack [] (v : va)) = (case reverse (v : va) of {
                             _ : ys -> AStack ys [];
                           });

push :: forall a. a -> Stack a -> Stack a;
push x (AStack xs ys) = AStack (x : xs) ys;

items :: forall a. Stack a -> [a];
items (AStack xs ys) = xs ++ ys;

}

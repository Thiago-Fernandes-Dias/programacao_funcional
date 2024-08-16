module Ex1 (sumsq) where

sumsq :: Int -> Int
sumsq n = foldr (\a b -> b + a ^ 2) 0 [1..n]


module Ex1 (sumsq) where

sumsq :: Int -> Int
sumsq n = foldr (\a b -> b + a * a) 0 [1 .. n]

-- >>> sumsq 4
-- 30

-- >>> sumsq 9
-- 285

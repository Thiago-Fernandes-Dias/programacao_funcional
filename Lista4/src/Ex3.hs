module Ex3 (minListr, minListl) where

minListr :: (Ord a) => [a] -> a
minListr [] = error "Lista vazia"
minListr as = foldr1 (\acc n -> if n < acc then n else acc) as

minListl :: (Ord a) => [a] -> a
minListl [] = error "Lista vazia"
minListl as = foldl1 (\n acc -> if n < acc then n else acc) as

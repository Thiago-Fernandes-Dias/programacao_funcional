{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}

{-# HLINT ignore "Use minimum" #-}

module Ex3 (minListr, minListl) where

minListr :: (Ord a) => [a] -> a
minListr = foldr1 (flip min)

minListl :: (Ord a) => [a] -> a
minListl = foldl1 min

-- >>>minListr [1, 2, 3, 4, 5]
-- 1

-- >>>minListr [2, 3, 4, 5, 1]
-- 1

-- >>>minListl [1, 2, 3, 4, 5]
-- 1

-- >>>minListl [2, 3, 4, 5, 1]
-- 1

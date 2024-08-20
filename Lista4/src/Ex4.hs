module Ex4 (reversel, reverser) where

reversel :: [a] -> [a]
reversel = foldl (flip (:)) []

reverser :: [a] -> [a]
reverser = foldr (\n acc -> acc ++ [n]) []

-- >>> reversel [1, 2, 3, 4, 5, 6]
-- [6,5,4,3,2,1]

-- >>> reverser [1, 2, 3, 4, 5, 6]
-- [6,5,4,3,2,1]

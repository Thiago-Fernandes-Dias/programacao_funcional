module Ex2 (length1, length2) where

length1 :: [a] -> Int
length1 = foldr (\_ acc -> acc + 1) 0

length2 :: [a] -> Int
length2 = foldl (\acc _ -> acc + 1) 0

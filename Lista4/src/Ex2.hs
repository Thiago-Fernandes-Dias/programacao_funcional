module Ex2 (lenght1, lenght2) where

lenght1 :: [a] -> Int
lenght1 = foldr (\_ n -> n + 1) 0

lenght2 :: [a] -> Int
lenght2 = foldl (\n _ -> n + 1) 0

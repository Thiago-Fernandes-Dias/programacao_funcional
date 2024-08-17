module Ex4 (reversel, reverser) where

reversel :: [a] -> [a]
reversel = foldl (\acc n -> n : acc) []

reverser :: [a] -> [a]
reverser = foldr (\n acc -> acc ++ [n]) []

module Ex6 (filterr, filterl) where

filterr :: (a -> Bool) -> [a] -> [a]
filterr f = foldr (\n acc -> if f n then n : acc else acc) []

filterl :: (a -> Bool) -> [a] -> [a]
filterl f xs = reverse $ foldl (\acc n -> if f n then n : acc else acc) [] xs

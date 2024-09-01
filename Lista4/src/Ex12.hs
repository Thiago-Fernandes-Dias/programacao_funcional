module Ex12 (shift, rotate) where

shift :: [a] -> [a]
shift [] = []
shift xs = last xs : (init . tail $ xs) ++ [head xs]

filter' :: (Eq a) => a -> [a] -> [a]
filter' _ [] = []
filter' y (z : zs)
  | y == z = zs
  | otherwise = z : filter' y zs

rotate :: (Eq a) => [a] -> [[a]]
rotate xs = foldl (\acc x -> ([x] ++ shift (filter' x xs)) : acc) [] xs

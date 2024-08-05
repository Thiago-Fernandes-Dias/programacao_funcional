merge :: Ord a => [a] -> [a] -> [a]
merge [] [] = []
merge xs [] = xs
merge [] ys = ys
merge (x:xs) (y:ys) 
  | x < y = x : merge xs (y:ys)
  | x > y = y : merge (x:xs) ys
  | otherwise = x : y : merge xs ys

halve :: [a] -> ([a], [a])
halve [] = ([], [])
halve [x] = ([x], [])
halve [x, y] = ([x], [y])
halve (x1:x2:xs) = (x1:l1, x2:l2) where (l1, l2) = halve xs

msort :: Ord a => [a] -> [a]
msort [] = []
msort [x] = [x]
msort xs = merge (msort h1) (msort h2)
  where (h1, h2) = halve xs

main = do
  print $ msort [5, 4, 3, 2, 1]

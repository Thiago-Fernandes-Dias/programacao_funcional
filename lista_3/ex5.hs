data Tree a = EmptyLeaf | Leaf a | Node (Tree a) (Tree a) deriving (Show)

halve :: [a] -> ([a], [a])
halve [] = ([], [])
halve [x] = ([x], [])
halve [x, y] = ([x], [y])
halve (x1 : x2 : xs) = (x1 : l1, x2 : l2) where (l1, l2) = halve xs

balance :: [a] -> Tree a
balance [] = EmptyLeaf
balance [x] = Leaf x
balance xs = Node (balance h1) (balance h2) where (h1, h2) = halve xs

main = do
  print $ balance [1, 2, 3, 4, 5]


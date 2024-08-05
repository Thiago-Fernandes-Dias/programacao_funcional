data Tree a = Leaf a | Node (Tree a) a (Tree a) deriving (Show)

occurs :: Ord a => a -> Tree a -> Bool
occurs x (Leaf y) = x == y
occurs x (Node lt y rt) = x `occurs` lt || x `occurs` rt

tree = Node (Node (Leaf 6) 5 (Leaf 7)) 8 (Node (Leaf 4) 3 (Leaf 2)) :: Tree Int

main = do
  print $ occurs 4 tree
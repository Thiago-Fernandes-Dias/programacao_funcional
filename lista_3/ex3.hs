data Tree a = Leaf a | Node (Tree a) a (Tree a) deriving (Show)

flatten :: Tree a -> [a]
flatten (Leaf a) = []
flatten (Node lt l rt) = flatten lt ++ [l] ++ flatten rt


data Tree a = Leaf a | Node (Tree a) (Tree a) deriving (Show)

leafsQty :: Tree a -> Int
leafsQty (Leaf x) = 1
leafsQty (Node lt rt) = leafsQty lt + leafsQty rt

balanced :: Tree a -> Bool
balanced (Leaf x) = True
balanced (Node lt rt) = (>=) 1 $ abs $ leafsQty lt - leafsQty rt

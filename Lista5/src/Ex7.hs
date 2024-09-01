module Ex7 (arvorePossui) where

import Ex6_9 (Tree (..))

arvorePossui :: (Eq a) => a -> Tree a -> Bool
arvorePossui x = foldr (\n acc -> n == x || acc) False 

-- >>> arvorePossui 5 (Node (Node (Leaf 5) 5 (Leaf 5)) 5 (Leaf 5))
-- True

-- >>> arvorePossui 4 (Node (Node (Leaf 5) 5 (Leaf 5)) 5 (Leaf 5))
-- False

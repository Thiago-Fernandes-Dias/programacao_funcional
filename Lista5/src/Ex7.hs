module Ex7 (arvorePossui) where

import Ex6_9 (Tree (..))

arvorePossui :: Eq a => a -> Tree a -> Bool
arvorePossui x (Leaf y) = x == y
arvorePossui x (Node l y r) = x == y || arvorePossui x l || arvorePossui x r

module Ex8 (contaLetras) where

import Ex6_9 (Tree (..))

contaLetras :: Tree String -> Tree Int
contaLetras = fmap length

-- >>> contaLetras (Node (Node (Leaf "5") "5" (Leaf "5")) "5" (Leaf "5"))
-- Node (Node (Leaf 1) 1 (Leaf 1)) 1 (Leaf 1)

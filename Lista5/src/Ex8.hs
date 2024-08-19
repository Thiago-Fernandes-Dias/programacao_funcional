module Ex8 (contaLetras) where

import Ex6_9 (Tree (..))

contaLetras :: Tree String -> Tree Int
contaLetras = fmap length

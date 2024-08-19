module Ex12 (frutasDaArvore) where

import Ex10 (convertStringToInt)
import Ex11 (nothingToZero)
import Ex6_9 (Tree (..))

frutasDaArvore :: Tree String -> Int
frutasDaArvore = foldr (\n acc -> acc + len n) 0
  where
    len = nothingToZero . convertStringToInt

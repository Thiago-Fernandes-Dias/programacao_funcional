{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}

{-# HLINT ignore "Use concat" #-}
{-# HLINT ignore "Use <$>" #-}
{-# HLINT ignore "Use sum" #-}

module Main (main) where

import Ex1 (Resultado (..))
import Ex10 (convertStringToInt)
import Ex11 (nothingToZero)
import Ex12 (frutasDaArvore)
import Ex13 (ZipList (..))
import Ex14 (Expr (..))
import Ex15 (Identity (..), Pair (..))
import Ex20 (Fantasma (..))
import Ex22 (Memory (..))
import Ex2_3 (delete, fromList, insert, memberSet)
import Ex6_9 (Tree (..))
import Ex7 (arvorePossui)
import Ex8 (contaLetras)
import FunctorExample (f1)

main :: IO ()
main = do
  print $ f1 4 5 -- Functor example test
  print $ foldMap Pontuacao [1, 3, 4]
  print $ foldr1 (<>) [Pontuacao 1, Pontuacao 3, Pontuacao 4, Cola]
  print $ foldr1 (<>) [Cola, Pontuacao 1, Pontuacao 3, Pontuacao 4]
  print $ fromList [1, 1, 3, 3, 4, 5, 6, 4, 4, 8, 8, 1]
  print $ memberSet 5 (fromList [1, 1, 3, 3, 4, 5, 6, 4, 4, 8, 8, 1])
  print $ memberSet 9 (fromList [1, 1, 3, 3, 4, 5, 6, 4, 4, 8, 8, 1])
  print $ insert 9 (fromList [1, 1, 3, 3, 4, 5, 6, 4, 4, 8, 8, 1])
  print $ delete 9 (fromList [1, 1, 3, 3, 4, 5, 6, 4, 4, 8, 8, 1])
  print $ (+ 5) <$> Node (Node (Leaf 5) 5 (Leaf 5)) 5 (Leaf 5)
  print $ arvorePossui 5 (Node (Node (Leaf 5) 5 (Leaf 5)) 5 (Leaf 5))
  print $ arvorePossui 4 (Node (Node (Leaf 5) 5 (Leaf 5)) 5 (Leaf 5))
  print $ contaLetras (Node (Node (Leaf "5") "5" (Leaf "5")) "5" (Leaf "5"))
  print $ foldr (++) "" (Node (Node (Leaf "5") "5" (Leaf "5")) "5" (Leaf "5"))
  print $ convertStringToInt "1234"
  print $ convertStringToInt "123a"
  print $ nothingToZero Nothing
  print $ nothingToZero (Just 10)
  print $ frutasDaArvore (Node (Node (Leaf "5") "5" (Leaf "5")) "5" (Leaf "5"))
  print $ take 5 $ getList $ pure (+) <*> Z [5, 6, 7, 8] <*> Z [6, 6, 5]
  print (pure (\x y z -> x + y + z) <*> Var 3 <*> Var 3 <*> Val 6)
  print (pure (\x y z -> x + y + z) <*> Var 3 <*> Var 3 <*> Add (Val 5) (Var 6))
  print (pure (+) <*> Pair 4 5 <*> Pair 6 5)
  print (pure (+) <*> Identity 4 <*> Identity 5)
  print (fmap (+) Fantasma)
  print (pure (+) <*> Fantasma <*> Fantasma)
  print (traverse (: []) $ SplitCache 5 2 (UnifiedCache 10 (RAM 5)))
  print (fromList [1, 3, 3, 4] <> fromList [1, 2, 3, 3, 5])

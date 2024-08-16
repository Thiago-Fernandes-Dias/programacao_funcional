module Main (main) where

import Ex1 (sumsq)
import Ex2 (lenght1, lenght2)

main :: IO ()
main = do
  print $ sumsq 4
  print $ lenght1 [1, 2, 3, 4, 5]
  print $ lenght2 [1, 2, 3, 4, 5]

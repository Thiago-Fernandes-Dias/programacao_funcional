module Main (main) where

import Ex11 (iterate')
import Ex12 (rotate, shift)

main :: IO ()
main = do
  -- TODO: QuickCheck tests
  print $ take 5 $ iterate (+ 1) 1
  print $ shift [1, 2, 3]
  print $ rotate [1, 2, 3]
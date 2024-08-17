module Main (main) where

import Ex1 (sumsq)
import Ex2 (length1, length2)
import Ex3 (minListl, minListr)
import Ex4 (reversel, reverser)
import Ex5 (remove)
import Ex6 (filterr, filterl)
import Ex7 (remdupsr, remdupsl)
import Ex8 (inits)
import Ex9 (approxe)

main :: IO ()
main = do
  print $ sumsq 4
  print $ length1 [1, 2, 3, 4, 5]
  print $ length2 [1, 2, 3, 4, 5]
  print $ minListr [1, 2, 3, 4, 5]
  print $ minListr [2, 3, 4, 5, 1]
  print $ minListl [1, 2, 3, 4, 5]
  print $ minListl [2, 3, 4, 5, 1]
  print $ reversel [1, 2, 3, 4, 5, 6]
  print $ reverser [1, 2, 3, 4, 5, 6]
  print $ remove "first" "second"
  print $ filterr (> 1) [1, 2, 3, 4, 5]
  print $ filterl (> 1) [1, 2, 3, 4, 5]
  print $ remdupsr [1, 2, 2, 3, 3, 3, 1, 1]
  print $ remdupsl [1, 2, 2, 3, 3, 3, 1, 1]
  print $ inits "ate"
  print $ approxe 4

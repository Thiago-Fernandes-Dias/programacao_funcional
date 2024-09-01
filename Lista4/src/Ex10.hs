module Ex10 (sae) where

import Ex9 (approxe)

sae :: (Integral i, Fractional f) => i -> [f]
sae n = scanl (\acc i -> acc + recip (fact i)) 1 [1 .. n - 1]
  where
    fact i = fromIntegral $ product [2 .. i]

-- >>> sae 4

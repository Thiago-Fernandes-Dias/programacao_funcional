module Ex9 (approxe) where

fat :: (Eq a, Num a) => a -> a
fat 0 = 1
fat n = n * fat (n - 1)

fats :: (Eq a, Fractional a) => a -> [a]
fats 0 = []
fats n = (1 / fat n) : fats (n - 1)

approxe :: (Eq a, Fractional a) => a -> a
approxe n = foldl (+) 1 $ fats n

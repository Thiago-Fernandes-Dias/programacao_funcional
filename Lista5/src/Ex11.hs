module Ex11 (nothingToZero) where

nothingToZero :: Maybe Int -> Int
nothingToZero Nothing = 0
nothingToZero (Just n) = n

-- >>> nothingToZero Nothing
-- 0

-- >>> nothingToZero (Just 10)
-- 10

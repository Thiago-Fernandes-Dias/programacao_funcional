module Ex10 (convertStringToInt) where

import Text.Read (readMaybe)

convertStringToInt :: String -> Maybe Int
convertStringToInt = readMaybe

-- >>> convertStringToInt "1234"
-- Just 1234

-- >>> convertStringToInt "123a"
-- Nothing

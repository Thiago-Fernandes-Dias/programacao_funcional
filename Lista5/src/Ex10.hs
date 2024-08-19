module Ex10 (convertStringToInt) where

import Text.Read (readMaybe)

convertStringToInt :: String -> Maybe Int
convertStringToInt "" = Nothing
convertStringToInt xs = readMaybe xs
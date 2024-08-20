{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use map" #-}

module Ex8 (inits) where

inits :: String -> [String]
inits xs = foldr (\x acc -> take x xs : acc) [] [0 .. length xs]

-- >>> inits "ate"
-- ["","a","at","ate"]

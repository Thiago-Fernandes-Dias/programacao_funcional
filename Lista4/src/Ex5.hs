module Ex5 (remove) where

remove :: String -> String -> String
remove str1 = foldr (\n acc -> if n `elem` str1 then acc else n : acc) []

-- >>> remove "first" "second"
-- "econd"

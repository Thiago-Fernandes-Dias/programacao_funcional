module Ex5 (remove) where

remove :: String -> String -> String
remove "" str = str
remove str1 str2 = foldr (\n acc -> if elem n str1 then acc else n : acc) [] str2

module Ex8 (inits) where

inits :: String -> [String] 
inits "" = []
inits str = reverse $ foldr (\n acc -> (n : head acc) : acc) [[]] str

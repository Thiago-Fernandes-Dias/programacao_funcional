module Ex7 (remdupsr, remdupsl) where

remdupsr :: (Eq a) => [a] -> [a]
remdupsr [] = []
remdupsr xs = foldr (\n acc -> if (acc /= []) && (n == head acc) then acc else n : acc) [] xs

remdupsl :: (Eq a) => [a] -> [a]
remdupsl [] = []
remdupsl xs = reverse $ foldl (\acc n -> if (acc /= []) && (n == head acc) then acc else n : acc) [] xs
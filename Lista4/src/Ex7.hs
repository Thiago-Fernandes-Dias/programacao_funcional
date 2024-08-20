module Ex7 (remdupsr, remdupsl) where

remdupsr :: (Eq a) => [a] -> [a]
remdupsr [] = []
remdupsr xs = foldr (\n acc -> if (acc /= []) && (n == head acc) then acc else n : acc) [] xs

remdupsl :: (Eq a) => [a] -> [a]
remdupsl [] = []
remdupsl xs = reverse $ foldl (\acc n -> if (acc /= []) && (n == head acc) then acc else n : acc) [] xs

-- >>> remdupsr [1, 2, 2, 3, 3, 3, 1, 1]
-- [1,2,3,1]

-- >>> remdupsl [1, 2, 2, 3, 3, 3, 1, 1]
-- [1,2,3,1]

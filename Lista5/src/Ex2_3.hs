module Ex2_3 (Set (..), fromList, member, insert, delete) where

import Data.List (sort)

newtype Set a = Set [a] deriving (Eq)

instance (Show a) => Show (Set a) where
  show (Set xs) = map removeBrackets $ show xs
    where
      removeBrackets c
        | c == '[' = '{'
        | c == ']' = '}'
        | otherwise = c

fromList :: (Ord a) => [a] -> Set a
fromList [] = Set []
fromList xs = Set . foldr (\n acc -> if (acc /= []) && n == head acc then acc else n : acc) [] . sort $ xs

-- >>> fromList [1, 1, 3, 4, 4, 5, 3, 2, 2]
-- {1,2,3,4,5}

-- halve :: [a] -> ([a], [a])
-- halve [] = ([], [])
-- halve [x] = ([], [x])
-- halve [x, y] = ([x], [y])
-- halve (x1 : x2 : xs) = (x1 : h1, x2 : h2)
--   where
--     (h1, h2) = halve xs

-- TODO: substituir por Binary Search
member :: (Ord a) => a -> Set a -> Bool
member _ (Set []) = False
member i (Set (x : xs)) = i == x || member i (Set xs)

-- >>> member 1 (fromList [1, 2, 3])
-- True

insert :: (Ord a) => a -> Set a -> Set a
insert e (Set xs) = Set (sort (e : xs))

-- >>> insert 4 $ fromList [1, 2, 3]
-- {1,2,3,4}

delete :: (Ord a) => a -> Set a -> Set a
delete i (Set xs) = Set $ filter (/= i) xs

-- >>> delete 3 $ fromList [1, 2, 3]
-- {1,2}

instance (Ord a) => Semigroup (Set a) where
  Set xs <> Set ys = fromList $ xs <> ys

instance (Ord a) => Monoid (Set a) where
  mempty = Set []

-- >>> fromList [2, 1, 2] <> fromList [2, 1, 3]
-- {1,2,3}

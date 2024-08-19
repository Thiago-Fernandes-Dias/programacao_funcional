module Ex2 (Set (..), fromList, member, insert, delete) where

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
fromList xs = Set $ foldr (\n acc -> if (acc /= []) && n == head acc then acc else n : acc) [] sxs
  where
    sxs = sort xs

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

insert :: (Ord a) => a -> Set a -> Set a
insert e (Set xs) = Set (sort (e : xs))

delete :: (Ord a) => a -> Set a -> Set a
delete i (Set xs) = Set $ filter (/= i) xs

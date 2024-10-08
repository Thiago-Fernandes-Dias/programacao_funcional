module Ex13 (ZipList (..)) where

newtype ZipList a = Z {getList :: [a]} deriving (Show)

instance Functor ZipList where
  fmap g (Z xs) = Z $ fmap g xs

instance Applicative ZipList where
  pure x = Z $ repeat x
  Z fs <*> Z xs = Z [f x | (f, x) <- zip fs xs]

-- >>> pure (+) <*> Z [5, 6, 7, 8] <*> Z [6, 6, 5]
-- Z {getList = [11,12,12]}

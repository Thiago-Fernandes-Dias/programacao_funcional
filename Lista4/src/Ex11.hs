module Ex11 (iterate') where

newtype ZipList a = Z {getList :: [a]} deriving (Show)

instance Functor ZipList where
  fmap g (Z xs) = Z $ fmap g xs

instance Applicative ZipList where
  pure x = Z $ repeat x
  Z fs <*> Z xs = Z [f x | (f, x) <- zip fs xs]

iterate' :: (a -> a) -> a -> [a]
iterate' f x = getList zr 
  where zr = Z (scanl (\acc n -> n . acc) id $ repeat f) <*> Z (repeat x)

-- >>> take 5 $ iterate (+1) 1

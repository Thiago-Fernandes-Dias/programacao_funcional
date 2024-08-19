module Ex15 (Identity (..), Pair (..)) where

newtype Identity a = Identity a deriving (Show)

data Pair a = Pair a a deriving (Show)

instance Functor Identity where
  fmap f (Identity a) = Identity (f a)

instance Applicative Identity where
  pure = Identity
  Identity f <*> Identity x = Identity (f x)

instance Functor Pair where
  fmap f (Pair x y) = Pair (f x) (f y)

instance Applicative Pair where
  pure x = Pair x x
  Pair f g <*> Pair x y = Pair (f x) (g y)

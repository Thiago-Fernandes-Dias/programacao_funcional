module Ex3 (Identity (..), Pair (..)) where

newtype Identity a = Identity a deriving (Show)

instance Functor Identity where
  fmap f (Identity a) = Identity $ f a

instance Applicative Identity where
  pure = Identity
  Identity f <*> i = fmap f i

instance Monad Identity where
  Identity a >>= f = f a

data Pair a = Pair a a deriving (Show)

instance Functor Pair where
  fmap f (Pair x y) = Pair (f x) (f y)

instance Applicative Pair where
  pure x = Pair x x
  Pair f g <*> Pair x y = Pair (f x) (g y)

instance Monad Pair where
  (Pair x _) >>= f = f x

-- >>> Pair 1 3 >>= (\n -> Pair (n + 1) (n + 2))
-- Pair 2 3

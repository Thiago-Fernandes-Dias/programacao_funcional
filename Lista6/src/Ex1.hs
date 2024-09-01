module Ex1 (Caixa (..)) where

newtype Caixa a = Caixa a deriving (Eq, Show)

instance Functor Caixa where
  fmap f (Caixa x) = Caixa (f x)

instance Applicative Caixa where
  pure = Caixa
  Caixa f <*> Caixa x = Caixa $ f x

instance Monad Caixa where
  Caixa x >>= f = f x

-- >>> fmap (+1) $ Caixa 2
-- Caixa 3

-- >>> pure (+) <*> Caixa 1 <*> Caixa 2
-- Caixa 3

-- >>> Caixa 4 >>= (\n -> Caixa $ n + 1)
-- Caixa 5

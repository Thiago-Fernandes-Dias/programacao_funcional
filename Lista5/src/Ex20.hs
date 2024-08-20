module Ex20 (Fantasma (..)) where

data Fantasma a = Fantasma deriving (Show)

instance Functor Fantasma where
  fmap f Fantasma = Fantasma

instance Applicative Fantasma where
  pure _ = Fantasma
  Fantasma <*> Fantasma = Fantasma

-- >>> fmap (+) Fantasma

-- >>> pure (+) Fantasma <*> Fantasma
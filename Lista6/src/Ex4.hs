module Ex4 (Fantasma (..)) where

data Fantasma a = Fantasma

instance Functor Fantasma where
  fmap _ Fantasma = Fantasma

instance Applicative Fantasma where
  pure _ = Fantasma
  Fantasma <*> Fantasma = Fantasma

instance Monad Fantasma where
  Fantasma >>= _ = Fantasma

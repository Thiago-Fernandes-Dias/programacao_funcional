data Fantasma a = Fantasma deriving (Show)

instance Functor Fantasma where
  fmap _ Fantasma = Fantasma

instance Applicative Fantasma where
  pure _ = Fantasma
  Fantasma <*> Fantasma = Fantasma

-- >>> fmap (+) Fantasma
-- Fantasma

-- >>> pure (+) <*> Fantasma <*> Fantasma
-- Fantasma

module Ex1 (Resultado (..)) where

data Resultado = Pontuacao Int | Cola deriving (Show, Eq)

instance Semigroup Resultado where
  Pontuacao x <> Pontuacao y = Pontuacao (x + y)
  _ <> _ = Cola

instance Monoid Resultado where
  mempty = Pontuacao 0

-- >>> foldMap Pontuacao [1, 3, 4]
-- Pontuacao 8

-- >>> foldr1 (<>) [Pontuacao 1, Pontuacao 3, Pontuacao 4, Cola]
-- Cola

-- >>> foldr1 (<>) [Cola, Pontuacao 1, Pontuacao 3, Pontuacao 4]
-- Cola

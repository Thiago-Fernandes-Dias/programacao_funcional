module Ex1 (Resultado (..)) where

data Resultado = Pontuacao Int | Cola deriving (Show, Eq)

instance Semigroup Resultado where
  Pontuacao x <> Pontuacao y = Pontuacao (x + y)
  _ <> Cola = Cola
  Cola <> _ = Cola

instance Monoid Resultado where
  mempty = Pontuacao 0
 
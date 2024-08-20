module Ex21 (Duo (..)) where

data Duo a = Duo (Bool -> a)

instance Functor Duo where
  fmap f (Duo g) = Duo (\b -> f $ g b)

instance Applicative Duo where
  pure x = Duo (\_ -> x)
  Duo g <*> Duo a = Duo (\b -> g b (a b))

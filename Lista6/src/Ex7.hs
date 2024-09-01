module Ex7 (Bolso (..)) where

data Bolso a = Um a | Dois a a | Tres a a a

instance Functor Bolso where
  fmap f (Um x) = Um $ f x
  fmap f (Dois x y) = Dois (f x) (f y)
  fmap f (Tres x y z) = Tres (f x) (f y) (f z)

instance (Eq a) => Eq (Bolso a) where
  Um x == Dois _ z = x == z
  Dois _ z == Um x = x == z
  Um x == Tres _ _ w = x == w
  Tres _ _ w == Um x = x == w
  Dois _ x == Tres _ _ y = x == y
  Tres _ _ y == Dois _ x = x == y
  Um x == Um y = x == y
  Dois _ x == Dois _ y = x == y
  Tres _ _ x == Tres _ _ y = x == y

instance Applicative Bolso where
  pure = Um
  Um f <*> b = fmap f b
  Dois _ g <*> b = fmap g b
  Tres _ _ h <*> b = fmap h b

instance Monad Bolso where
  Um x >>= f = f x
  Dois _ y >>= f = f y
  Tres _ _ z >>= f = f z
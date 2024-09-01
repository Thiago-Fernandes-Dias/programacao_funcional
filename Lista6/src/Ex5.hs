module Ex5 (Duo (..)) where

newtype Duo a = Duo (Bool -> a)

instance Functor Duo where
  fmap f (Duo g) = Duo $ f . g

instance Applicative Duo where
  pure x = Duo (const x)
  Duo f <*> Duo g = Duo $ \b -> f b $ g b

flatten :: Bool -> Duo a -> a
flatten b (Duo f) = f b

instance Monad Duo where
  Duo g >>= f = Duo (\b -> flatten b $ f (g b))
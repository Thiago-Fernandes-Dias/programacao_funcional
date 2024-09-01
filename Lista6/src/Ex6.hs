module Ex6 (Request (..)) where

data Request a = Loading | Error | Success a

boxedCoerce :: Request a -> Request b
boxedCoerce Loading = Loading
boxedCoerce Error = Error
boxedCoerce _ = error "Not supposed to be used for a Success Request"

instance Functor Request where
  fmap f (Success x) = Success $ f x
  fmap _ s = boxedCoerce s

instance Applicative Request where
  pure = Success
  Success f <*> Success x = Success (f x)
  Error <*> _ = Error
  _ <*> Error = Error
  Loading <*> r = boxedCoerce r
  _ <*> Loading = Loading

instance Monad Request where
  (Success x) >>= f = f x
  r >>= _ = boxedCoerce r
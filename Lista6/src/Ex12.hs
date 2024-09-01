module Ex12 (verde) where

verde :: (Monad m) => m a -> m (a -> b) -> m b
verde ma mf = mf <*> ma
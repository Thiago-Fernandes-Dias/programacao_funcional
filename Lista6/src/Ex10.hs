module Ex10 (amarelo) where

amarelo :: (Monad m) => (a -> b) -> m a -> m b
amarelo f m = fmap f m
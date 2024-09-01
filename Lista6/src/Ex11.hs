module Ex11 (vermelho) where

vermelho :: Monad m => (a -> b -> c) -> m a -> m b -> m c
vermelho f ma mb = (f <$> ma) <*> mb

-- >>> vermelho (+) (Just 1) (Just 3)
-- Just 4

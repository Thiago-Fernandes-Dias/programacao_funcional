module Ex9 (azul) where

azul :: (Monad m) => m (m a) -> m a
azul m = m >>= id

-- >>> azul (Just (Just 6))
-- Just 6

module Ex13 (laranja) where

laranja :: (Monad m) => [m a] -> m [a]
laranja [] = return []
laranja [m] = fmap (: []) m
laranja (m : ms) = ((:) <$> m) <*> laranja ms

-- >>> laranja [Just 5, Just 6, Just 7]
-- Just [5,6,7]

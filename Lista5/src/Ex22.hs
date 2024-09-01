module Ex22 (Memory (..)) where

data Memory a = UnifiedCache a (Memory a) | SplitCache a a (Memory a) | RAM a deriving (Show)

instance Functor Memory where
  fmap g (RAM x) = RAM (g x)
  fmap g (UnifiedCache x mem) = UnifiedCache (g x) (fmap g mem)
  fmap g (SplitCache x y mem) = SplitCache (g x) (g y) (fmap g mem)

instance Foldable Memory where
  foldMap g (RAM x) = g x
  foldMap g (UnifiedCache x mem) = g x <> foldMap g mem
  foldMap g (SplitCache x y mem) = g x <> g y <> foldMap g mem

instance Traversable Memory where
  traverse g (RAM x) = RAM <$> g x
  traverse g (UnifiedCache x mem) = UnifiedCache <$> g x <*> traverse g mem
  {- Example: UnifiedCache x (UnifiedCache z (RAM w))
  UnifiedCache <$> g x = g (UnifiedCache x)
  g (UnifiedCache x) <*> traverse g (UnifiedCache z (RAM w)) = g (UnifiedCache x) <*> UnifiedCache <$> g z <*> pure RAM =
  g (UnifiedCache x) <*> g (UnifiedCache z) <*> pure RAM = g (UnifiedCache x (UnifiedCache z (RAM w)))
  -}
  traverse g (SplitCache x y mem) = SplitCache <$> g x <*> g y <*> traverse g mem

-- >>> traverse (\x -> [x]) $ SplitCache 5 2 (UnifiedCache 10 (RAM 5))
-- [SplitCache 5 2 (UnifiedCache 10 (RAM 5))]

-- >>> traverse (: []) $ SplitCache 5 2 (UnifiedCache 10 (RAM 5))
-- [SplitCache 5 2 (UnifiedCache 10 (RAM 5))]

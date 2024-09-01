module Ex6_9 (Tree (..)) where

data Tree a = Leaf a | Node (Tree a) a (Tree a) deriving (Show)

instance Functor Tree where
  fmap f (Leaf x) = Leaf (f x)
  fmap f (Node l x r) = Node (fmap f l) (f x) (fmap f r)

instance Foldable Tree where
  foldMap f (Leaf a) = f a
  foldMap f (Node l a r) = foldMap f l <> f a <> foldMap f r

-- >>> (+ 5) <$> Node (Node (Leaf 5) 5 (Leaf 5)) 5 (Leaf 5)
-- Node (Node (Leaf 10) 10 (Leaf 10)) 10 (Leaf 10)

-- >>> foldr (++) "" (Node (Node (Leaf "5") "5" (Leaf "5")) "5" (Leaf "5"))
-- "55555"

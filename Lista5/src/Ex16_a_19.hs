data RLE a = Repeat Int a (RLE a) | End deriving (Eq, Show)

instance Foldable RLE where
  foldr _ b End = b
  foldr g b (Repeat 1 x rle) = g x (foldr g b rle)
  foldr g b (Repeat n x rle) = g x (foldr g b (Repeat (n - 1) x rle))

rleCons :: (Eq a) => a -> RLE a -> RLE a
rleCons x End = Repeat 1 x End
rleCons x (Repeat n y rle)
  | x == y = Repeat (n + 1) x rle
  | otherwise = Repeat n y (rleCons x rle)

encode :: (Eq a) => [a] -> RLE a
encode = foldr rleCons End

decode :: RLE a -> [a]
decode = foldr (:) []

-- >>> rleCons 1 $ rleCons 2 $ rleCons 1 $ rleCons 2 End
-- Repeat 2 2 (Repeat 2 1 End)

-- >>> foldr (+) 0 (rleCons 1 $ rleCons 2 $ rleCons 1 $ rleCons 2 End)
-- 6

-- >>> encode [1, 2, 1, 1, 3, 2]
-- Repeat 2 2 (Repeat 1 3 (Repeat 3 1 End))

-- >>> decode (rleCons 1 $ rleCons 2 $ rleCons 1 $ rleCons 2 End)
-- [2,2,1,1]

{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}

{-# HLINT ignore "Use <$>" #-}
module FunctorExample (f1, f2) where

data SafeNum a = SafeNum a | PosInf | NegInf | NaN deriving (Show)

safeDiv :: Int -> Int -> SafeNum Int
safeDiv x 0 = if signum x > 0 then PosInf else NegInf
safeDiv x y = SafeNum (x `div` y)

-- >>> safeDiv 4 4
-- SafeNum 1

safeAdd :: Int -> Int -> SafeNum Int
safeAdd x y
    | signum x /= signum y = SafeNum z
    | signum z /= signum x = if signum x > 0 then PosInf else NegInf
    | otherwise = SafeNum z
  where
    z = x + y

-- >>> safeAdd 5 5
-- SafeNum 10

boxedCoerce :: SafeNum a -> SafeNum b
boxedCoerce PosInf = PosInf
boxedCoerce NegInf = NegInf
boxedCoerce NaN = NaN
boxedCoerce (SafeNum _) = error "SafeNum not allowed"

instance Functor SafeNum where
    fmap f (SafeNum x) = SafeNum (f x)
    fmap _ x = boxedCoerce x

flatten :: SafeNum (SafeNum a) -> SafeNum a
flatten (SafeNum sn) = sn
flatten v = boxedCoerce v

{- (x/y) + (y/x) -}
-- Remember that fmap signature is "fmap :: (a -> b) -> f a -> f b"
f1 :: Int -> Int -> SafeNum Int
f1 x y =
    let xy = safeDiv x y
        yx = safeDiv y x
        safeAddXY = fmap safeAdd xy
        {-
        SafeNum ((\i1 i2 -> SafeNum i1 + i2) w), where "xy" is SafeNum w, which is
        SafeNum (\i -> SafeNum w + i)
        -}
        safeXYPlusYX = fmap (<$> yx) safeAddXY
     in {-
        SafeNum ((\i -> SafeNum w + i) <$> SafeNum s), where SafeNum s = yx.
        SafeNum ((\i -> SafeNum w + i) <$> SafeNum s) = SafeNum $ SafeNum $ (\i -> SafeNum w + i) s =
        SafeNum $ SafeNum $ SafeNum $ w + s *End*
        -}
        (flatten . flatten) safeXYPlusYX

-- >>> f1 4 5
-- SafeNum 1

instance Applicative SafeNum where
    pure = SafeNum
    f <*> x = flatten $ fmap (<$> x) f

{-
fmap (<$> SafeNum s) (SafeNum (a -> b)) = SafeNum ((a -> b) <$> SafeNum s) =
SafeNum $ SafeNum $ (a -> b) s
-}

f2 :: Int -> Int -> SafeNum Int
f2 x y =
    let xy = safeDiv x y
        yx = safeDiv y x
     in flatten $ pure safeAdd <*> xy <*> yx

-- >>> f2 4 5
-- SafeNum 1

instance Monad SafeNum where
    SafeNum s >>= f = f s
    sfn >>= _ = boxedCoerce sfn

f3 :: Int -> Int -> SafeNum Int
f3 x y =
    safeDiv x y >>= \n -> safeDiv y x >>= \m -> safeAdd n m

f4 :: Int -> Int -> SafeNum Int
f4 x y = do
    n <- safeDiv x y
    m <- safeDiv y x
    safeAdd n m

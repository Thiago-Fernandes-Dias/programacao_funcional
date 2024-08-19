module ApplicativeExamples (nothing) where

{-
fmap0 :: a -> f a (coloca um valor dentro de um contexto)
fmap1 :: (a -> b) -> f a -> f b (função de um parâmetro e um valor dentro de um contexto)
fmap2 :: (a -> b -> c) -> f a -> f b -> f c (função de dois parâmetros e dois valores dentro de um contexto)
fmap3 :: (a -> b -> c -> d) -> f a -> f b -> f c -> f d (função de três parâmetros...)


class Functor t => Applicative t where
    pure :: a -> f a
    apply :: f (a -> b) -> f a -> f b
    

fmap0 = pure
fmap1 f ta = apply (pure f) ta
fmap2 f ta tb = apply ( apply ( pure f ) ta ) tb
fmap3 f ta tb tc = apply ( apply ( apply (pure f) ta ) tb ) tc
-}

nothing = "Nothing"

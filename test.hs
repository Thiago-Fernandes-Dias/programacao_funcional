module Main where

y f = f (y f)

fat :: (Eq t, Num t) => (t -> t) -> t -> t
fat f 1 = 1
fat f n = n * f (n - 1)

len = foldr (\n _ -> n + 1) 0

main :: IO ()
main = do
    print (y fat 10)
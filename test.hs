module Main where
import Data.Void

data Fuzzy = V | F | BelongPC Double deriving Show

newtype FuzzyType a = AV a

data Ponto3D = Ponto { coordX :: Double
                     , coordY :: Double
                     , coordZ :: Double
                     }

type ZeroMaisUm = Either Void ()

a = Right () :: ZeroMaisUm

fuzzify :: Double -> Fuzzy
fuzzify d 
  | d <= 0 = F
  | d >= 1 = V
  | otherwise = BelongPC d

main :: IO ()
main = do
  print $ fuzzify 0.5

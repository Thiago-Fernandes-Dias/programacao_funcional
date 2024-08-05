infixr 5 :-

data List a = Nil | a :- List a

data Sem = Green | Yellow | Red deriving (Eq, Show, Enum)

count :: Sem -> List Sem -> Int
count _ Nil = 0
count x (y :- ys) | x == y = 1 + count x ys
  | otherwise = count x ys

next :: Sem -> Sem
next Red = Green
next c = succ c

main = do
  print $ next $ next $ next $ next Red
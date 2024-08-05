data Expr = Val Int | Add Expr Expr deriving Show

folde :: (Int -> a) -> (a -> a -> a) -> Expr -> a
folde f _ (Val i) = f i
folde f g (Add e1 e2) = g (folde f g e1) (folde f g e2)

eval :: Expr -> Int
eval = folde id (+)

size :: Expr -> Int
size (Val v) = 1
size (Add expr1 expr2) = 1 + size expr1 + size expr2 

main = do
  print $ folde (+1) (*) (Add (Add (Val 1) (Val 5)) (Val 3))
  print $ eval (Add (Val 1) (Add (Val 3) (Val 7)))
  print $ size (Add (Val 1) (Add (Val 3) (Val 7)))
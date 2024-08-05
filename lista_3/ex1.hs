data Nat = Zero | Succ Nat deriving Show

add :: Nat -> Nat -> Nat
add Zero n = n
add (Succ m) n = Succ (add m n)

mult :: Nat -> Nat -> Nat
mult Zero _ = Zero
mult _ Zero = Zero
mult (Succ Zero) n = n
mult n (Succ Zero) = n
mult (Succ m) n = mult m (add n n)

main = do
  print $ mult (Succ (Succ Zero)) (Succ (Succ (Succ Zero)))
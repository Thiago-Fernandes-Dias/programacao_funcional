module Ex2 (Expr (..)) where

data Expr a = Var a | Val Int | Add (Expr a) (Expr a) deriving (Show)

instance Functor Expr where
  fmap f (Var x) = Var $ f x
  fmap _ (Val i) = Val i
  fmap f (Add e1 e2) = Add (fmap f e1) (fmap f e2)

instance Applicative Expr where
  pure = Var
  Var g <*> e = g <$> e

instance Monad Expr where
  Var x >>= f = f x
  Val i >>= _ = Val i
  Add e1 e2 >>= f = Add (e1 >>= f) (e2 >>= f)

-- >>> fmap (+1) (Add (Var 1) (Var 2))
-- Add (Var 2) (Var 3)

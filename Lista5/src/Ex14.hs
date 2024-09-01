{-# OPTIONS_GHC -Wno-incomplete-patterns #-}

module Ex14 (Expr (..)) where

data Expr a = Var a | Val Int | Add (Expr a) (Expr a) deriving (Show)

instance Functor Expr where
  fmap f (Var a) = Var (f a)
  fmap _ (Val x) = Val x
  fmap f (Add expr1 expr2) = Add (fmap f expr1) (fmap f expr2)

instance Applicative Expr where
  pure = Var
  Var g <*> e = fmap g e

-- >>> pure (\x y z -> x + y + z) <*> Var 3 <*> Var 3 <*> Var 6
-- Var 12

-- >>> pure (\x y z -> x + y + z) <*> Var 3 <*> Var 3 <*> Add (Val 5) (Var 6)
-- Add (Val 5) (Var 12)

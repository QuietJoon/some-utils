module Utils.Operator where

{-# INLINE (>>==) #-}
-- | Monad-like function binder
v >>== f = f v
infixl 9 >>==

module Utils.Operator where

{-# INLINE (>>==) #-}
v >>== f = f v
infixl 9 >>==

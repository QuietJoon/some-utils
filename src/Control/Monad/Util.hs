{-# LANGUAGE ExplicitForAll, KindSignatures #-}
{-# LANGUAGE CPP #-}

module Control.Monad.Util where

#ifdef LIMITEDDEBUG
import Control.Exception
#endif

-- | Shorthand of `retryThisWhile`
rtw :: forall (m :: * -> *) b. Monad m => m b -> (b -> Bool) -> m b
rtw = retryThisWhile
-- | Shorthand of `retryThisWhileUntil`
rtwu :: forall (m :: * -> *) b. Monad m => Int -> m b -> (b -> Bool) -> m b
rtwu = retryThisWhileUntil
-- | Shorthand of `retryThisWhileUntilDefault`
rtwud :: forall (m :: * -> *) b. Monad m => b -> Int -> m b -> (b -> Bool) -> m b
rtwud = retryThisWhileUntilDefault
-- | Shorthand of `retryThisWhileUntilM`
rtwum :: forall (m :: * -> *) b. Monad m => Int -> m b -> (b -> Bool) -> m (Maybe b)
rtwum = retryThisWhileUntilM

{-# INLINE retryThisWhile #-}
-- | Retry given monadic function until the result satisfy given check function
-- This may not stop, therefore use this very carefully or use `retryThisWhileUntil`
retryThisWhile :: forall (m :: * -> *) b. Monad m => m b -> (b -> Bool) -> m b
retryThisWhile f chk = do
  v <- f
  if chk v
    then retryThisWhile f chk
    else return v

{-# INLINE retryThisWhileUntil #-}
-- | Retry given monadic function until the result satisfy given check function or the retrying time reaches given number
-- When retrying time reaches given number, the function returns the last result
retryThisWhileUntil :: forall (m :: * -> *) b. Monad m => Int -> m b -> (b -> Bool) -> m b
retryThisWhileUntil num f chk =
    retryThisWhileUntilSub num
  where
    retryThisWhileUntilSub 1 = f
    retryThisWhileUntilSub num = do
      v <- f
      if chk v
        then retryThisWhileUntilSub (num-1)
        else return v

{-# INLINE retryThisWhileUntilDefault #-}
-- | Retry given monadic function until the result satisfy given check function or the retrying time reaches given number
-- When retrying time reaches given number, the function returns given default value
retryThisWhileUntilDefault :: forall (m :: * -> *) b. Monad m => b -> Int -> m b -> (b -> Bool) -> m b
retryThisWhileUntilDefault def num f chk = do
  v <- retryThisWhileUntil num f chk
  return $
    if chk v
      then v
      else def

{-# INLINE retryThisWhileUntilM #-}
-- | Retry given monadic function until the result satisfy given check function or the retrying time reaches given number
-- When retrying time reaches given number, the function returns the result by Maybe monad
retryThisWhileUntilM :: forall (m :: * -> *) b. Monad m => Int -> m b -> (b -> Bool) -> m (Maybe b)
retryThisWhileUntilM num f chk = do
  v <- retryThisWhileUntil num f chk
  return $
    if chk v
      then Just v
      else Nothing
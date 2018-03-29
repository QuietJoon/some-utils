{-# LANGUAGE ExplicitForAll, KindSignatures #-}
{-# LANGUAGE CPP #-}

module Control.Monad.Util where

#ifdef LIMITEDDEBUG
import Control.Exception
#endif

rtw :: forall (m :: * -> *) b. Monad m => m b -> (b -> Bool) -> m b
rtw = retryThisWhile
{-# INLINE retryThisWhile #-}
retryThisWhile :: forall (m :: * -> *) b. Monad m => m b -> (b -> Bool) -> m b
retryThisWhile f chk = do
  v <- f
  if chk v
    then retryThisWhile f chk
    else return v

rtwu :: forall (m :: * -> *) b. Monad m => Int -> m b -> (b -> Bool) -> m b
rtwu = retryThisWhileUntil

rtwud :: forall (m :: * -> *) b. Monad m => b -> Int -> m b -> (b -> Bool) -> m b
rtwud = retryThisWhileUntilDefault

rtwum :: forall (m :: * -> *) b. Monad m => Int -> m b -> (b -> Bool) -> m (Maybe b)
rtwum = retryThisWhileUntilM

{-# INLINE retryThisWhileUntil #-}
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
retryThisWhileUntilDefault :: forall (m :: * -> *) b. Monad m => b -> Int -> m b -> (b -> Bool) -> m b
retryThisWhileUntilDefault def num f chk = do
  v <- retryThisWhileUntil num f chk
  return $
    if chk v
      then v
      else def

{-# INLINE retryThisWhileUntilM #-}
retryThisWhileUntilM :: forall (m :: * -> *) b. Monad m => Int -> m b -> (b -> Bool) -> m (Maybe b)
retryThisWhileUntilM num f chk = do
  v <- retryThisWhileUntil num f chk
  return $
    if chk v
      then Just v
      else Nothing
{-# LANGUAGE ExplicitForAll, KindSignatures #-}
{-# LANGUAGE CPP #-}

module Control.Monad.Util where

#ifdef LIMITEDDEBUG
import Control.Exception
#endif

{-# INLINE retryThisWhile #-}
retryThisWhile :: forall (m :: * -> *) b. Monad m => m b -> (b -> Bool) -> m b
retryThisWhile f chk = do
  v <- f
  if chk v
    then retryThisWhile f chk
    else return v

{-# INLINE retryThisWhileUntil #-}
retryThisWhileUntil :: forall (m :: * -> *) b. Monad m => b -> Int -> m b -> (b -> Bool) -> m b
retryThisWhileUntil def num f chk =
  #ifdef LIMITEDDEBUG
  assert (chk def) $
  #endif
    retryThisWhileUntilSub f chk num
  where
    retryThisWhileUntilSub f chk 0 = do
      v <- f
      return $ if chk v then def else v
    retryThisWhileUntilSub f chk num = do
      v <- f
      if chk v
        then retryThisWhileUntilSub f chk (num-1)
        else return v

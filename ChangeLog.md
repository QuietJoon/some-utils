# Revision history for some-utils

## 0.1.0.1  -- 2017/01/20

* Add assertion for `retryThisWhileUntil`.

## 0.1.0.0  -- 2017/01/18

* `retryThisWhile` & `retryThisWhileUntil`
  * Functions to retry monadic function until a return value satisfies the given function.
  * `retryThisWhileUntil` is given to avoid infinite loop.
* `>>==` is reverse version of `.` for non-fuctor functions. (Was it non-applicative? non-monadic?)
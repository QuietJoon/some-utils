# Revision history for some-utils

## 0.1.0.5  -- 2017/01/24

* Add shorthand function because original's names are too long.

## 0.1.0.4  -- 2017/01/24

* Simplify `retryThisWhileUntil` and fix trivial bug again.

## 0.1.0.3  -- 2017/01/24

* Simplify `retryThisWhileUntil` more.

## 0.1.0.2  -- 2017/01/24

* Simplify `retryThisWhileUntil` and fix trivial bug.

## 0.1.0.1  -- 2017/01/20

* Add assertion for `retryThisWhileUntil`.

## 0.1.0.0  -- 2017/01/18

* `retryThisWhile` & `retryThisWhileUntil`
  * Functions to retry monadic function until a return value satisfies the given function.
  * `retryThisWhileUntil` is given to avoid infinite loop.
* `>>==` is reverse version of `.` for non-fuctor functions. (Was it non-applicative? non-monadic?)

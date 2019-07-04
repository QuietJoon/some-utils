ChangeLog for some-utils
====

## [Unreleased]

## [0.5.0.0] -- 2018-03-29

### Changed
* `retryThisWhileUntil` does not require default value always.
  * To replace this, `retryThisWhileUntilDefault` is introduced.
  * `retryThisWhileUntil` provide the result of the last trying.

### Added
* Introduce `retryThisWhileUntilM` for `Maybe`

## [0.4.0.1] -- 2018-01-07

### Added
* Add missing dependencies

### Fixed
* Fix CPP indent

## [0.4.0.0] -- 2017-09-15

### Added
* Add `filterComment*`
* Add `readFileTL*WithHandle`

## [0.3.0.0] -- 2017-09-14

### Added
* Add `readFileTL*`.

## [0.2.0.0] -- 2017-02-21

### Changed
* Change `putStr*` to `putAs*`.

### Added
* Add `putErrAs*`.

## [0.1.1.0] -- 2017-02-21

### Added
* Add `putStr*` from `String` as `Text`. Inspired from concurrent program.

## [0.1.1.0] -- 2017-02-21

### Added
* Add a brief module.

## [0.1.0.5] -- 2017-01-24

### Added
* Add shorthand function because original's names are too long.

## [0.1.0.4] -- 2017-01-24

### Fixed
* Simplify `retryThisWhileUntil` and fix trivial bug again.

## [0.1.0.3] -- 2017-01-24

### Improved
* Simplify `retryThisWhileUntil` more.

## [0.1.0.2] -- 2017-01-24

### Fixed
* Simplify `retryThisWhileUntil` and fix trivial bug.

## [0.1.0.1] -- 2017-01-20

### Added
* Add assertion for `retryThisWhileUntil`.

## [0.1.0.0] -- 2017-01-18

### Added
* `retryThisWhile` & `retryThisWhileUntil`
  * Functions to retry monadic function until a return value satisfies the given function.
  * `retryThisWhileUntil` is given to avoid infinite loop.
* `>>==` is reverse version of `.` for non-functor functions. (Was it non-applicative? non-monadic?)

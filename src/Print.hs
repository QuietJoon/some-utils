module Print where

import Data.Text as T
import Data.Text.IO as T

import System.IO

-- | `putStr` for using in a parallel programming
putAsT = T.putStr . T.pack
-- | `putStrLn` for using in a parallel programming
putAsTLn = T.putStrLn . T.pack

-- | `putStr` error message for using in a parallel programming
putErrAsT = T.hPutStr stderr . T.pack
-- | `putStrLn` error message for using in a parallel programming
putErrAsTLn = T.hPutStrLn stderr . T.pack

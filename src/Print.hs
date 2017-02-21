module Print where

import Data.Text as T
import Data.Text.IO as T

import System.IO

putAsT = T.putStr . T.pack
putAsTLn = T.putStrLn . T.pack

putErrAsT = T.hPutStr stderr . T.pack
putErrAsTLn = T.hPutStrLn stderr . T.pack

module Print where

import Data.Text as T
import Data.Text.IO as T

putAsText = T.putStr . T.pack
putAsTextLn = T.putStrLn . T.pack

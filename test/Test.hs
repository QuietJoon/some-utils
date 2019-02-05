import qualified System.IO.Silently as Silently

import qualified Test.Framework as Test
import qualified Test.Framework.Providers.HUnit as Test
import qualified Test.Framework.Providers.QuickCheck2 as Test
import Test.HUnit
import Test.QuickCheck

main :: IO ()
main = do
  print "Test"
  Test.defaultMain []

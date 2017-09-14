module Utils.IO.Reader where

import System.IO
import System.Directory
import Control.Exception

import Data.Text (Text)
import qualified Data.Text as T
import qualified Data.Text.Lazy as TL
import qualified Data.Text.Lazy.IO as TL

import Debug.Trace


readFileTL :: FilePath -> IO TL.Text
readFileTL path = do
  h <- System.IO.openFile path System.IO.ReadMode
  System.IO.hSetEncoding h System.IO.utf8_bom
  TL.hGetContents h

readFileTLAsLine :: FilePath -> IO (Either String [TL.Text])
readFileTLAsLine filePath = do
  isExist <- doesFileExist filePath
  if isExist
      then fmap (Right . TL.lines) . readFileTL $ filePath
      -- FIXME: Study `tryJust`, `catchJust`
      else return . Left $ "No file exist on \"" ++ filePath ++ "\""

readFileTLWithHandle :: FilePath -> IO (TL.Text, Handle)
readFileTLWithHandle path = do
  h <- System.IO.openFile path System.IO.ReadMode
  System.IO.hSetEncoding h System.IO.utf8_bom
  contents <- TL.hGetContents h
  return (contents, h)

readFileTLAsLineWithHandle :: FilePath -> IO (Either String ([TL.Text], Handle))
readFileTLAsLineWithHandle filePath = do
  isExist <- doesFileExist filePath
  if isExist
      then do
        (contents, h) <- readFileTLWithHandle $ filePath
        return $ Right (TL.lines contents, h)
      -- FIXME: Study `tryJust`, `catchJust`
      else return . Left $ "No file exist on \"" ++ filePath ++ "\""

filterComment :: TL.Text -> [TL.Text] -> [TL.Text]
filterComment commentText = filter (not . TL.isPrefixOf commentText)

filterComments :: [TL.Text] -> [TL.Text] -> [TL.Text]
filterComments commentsText targetTexts = foldr filterComment targetTexts commentsText

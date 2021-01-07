{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE ScopedTypeVariables #-}

module WordHandlers
(
  factH,
  beamH,
)
where


import Data.Maybe (fromJust)
import Data.Text.Internal.Lazy (Text)
import Data.Text.Lazy (pack, unpack)
import TextUtils (fromLazyText, toLazyText)
import Web.Scotty (ActionM, html, json, param)
import WordUtils

beamH :: ActionM ()
beamH = do
  name <- param "name"
  html $ mconcat ["<h1>", name, ", beam me up!</h1>"]

factH :: ActionM ()
factH = do
  num <- param "num"
  let number :: Integer = fromLazyText num
      factorial = (toLazyText . fromJust . factSec) number
   in json factorial
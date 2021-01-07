{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE ScopedTypeVariables #-}

module DayRoutes
  (beam,
  )
where

import Data.Maybe (fromJust)
import Data.Text.Internal.Lazy (Text)
import Data.Text.Lazy (pack, unpack)
import DayUtils
import Web.Scotty (ActionM, param, html)


toLazyText :: Show a => a -> Text
toLazyText = Data.Text.Lazy.pack . show

fromLazyText :: Read a => Text -> a
fromLazyText = read . Data.Text.Lazy.unpack

beam :: ActionM ()
beam = do
  name <- param "name"
  html $ mconcat ["<h1>", name, ", beam me up!</h1>"]
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE ScopedTypeVariables #-}

module DayHandlers
  (beam,
  )
where

import Data.Maybe (fromJust)
import Data.Text.Internal.Lazy (Text)
import Data.Text.Lazy (pack, unpack)
import DayUtils
import TextUtils
import Web.Scotty (ActionM, param, html)


beam :: ActionM ()
beam = do
  name <- param "name"
  html $ mconcat ["<h1>", name, ", beam me up!</h1>"]
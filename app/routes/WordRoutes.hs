{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE ScopedTypeVariables #-}

module WordRoutes
  ( wordRoutes,
  )
where

import WordHandlers
import WordUtils
import TextUtils
import Web.Scotty


wordRoutes :: ScottyM ()
wordRoutes = do
  get "/nums/fact/:num" factH
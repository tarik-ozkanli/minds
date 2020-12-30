{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE ScopedTypeVariables #-}

module Handlers
  ( routes,
  )
where
import WordUtils
import DayUtils
import Web.Scotty
import Data.Text.Lazy ( pack, unpack )
import Data.Text.Internal.Lazy(Text)
import Data.Maybe (fromJust)

toLazyText :: Show a => a -> Text
toLazyText = Data.Text.Lazy.pack . show

fromLazyText :: Read a => Text -> a
fromLazyText = read . Data.Text.Lazy.unpack

routes :: ScottyM ()
routes = do
  
  get "/name/:name" $ do
    name <- param "name"
    html $ mconcat ["<h1>", name, ", beam me up!</h1>"]

  get "/fact/:num" $ do
    num <- param "num"
    let number = fromLazyText num in
      let factorial = (toLazyText . fromJust . factSec) number in
        html $ mconcat ["<h1>Factorial of ", num, " is ",  factorial]

  get "/days/next/:day" $ do
    day <- param "day"
    let inputDay = fromLazyText day in
      let output = (toLazyText . nextDay) inputDay in
        html $ mconcat ["<h1>The next day after ", day, " is ", output  ,"</h1>"]
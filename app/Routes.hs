{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE ScopedTypeVariables #-}

module Routes
  ( routes,
  )
where

import Data.Maybe (fromJust)
import Data.Text.Internal.Lazy (Text)
import Data.Text.Lazy (pack, unpack)
import DayUtils
import Web.Scotty
import WordUtils

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
    let number = fromLazyText num
     in let factorial = (toLazyText . fromJust . factSec) number
         in html $ mconcat ["<h1>Factorial of ", num, " is ", factorial]

  get "/days/next/:day" $ do
    day <- param "day"
    let inputDay = fromLazyText day
     in let output = (toLazyText . nextDay) inputDay
         in html $ mconcat ["<h1>The next day after ", day, " is ", output, "</h1>"]

  get "/days/previous/:day" $ do
    day <- param "day"
    let inputDay = fromLazyText day
        output = (toLazyText . previousDay) inputDay
     in json output

  get "/days/isbefore/:day1/:day2" $ do
    day1 <- param "day1"
    day2 <- param "day2"
    let inputDay1 :: Day = fromLazyText day1
        inputDay2 :: Day = fromLazyText day2
        output = toLazyText (isBefore inputDay1 inputDay2)
     in html $ mconcat ["<h1>The day  ", toLazyText inputDay1, " is before ", toLazyText inputDay2, " is ", output, "</h1>"]

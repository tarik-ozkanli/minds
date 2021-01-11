{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE ScopedTypeVariables #-}

module DayHandlers
  ( weekDays,
    isDayH,
    nextDayH,
    previousDayH,
    isBeforeH,
  )
where

import Data.Text.Internal.Lazy (Text)
import Data.Text.Lazy (pack, unpack)
import DayUtils
import TextUtils (fromLazyText, toLazyText)
import Web.Scotty (ActionM, html, json, param)

daysOfWeek :: ActionM ()
daysOfWeek = json (show weekDays)

isDayH :: ActionM ()
isDayH = do
  text :: String <- param "text"
  let output = isValidDay text
   in json output

nextDayH :: ActionM ()
nextDayH = do
  day <- param "day"
  let inputDay = fromLazyText day
      output = (toLazyText . nextDay) inputDay
   in json output

previousDayH :: ActionM ()
previousDayH = do
  day <- param "day"
  let inputDay = fromLazyText day
      output = (toLazyText . previousDay) inputDay
   in json output

isBeforeH :: ActionM ()
isBeforeH = do
  day1 <- param "day1"
  day2 <- param "day2"
  let inputDay1 :: Day = fromLazyText day1
      inputDay2 :: Day = fromLazyText day2
      output = toLazyText (isBefore inputDay1 inputDay2)
   in json output

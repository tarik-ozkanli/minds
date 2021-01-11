{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE ScopedTypeVariables #-}

module DayRoutes
  ( dayRoutes,
  )
where

import Data.Maybe (fromJust)
import DayHandlers
import DayUtils
import TextUtils
import Web.Scotty


dayRoutes :: ScottyM ()
dayRoutes = do

  get "7days" daysOfWeek
  get "/days/isday/:text" isDayH
  get "/days/next/:day" nextDayH
  get "/days/previous/:day" previousDayH
  get "/days/isbefore/:day1/:day2" isBeforeH

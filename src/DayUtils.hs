{-# LANGUAGE ScopedTypeVariables #-}

module DayUtils
  ( Day (Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday),
    weekDays,
    isValidDay,
    isWeekend,
    nextDay,
    previousDay,
    daysLater,
    daysBefore,
    isBefore,
    isAfter,
  )
where

import Data.List (elemIndex)
import Data.Maybe
import Text.Read

data Day
  = Monday
  | Tuesday
  | Wednesday
  | Thursday
  | Friday
  | Saturday
  | Sunday
  deriving (Eq, Show, Read)

weekDays :: [Day]
weekDays = [Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday]

-- TODO :improve this function
isValidDay :: String -> Maybe Day
isValidDay = readMaybe

isWeekend :: Day -> Bool
isWeekend day
  | day == Saturday || day == Sunday = True
  | otherwise = False

nextDay :: Day -> Day
nextDay day =
  let nextIndex = (fromJust (elemIndex day weekDays) + 1) `mod` 7
   in weekDays !! nextIndex

previousDay :: Day -> Day
previousDay day =
  let prevIndex = (fromJust (elemIndex day weekDays) - 1) `mod` 7
   in weekDays !! prevIndex

daysLater :: Day -> Int -> Day
daysLater day 0 = day
daysLater day n = daysLater (nextDay day) (n -1)

daysBefore :: Day -> Int -> Day
daysBefore day 0 = day
daysBefore day n = daysBefore (previousDay day) (n -1)

isBefore :: Day -> Day -> Bool
isBefore day1 day2 =
  let n = elemIndex day1 weekDays
      m = elemIndex day2 weekDays
   in n < m

isAfter :: Day -> Day -> Bool
isAfter day1 day2 =
  let n = elemIndex day1 weekDays
      m = elemIndex day2 weekDays
   in n > m

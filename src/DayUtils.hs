module DayUtils
  ( isWeekend,
    Day (Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday),
    nextDay,
    previousDay,
    daysLater,
    daysBefore,
    isBefore,
    isAfter,
  )
where

import Data.List (elemIndex)

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

isWeekend :: Day -> Bool
isWeekend day
  | day == Saturday || day == Sunday = True
  | otherwise = False

nextDay :: Day -> Day
nextDay Monday = Tuesday
nextDay Tuesday = Wednesday
nextDay Wednesday = Thursday
nextDay Thursday = Friday
nextDay Friday = Saturday
nextDay Saturday = Sunday
nextDay Sunday = Monday

previousDay :: Day -> Day
previousDay Monday = Sunday
previousDay Tuesday = Monday
previousDay Wednesday = Tuesday
previousDay Thursday = Wednesday
previousDay Friday = Thursday
previousDay Saturday = Friday
previousDay Sunday = Saturday

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

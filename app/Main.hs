module Main where

import Web.Scotty
import DayRoutes


main :: IO ()
main = scotty 3000 dayRoutes
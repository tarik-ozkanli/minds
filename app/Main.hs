module Main where

import DayRoutes
import WordRoutes

import Web.Scotty



main :: IO ()
main = do
  scotty 3000 (dayRoutes >> wordRoutes)
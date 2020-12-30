module Main where

import Web.Scotty
import Handlers


main :: IO ()
main = scotty 3000 routes
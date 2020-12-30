module WordUtils
  ( fact,
    factSec, 
    WordType (Name, Adjective, Verb, Adverb),
    Sentence,
    lengthOfSentence,
  )
where

import Data.Maybe (fromJust)

fact :: Integer -> Integer
fact 0 = 1
fact n = n * fact (n-1)

-- secure Factorial function.
factSec :: Integer -> Maybe Integer
factSec n
  | n < 0 = Nothing
  | n == 0 = Just 1
  | otherwise = Just (n * fromJust (factSec (n -1)))

type Symbol = String

data WordType = Name Symbol | Verb Symbol | Adverb Symbol | Adjective Symbol
  deriving (Eq, Show)


type Sentence = [WordType]

lengthOfSentence :: Sentence -> Int
lengthOfSentence = length

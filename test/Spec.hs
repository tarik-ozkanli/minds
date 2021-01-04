import Control.Exception (evaluate)
import Data.Maybe (fromJust, isNothing)
import DayUtils
import Test.Hspec
import Test.QuickCheck
import WordUtils

main :: IO ()
main = hspec $ do
  describe "Prelude.head" $ do
    it "returns the first element of a list" $ do
      head [23 ..] `shouldBe` (23 :: Int)
    it "returns the first element of an *arbitrary* list" $
      property $ \x xs -> head (x : xs) == (x :: Int)
    it "throws an exception if used with an empty list" $ do
      evaluate (head []) `shouldThrow` anyException

  describe "Wordutils" $ do
    it "returns the multiplication of list [1..n] for n > 0" $ do
      property $ \n -> (n < 1) || fromJust (factSec n) == product [1 .. n]
    it "returns Nothing for an *arbitrary* negative integer for (factSec n)" $ do
      property $ \n -> (n >= 0) || isNothing (factSec n)
    it "returns 1 for fact 0" $ do
      factSec 0 `shouldBe` Just 1
    it "returns the lenght of sentence" $ do
      lengthOfSentence [Name "Kaan", Adverb "eve", Verb "geldi"] `shouldBe` 3

  describe "DayUtils" $ do
    it "returns the next day of the week" $ do
      nextDay Tuesday `shouldBe` Wednesday
    it "returns the previous day of the week" $ do
      previousDay Tuesday `shouldBe` Monday
    it "returns 2 days later of Tuesday as Thurday" $ do
      daysLater Tuesday 2 `shouldBe` Thursday

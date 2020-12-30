import Control.Exception (evaluate)
import Data.Maybe (isNothing)
import WordUtils
import Test.Hspec
import Test.QuickCheck

main :: IO ()
main = hspec $ do
  
  describe "Prelude.head" $ do
    it "returns the first element of a list" $ do
      head [23 ..] `shouldBe` (23 :: Int)
    it "returns the first element of an *arbitrary* list" $
      property $ \x xs -> head (x : xs) == (x :: Int)
    it "throws an exception if used with an empty list" $ do
      evaluate (head []) `shouldThrow` anyException
  
  describe "Lib.fact" $ do
    it "returns the factorial of the number" $ do
      fact 4 `shouldBe` (Just 24 :: Maybe Integer)
    it "returns Nothing for an *arbitrary* negative n for fact n" $ do
      property $ \n -> (n >= 0) || isNothing (fact n)
    it "returns 1 for fact 0" $ do
      fact 0 `shouldBe` Just 1
  
  describe "Lib.language" $ do
    it "returns the lenght of sentence" $ do
      lengthOfSentence [Name "Kaan", Adverb "eve", Verb "geldi"] `shouldBe` 3

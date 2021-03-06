Programming in Haskell: Chapter 8: Exercise 6
=============================================

This is a literate Haskell file.  Implement your solution below and test your
implementation with the included test cases.

Note that GHC 7.0.3 or greater is required.

You may ignore the following module declaration and imports.

> module Main (main) where
>
> -- base
> import Control.Exception (ErrorCall(..), evaluate, handleJust)
>
> -- hunit
> import Test.HUnit
>
> -- local
> import Parsing

Implement your solution here:

> eval :: String -> Int
> eval = undefined

To test: `runTests evalTests`

> evalTests :: [Test]
> evalTests = map TestCase
>   [ assertEqual "eval \"1\"" 1 (eval "1")
>   , assertEqual "eval \"2 * 3\"" 6 (eval "2 * 3")
>   , assertEqual "eval \"4 / 2\"" 2 (eval "4 / 2")
>   , assertEqual "eval \"3 + 2\"" 5 (eval "3 + 2")
>   , assertEqual "eval \"3 - 2\"" 1 (eval "3 - 2")
>   , assertEqual "eval \"(1 + 2 - 3)\"" 0 (eval "(1 + 2 - 3)")
>   , assertEqual "eval \"2 * 3 + 4\"" 10 (eval "2 * 3 + 4")
>   , assertEqual "eval \"2 * (3 + 4)\"" 14 (eval "2 * (3 + 4)")
>   , assertEqual "eval \"8 / 4 - 2\"" 0 (eval "8 / 4 - 2")
>   , assertEqual "eval \"8 / (4 - 2)\"" 4 (eval "8 / (4 - 2)")
>   , assertError "eval \"a1\"" (eval "a1")
>   , assertError "eval \"1a\"" (eval "1a")
>   ]

> assertError :: String -> a -> Assertion
> assertError msg x = handleJust errorCalls (const $ return ()) $ do
>     evaluate x
>     assertFailure $ msg Prelude.++ ": error not thrown"
>   where
>     errorCalls (ErrorCall _) = Just ()

> runTests :: [Test] -> IO Counts
> runTests ts = runTestTT $ TestList ts

> main :: IO Counts
> main = runTests evalTests

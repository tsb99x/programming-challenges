{-

    https://www.reddit.com/r/dailyprogrammer/comments/q2v2k/2232012_challenge_14_easy/

    [2/23/2012] Challenge #14 [easy]

    Input: list of elements and a block size k or some other variable of your choice

    Output: return the list of elements with every block of k elements reversed, starting from the beginning of the list.

    For instance, given the list 12, 24, 32, 44, 55, 66 and the block size 2, the result is 24, 12, 44, 32, 66, 55.

-}

import System.Environment (getArgs)
import Data.List (unfoldr)
import Text.Read (readMaybe)

main :: IO ()
main = do
    (a:as) <- getArgs
    output $ process (readInt a) as
    where output = putStrLn . unwords

process :: Int -> [String] -> [String]
process size xs = concatMap reverse $ chunk xs
    where chunk = takeWhile (not . null) . unfoldr (Just . splitAt size)

readInt :: String -> Int
readInt str =
    case readMaybe str of
        Just x -> x
        Nothing -> error "only int values are allowed"

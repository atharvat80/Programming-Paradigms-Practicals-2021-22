module Exercise5 where
import Prelude hiding (length, map, reverse, and, all, any, takeWhile, dropWhile)

-- Length of a list
length' :: [a] -> Int
length' = foldl (\a _ -> a + 1) 0

-- Map a function over a list to produce a new one
map' :: (a -> b) -> [a] -> [b]
map' f = foldl (\x y -> x ++ [f y]) []

-- Reverse a list
reverse' :: [a] -> [a]
reverse' = foldl (\x y -> y:x) []

-- Check if all entries in a boolean list are true
and' :: [Bool] -> Bool
and' = foldl (\x y -> x && y) True

-- Every entry satisfies a predicate, all p [] = True
all' :: (a -> Bool) -> [a] -> Bool
all' f = foldl (\x y -> x && f y) True

-- At least one entry satisfies a predicate, any p [] = False
any' :: (a -> Bool) -> [a] -> Bool
any' f = foldl (\x y -> x || f y) False

-- Return elements from a list while they satisfy a predicate, and
-- stop as soon as the predicate is not satisfied
takeWhile' :: (a -> Bool) -> [a] -> [a]
takeWhile' p = foldr (\x xs -> if p x then x:xs else []) []

-- Remove elements from a list while they satisfy some predicate, and
dropWhile' :: (a -> Bool) -> [a] -> [a]
dropWhile' p = foldr (\x xs -> if p x then xs else x:xs) []

-- same thing as all but with only one traversal over the list using foldr.
allSingleFold :: (a -> Bool) -> [a] -> Bool
allSingleFold p = foldr (\x y -> y && p x) True
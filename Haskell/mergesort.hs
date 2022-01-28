module Mergesort where

-- Split a list into two (approximately) equal-length sublists
-- We can use splitAt and find the midpoint by using div to compute
-- the integer division of the lists length.
halve :: [a] -> ([a], [a])
halve xs = splitAt (length xs `div` 2) xs

-- Merge two sorted lists into one sorted list
merge :: Ord a => [a] -> [a] -> [a]
merge [] ys = ys
merge xs [] = xs
merge (x : xs) (y : ys)
  | x < y = x : merge xs (y : ys)
  | otherwise = y : merge (x : xs) ys

-- Sort a list using merge sort
mergeSort :: Ord a => [a] -> [a]
mergeSort [] = []
mergeSort [x] = [x]
mergeSort xs = merge ys zs
  where
    (left, right) = halve xs
    ys = mergeSort left
    zs = mergeSort right


-- mergeSortwith
mergeWith :: (a -> a -> Ordering) -> [a] -> [a] -> [a]
mergeWith _ [] ys = ys
mergeWith _ xs [] = xs
mergeWith fn (x:xs) (y:ys)
  | fn x y == LT = x : mergeWith fn xs (y:ys)
  | otherwise = y : mergeWith fn (x:xs) ys

mergeSortWith :: (a -> a -> Ordering) -> [a] -> [a]
mergeSortWith _ [] = []
mergeSortWith _ [x] = [x]
mergeSortWith fn xs = mergeWith fn ys zs
  where
    (left, right) = halve xs
    ys = mergeSortWith fn left
    zs = mergeSortWith fn right

mergeSort' :: Ord a => [a] -> [a]
mergeSort' = mergeSortWith compare

-- Comparator
type Comparator a = a -> a -> Ordering

invert :: Comparator a -> Comparator a
invert ord x y = invertOrd $ ord x y

invertOrd :: Ordering -> Ordering
invertOrd LT = GT
invertOrd GT = LT
invertOrd EQ = EQ

on :: Comparator a -> (b -> a) -> Comparator b
on cmp f = \x y -> cmp (f x) (f y)

sortReversedByLengthSnd :: [(a, String)] -> [(a, String)]
sortReversedByLengthSnd = mergeSortWith (invert (compare `on` (length . snd)))
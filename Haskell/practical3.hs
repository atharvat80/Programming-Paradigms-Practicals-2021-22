{-# LANGUAGE ParallelListComp #-}

compress :: Eq a => [a] -> [a]
compress [] = []
compress [x] = [x]
compress (x:xs) | x == head xs    = compress xs
                | otherwise       = x:compress xs

pyths :: Int -> [(Int, Int, Int)]
pyths n = [(x,y,z) | x <- [1..n], y <- [1..n], z <- [1..n], x^2 + y^2 == z^2]

pyths' :: Int -> [(Int, Int, Int)]
pyths' n = [(x,y,z) | x <- [1..n], y <- [1..n], z <- [1..n], x^2 + y^2 == z^2, x<=y]

scalar :: Num a => [a] -> [a] -> a
scalar xs ys = sum [a*b | a <- xs | b <- ys]

scalar' ::  Num a => [a] -> [a] -> a
scalar' xs ys = sum [a*b | (a,b) <- zip xs ys]

scalar'' :: Num a => [a] -> [a] -> a
scalar'' xs ys = sum (zipWith (*) xs ys)

halve :: [a] -> ([a], [a])
halve xs = splitAt (length xs `div` 2) xs

merge :: Ord a => [a] -> [a] -> [a]
merge [] [] =  []
merge xs [] = xs
merge [] ys = ys
merge (x:xs) (y:ys) | x>=y        = y:merge (x:xs) ys
                    | otherwise   = x:merge xs (y:ys)

mergeSort :: Ord a => [a] -> [a]
mergeSort [] = []
mergeSort [x] = [x]
mergeSort xs = merge ys zs
    where
        (left, right) = halve xs
        ys = mergeSort left
        zs = mergeSort right

mergeSortWith :: (a -> a -> Ordering) -> [a] -> [a]
mergeSortWith _ [] = []
mergeSortWith _ [x] = [x]
mergeSortWith ord xs = mergeWith ord ys zs
    where
        (left, right) = halve xs
        ys = mergeSortWith ord left
        zs = mergeSortWith ord right

mergeWith :: (a -> a -> Ordering) -> [a] -> [a] -> [a]
mergeWith _ [] [] = []
mergeWith _ xs [] = xs
mergeWith _ [] ys = ys
mergeWith ord (x:xs) (y:ys) | ord x y == GT = y:mergeWith ord (x:xs) ys
                            | otherwise     = x:mergeWith ord xs (y:ys)

mergeSort' :: Ord a => [a] -> [a]
mergeSort' = mergeSortWith compare

sortReverse :: Ord a => [a] -> [a]
sortReverse = reverse . mergeSort'

type Comparator a = a -> a -> Ordering

invert :: Comparator a -> Comparator a
invert ord x y = invertOrd (ord x y)

invertOrd :: Ordering -> Ordering
invertOrd LT = GT
invertOrd GT = LT
invertOrd EQ = EQ

sortReverse' :: Ord a => [a] -> [a]
sortReverse' = mergeSortWith (invert compare)

on :: Comparator a -> (b -> a) -> Comparator b
on ord f x y = ord (f x) (f y)

sortReversedByLengthSnd :: [(a, String)] -> [(a, String)]
sortReversedByLengthSnd = mergeSortWith (invert (on compare  (length . snd)))

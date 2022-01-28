{-# LANGUAGE ParallelListComp #-}
module Exercise3 where

-- Exercise
-- Write a function compress :: Eq a => [a] -> [a] that eliminates consecutive duplicate 
-- elements of a list, but otherwise leaves the order unchanged.

compress :: Eq a => [a] -> [a]
compress [] = []
compress [x] = [x]
compress (x:y:xs) = if x == y then compress (y:xs) else x:compress (y:xs)

-- or
compress' :: Eq a => [a] -> [a]
compress' = foldr pick []
  where pick x [] = [x]
        pick x (y:xs)
          | x == y    = y:xs
          | otherwise = x:y:xs

-- Exercise
-- Using a list comprehension, define pyths :: Int -> [(Int, Int, Int)] that generates 
-- all pythogorean truples with components less than or equal to the specified integer.

pyths :: Int -> [(Int, Int, Int)]
pyths x = [(c, b, a) | a <- [1..x], b <- [1..a], c <- [1..b], a*a == (b*b + c*c)]

-- Exercise
-- Define a function to compute the scalar product in three different ways
-- 1. Using sum and a list comprehension
dot :: Num a => [a] -> [a] -> a
dot xs ys = sum [a*b | a <- xs | b <- ys]

-- 2. Using sum, map, and zip.
dot' :: Num a => [a] -> [a] -> a
dot' xs ys = sum $ map (\(x, y) -> x*y) (zip xs ys)

-- 3. Using sum and zipWith
dot'' :: Num a => [a] -> [a] -> a
dot'' xs ys = sum $ zipWith (*) xs ys
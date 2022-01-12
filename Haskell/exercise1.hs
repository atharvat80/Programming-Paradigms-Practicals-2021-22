module Exercise1 where

-- Errors in the code
-- 1. variable names must start with a lowercase letter
-- 2. function names are witten in single quotes not backticks
n = a `div` length xs
    where
        a = 10
        xs = [1, 2, 3, 4, 5]


-- last' should return the final element of a non-empty list
-- try implementing it using builtin functions (excluding last!) that you 
-- already know about, undefined has type a, so it always type-checks, 
-- but indicates that we haven't implemented  this function.

-- Using list indexing
last' :: [a] -> a
last' xs
    | length xs > 1 = xs !! (length xs -1)
    | otherwise = error "Empty list"

-- Now try using recursion and pattern matching
-- We can't return a empty list because haskell expects last' to return an number
-- If x is the only number then return x otherwise return the last item of xs
last'' :: [a] -> a
last'' [] = error "Empty list"
last'' [x] = x
last'' (x:xs) = last'' xs

-- A more haskell like implementation when we make the return type ambiguous 
lastt :: [a] -> Maybe a
lastt [] = Nothing
lastt [x] = Just x
lastt (x:xs) = lastt xs


-- Implement init
init' :: [a] -> [a]
init' [] = error "Empty List"
init' [x] = []
init' (x:xs) = x : init' xs

-- Don't know how else to implement init 
-- (let me know if you come up with some fun solutions)


-- Shuffle
shuffle :: [a] -> [a]
shuffle [] = error "Empty list"
shuffle [x] = [x]
shuffle (x:xs) = xs ++ [x]


-- mystery is quick sort
mystery :: Ord a => [a] -> [a]
mystery [] = []
mystery (x:xs) = mystery ys ++ [x] ++ mystery zs
    where
        ys = [a | a <- xs, a <= x]
        zs = [a | a <- xs, a > x]

-- Replacing a <= x with a < x in ys removes duplicates in the imput list
mystery' :: Ord a => [a] -> [a]
mystery' [] = []
mystery' (x:xs) = mystery' ys ++ [x] ++ mystery' zs
    where
        ys = [a | a <- xs, a < x]
        zs = [a | a <- xs, a > x]

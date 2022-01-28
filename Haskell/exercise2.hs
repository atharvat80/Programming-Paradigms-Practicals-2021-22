module Exercise2 where

-- Exercise
-- Check if all elements in the list are True
allTrue :: [Bool] -> Bool
allTrue xs = foldr (&&) True xs

-- Exercise
-- last :: [a] -> a returns the final element of a non-empty list.
-- Write a function butlast :: [a] -> a which returns the penultimate element of a list of at least two entries.
-- Try it in two different ways
--     1. Using existing builtin functions
--     2. Recursively, using pattern matching

butlast :: [a] -> a
butlast [] = error "Empty list"
butlast [_] = error "Not enough elements"
butlast [x, _] = x
butlast (_ : xs) = butlast xs

-- or
butlast' :: [a] -> a
butlast' xs
  | length xs > 1 = xs !! (length xs - 2)
  | length xs == 1 = error "Not enough elements"
  | otherwise = error "Empty list"

-- or
butlast'' :: [a] -> a
butlast'' xs = last (tail xs)

--or
butlast''' :: [a] -> a
butlast''' = last . tail

-- Exercise
safetail :: [a] -> [a]
safetail xs = if null xs then [] else tail xs

-- or
safetail' :: [a] -> [a]
safetail' xs
  | null xs = []
  | otherwise = tail xs

-- or
safetail'' :: [a] -> [a]
safetail'' [] = []
safetail'' (_ : xs) = xs

-- or
safetail''' :: [a] -> [a]
safetail''' xs = if null xs then [] else tail xs
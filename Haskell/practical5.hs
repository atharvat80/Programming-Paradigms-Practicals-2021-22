length' :: [a] -> Integer
length' = foldr (const (1+)) 0

length'' :: [a] -> Integer
length'' = foldl (\a _ -> a + 1) 0

map' :: (a -> b) -> [a] -> [b]
map' f = foldr ((:) . f) []

map'' :: (a -> b) -> [a] -> [b]
map'' f = foldl (\xs x -> xs ++ [f x]) []

reverse' :: [a] -> [a]
reverse' = foldl (flip (:)) []

reverse'' :: [a] -> [a]
reverse'' = foldr (\x xs -> xs ++ [x]) []

and' :: [Bool] -> Bool
and' = and

and'' :: [Bool] -> Bool
and'' = and

all' :: (a -> Bool) -> [a] -> Bool
all' f [] = error "More than one element needed."
all' f [x] = f x
all' f (x:xs) = f x && all' f xs

any' :: (a -> Bool) -> [a] -> Bool
any' f [] = error "More than one element needed."
any' f [x] = f x
any' f (x:xs) = f x || any' f xs

takeWhile' :: (a -> Bool) -> [a] -> [a]
takeWhile' f [] = []
takeWhile' f [x] = [x | f x]
takeWhile' f (x:xs) | f x         = x:takeWhile' f xs
                    | otherwise   = []

dropWhile'  :: (a -> Bool) -> [a] -> [a]
dropWhile' f [] = []
dropWhile' f [x] = [x | not (f x)]
dropWhile' f (x:xs) | f x           = dropWhile' f xs
                    | otherwise     = x:xs

all'' :: (a -> Bool) -> [a] -> Bool
all'' p = and . map p

any'' :: (a -> Bool) -> [a] -> Bool
any'' p = or . map p

takeWhile'' :: (a -> Bool) -> [a] -> [a]
takeWhile'' p = foldr (\x xs -> if p x then x:xs else []) []

dropWhile'' :: (a -> Bool) -> [a] -> [a]
dropWhile'' p = foldr (\x xs -> if p x then xs else x:xs) []

allSingleFold :: (a -> Bool) -> [a] -> Bool 
allSingleFold p = foldr ((&&) . p) True

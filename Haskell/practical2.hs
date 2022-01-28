x1 :: [Char]
x1 = ['a', 'b', 'c']

x2 :: (Char, Char, Char)
x2 = ('a', 'b', 'b')

x3 :: [(Bool, Integer)]
x3 = [(False, 0), (True ,10)]

palindrome :: Eq a => [a] -> Bool
palindrome xs = xs == reverse xs

butlast :: [a] -> a
butlast [] = error "Not enough elements"
butlast [x] = error "Not enough elements"
butlast xs = head (tail (reverse xs))

butlast' :: [a] -> a
butlast' [] = error "Not enough elements"
butlast' [x] = error "Not enough elements"
butlast' xs = reverse xs!!1

butlast'' :: [a] -> a
butlast'' [] = error "Not enough elements"
butlast'' [x] = error "Not enough elements"
butlast'' [x,y] = x
butlast'' (x:xs) = butlast'' xs

safetail :: [a] -> [a]
safetail xs = if null xs then [] else tail xs

safetail' :: [a] -> [a]
safetail' xs | null xs      = []
             | otherwise    = tail xs

safetail'' :: [a] -> [a]
safetail'' [] = []
safetail'' xs = tail xs

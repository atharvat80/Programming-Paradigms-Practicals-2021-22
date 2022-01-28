hello :: IO()
hello = putStrLn "Hello, World!"

last' :: [a] -> a
last' [] = error "Empty List"
last' [x] = x
last' (x:xs) = last' xs

last'' :: [a] -> a
last'' [] = error "Empty list"
last'' xs = xs!!(length xs - 1)

last''' :: [a] -> a
last''' [] = error "Empty list"
last''' xs = head (reverse xs)

init' :: [a] -> [a]
init' [] = error "Empty list"
init' [x] = []
init' (x:xs) = x:init' xs

init'' :: [a] -> [a]
init'' [] = error "Empty list"
init'' xs = reverse (tail (reverse xs))

shuffle :: [a] -> [a]
shuffle [] = error "Empty list"
shuffle (x:xs) = xs ++ [x]

shuffle' :: [a] -> [a]
shuffle' [] = error "Empty list"
shuffle' (x:xs) = reverse(x:reverse xs)

mystery :: Ord a => [a] -> [a]
mystery [] = []
mystery (x:xs) = mystery ys ++ [x] ++ mystery zs
    where
        ys = [a | a <- xs, a <= x]
        zs = [a | a <- xs, a > x]

mystery' :: Ord a => [a] -> [a]
mystery' [] = []
mystery' (x:xs) = mystery' ys ++ [x] ++ mystery' zs
    where
        ys = [a | a <- xs, a < x]
        zs = [a | a <- xs, a > x]
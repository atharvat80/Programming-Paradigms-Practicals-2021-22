candidates :: [Integer]
candidates = [2..]

sieve :: [Integer] -> [Integer]
sieve (x:xs) = x : sieve([y | y <- xs, y `mod` x /= 0])

mult :: [[Int]] -> [Int] -> [Int]
mult xs ys = map (\ x -> sum (zipWith (*) x ys)) xs

pythTriple :: [Int] -> (Int, Int, Int)
pythTriple [m,n] = (m^2 - n^2, 2*m*n, m^2 + n^2)

treeGen :: [[Int]] -> [[Int]]
treeGen xs = top ++ treeGen top
    where
        top = concatMap gen xs
        gen :: [Int] -> [[Int]]
        gen ys = [mult [[2,-1],[1,0]] ys] ++ [mult [[2,1],[1,0]] ys] ++ [mult [[1,2],[0,1]] ys]


pythagoreanTriples :: [(Int, Int, Int)]
pythagoreanTriples = pythTriple [2,1] : map pythTriple (treeGen [[2,1]])


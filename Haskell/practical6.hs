data Tree a = Leaf | Node (Tree a) a (Tree a)
    deriving (Eq, Show)

--makeBalancedTree :: Int -> Tree Int 
--mirrorTree :: Tree a -> Tree a

instance Functor Tree where
    fmap f Leaf = Leaf
    fmap f (Node left x right) = Node (fmap f left) (f x) (fmap f right)

instance Foldable Tree where
    foldr _ z Leaf = z
    foldr f z (Node left x right) = f x (foldr f (foldr f z right) left)

toTree :: [a] -> Tree a
toTree [] = Leaf
toTree (x:xs) = Node (toTree left) x (toTree right)
    where
        (left,right) = splitAt (length xs `div` 2) xs

depth :: Tree a -> Int
depth Leaf = 0
depth (Node left _ right) = 1 + max (depth left) (depth right)

balanced :: Tree a -> Bool
balanced Leaf = True
balanced (Node left _ right) = balanced left && balanced right && abs (leafCounter left - leafCounter right) <= 1
    where
        leafCounter :: Tree a -> Int
        leafCounter Leaf = 1
        leafCounter (Node left _ right) = leafCounter left + leafCounter right

balanced' :: Tree a -> Bool
balanced' = fst . balancedHelper
    where
        balancedHelper Leaf = (True, 0)
        balancedHelper (Node left _ right) = (lb && rb && abs (ln - rn) <=1, 1 + ln + rn)
            where
                (lb, ln) = balancedHelper left
                (rb, rn) = balancedHelper right

symmetric :: Tree a -> Bool
symmetric Leaf = True
symmetric (Node left _ right) = mirror left right

mirror :: Tree a -> Tree a -> Bool
mirror Leaf Leaf = True
mirror (Node left1 _ right1) (Node left2 _ right2) = mirror left1 right2 && mirror left2 right1
mirror _ _ = False

data Expr = Val Int | Add Expr Expr
    deriving (Eq, Show)

eval :: Expr -> Int
eval (Val int) = int
eval (Add expr1 expr2) = eval expr1 + eval expr2

collect :: Expr -> [Expr]
collect (Val int) = [Val int]
collect (Add expr1 expr2) = collect expr1 ++ collect expr2

size :: Expr -> Int
size (Val int) = 1
size (Add expr1 expr2) = size expr1 + size expr2

eval' :: Expr -> Int
eval' = folde id (+)

folde :: (Int -> a) -> (a -> a -> a) -> Expr -> a
folde f _ (Val int) = f int
folde f1 f2 (Add expr1 expr2) = f2 (folde f1 f2 expr1) (folde f1 f2 expr2)

collect' :: Expr -> [Expr]
collect' = folde (\int -> [Val int]) (++)

size' :: Expr -> Int
size' = folde (const 1) (+)

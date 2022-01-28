import Data.List (intercalate)

data Expr = Const Bool | Var String | Not Expr | And [Expr] | Or [Expr]
    deriving Eq

instance Show Expr where
    show (Const bool) = show bool
    show (Var string) = show string
    show (Not expr) = "¬" ++ show expr
    show (And xs) = "(" ++ intercalate " ∧ " [show x | x <- xs] ++ ")"
    show (Or xs) = "(" ++ intercalate " ∨ " [show x | x <- xs] ++ ")"

type Bindings = [(String, Bool)]

find :: String -> Bindings -> Bool
find s (x:xs) = if fst x == s then snd x else find s xs

eval :: Expr -> Bindings -> Bool
eval (Const bool) _ = bool
eval (Var str) b = find str b
eval (Not expr) b = not (eval expr b)
eval (And [x]) b = eval x b
eval (And (x:xs)) b = eval x b && eval (And xs) b
eval (Or [x]) b = eval x b
eval (Or (x:xs)) b = eval x b || eval (Or xs) b

vars :: Expr -> [String]
vars (Const _) = []
vars (Var str) = [str]
vars (Not expr) = vars expr
vars (And [x]) = vars x
vars (And (x:xs)) = vars x ++ vars (And xs)
vars (Or [x]) = vars x
vars (Or (x:xs)) = vars x ++ vars (Or xs)

--vars (Or xs) = concatMap vars xs
--vars (And xs) = concatMap vars xs

bools :: Int -> [[Bool]]
bools x | x == 0    = [[]]
        | otherwise = map (False:) xs ++ map (True:) xs
        where xs = bools (x-1)

uniquify :: Eq a => [a] -> [a]
uniquify [] = []
uniquify (x:xs) = x : filter(/=x) (uniquify xs)

bindings :: Expr -> [Bindings]
bindings expr = map (zip unique) booleans
    where
        unique = uniquify (vars expr)
        booleans = bools (length unique)

sat :: Expr -> Maybe Bindings
sat expr = sat' expr (bindings expr)
    where
        sat' :: Expr -> [Bindings] -> Maybe Bindings
        sat' _ [] = Nothing
        sat' expr (x:xs) = if eval expr x then Just x else sat' expr xs

-- Extension

data QuantifiedExpr = Bare Expr | Exists String QuantifiedExpr | Forall String QuantifiedExpr
    deriving Eq

rewrite :: QuantifiedExpr -> Expr
rewrite qExpr = rewrite' qExpr []
    where
        rewrite' :: QuantifiedExpr -> Bindings -> Expr
        rewrite' (Bare expr) [] = expr
        rewrite' (Bare expr) b = substitute b expr
        rewrite' (Exists s expr) b = Or [rewrite' expr (b ++ [(s,False)]), rewrite' expr (b ++ [(s,True)])]
        rewrite' (Forall s expr) b = And [rewrite' expr (b ++ [(s,False)]), rewrite' expr (b ++ [(s,True)])]

        substitute :: Bindings -> Expr -> Expr
        substitute (b:bs) (Var str) | str == fst b  = Const (snd b)
                                    | otherwise     = substitute bs (Var str)
        substitute b (Not expr) = Not (substitute b expr)
        substitute b (And xs) = And $ map (substitute b) xs
        substitute b (Or xs) = Or $ map (substitute b) xs
        substitute _ (Const c) = Const c

satQuantified :: QuantifiedExpr -> Maybe Bindings
satQuantified = sat . rewrite


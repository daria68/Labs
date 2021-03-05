{-
data Expr = Const Int -- integer constant
    | Expr :+: Expr -- addition
    | Expr :*: Expr -- multiplication
    deriving Eq

data Operation = Add | Mult deriving (Eq, Show)
data Tree = Lf Int -- leaf
    | Node Operation Tree Tree -- branch
    deriving (Eq, Show)



{-    (*)
      / \
    (+)  5
    / \   
   3   4    -}   

-- Ex 1.1 : sa se instantieze clasa Show pt Expr
instance Show Expr where
    show (Const x) = show x
    show (exp1 :+: exp2) = "(" ++ show exp1 ++ " + " ++ show exp2 ++ ")"
    show (exp1 :*: exp2) = "(" ++ show exp1 ++ " * " ++ show exp2 ++ ")"

-- Ex 1.2 :     sa se scrie o functie care evalueaza o expresie determinand valoarea acesteia

evalExp :: Expr -> Int
evalExp (Const op) = op
evalExp (op1 :+: op2) = evalExp op1 + evalExp op2
evalExp (op1 :*: op2) = evalExp op1 * evalExp op2

exp1 = ((Const 2 :*: Const 3) :+: (Const 0 :*: Const 5))
exp2 = (Const 2 :*: (Const 3 :+: Const 4))
exp3 = (Const 4 :+: (Const 3 :*: Const 3))
exp4 = (((Const 1 :*: Const 2) :*: (Const 3 :+: Const 1)) :*: Const 2)

-- Ex 1.3
evalArb :: Tree -> Int
evalArb (Lf fr) = fr
evalArb (Node Add  fr1 fr2) = evalArb fr1 + evalArb fr2
evalArb (Node Mult  fr1 fr2) = evalArb fr1 * evalArb fr2

arb1 = Node Add (Node Mult (Lf 2) (Lf 3)) (Node Mult (Lf 0)(Lf 5))
arb2 = Node Mult (Lf 2) (Node Add (Lf 3)(Lf 4))
arb3 = Node Add (Lf 4) (Node Mult (Lf 3)(Lf 3))
arb4 = Node Mult (Node Mult (Node Mult (Lf 1) (Lf 2)) (Node Add (Lf 3)(Lf 1))) (Lf 2)

-- Ex 1.4 
-- sa se scrie o functie 
-- care transorma o expresie in arborele corespunzator
expToArb :: Expr -> Tree
expToArb (Const op) = (Lf op)
expToArb (op1 :+: op2) = Node Add (expToArb op1) (expToArb op2)
expToArb (op1 :*: op2) = Node Mult (expToArb op1) (expToArb op2)

arb1 = Node Add (Node Mult (Lf 2) (Lf 3)) (Node Mult (Lf 0)(Lf 5))
arb2 = Node Mult (Lf 2) (Node Add (Lf 3)(Lf 4))
arb3 = Node Add (Lf 4) (Node Mult (Lf 3)(Lf 3))
arb4 = Node Mult (Node Mult (Node Mult (Lf 1) (Lf 2)) (Node Add (Lf 3)(Lf 1))) (Lf 2)


--Ex 1.5
-- sa se instantieze clasa MySmallCheck pt tipul de date Expr
class MySmallCheck a where
    smallValues :: [a]
    smallCheck :: (a -> Bool) -> Bool
    smallCheck prop = and [prop x | x <- smallValues] 

instance MySmallCheck Expr where
    smallValues = [exp1, exp2, exp3, exp4]
-- sa se verifice ca evaluarea unei expresii
-- este egala cu valoarea arborelui asociat
-- sa se verifice, ulterior, cu smallCheck
checkExpr :: Expr -> Bool
checkExpr exp = evalExp exp == evalArb (expToArb exp)
-}
-- un fel de quickCheck
-- smallCheck checkExpr


type Key = Int
type Value = String


-- sa se adauge definitii implicite pt 
-- ckeys, cvalues, cFromList pe baza celorlalte functii din clasa Collection

-- Ex 2.1

class Collection c where
    cempty :: c
    csingleton :: Key -> Value -> c
    cinsert :: Key -> Value -> c -> c
    cdelete :: Key -> c -> c
    clookup :: Key -> c -> Maybe Value
    cToList :: c -> [(Key, Value)]
    ckeys :: c -> [Key]
    ckeys c = [fst p | p <- cToList c]
    cvalues :: c -> [Value]
    cvalues c = [snd p | p <- cToList c]
    cFromList :: [(Key, Value)] -> c
    -- ma folosesc de cinsert
    -- iau fiecare element din lista si il inserez in  colectie
    cFromList [] = cempty
    cFromList (x:xs) = cinsert (fst x) (snd x) (cFromList xs)

-- fie tipul listelor de perechi de forma cheie - valoare
newtype PairList = PairList { getPairList :: [(Key, Value)]}

-- Ex 2.2
instance Show PairList where
    show (PairList pairList) = "PairList" ++ show pairList

-- faceti PairList instanta a clasei Collection
instance Collection PairList where
    cempty = PairList []
    csingleton k v = PairList [(k,v)]
    cinsert k v (PairList list) = if elem k (map fst list) then PairList list else PairList ((k,v) : list)
    cdelete k (PairList list) = PairList [(k1,v1) | (k1,v1) <- list, k1 /= k]
    clookup k (PairList list) = lookup k list
    cToList (PairList list) = list
    -- sau, mai elegant, fara argument
    -- cToList = getPairList

-- Ex 2.3
data SearchTree 
    = Empty
    | Node SearchTree Key (Maybe Value) SearchTree
    deriving Show
instance Collection SearchTree where
    cempty = Empty
    csingleton k v = Node Empty k (Just v) Empty


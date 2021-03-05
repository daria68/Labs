--LAB2
import Data.List
import Data.Char

--in programarea declarativa iterarea nus e face prin bucle
--ci prin recursie
--Fn = n daca  n ∈ {0, 1}
--     Fn−1 + Fn−2 daca  n > 1
fibonacciCazuri :: Integer -> Integer
fibonacciCazuri n
    | n<2 = n
    | otherwise = fibonacciCazuri(n-1) + fibonacciCazuri(n-2)

--fibonacciPereche(n-1) va calcula perechea (Fn-2,Fn-1)
fibonacciPereche :: Integer -> (Integer,Integer)
fibonacciPereche n
    | n==1 = (0,1)
    | otherwise = (b,a+b)
        where (a,b) = fibonacciPereche(n-1)

fibonacciLiniar :: Integer -> Integer
fibonacciLiniar n
    | n <2 = n
    | otherwise = snd(fibonacciPereche n)

--Recursie peste liste
--sa se scrie o functie semiPare care elimina numerele impare
--si le injumatatete pe cele pare


semiPare1 :: [Integer]->[Integer]
semiPare1 l
    | null l = l
    | even h = h `div` 2 : t'
    | otherwise = t'
    where 
        h = head l
        t = tail l
        t' = semiPare1 t

--implemetarea recomandata cu sabloane
-- peste constructorul de lista
semiPare2 :: [Int] -> [Int]
semiPare2 [] = []
semiPare2 (h:t)
    | even h = h `div` 2 : t'
    | otherwise = t'
    where t' = semiPare2 t

--Liste definite prin comprehensiune

semiPareComp :: [Int] -> [Int]
semiPareComp l = [ x `div` 2 | x <- l , even x]

--in Interval
--recursie
inInterval :: Int -> Int -> [Int] ->[Int]
inInterval x y [] = []
inInterval x y (h:t)
    | h>=x && h<=y = h: t'
    | otherwise = t'
    where t' = inInterval x y t

--descrieri de liste
inIntervalComp :: Int -> Int -> [Int] ->[Int]
inIntervalComp x y l = [a | a <-l, a>=x && a<=y ]

--functie care numara cate numere strict pozitive
--sunt intr o lista data ca argument
--recursie
pozitiveRec :: [Int] -> Int
pozitiveRec l 
    | null l =0
    | h > 0 = 1 + t'
    | otherwise = t'
   where 
       h = head l
       t = tail l
       t'= pozitiveRec t

--descrieri de liste
pozitiveComp :: [Int] -> Int
pozitiveComp l = length [x | x<-l, x>0]

--functie care calculeaza lista pozitiilor
--elementelor impare din lista originala

--functie ajutatoare pentru determinarea 
--pozitiei curente din lista
--ceva :: [Int] -> [Int]
--ceva l = [x | x <- (head l )]

--recursie
pozitiiImpareRec :: [Int]  -> [Int]
pozitiiImpareRec l = pozitie 0 l
   where
    pozitie :: Int -> [Int] -> [Int]
    pozitie _ [] = []
    pozitie n (x:t) = let
                        t' = pozitie (n+1) t
                        in (if (odd x) then n:t' else t')

--comprehensiune
pozitiiImpare :: [Int] -> [Int]
pozitiiImpare l = [y | (x,y) <- zip l [0..], odd x]

--MultDigit
--produsul tuturor cifrelor care apar in sirul de caractere

{-cifre :: String -> [Int]
cifre [] = []
cifre (h:t)
    | isDigit h = digitToInt h: t'
    | otherwise = t'
    where t' = cifre t
    -}
    


-- denumeste functiile incepand cu carectere mici !!!
multDigit :: String -> Int
multDigit l
    | null l = 1
    | isDigit h = (digitToInt h) * t'
    | otherwise = t'
    where 
        h = head l
        t = tail l
        t' = multDigit t

multDigitComp :: String -> Int
multDigitComp l = product [digitToInt x | x <-l, isDigit x]


discountRec :: [Float] -> [Float]
discountRec l
    | null l = []
    | h - 0.25*h <200 = (h - 0.25*h) : t'
    | otherwise = t'
    where 
        h = head l
        t = tail l
        t' = discountRec t

discountComp :: [Float] -> [Float]
discountComp l = [ x - 0.25*x | x <- l , x - 0.25*x < 200]
import Data.Char
--Simulare
--1
--a
f:: Char -> Bool
f x 
    | elem (toUpper x) ['A' .. 'M'] == True = True
    | elem (toUpper x) ['N' .. 'Z'] == True = False
    | otherwise = error "eroare"


--b
g :: String -> Bool
g xs = length [ x | x <- xs, elem (toUpper x) ['A' .. 'M']] > div (length xs) 2

--c
h :: String -> Bool
h [] = True
h (x:xs) = primajum (x:xs) > div ( length (x:xs) ) 2
    where
        primajum [] = 0
        primajum (x:xs) 
            | elem (toUpper x) ['A' .. 'M'] = 1 + primajum xs
            | otherwise = primajum xs

--2
--a
c :: [Int] -> [Int]
c (x:xs) = [ x | (x,y) <- zip (x:xs) xs , x == y]

--b
d :: [Int] -> [Int]
d [] = []
d [_] = []
d (x:y:xs)
    | length xs >= 1 && x == y = x: d (y:xs)
    | length xs >= 1 && x /= y = d (y:xs)
    | length xs == 0 && x == y = x : d xs
    | otherwise = d xs

--c
prop_cd ::  [Int] -> Bool
prop_cd arg= c arg == d arg 


--Tipuri de date abstracte
--ex1
data Fruct 
  = Mar String Bool 
  | Portocala String Int

ionatanFaraVierme = Mar "Ionatan" False
goldenCuVierme = Mar "Golden Delicious" True
portocalaSicilia10 = Portocala "Sanguinello" 10
listaFructe = [ Mar "Ionatan" False,
                Portocala "Sanguinelo" 10,
                Portocala "Valencia" 22,
                Mar "Golden Delicious" True,
                Portocala "Sanguinelo" 15,
                Portocala "Moro" 12,
                Portocala "Tarocco" 3,
                Portocala "Valencia" 2,
                Mar "Golden Delicious" False,
                Mar "Golden" False,
                Mar "Golden" True ]
--a
ePortocalaDeSicilia :: Fruct -> Bool
ePortocalaDeSicilia (Portocala soi _) = elem soi ["Tarocco", "Moro", "Sanguinelo"]
ePortocalaDeSicilia _ = False                          

--b
nrFeliiSicilia :: [Fruct] -> Int
nrFeliiSicilia l = sum [ nrfelii | (Portocala soi nrfelii) <- l , ePortocalaDeSicilia (Portocala soi nrfelii)]

--c
nrMereViermi :: [Fruct] -> Int
nrMereViermi l = length [(Mar soi True)| (Mar soi True) <- l]

--ex2
data Linie = L[Int]
data Matrice = M[Linie]

--a
-- fc care verifica daca suma elem de pe fiecare linie
-- este egala cu o valoare n. Rez folosind foldr

--cum fac suma elementelor de pe o linie>???
verifica_comp :: Matrice -> Int -> Bool
verifica_comp (M matrix) n = and [sum l == n | (L l) <- matrix]

verificaLinie :: Int -> Linie -> Bool
verificaLinie n (L cl) = sum cl == n
--cl = continut linie

verifica :: Matrice -> Int -> Bool
verifica (M mc) n = and (map (verificaLinie n) mc)
--cm = continut matrice

verificaFold :: Matrice -> Int -> Bool
verificaFold (M mc) n = foldr (\x acc-> acc && verificaLinie n x) True mc

--c
--luam initial doar liniile de lungime n

verificaLinie2 :: Int -> Linie -> Bool
verificaLinie2 n (L cl) = (length cl /= n) || and [ x > 0 | x <- cl]
--de ce nu mergea cu and????


doarPozN :: Matrice -> Int -> Bool
doarPozN (M mc) n = foldr (\x acc-> acc && verificaLinie2 n x) True mc

--b
--instanta a clasei show
--show :: a -> String
instance Show Matrice where
    show (M []) = ""
    show (M (x:xs)) =(showL x)  ++"\n" ++ show (M xs)
                     where showL (L ln) = show ln

-- (x:xs) -> lista de linii

ex  :: [Int] -> [Int]
ex xs = map (\x -> x*x) (filter(\x -> odd x) xs)
--functia foldr
import Numeric.Natural
import Test.QuickCheck
import Data.List
import Data.Char
--a) fc recursiva care calculeaza produsul nr dintr-o lista
myproduct l
    | null l = 1
    | otherwise = h * t'
    where 
        h = head l
        t = tail l
        t' = myproduct t

--b) fc echivalenta care foloseste foldr in locul recursiei
produsFold :: [Integer] -> Integer
produsFold l = foldr (*) 1 l

--ex2
--a) fc recursiva care verfica ca toate elem dintr-o lista sunt True
--(!nu uita, exista functia product care face acelsi lucru)
andRec :: [Bool] -> Bool
andRec (h:t) = h && andRec t

--b) fc echiv cu foldr
andFold :: [Bool] -> Bool
andFold l = foldr (&&) True l

--ex3
--a) fc rec care concat o lista de liste
--(!nu uita, exista fc concat care face acelasi lucru)
concatRec :: [[a]] -> [a]
concatRec [] = []
concatRec (h:t) = h ++ concatRec t

--b) echiv cu foldr
concatFold :: [[a]] -> [a]
concatFold l = foldr (++) [] l

--ex4
--a) fc care elimina un caracter din sir de caractere
rmChar :: Char -> String -> String
rmChar ' ' []=[]
rmChar car (h:t)
    | h /= car = h:t'
    | otherwise = t'
    where t' = rmChar car t

--b) functie recursivă care elimină toate caracterele din al
--doilea argument care se găsesc în primul argument
rmCharsRec :: String -> String -> String
rmCharsRec _ [] = []
rmCharsRec [] _ = []
rmCharsRec s1 s2 
    | h2 `elem` s1 = t'
    | otherwise = h2:t'
    where h2 = head s2
          t2 = tail s2
          t' = rmCharsRec s1 t2

-- c) Scrieti o functie echivalentă cu cea de la b) 
--care foloseste foldr în locul recursiei.
{-rmCharsFold :: String -> String -> String
rmCharsFold s1 s2 = foldr rmChar s2 s1-}

--semnul numerelor care  apartin ontervalului [-9,9]
semn :: [Integer] -> String
semn [] = " "
semn (x:xs) = if (x>= -9 && x<=9) 
              then if(x<0)
                   then '-' : semn xs
                   else if(x>0) 
                        then  '+' : semn xs
                        else '0':semn xs
              else semn xs

--cu foldr
unit :: String
unit = " "
func :: Integer -> String -> String
func = \x u -> if (x>= -9 && x<=9) 
                   then if(x<0)
                        then '-' : u
                        else if(x>0) 
                             then  '+' : u
                             else '0': u
                   else u
g :: [Integer] -> String
g = foldr func unit


--map cu foldr
map' :: (a->b) -> [a] -> [b]
map' _ [] = []
map' h (x:xs) = h x : map' h xs
i:: (a->b) -> [b]
i = \_ -> []
f :: a ->((a -> b) -> [b]) -> (a->b) -> [b]
f x u  = \h -> h x : u h
--(foldr f i) [1..10] (+2)
--LAB 3
import Data.List
import Data.Char
--Functii de nivel inalt
--[ x^2 | x <− [ 1 . . 1 0 ] , x `rem` 3 == 2 ] -> 4,25,64
--[(x,y) | x <− [1 .. 5] , y <− [x..(x+2)]] 
-- (1,1), (1,2), (1,3), (2,2), (2,3), (2,4), ...
--[ x | x<− " Facultatea de Matematica si Informatica " , elem x [ 'A' . . ' Z ' ] ]
--elem 'caracter' "sir de caractere/['caract1','carct2', 'caract3']"
--returneaza tu daca caracter e in sirul de caractere
--FMI
--[[x .. y] | x <− [1 .. 5] , y <− [1 .. 5] , x < y ]
--[1,2], [1,2,3], [1,2,3,4], [1,2,3,4,5], [2,3], 
-- [2,3,4], [2,3,4,5], [3,4], [3,4,5], [4,5]

--1
factori :: Int -> [Int]
factori n = [x| x <- [1..n], n `rem` x == 0]

--2
prim :: Int -> Bool
prim x
    | elem x [0,1] = False
    | x == product (factori x) = True
    | otherwise = False

--3
--lista numerelor prime din intervalul [2..n]
numerePrime :: Int -> [Int]
numerePrime n = [x| x <- [2..n], prim x]

--L3.2
--[(x,y) | x <- [1..5], y<-[1..3]] => [(1,1),(1,2),(1,3),(2,1),(2,2),(2,3),(3,1),(3,2),(3,3),(4,1),(4,2),(4,3),(5,1),(5,2),(5,3)]
-- zip [1..5] [1..3]
--[(1,1),(2,2),(3,3)]

-- _ inseamna ca este ceva acolo
myzip3 :: [Int] -> [Int] -> [Int] -> [(Int,Int,Int)]
myzip3 _ _ [] = []
myzip3 _ [] _ = []
myzip3 [] _ _ = []
myzip3 (h1:t1) (h2:t2) (h3:t3) = (h1,h2,h3) : myzip3 t1 t2 t3 

--Functii de nivel inalt
--map
{-ex : map (*3) [1,3,4] => [3,9,12]
       map (1 `elem` ) [[2, 3], [1, 2]] => [False,True,False,False]
       map ( `elem` [2, 3] ) [1, 3, 4, 5] => [False,True,False,False]
-}

--EXERCITII folosind map

--1
firstEl l = map snd l

--2
sumList l = map sum l

--3
--cum map aplica o functie fiecarui element, 
--acea functie va trebui facuta pt un element
prel x
    | x `rem` 2 ==0 = x `div` 2
    | otherwise = (x * 2) 
  
prel2 l = map prel l


--ex folosind filter si map
--1
ex1 car l = filter (car `elem` ) l

--2
ex2 l = map (^2) (filter odd l)

--3
pozimpara x 
    | (snd x) `rem` 2 == 1 = True
    | otherwise = False
ex3 l = map(^2)(map fst(filter pozimpara (zip l [0..])))

--4
ex4 l = map (filter ( `elem` "aeiouAEIOU")) l

--L3.5
mymap :: (a->b) -> [a] -> [b]
mymap f l = [f x | x <- l]

myfilter :: (a->Bool) -> [a] -> [a]
myfilter p l = [x | x <- l, p x]
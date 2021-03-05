import Data.Char
--Problem 1
-- Find the last element of a list.
myLast :: [a] -> a
myLast [] = error "No end for empty lists!"
myLast l = l !! ((length l) -1)

myLast1 :: [a] -> a
myLast1 [] = error "No end for empty lists!"
myLast1 l = head (reverse l)

--The Prelude  provides the function last 

--Problem 2
--Find the last but one element of a list. (penultimul)
myButLast :: [a] -> a
myButLast [] = error "No last but one element for empty lists!"
myButLast [_] =  error "No last but one element a liswith one element!"
myButLast l = l !! ((length l) -2)
-- last . init
-- head . tail . reverse
-- head . reverse . init

--Problem 3
--Find the K'th element of a list. 
--The first element in the list is number 1
elementAt :: [a] -> Int -> a
elementAt l n 
    | n > length l = error "No such index in list"
    | otherwise = l !! (n-1)

elementAt1 n = head.drop (n-1) 
--tb inversata ordinea in Prelude, in sensul ca list
-- tb sa fie pe ultimul loc

--Problem 4
--(*) Find the number of elements of a list

--recursiv
myLength :: [a] -> Int
myLength [] = 0
myLength (x:xs) = 1 + myLength xs

--cu foldr
myLengthFold :: [a] -> Int
myLengthFold l = foldr (\_ -> (+1)) 0 l

--Problem 5
--(*) Reverse a list.
myReverse :: [a] -> [a]
myReverse [] = []
myReverse (x:xs) = myReverse xs ++ [x]

--Problem 6
--(*) Find out whether a list is a palindrome. 
--A palindrome can be read forward or backward; e.g. (x a m a x).
isPalindrome :: (Eq a) => [a] -> Bool
isPalindrome l = l == reverse l

--7 ???

--8
--Problem 8
--(**) Eliminate consecutive duplicates of list elements.
--recursiv
compress :: (Eq a) =>[a] -> [a]
compress [] =[]
compress (x:xs)
        | length xs > 0 && x == head xs = compress xs
        | length xs > 0 && x /= head xs = x: compress xs
        | otherwise = x:compress (xs)

--9
{--
pack ['a', 'a', 'a', 'a', 'b', 'c', 'c', 'a', 
             'a', 'd', 'e', 'e', 'e', 'e']
["aaaa","b","cc","aa","d","eeee"]
--}

pack :: (Eq a) => [a] -> [[a]]
pack [] = []
pack l = let (l1,l2) = span (== head l) l
         in l1:pack l2

--10
--encode "aaaabccaadeeee"
--[(4,'a'),(1,'b'),(2,'c'),(2,'a'),(1,'d'),(4,'e')]
encode :: (Eq a) => [a] -> [(a,Int)]
encode l = [(head x, length x)| x <- pack l ]


--14
--(*) Duplicate the elements of a list.
dupli :: [a] -> [a]

--recursiv
{-
dupli [] = []
dupli (x:xs) = x: x: dupli xs
-}

--comprehensiune
dupli list = concat [[x,x] | x <- list]

--15
--(**) Replicate the elements of a list a given number 
--of times.
repli :: (Enum a) =>[a] -> Int -> [a]
--repli l num = concat [take num [x,x..] | x <- l]

repli l num = concat[replicate num x| x <- l]

--16
dropEvery :: [a] -> Int -> [a]
dropEvery l num = [x | (x,y) <- zip l [1..], mod y num /= 0]

--17
--(*) Split a list into two parts;
-- the length of the first part is given.

split :: [a] -> Int -> ([a],[a])
split l num = splitAt num l

--split xs n = (take n xs, drop n xs)
--split = flip splitAt

--18
--(**) Extract a slice from a list.
{-
Given two indices, i and k, the slice is the list containing 
the elements between the i'th and k'th element of the original 
list (both limits included). Start counting the elements with 1.
-}
slice :: [a] -> Int -> Int -> [a]
slice l i k = [x | (x,y) <- zip l [1..], y >=i && y<=k]

--se mai poate si cu take drop

--19
--(**) Rotate a list N places to the left.
rotate :: [a] -> Int -> [a]
rotate l num = 
    let l1 = take (if num >0 then num else (length l + num)) l 
        l2 = drop (if num >0 then num else (length l + num)) l
    in l2 ++ l1

--20
--(*) Remove the K'th element from a list.
{-
removeAt 2 "abcd"
('b',"acd")
-}

removeAt :: Int -> [a] -> (a,[a])
removeAt num list = (list !! (num -1), [x | (x,y) <- zip list [1..] , y /= num])

--21
--Insert an element at a given position into a list.
insertAt :: a -> [a] -> Int -> [a]
insertAt el list poz = fst (splitAt (poz-1) list) ++ [el] ++ snd (splitAt (poz-1) list)

--22
{-
range 4 9
[4,5,6,7,8,9]
-}
range :: Enum a => a -> a -> [a]
range s f = [s..f]

--curs 3
--Aflati lungimea celui mai lung cuvânt care începe cu 
--litera ’c’ dintr-o lista data
maxLenc :: [[Char]] -> Int
maxLenc l = foldr max 0 (map (\x -> length x) (filter (\x -> head x == 'c') l))

-- curs 4
-- functie care scrie un sir de caratere cu litere mari

bigChar :: [Char] -> [Char]
bigChar xs = map toUpper xs

-- Functie care selecteaza dintr-o lista de cuvinte pe cele
-- care incep cu litera mare

isUpperChar :: [[Char]] -> [[Char]]
isUpperChar = filter (\x -> isUpper (head x))

-- scrieti o functie care calculeaza secvneta lui 
-- Collatz care incepe cu n

collatz :: Int -> [Int]
collatz 1 = [1]
collatz n 
    | mod n 2 == 0 = n: collatz (div n 2)
    | otherwise = n: collatz (3*n +1)

-- determinati secventele Collatz de lg <=5 care incep
-- cu un numar din intervalul [1,100]
secvCollatz = [ collatz x| x <- [1..100], length (collatz x) <= 5]
secvCollatznivInalt = filter ( \x -> length x <= 5) (map collatz [1..100])

--31
isPrime :: Int -> Bool
isPrime n 
    | n < 2 || (n > 2 && mod n 2 == 0) = False
    | length [ d | d <- [3,5 .. (div n 3)], mod n d ==0 ] /= 0 = False
    | otherwise = True

--32
-- gcd using Euclid's algorithm
myGCD :: Int -> Int -> Int
myGCD a b 
    | b /= 0 = myGCD b (mod a b)
    | otherwise = abs a

--33
coprime :: Int -> Int -> Bool
coprime a b = myGCD a b == 1

--34
totient :: Int -> Int
totient m = length [x | x <- [1..m-1], coprime x m]

--35
primeFactors :: Int -> [Int]
primeFactors nr = [x| x <- [2..nr], mod nr x ==0 && isPrime x]
--LAB1
import Data.List
import Data.Char
myInt = 55555555555555555555555555555555555555555555555555555555555
double :: Integer -> Integer
double x = x+x

triple :: Integer -> Integer
triple x = 4*x

maxim :: Integer -> Integer -> Integer
maxim x y = if (x > y)
            then x
            else y

--maximul a 3 numere folosind maxim
maxim3 :: Integer -> Integer-> Integer -> Integer
--maxim3 x y z = maxim x (maxim y z)

--maximul a 3 numere folosind if cu indentare
--maxim3 x y z = if (x > y)
--               then if (x > z)
--                    then x
--                    else z
--               else if (y>z)
--                    then y
--                    else z

--maximul a 3 numere folosind let
maxim3 x y z =
    let u = maxim x y
    in maxim u z

--Scrieti o functie maxim4 folosind varianta cu let..in s, i indentare.
maxim4 :: Integer -> Integer-> Integer -> Integer -> Integer
maxim4 x y z t = 
    let
        u = maxim3 x y z
    in 
        maxim u t

--Scrieti o functie care testeaza functia maxim4 prin 
--care sa verificati ca rezultatul este
--ın relatia >= cu fiecare din cele patru argumente
-- (operatorii logici ˆın Haskell sunt ||,&&, not).

--test trebuie scris cu litera mica
test :: Integer -> Integer-> Integer -> Integer -> Bool
test x y z t = 
    let 
        a = maxim4 x y z t 
    in
        a>= x &&  a>= y && a>=z && a>=t

--se pot defini functii si in ghci
--definirea a noi tipuri de date:

--modelul PFH
--tip de date Alegere
data Alegere
    = Piatra
    | Foarfeca
    | Hartie
 deriving(Eq,Show)
 
 --atentie la indentare, la definirea unor noi tipuri nu lasa spatiu 
data Rezultat
   = Victorie
   | Infrangere
   | Egalitate
 deriving(Eq,Show)



partida :: Alegere -> Alegere -> Rezultat
partida x y = if(x == Piatra)
              then if (y == Hartie)
                   then Infrangere
                   else if (y == Foarfeca)
                        then Victorie
                        else Egalitate
              else if(x == Foarfeca)
                   then if (y == Piatra)
                        then Infrangere
                        else if (y== Hartie)
                              then Victorie
                              else Egalitate
                   else  if (y == Foarfeca)
                         then Infrangere
                         else if(y==Piatra)
                              then Victorie
                              else Egalitate
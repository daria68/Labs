import Test.QuickCheck
import Data.Char

double :: Int -> Int
double x = 2 * x

triple :: Int -> Int
triple x = 3 * x

penta :: Int -> Int
penta x = 5 * x

test x = (double x + triple x) /= penta x

fail_test :: Int -> Bool
fail_test x =  (double x + triple x + x) == penta x


myLookUp :: Int -> [(Int, String)] -> Maybe String
myLookUp _ [] = Nothing
myLookUp element (x:xs)
    | element == fst x = Just (snd x)
    | otherwise        = myLookUp element xs

{-
myLookUp :: Int -> [(Int, String)] -> Maybe String
myLookUp element = foldr (\x found -> if fst x == element then Just (snd x) else found) Nothing
-}
testLookUp :: Int -> [(Int,String)] -> Bool

testLookUp key env = myLookUp key env == lookup key env

testLookUpCond :: Int -> [(Int,String)] -> Property
testLookUpCond n list = n > 0 && n `div` 5 == 0 ==> testLookUp n list


--data ElemIS = I Int | S String
  --  deriving(Show,Eq)
instance Arbitrary ElemIS
    arbitrary = do
        i <- arbitrary
        s <- arbitrary
        elements [I i, S s]
class Arbitrary a where
    arbitrary :: Gen a
myLookUpElem :: Int -> [(Int,ElemIS)]-> Maybe ElemIS
myLookUpElem _ [] = Nothing
myLookUpElem n (x:xs)
     | n==(fst x) = Just (snd x)
     | otherwise = myLookUpElem n xs



testLookUpElem :: Int -> [(Int,ElemIS)] -> Bool
testLookUpElem key env = myLookUpElem key env == lookup key env

data Person = P (String -> String)

transforma :: String -> String
transforma s = tail s

toUpperStr s = map toUpper s
{-# LANGUAGE FlexibleInstances #-}
import Data.Monoid
import Data.Semigroup (Max (..), Min (..))
import Data.Foldable (foldMap, foldr)
import Data.Char (isUpper)


{-1. Implementati următoarele functii folosind foldMap si/sau foldr din clasa
Foldable, apoi testati-le cu mai multe tipuri care au instantă pentru Foldable-}
{-
felem :: (Foldable t, Eq a) => a -> t a -> Bool
felem val = foldr (\x acc -> if x == val then True else acc) False

fnull :: (Foldable t) => t a -> Bool
fnull = foldr (\x acc -> False) True

flength :: (Foldable t) => t a -> Int
flength = foldr (\x acc -> acc + 1) 0

ftoList :: (Foldable t) => t a -> [a]
ftoList = foldr (\x acc -> x:acc) []

-- fold combină elementele unei structuri folosind structura de monoid a acestora.
ffold :: (Foldable t, Monoid m) => t m -> m
ffold = foldMap id -- Hint: folositi foldMap

-- 2. Scrieti instante ale lui Foldable pentru următoarele tipuri
data Constant a b = Constant b
instance Foldable (Constant a) where
  foldr f i (Constant b)=  f b i


data Two a b = Two a b
instance Foldable (Two a) where
  foldr f i (Two x y) =  f y i


data Three a b c = Three a b c
instance Foldable (Three a b) where
    foldr f i (Three x y z) = f z i

data Three' a b = Three' a b b
instance Foldable (Three' a) where
    foldr f i (Three' x y z) = f z (f y i) 

data Four' a b = Four' a b b b
instance Foldable (Four' a) where
    foldr f i (Four' x y z t) = f t (f z (f y i))

data GoatLord a = NoGoat 
                  | OneGoat a 
                  | MoreGoats (GoatLord a) (GoatLord a) (GoatLord a)


instance Foldable GoatLord where
    foldr f i NoGoat = i
    foldr f i (OneGoat x) = f x i
    foldr f i (MoreGoats x y z) = foldr f (foldr f (foldr f i z) y) x

-- *Main> foldMap Sum (Three' 1 2 3)
-- Sum {getSum = 5}
-- *Main> foldMap Product (Three' 1 2 3)
-- Product {getProduct = 6}

-- 3. Scrieti o functie de filtrare pentru Foldable
wrapperOfA :: (Applicative f, Monoid (f a)) => a -> Bool -> f a 
wrapperOfA a condition = if condition then pure a else mempty

filterF:: ( Applicative f
          , Foldable t
          , Monoid (f a)
          )
     => (a -> Bool) -> t a -> f a
filterF pred = foldMap (wrapperOfA <*> pred)

unit_testFilterF1 = filterF Data.Char.isUpper "aNA aRe mEre" == "NARE"
unit_testFilterF2 = filterF Data.Char.isUpper "aNA aRe mEre" == First (Just 'N')
unit_testFilterF3 = filterF Data.Char.isUpper "aNA aRe mEre" == Min 'A'
unit_testFilterF4 = filterF Data.Char.isUpper "aNA aRe mEre" == Max 'R'
unit_testFilterF5 = filterF Data.Char.isUpper "aNA aRe mEre" == Last (Just 'E')
-}


-- Exercitii pentru Functor
--Scrieti instante ale clasei Functor pentru tipurile de date descrise mai jos.
newtype Identity a = Identity a
instance Functor Identity where
  fmap f (Identity a) = Identity (f a)

data Pair a = Pair a a
instance Functor Pair where
  fmap f (Pair a b) = Pair (f a) (f b)

data Two a b = Two a b
instance Functor (Two a) where
  fmap f (Two a b) = Two a (f b)

data Three a b c = Three a b c
instance Functor (Three a b) where
  fmap f (Three a b c) = Three a b (f c)

data Three' a b = Three' a b b 
instance Functor (Three' a) where
  fmap f (Three' a b c) = Three' a (f b) (f c)

data Four a b c d = Four a b c d
instance Functor (Four a b c) where
  fmap f (Four a b c d) = Four a b c (f d)

data Four' a b = Four' a a a b
instance Functor (Four' a) where
    fmap f (Four' a b c d) = Four' a b c (f d)


-- scrieti o instantă de Functor penru tipul Constant de mai sus
-- dau f doar celui care nu se gaseste in declaratia de la instance
data Quant a b = Finance | Desk a | Bloor b -- se gaseste
instance Functor (Quant a) where
  fmap _ Finance = Finance
  fmap f (Desk a) = (Desk a)
  fmap f (Bloor a) = Bloor (f a)

data K a b = K a
newtype Flip f a b = Flip (f b a) deriving (Eq, Show)
-- pentru Flip nu trebuie să faceti instantă
instance Functor (Flip K a) where
  fmap f (Flip (K a))= Flip (K (f a))
--S-ar putea să fie nevoie să adăugat, i unele constrângeri la definirea instant,elor
data LiftItOut f a = LiftItOut (f a)
instance Functor a => Functor (LiftItOut a) where
  fmap f (LiftItOut a) = LiftItOut (fmap f a)

data Parappa f g a = DaWrappa (f a) (g a)
instance (Functor f, Functor g) => Functor (Parappa f g) where
  fmap f (DaWrappa fa ga) = DaWrappa (fmap f fa) (fmap f ga)

data IgnoreOne f g a b = IgnoringSomething (f a) (g b)
instance Functor g => Functor (IgnoreOne f g a) where
  fmap f (IgnoringSomething fa gb) = IgnoringSomething fa (fmap f gb)

data Notorious g o a t = Notorious (g o) (g a) (g t)
instance Functor g => Functor (Notorious g o a) where
  fmap f (Notorious go ga gt) = Notorious go ga (fmap f gt)
-- scrieti o instantă de Functor pentru tipul GoatLord de mai sus
data TalkToMe a = Halt | Print String a | Read (String -> a)
instance Functor TalkToMe where
  fmap _ Halt = Halt
  fmap f (Print s a) = Print s (f a)
  fmap f (Read a) = Read (fmap f a)
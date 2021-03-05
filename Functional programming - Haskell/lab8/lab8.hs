import Data.List (nub, concat)
import Data.Maybe (fromJust)
import Data.List

type Nume = String

--tipul prop este o reprezentare a formuleleor propozitionale
data Prop
  = Var Nume
  | F -- false(constante booleene)
  | T -- true 
  | Not Prop -- negatia ¬
  | Prop :|: Prop -- disjunctia (∨)
  | Prop :&: Prop -- conjunctia (∧)
  | Prop :->: Prop -- implicatia
  | Prop :<->: Prop -- echivalenta
  deriving (Eq, Read)
infixr 2 :|:
infixr 3 :&:


-- ex 1
-- sa se scrie urmatoarele formule ca expresii de tip prop
-- 1. (P ∨ Q) ∧ (P ∧ Q)
p1 :: Prop
p1 = (Var "P" :|: Var "Q") :&: (Var "P" :&: Var "Q")

-- 2. (P ∨ Q) ∧ (¬P ∧ ¬Q)
p2 :: Prop
p2 = (Var "P" :|: Var "Q") :&: (Not (Var "P" ) :&: Not (Var "Q"))

p3 :: Prop
p3 = (Var "P" :&: (Var "Q" :|: Var "R")) :&:(((Not (Var "P")) :|: (Not (Var "Q"))) :&: ((Not (Var "P")) :&: (Not (Var "R"))))

-- ex2
-- faceti tipul prop instanta a clasei de tipuri Show
-- inlocuind conectivele Not, :|: si :&: cu ~,| si &
-- si folosind direct numele variabilelor in loc de 
-- constructia var

instance Show Prop where
  show F = "F"
  show T = "T"
  show (Var p) = p
  show (Not prop) = "(~" ++ show prop ++ ")"
  show (prop1 :&: prop2) = "(" ++ show prop1 ++ "&" ++ show prop2 ++ ")"
  show (prop1 :|: prop2) = "(" ++ show prop1 ++ "|" ++ show prop2 ++ ")"
  show (prop1 :->: prop2) = "(" ++ show prop1 ++ "->" ++ show prop2 ++ ")"
  show (prop1 :<->: prop2) = "(" ++ show prop2 ++ "<->" ++ show prop2 ++ ")"

test_ShowProp :: Bool
test_ShowProp =
  show (Not (Var "P") :&: Var "Q") == "((~P)&Q)"
 

--exercitiul 2' (optional)
-- pentru a putea evalua o expresie logica vom considera
-- un mediu de evaluare care asociaza valori Bool
-- variabilelor propozitionale

type Env = [(Nume, Bool)]
impureLookup :: Eq a => a -> [(a,b)] -> b
impureLookup a = fromJust . lookup a
-- fromJust extrage elementul dintr-un just si arunca 
-- eroare daca argumentul este Nothing

-- definiti o functie eval care data fiind o 
-- expresie logica si un mediu de evaluare,
-- calculeaza valoarea de adevar a expresiei

env :: Env
env = [("P", True), ("Q", False)]
-- fromJust (lookup "Q" env) -> False

-- se dau o formula si un environment in care se face evaluarea
-- sa se determine valoarea de adevar a acelei formule
eval :: Prop -> Env -> Bool
-- pentru o singura variabila propozitionala
eval (Var prop) env = impureLookup prop env
eval F _ = False
eval T _ = True
eval (Not prop) env = not (eval prop env)
eval (prop1 :|: prop2) env = (eval prop1 env) || (eval prop2 env)
eval (prop1 :&: prop2) env = (eval prop1 env) && (eval prop2 env)
eval (prop1 :->: prop2) env = not (eval prop1 env) || (eval prop2 env)
eval (prop1 :<->: prop2) env = (eval ( prop1 :->: prop2) env ) && (eval( prop2 :->: prop1) env) 
-- sa se determine toate variabilele utilizate intr -o formula

--4
variabile :: Prop -> [Nume]
variabile (Var prop) = [prop]
variabile F = []
variabile T = []
variabile (Not prop) = variabile prop
variabile (prop1 :&: prop2) = nub (variabile prop1 ++ variabile prop2)
variabile (prop1 :|: prop2) = nub (variabile prop1 ++ variabile prop2)
variabile (prop1 :->: prop2) = nub (variabile prop1 ++ variabile prop2)
variabile (prop1 :<->: prop2) = nub (variabile prop1 ++ variabile prop2)

--Ex 5
-- sequence imi returneaza produsul cartezian 
-- take 2 [2..] => [2,3]
-- take 2 (repeat 2) => [2,2]
envs :: [Nume] -> [Env]
envs list =  [zip list evironment | evironment <- sequence(take (length list) (repeat[False, True]) )]

test_envs =
  envs ["P", "Q"]
  ==
  [ [ ("P",False)
    , ("Q",False)
    ]
  , [ ("P",False)
    , ("Q",True)
    ]
  , [ ("P",True)
    , ("Q",False)
    ]
  , [ ("P",True)
    , ("Q",True)
    ]
  ]



-- Ex 6
-- exemplu satisfiabila (Not (Var "P") :&: Var "Q") == True
-- parcurh toate ebironmenturile
satisfiabila :: Prop -> Bool
satisfiabila form = or [eval form e | e <- envs (variabile form)]

-- Ex 7
--  o propozitie este valida daca negatia ei este nesatisfiabila
valida :: Prop -> Bool
valida form = (and [eval form e | e <- envs (variabile form)]) == True

-- Ex 8
-- prima data afisez doar variabilele
-- apoi expresia
-- apoi mediile din envs

-- imi voi face o functie care pentru un element din envs 
perval :: Env -> String
perval envv =  concat [ (if (snd x) == True then "T" else "F") ++ " " | x <- envv]

tabelAdevar :: Prop -> String
tabelAdevar form = concat[x ++ " "| x<- variabile form] ++ (show form) ++ "\n" ++ concat [ (perval x) ++ "  " ++  (if (eval form x) == True then "T" else "F") ++ "\n" | x <- envs (variabile form)]

-- Ex 10
-- doua prop sunt echivalente daca este valida echivalenta lor
echivalenta :: Prop -> Prop -> Bool
echivalenta prop1 prop2 = valida (prop1 :<->: prop2)


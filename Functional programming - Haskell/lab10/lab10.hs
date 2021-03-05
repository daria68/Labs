import Test.QuickCheck
import Test.QuickCheck.Gen

semigroupAssoc :: (Eq m, Semigroup m) => m -> m -> m -> Bool
semigroupAssoc a b c = (a <> (b <> c)) == ((a <> b) <> c)
monoidLeftIdentity :: (Eq m, Monoid m) => m -> Bool
monoidLeftIdentity a = (mempty <> a) == a
monoidRightIdentity :: (Eq m, Monoid m) => m -> Bool
monoidRightIdentity a = (a <> mempty) == a

-- Exercitiul 1 - Trivial

data Trivial = Trivial
    deriving (Eq, Show)

instance Semigroup Trivial where
    _ <> _ = Trivial

instance Monoid Trivial where
    mempty = Trivial

instance Arbitrary Trivial where
    arbitrary = elements [Trivial]

type TrivialAssoc =    Trivial -> Trivial -> Trivial -> Bool
type TrivialIdentity = Trivial -> Bool

-- pentru a sti sa is genereze valori random, quickCheck are nevoie de instante Arbitrary 
test_trivial_assoc = quickCheck (semigroupAssoc :: TrivialAssoc)
test_trivial_ml = quickCheck (monoidLeftIdentity :: TrivialIdentity)
test_trivial_mr = quickCheck (monoidRightIdentity :: TrivialIdentity)

-- Exercitiul 2 - Conjunctii
newtype BoolConj = BoolConj Bool
    deriving (Eq, Show)

instance Semigroup BoolConj where
    BoolConj a <> BoolConj b = BoolConj (a && b)

instance Monoid BoolConj where
    mempty = BoolConj True

-- quickCheck nu stie sa genereze random valori de tip BoolConj
-- tot ce fac este sa aplic BoolConj pe fiecare rezultat al lui arbitrary
instance Arbitrary BoolConj where
    arbitrary = fmap BoolConj arbitrary 

type BoolConjAssoc =    BoolConj -> BoolConj -> BoolConj -> Bool
type BoolConjIdentity = BoolConj -> Bool

test_boolconj_assoc = quickCheck (semigroupAssoc :: BoolConjAssoc)
test_boolconj_ml = quickCheck (monoidLeftIdentity :: BoolConjIdentity)
test_boolconj_mr = quickCheck (monoidRightIdentity :: BoolConjIdentity)


-- Exercitiul 3 - Disjunctii
newtype BoolDisj = BoolDisj Bool 
    deriving (Eq, Show)
instance Semigroup BoolDisj where
    BoolDisj a <> BoolDisj b = BoolDisj (a || b)

instance Monoid BoolDisj where
    mempty = BoolDisj False

instance Arbitrary BoolDisj where
    arbitrary = fmap BoolDisj arbitrary
    -- cu forma infixata BoolDisj <$> arbitrary
type BoolDisjAssoc = BoolDisj -> BoolDisj -> BoolDisj -> Bool
type BoolDisjIdentity = BoolDisj -> Bool

test_booldisj_assoc = quickCheck (semigroupAssoc :: BoolDisjAssoc)
test_booldisj_ml = quickCheck (monoidLeftIdentity :: BoolDisjIdentity)
test_booldisj_mr = quickCheck (monoidRightIdentity :: BoolDisjIdentity)

--Exercitiul 4 - Identity
newtype Identity a = Identity a
    deriving (Eq, Show)

instance Semigroup a => Semigroup (Identity a) where
    (Identity x) <> (Identity y) = Identity (x <> y)

instance Monoid a => Monoid (Identity a) where
    mempty = Identity mempty
instance Arbitrary a => Arbitrary (Identity a) where
    -- arbitrary = fmap Identity arbitrary
    arbitrary = Identity <$> arbitrary

type IdentityAssoc a = Identity a -> Identity a -> Identity a -> Bool
type IdentityId a = Identity a -> Bool

test_identity_assoc = quickCheck (semigroupAssoc :: IdentityAssoc String)
test_identity_ml = quickCheck (monoidLeftIdentity :: IdentityId [Int])
test_identity_mr = quickCheck (monoidRightIdentity :: IdentityId [Int])

-- Exercitiul 5 - Pereche
data Two a b = Two a b
    deriving (Eq, Show)

instance (Semigroup a, Semigroup b) => Semigroup (Two a b) where
    Two x y <> Two z t = Two (x <> z) (y <> t)

instance (Monoid a, Monoid b) => Monoid (Two a b) where
    mempty = Two mempty mempty

instance (Arbitrary a, Arbitrary b) => Arbitrary (Two a b) where
    arbitrary = Two <$> arbitrary <*> arbitrary

type TwoAssoc a b = Two a b -> Two a b -> Two a b -> Bool
type TwoId a b = Two a b -> Bool

test_two_assoc = quickCheck (semigroupAssoc :: TwoAssoc String [Int])
test_two_ml = quickCheck (monoidLeftIdentity :: TwoId [Int] String)
test_two_mr = quickCheck (monoidRightIdentity :: TwoId [Int] [Int])

-- Exercitiul 6 - Alternativă
data Or a b = Fst a | Snd b
    deriving (Eq, Show)

-- trebuie sa implementez operatia pt Semigroup (<>) astef incat

instance Semigroup (Or a b) where
    Fst _ <> x = x
    y <> _ = y

instance (Arbitrary a, Arbitrary b) => Arbitrary (Or a b) where
    arbitrary = oneof [arbitraryFst, arbitrarySnd]
        where
        arbitraryFst = Fst <$> arbitrary
        arbitrarySnd = Snd <$> arbitrary

type OrAssoc a b = Or a b -> Or a b -> Or a b -> Bool

test_or_assoc = quickCheck (semigroupAssoc :: OrAssoc String Int)

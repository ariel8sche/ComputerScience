{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
import Data.Foldable (Foldable(fold))
import Data.Bifoldable (bifoldl1)
{-# HLINT ignore "Redundant lambda" #-}
{-# HLINT ignore "Use foldr" #-}

 -- Ejercicio 1

max2 :: (Float, Float) -> Float
max2 (x,y) | x >= y = x
           | otherwise = y
-- No esta currificado

normaVectorial :: (Float, Float) -> Float
normaVectorial (x, y) = sqrt (x^2 + y^2)
-- No esta currificado

subtract :: Float -> Float -> Float
subtract = flip (-)
-- Esta currificado

predecesor :: Float -> Float
predecesor = Main.subtract 1
-- Esta currificado

evaluarEnCero :: (Float -> a) -> a
evaluarEnCero = \f -> f 0
-- Esta currificado

dosVeces :: (Float -> Float) -> Float -> Float
dosVeces = \f -> f . f
-- Esta currificado

--flip :: (a -> b -> c) -> b -> a -> c

--map :: (x -> y) -> [x] -> [y]

flipAll :: [a -> b -> c] -> [b -> a -> c]
flipAll = Prelude.map flip
-- Esta currificado

flipRaro :: b -> (a -> b -> c) -> a -> c
flipRaro = flip flip
-- Esta 

-- Ejercicio 2

-- I

curry' :: ((a,b) -> c) -> a -> b -> c
curry' f x y = f (x, y)

-- II

uncurry' :: (a -> b -> c) -> (a, b) -> c
uncurry' f (x, y) = f x y

-- Ejercicio 3

-- I

foldr :: (a -> b -> b) -> b -> [a] -> b
foldr f z [] = z
foldr f z (x:xs) = f x (Main.foldr f z xs)

sum :: [Float] -> Float
sum = Main.foldr (+) 0

elem :: Ord a => a -> [a] -> Bool
elem e = Main.foldr (\x rec -> (x == e) || rec) False

(++) :: [[a]] -> [a]
(++) = Main.foldr (Prelude.++) []

filter :: (a -> Bool) -> [a] -> [a]
filter f = Main.foldr (\x rec -> if f x
                                    then (:) x rec
                                else rec) []

map :: (a -> b) -> [a] -> [b]
map f = Main.foldr (\x rec -> f x: rec) []

-- II

mejorSegun :: (a -> a -> Bool) -> [a] -> a
mejorSegun f = foldr1 (\x rec -> if f x rec then x else rec)

-- III

sumasParciales :: Num a => [a] -> [a]
sumasParciales xs = reverse (foldl (\acc x -> (head acc + x) : acc) [0] (reverse xs))

-- IV

sumaAlt :: Num a => [a] -> a
sumaAlt = Main.foldr (-) 0

-- Ejercicio 4

-- I

--permutaciones :: [a] -> [[a]]
--permutaciones 

-- Ejercicio 5

elementosEnPosicionesPares :: [a] -> [a]
elementosEnPosicionesPares [] = []
elementosEnPosicionesPares (x:xs) = if null xs
                                        then [x]
                                    else x : elementosEnPosicionesPares (tail xs)

-- No usa recursion estructural, usa recursion explicita

entrelazar :: [a] -> [a] -> [a]
entrelazar [] = id
entrelazar (x:xs) = \ys ->  if null ys
                                then x : entrelazar xs []
                            else x : head ys : entrelazar xs (tail ys)

-- No usa recursion estructural, usa recursion explicita

-- Ejercicio 6

recr :: (a -> [a] -> b -> b) -> b -> [a] -> b
recr _ z [] = z
recr f z (x : xs) = f x xs (recr f z xs)

-- I

sacarUnaSF :: Eq a => a -> [a] -> [a]
sacarUnaSF e [] = []
sacarUnaSF e (x:xs) = if e == x then xs else sacarUnaSF e xs

sacarUna :: Eq a => a -> [a] -> [a]
sacarUna e = recr (\x xs rec -> if e == x then xs else x:rec) []

-- Ejercicio 11

-- I

data Nat = Zero
         | Succ Nat

foldNat :: (Nat -> a -> a) -> a -> Nat -> a
foldNat fSucc fZero Zero = fZero
foldNat fSucc fZero (Succ n) = fSucc n (foldNat fSucc fZero n)

contar :: Nat -> Int
contar n = case n of
            Zero -> 0
            Succ n -> 1 + contar n

contarF :: Nat -> Int
contarF = foldNat (\n rec -> 1 + rec) 0 

-- II 

-- Ejercicio 12



cinco = Succ (Succ (Succ (Succ (Succ Zero)))) 

-- Ejercicio 13

data AB a = Nil | Bin (AB a) a (AB a)

foldAB :: (a -> b -> b -> b) -> b -> AB a -> b
foldAB fBin fNil t = case t of
                    Nil -> fNil
                    Bin i r d -> fBin r (rec i) (rec d)
    where rec = foldAB fBin fNil

recrAB :: (a -> AB a -> AB a -> b -> b -> b) -> b -> AB a -> b
recrAB fBin fNil t = case t of
                    Nil -> fNil
                    Bin i r d -> fBin r i d (rec i) (rec d)
    where rec = recrAB fBin fNil

esNil :: AB a -> Bool
esNil t = case t of
    Nil -> True
    Bin i r d -> False

altura :: AB a -> Int
altura = foldAB (\_ i d-> 1 + max i d) 0

cantNodos :: AB a -> Int
cantNodos = foldAB (\r i d -> 1 + i + d) 0

arbol1 = Bin (Bin (Bin (Bin (Nil) 1 (Nil)) 2 (Bin (Nil) 3 (Nil))) 4 (Bin (Nil) 5 (Nil))) 6 (Bin (Bin (Nil) 7 (Nil)) 8 (Bin (Nil) 9 (Nil)))
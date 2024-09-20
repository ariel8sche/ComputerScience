{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Avoid lambda" #-}
import Test.HUnit (assertBool)

max2 :: (Float, Float) -> Float
max2 (x, y) | x >= y = x
            | otherwise = y

normaVectorial :: (Float, Float) -> Float
normaVectorial (x, y) = sqrt (x^2 + y^2)

subtract :: Float -> Float -> Float
subtract = flip (-)

predecesor :: Float -> Float
predecesor = Main.subtract 1

evaluarEnCero :: (Float -> Float) -> Float
evaluarEnCero = \f -> f 0

dosVeces :: (Float -> Float) -> Float -> Float
dosVeces = \f -> f . f

flipAll :: [Float -> Float -> Float] -> [Float -> Float -> Float]
flipAll = map flip

flipRaro :: Float -> (Float -> Float -> Float) -> Float -> Float
flipRaro = flip flip

-- II.

max2C :: Float -> Float -> Float
max2C x = \y -> max2 (x, y)

normaVectorialC :: Float -> Float -> Float
normaVectorialC x = \y -> sqrt (x^2 + y^2)

-- 2.

-- I.

curry :: ((Float, Float) -> Float) -> Float -> Float -> Float
curry f = \x y -> f (x, y)

--main = do
--    let sumaCurrificada = Main.curry max2
--    print(sumaCurrificada 2 3)

-- II.

uncurry :: (Float -> Float -> Float) -> (Float, Float) -> Float
uncurry f = \(x, y) -> f x y

--main = do
--   let maxCurrificada = Main.curry max2
--    let maxNoC = Main.uncurry maxCurrificada
--    print(maxNoC (2, 3))

-- 3.

-- I.

foldr :: (a -> b -> b) -> b -> [a] -> b
foldr f z [] = z
foldr f z (x:xs) = f x (Main.foldr f z xs)

sum :: [Float] -> Float
sum = Main.foldr (+) 0

elem :: Float -> [Float] -> Bool
elem n = Main.foldr (\x acc -> x == n || acc) False

(++) :: [[a]] -> [a]
(++) = Main.foldr (Prelude.++) []

filterf :: (a -> Bool) -> [a] -> [a]
filterf b = Main.foldr (\x acc -> if b x then x : acc else acc) []

mapf :: (a -> b) -> [a] -> [b]
mapf f = Main.foldr ((:) . f) []

-- II.

mejorSegun :: (a -> a -> Bool) -> [a] -> a
mejorSegun f = foldr1 (\x acc -> if f x acc then x else acc)

main = do
    let maximum = mejorSegun (>) [1,2,3]
    print (maximum)

-- III.

sumasParciales :: Num a => [a] -> [a]
sumasParciales xs = reverse (foldl (\acc x -> (head acc + x) : acc) [0] (reverse xs))

-- IV.

sumaAlt :: Num a => [a] -> a
sumaAlt = Main.foldr (-) 0

-- V.

-- sumaAltInv :: Num a => [a] -> a
-- sumaAltInv =

-- Ejercicio 4

-- I.

-- permutaciones :: [a] -> [[a]]
-- permutaciones =

-- II.

-- partes :: [a] -> [[a]]
-- partes =

-- III.  

-- prefijos ::

-- IV.

-- sublistas ::

-- Ejercicio 5

elementosEnPosicionesPares :: [a] -> [a]
elementosEnPosicionesPares [] = []
elementosEnPosicionesPares (x:xs) = if null xs
                                        then [x]
                                    else x : elementosEnPosicionesPares (tail xs)

entrelazar :: [a] -> [a] -> [a]
entrelazar [] = id
entrelazar (x:xs) = \ys -> if null ys
                                then x : entrelazar xs []
                            else x : head ys : entrelazar xs (tail ys)

-- Estas funciones no usan recursion estructural
-- ya que ambas miran la cola y esa es una de las 
-- reglas de recursion estructural

-- Ejercicio 6

recr :: (a -> [a] -> b -> b) -> b -> [a] -> b
recr _ z [] = z
recr f z (x : xs) = f x xs (recr f z xs)

-- I.  

sacarUna :: Eq a => a -> [a] -> [a]
sacarUna e = recr (\x xs rec -> if x == e then xs else x:rec) []

-- II.  

-- No se podria usar foldr para la funcion sacarUna
-- pq no sacaria la primera aparcicion si no que sacaria
-- todas las apariciones del elemento en la lista

-- III.

insertarOrdenado :: Ord a => a -> [a] -> [a]
insertarOrdenado a = recr (\x xs rec -> if a < x then a:x:xs else x:rec) []

-- Ejercicio 7

-- I.  

genLista :: a -> (a -> a) -> Integer -> [a]
genLista n f x | x <= 0 = []
               | otherwise = n : genLista (f n) f (x-1)

-- II.  

desdeHasta :: Integer -> Integer -> [Integer]
desdeHasta x y = genLista x (+1) (y-x+1)

-- Ejercicio 8

-- I.  

-- mapPares :: (a -> a -> a) -> [(a,a)] -> [(a, a)]
-- mapPares f 

-- II. 

armarPares :: [a] -> [a] -> [(a, a)]
armarPares = zip

-- III.  

mapDoble :: (a -> a -> a) -> [a] -> [a] -> [a]
mapDoble = zipWith

-- Ejercicio 9

-- I.

sumaMat :: [[Int]] -> [[Int]] -> [[Int]]
sumaMat [] [] = []
sumaMat (x:xs) (y:ys) = (zipWith (+) x y) : sumaMat xs ys

--sumaMat :: [[Int]] -> [[Int]] -> [[Int]]
--sumaMat = zipWith (zipWith (+))

-- II.  

--trasponer :: [[Int]] -> [[Int]]
--trasponer

-- Ejericicio 10

generate :: ([a] -> Bool) -> ([a] -> a) -> [a]
generate stop next = generateFrom stop next []

generateFrom:: ([a] -> Bool) -> ([a] -> a) -> [a] -> [a]
generateFrom stop next xs | stop xs = init xs
                          | otherwise = generateFrom stop next (xs Prelude.++ [next xs])

-- I.



-- II.



-- III.



-- IV.



-- V.



-- Ejercicio 11

-- I.  

data Nat = Zero
         | Succ Nat

aEntero :: Nat -> Int
aEntero Zero     = 0
aEntero (Succ n) = 1 + aEntero n

esZero :: Nat -> Bool
esZero Zero = True
esZero _ = False

suma :: Nat -> Nat -> Nat
suma Zero     n = n
suma (Succ m) n = Succ (suma m n)

multiplica :: Nat -> Nat -> Nat
multiplica Zero     _ = Zero
multiplica (Succ m) n = suma n (multiplica m n)

potencia :: Nat -> Nat -> Nat
potencia (Succ m) Zero = Succ Zero
potencia Zero _ = Zero
potencia (Succ m) (Succ n) = multiplica (Succ m) (potencia (Succ m) n)

doble :: Nat -> Nat
doble Zero = Zero
doble (Succ n) = Succ (Succ (doble n))

main2 :: IO ()
main2 = do
    let dos = Succ (Succ Zero)
    let tres = Succ dos
    --print (aEntero (suma dos tres))
    --print (aEntero (doble tres))
    --print (esZero Zero)
    --print (esZero dos)
    print (aEntero (potencia tres tres))

--I.

foldNat :: a -> (a -> a) -> Nat -> a
foldNat cZero _ Zero = cZero
foldNat cZero cSucc (Succ n) = cSucc (foldNat cZero cSucc n)

aEnteroF :: Nat -> Int
aEnteroF = foldNat 0 (1 +)

sumaF :: Nat -> Nat -> Nat
sumaF m = foldNat m Succ

multiplicaF :: Nat -> Nat -> Nat
multiplicaF m = foldNat Zero (\ acc -> sumaF m acc)

-- II.

potenciaF :: Nat -> Nat -> Nat
potenciaF m = foldNat (Succ Zero) (multiplica m)

main3 :: IO()
main3 = do
    let tres = Succ (Succ (Succ Zero))
    print (aEnteroF (potenciaF tres tres))

-- Ejercicio 12

data Polinomio a = X
                 | Cte a
                 | Suma (Polinomio a) (Polinomio a)
                 | Prod (Polinomio a) (Polinomio a)

foldPoli :: b -> (a -> b) -> (b -> b -> b) -> (b -> b -> b) -> Polinomio a -> b
foldPoli cX cCte cSuma cProd poli = case poli of
    X -> cX
    Cte k -> cCte k
    Suma p q -> cSuma (rec p) (rec q)
    Prod p q -> cProd (rec p) (rec q)
  where rec = foldPoli cX cCte cSuma cProd

evaluar :: Num a => a -> Polinomio a -> a
evaluar n poli = case poli of
       X -> n
       Cte k -> k
       Suma p q -> evaluar n p + evaluar n q
       Prod p q -> evaluar n p * evaluar n q

evaluarF :: Num a => a -> Polinomio a -> a
evaluarF n = foldPoli n id (+) (*)

main4 :: IO ()
main4 = do
    let poli = Suma (Prod (Cte 2) X) (Cte 3)  -- representa el polinomio 2x + 3
    print $ evaluar 5 poli  -- evalúa el polinomio en x = 5


-- Ejercicio 13

data AB a = Nil | Bin (AB a) a (AB a)

-- I.  

foldAB ::  (b -> a -> b -> b) -> b -> AB a -> b
foldAB f z Nil = z
foldAB f z (Bin i r d) = f (foldAB f z i) r (foldAB f z d)

cantNodos :: AB a -> Int
cantNodos = foldAB (\iz _ der -> 1 + iz + der) 0

altura :: AB a -> Int
altura = foldAB (\izq _ der -> 1 + max izq der) 0

esNil :: AB a -> Bool
esNil = foldAB ((const . const) (const False)) True

{-
altura :: AB a -> Int
altura Nil = 0
altura (Bin izq _ der) = 1 + max (altura izq) (altura der)
-}


main8 :: IO ()
main8 = do
    let arbol = Bin (Bin (Bin Nil 4 Nil) 2 (Bin Nil 5 Nil)) 1 (Bin Nil 3 Nil)
    print $ cantNodos arbol
    print $ altura arbol
    print $ esNil arbol

-- Ejercicio 14

--mismaEstructura :: AB a -> AB b -> Bool

--ramas

--cantHojas

--espejo

-- Ejercicio 15

--data AIH a = Hoja a | Bin (AIH a) (AIH a)

--foldAIH

--altura :: AIH a -> Integer y tamaño :: AIH a -> Integer
--altura



-- Ejercicio 16

data RoseTree a = Rose a [RoseTree a]

ejemploRoseTree :: RoseTree Int
ejemploRoseTree =
    Rose 1
        [ Rose 2 []
        , Rose 3
            [ Rose 4 []
            , Rose 5 []
            ]
        , Rose 6
            [ Rose 7 []
            ]
        ]

tamaño :: RoseTree a -> Int
tamaño (Rose x hijos) = 1 + Prelude.sum (map tamaño hijos)

foldRT :: (a -> [b] -> b) -> RoseTree a -> b
foldRT f (Rose x hijos) = f x (map (foldRT f) hijos)

tamañoF :: RoseTree a -> Int
tamañoF = foldRT (\_ recs -> 1 + Prelude.sum recs)
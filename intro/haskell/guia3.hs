dobleMe :: Int -> Int
dobleMe x = x + x

-- Ejercicio 1

-- a)

f1 :: Int -> Int
f1 x | x == 1 = 8
     | x == 4 = 131
     | x == 16 = 16

-- b)

{-
problema g1 (n:Z) :Z {
    requiere { n=8 v n=131 v n=16}
    asegura { (n = 8 -> Res = 1) ∧ (n = 131 -> Res = 4) ∧ (n = 16-> Res = 16) }
    }
-}

g1 :: Int -> Int
g1 x | x == 8 = 1
     | x == 131 = 4
     | x == 16 = 16

-- c)

h1 :: Int -> Int
h1 x = f1 (g1 (x))

k1 :: Int -> Int
k1 x = g1 (f1 (x))

-- Ejercicio 2

-- a

{-
problema absoluto (x:Z) :N {
     requiere {True}
     asegura {res = |x|}
}
-}

absoluto :: Float -> Float
absoluto x = abs (x)

-- b)

{-
problema maximoAbsoluto (x,y:Z) :N {
     requiere {True}
     asegura { res = (if absoluto(x) >= absoluto (y) then absoluto(x) else absoluto(y)}
} 
-}

maximo:: Int -> Int -> Int
maximo x y | x >= y = x
           | otherwise = y

maximoAbsoluto :: Int -> Int -> Int
maximoAbsoluto x y = maximo (abs (x)) (abs (y))

-- c)

{-
problema maximo3 (x,y,z:Z) :Z {
     requiere {True}
     asegura {((x >= y) ∧ (x >= z)) -> res = x}
     asegura {((y >= x) ∧ (y >= z)) -> res = y}
     asegura {((z >= y) ∧ (z >= x)) -> res = z}
     asegura {((x = y) ∧ (x = z)) -> res = x}
}
-}

maximo3 :: Int -> Int -> Int -> Int
maximo3 x y z | ((x >= y) && (x >= z)) = x
              | ((y >= x) && (y >= z)) = y
              | otherwise = z

-- d)

{-
problema algunoEs0 (x,y:Z) :Bool{
     requiere {True}
     asegura {res = True <=> ((x = 0) v (y = 0))}
}
-}

algunoEs0 :: Int -> Int -> Bool
algunoEs0 x y | x == 0 = True
              | y == 0 = True
              | otherwise = False

algunoEs0bis :: Int -> Int -> Bool
algunoEs0bis 0 _ = True
algunoEs0bis _ 0 = True
algunoEs0bis x y = False

-- e) 

{-
problema ambosSon0 (x,y:Z) :Bool{
     requiere {True}
     asegura {res = True <=> ((x = 0) ∧ (y = 0))}
}
-}

ambosSon0 :: Int -> Int -> Bool
ambosSon0 x y | ((x == 0) && (y == 0)) = True
              | otherwise = False

ambosSon0bis :: Int -> Int -> Bool
ambosSon0bis 0 0 = True
ambosSon0bis x y = False

-- f)

{-
problema mismoIntervalo (x,y:Z) :Bool {
     requiere {True}
     asegura {res = True <=> (((x ∧ y) e A) v ((x ∧ y) e B) v ((x ∧ y) e C)}
-- A = (−∞, 3]
-- B = (3, 7]
-- C = (7, ∞)

}
-}

mismoIntervalo :: Float -> Float -> Bool
mismoIntervalo x y | ((x <= 3) && (y <= 3)) = True
                   | (((x > 3) && (x <= 7)) && ((y > 3) && (y <= 7))) = True
                   | ((x > 7) && (y > 7)) = True
                   | otherwise = False

-- g)

{-
problema sumaDistintos (x,y,z:Z) :Z {
     requiere {True}
     asegura {(Practica 13/04)}
}
-}

sumaDistintos :: Int -> Int -> Int -> Int
sumaDistintos x y z | ((x /= y) && (x /= z) && (y /= z)) = x + y + z
                    | (((x == z) || (y == z)) && (x /= y)) = x + y
                    | (((y == x) || (z == x)) && (y /= z)) = y + z
                    | (((x == y) || (z == y)) && (z /= x)) = z + x
                    | otherwise = x

-- h)

{-
problema esMultiploDe (x,y:Z) :Bool{
     requiere {True}
     asegura {res = True <=> (y * k) = x}
}
-}

esMultiploDe :: Int -> Int -> Bool
esMultiploDe x y | mod x y == 0 = True
                 | otherwise = False

-- i)

{-
problema digitoUnidades (x:Z) :Z {
     requiere {}
     asegura {}
}
-}

digitoUnidades :: Int -> Int
digitoUnidades x | x < 10 = x
                 | otherwise = digitoUnidades (x - 10)

-- j) 

{-
problema digitoDecenes (x:Z) :Z {
     requiere {}
     asegura {}
}
-}

digitoDecenas :: Int -> Int
digitoDecenas x | x < 100 = x - digitoUnidades (x)
                | otherwise = digitoDecenas (x - 100)

-- Ejercicio 3

despejarK :: Int -> Int -> Int
despejarK x y = - (div (x * x) (x * y))

estanRelacionados :: Int -> Int -> Bool
estanRelacionados x y | (x * x + (x * y * despejarK x y)) == 0 = True
                      | otherwise = False

-- Ejercicio 4

-- a) 

{-
problema prodInt (a:seq(R) x b:seq(R)) :R {
     requiere {True}
     asegura {Res = ((ax * bx) + (ay * by))}
}
-}

prodInt :: (Float, Float) -> (Float, Float) -> Float
prodInt (ax, ay) (bx, by) = ((ax * bx) + (ay * by))

-- b) 

{-
problema todoMenor (a:seq(R) x b:seq(R)) :Bool {
     requiere {True}
     asegura {Res = True <-> ((ax < bx) ∧ (ay < by))}
}
-}

todoMenor :: (Float, Float) -> (Float, Float) -> Bool
todoMenor (ax, ay) (bx, by) | ((ax < bx ) && (ay < by)) = True
                            | otherwise = False

-- c)

{-
problema distanciaPuntos (a:(R x R), b:(R x R)) :R {
     requiere {True}
     asegura { res = |(a - b)|}
     asegura { res >= 0 }
}
-}

restaVectores :: (Float, Float) -> (Float, Float) -> (Float, Float)
restaVectores (ax, ay) (bx, by) = ((bx - ax), (by - ay))

modulo :: (Float, Float) -> Float
modulo (ax, ay) = sqrt ((ax ** 2) + (ay ** 2))

distanciaPuntos :: (Float, Float) -> (Float, Float) -> Float
distanciaPuntos (ax, ay) (bx, by) = modulo (restaVectores (ax, ay) (bx, by))

-- d)

{-
problema sumaTerna (t:(Z x Z x Z)) :Z {
     requiere {True}
     asegura {res = t1 + t2 + t3}
}
-}

sumaTerna :: (Int, Int, Int) -> Int
sumaTerna (x, y, z) = (x + y + z)

-- e)

{-
problema sumaSoloMultiplos (t:(Z x Z x Z), n:Z ) :Z {
     requiere {True}
     asegura {res}
}
-}

sumarSiEsMultiplo :: Int -> Int -> Int
sumarSiEsMultiplo x n | esMultiploDe x n == True = x
                      | otherwise = 0

sumarSoloMultiplo :: (Int, Int, Int) -> Int -> Int
sumarSoloMultiplo (x, y, z) n = (sumarSiEsMultiplo x n) + (sumarSiEsMultiplo y n) + (sumarSiEsMultiplo z n)

-- f)

{- 
problema posPrimerPar (t:(Z x Z x Z)) :Z {
     requiere {True}
     asegura {(!esPar(t0) ∧ !esPar(t1) ∧ !esPar(t2)) -> res = 4}
     asegura {esPar(t0) -> res = 0}
     asegura {(esPar(t1) ∧ !esPar(t0)) -> res = 1}
     asegura {(esPar(t2) ∧ !esPar(t0) ∧ !esPar(t1)) -> res = 2}
}
-}

esPar :: Int -> Bool
esPar x | x == 0 = True
        | x == 1 = False
        | otherwise = esPar (x - 2)

posPrimerPar :: (Int, Int, Int) -> Int
posPrimerPar (x, y, z) | esPar (x) == True = 0
                       | esPar (y) == True = 1
                       | esPar (z) == True = 2
                       | ((esPar (x) == False) && (esPar (x) == False) && (esPar (x) == False)) = 4

-- g)

{-
problema crearPar (x,y:T) : (T x T) {
     requiere {True}
     asegura {(x ∧ y) e res}
}
-}

crearPar :: t -> t -> (t, t)
crearPar x y = (x, y)

-- h)

{-
problema invertir (t:T x T) : (T x T) {
     requiere { True }
     asegura { ((t0 = res1) ∧ (t1 = res0)) }
     asegura { (t0 ∧ t1) e res }
} 
-}

invertir :: (t, t) -> (t, t)
invertir (x, y) = (y, x)

-- Ejercicio 5
{-
problema todosMenores ((n1,n2,n3) : Z × Z × Z) : Bool {
requiere: {T rue}
asegura: {(res = true) <=> ((f(n1) > g(n1)) ∧ (f(n2) > g(n2)) ∧ (f(n3) > g(n3))))}
}
-}

todosMenores :: (Int, Int, Int) -> Bool
todosMenores (x, y, z) | (((f x) > (g x)) && ((f y) > (g y)) && ((f z) > (g z))) = True
                       | otherwise = False

{-
problema f (n: Z) : Z {
requiere: {True}
asegura: {(n ≤ 7 → res = n^2) ∧ (n > 7 → res = 2n − 1)}
}
-}

f :: Int -> Int
f x | x <= 7 = (x ^ 2)
    | x > 7 = ((2 * x) - 1)
{-
problema g (n: Z) : Z {
requiere: {True}
asegura: {res = if esPar(n) then n/2 else 3n + 1 fi}
}
-}

g :: Int -> Int
g x | esPar x == True = (div x 2)
    | otherwise = ((3 * x) + 1)

{-
pred esP ar(n : Z){ (n mod 2) = 0 }
-}

-- Ejercicio 6

{-
pred EsMultiplo(x : Z, y : Z){x mod y = 0}
-}

esMultiplo :: Integer -> Integer -> Bool
esMultiplo x y | mod x y == 0 = True
               | otherwise = False

{-
problema bisiesto (año: Z) : Bool {
requiere: {True}
asegura: {res = false <=> (¬EsMultiplo(año, 4) ∨ (EsMultiplo(año, 100) ∧ ¬EsMultiplo(año, 400)))}
-}

bisiesto :: Integer -> Bool
bisiesto x | ((not (esMultiplo x 4)) || ((esMultiplo x 100) && (not (esMultiplo x 400)))) = False
           | otherwise = True

-- Ejercicio 7

{-
problema distanciaManhattan (p : R × R × R, q : R × R × R) : R {
requiere: {True}
asegura: {res = sumatoria desde i=0 hasta 2 de abs(pi − qi)}
-}

distanciaManhattan:: (Float, Float, Float) -> (Float, Float, Float) -> Float
distanciaManhattan (x, y, z) (a, b, c) = ((absoluto (x - a)) + (absoluto (y - b)) + (absoluto (z - c)))

-- Ejercicio 8 

{-
problema comparar (a:Z, b:Z) : Z {
     requiere: {T rue}
     asegura: {(res = 1 ↔ sumaUltimosDosDigitos(a) < sumaUltimosDosDigitos(b))}
     asegura: {(res = −1 ↔ sumaUltimosDosDigitos(a) > sumaUltimosDosDigitos(b))}
     asegura: {(res = 0 ↔ sumaUltimosDosDigitos(a) = sumaUltimosDosDigitos(b)))}
}
-}

comparar :: Integer ->Integer ->Integer
comparar x y | ((sumaUltimosDosDigitos x) < (sumaUltimosDosDigitos y)) == True = 1
             | ((sumaUltimosDosDigitos x) > (sumaUltimosDosDigitos y)) == True = (-1)
             | ((sumaUltimosDosDigitos x) == (sumaUltimosDosDigitos y)) == True = 0

{-
problema sumaUltimosDosDigitos (x: Z) : Z {
     requiere: {T rue}
     asegura: {res = (x m´od 10) + (⌊(x/10)⌋ m´od 10)}
}
-}

sumaUltimosDosDigitos :: Integer -> Integer
sumaUltimosDosDigitos x = mod ((mod x 10) + (div x 10)) 10

-- Ejercicio 9

{-
problema fUno (n:R) :R {
     requiere {}
     asegura {n = 0 -> res = 1}
     asegura {n =/ 0 -> res = 0 }
}
-}

fUno :: Float -> Float
fUno n | n == 0 = 1
     | otherwise = 0

{-
problema f2 (x:R) :R {
     requiere {}
     asegura {n = 1 -> res = 15}
     asegura {n = -1 -> res = -15}
}
-}

f2 :: Float -> Float
f2 n | n == 1 = 15
     | n == (-1) = (-15)

{-
problema f3 (n:R) :R {
     requiere {}
     asegura {n <= 9 -> res = 7}
     asegura {n >= 3 -> res = 5}
}
-}

f3 :: Float -> Float
f3 n | n <= 9 = 7
     | n >= 3 = 5

{-
problema f4 (x,y:R) :R {
     requiere {}
     asegura {res = div (x + y) 2 }
}
-}

f4 :: Float -> Float -> Float
f4 x y = (x + y) / 2

{-
problema f5 (t:(R x R)) :R {
     requiere {}
     asegura {res = div (x + y) 2}
}
-}

f5 :: (Float , Float) -> Float
f5 (x , y) = ( x + y ) / 2

{-
problema f6 (a:R, b:Z) :Bool {
     requiere {}
     asegura {res = True <=> El entero mas cercano entre 0 y "a" es igual a "b"}
}
-}

f6 :: Float -> Int -> Bool
f6 a b = truncate a == b
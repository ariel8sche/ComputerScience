type Set a = [a]

vacio :: [Int]
vacio = []

cantidadDeApariciones :: (Eq t ) => t -> [t] -> Integer
cantidadDeApariciones y [] = 0 
cantidadDeApariciones y (x:xs) | y == x = 1 + cantidadDeApariciones y xs
                               | otherwise = cantidadDeApariciones y xs

-- Ejercicio 1

-- 1)

{-
problema logitud (s:seq<T>) : T {
    rquiere {True}
    asegura {resultado = # de elem de s}
}
-}

longitud :: [t] -> Integer
longitud [] = 0
longitud (x:xs) = (longitud xs) + 1

longitudBis :: [t] -> Integer
longitudBis [] = 0
longitudBis (x:xs) = fromIntegral(length (x:xs))

-- 2)

{-
problema ultimo (s: seq⟨T ⟩) : seq⟨T ⟩ {
    requiere: { |s|> 0 }
    asegura: { resultado = s[|s|−1] }
}
-}

ultimo :: [t] -> t
ultimo [x] = x
ultimo (x:xs) = ultimo (tail(xs))

-- 3)

{-
problema principio (s: seq⟨T ⟩) : seq⟨T ⟩ {
    requiere: { |s|> 0 }
    asegura: { resultado = subseq(s, 0, |s|−1) }
}
-}

principio :: [t] -> [t]
principio [x] = []
principio (x:xs) = x : principio (xs)

-- 4)

{-
problema reverso (s: seq⟨T ⟩) : seq⟨T ⟩ {
    requiere: { T rue }
    asegura: { resultado tiene los mismos elementos que s pero en orden inverso.}
}
-}

reverso :: [t] -> [t]
reverso [] = []
reverso (x:xs) = (reverso xs) ++ [x]

-- Ejercicio 2

-- 1)

{-
problema pertenece (e: T, s: seq⟨T ⟩) : B {
    requiere: { True }
    asegura: { resultado = true ↔ e ∈ s }
}
-}

pertenece :: (Eq t) => t -> [t] -> Bool
pertenece x [] = False
pertenece x (y:ys) | x == y = True
                   | otherwise = pertenece x ys 

perteneceBis :: (Eq t) => t -> [t] -> Bool
perteneceBis x [] = False
perteneceBis x (y:ys) | elem x (y:ys) == True = True
                   | otherwise = False

-- 2)

{-
problema todosIguales (s:seq<T>) :B {
    requiere {}
    asegura {}
}
-}

todosIguales :: (Eq t) => [t] -> Bool
todosIguales [] = True
todosIguales [x] = True
todosIguales (x:y:xs) | x == y = todosIguales (y:xs)
                      | otherwise = False

-- 3) 

{-
problema todosDistintos (s: seq⟨T ⟩) : B {
    requiere: { True }
    asegura: { resultado = f alse ↔(∃i, j : Z)(0 ≤i < |s|∧0 ≤j < |s|∧i ̸= j ∧s[i] = s[j] }
}
-}

todosDistintos :: (Eq t) => [t] -> Bool
todosDistintos [] = True
todosDistintos (x:xs) | pertenece x xs = False
                      | otherwise = todosDistintos xs

-- 4)

{-
problema hayRepetidos (s: seq⟨T ⟩) : B {
    requiere: { True }
    asegura: {resultado = true ↔(∃i, j : Z)(0 ≤i < |s|∧0 ≤j < |s|∧i ̸= i ∧s[i] = s[j])}
}
-}

hayRepetidos :: (Eq t) => [t] -> Bool
hayRepetidos [] = False
hayRepetidos (x:xs) = pertenece x xs || hayRepetidos xs 

-- 5)

quitar :: (Eq t) => t -> [t] -> [t]
quitar y [] = [] 
quitar y (x:xs) | x == y = xs
                | otherwise = x : quitar y xs 

-- 6)

{-
problema quitarTodos (e: T, s: seq⟨T ⟩) : seq⟨T ⟩ {
    requiere: { True }
    asegura: { resultado es igual a s pero sin el elemento e. }
}
-}

quitarTodos :: (Eq t ) => t -> [t] -> [t] 
quitarTodos y [] = []
quitarTodos y (x:xs) | x == y = quitarTodos y xs
                     | otherwise = x : quitarTodos y xs 

-- 7) 

eliminarRepetidos :: (Eq t) => [t] -> [t]
eliminarRepetidos [] = []
eliminarRepetidos (x:xs) = x : eliminarRepetidos (quitarTodos x (x:xs))

-- 8)

{-
problema mismosElementos (s: seq⟨T ⟩, r: seq⟨T ⟩) : B {
    requiere: { True }
    asegura: { resultado = true ↔(∀e : T )(e ∈s ↔e ∈r) }
}
-}

mismosElementos :: (Eq t) => [t] -> [t] -> Bool
mismosElementos [] [] = True
mismosElementos (x:xs) (y:ys) | incluido (x:xs) (y:ys) && incluido (y:ys) (x:xs) = True 
                              | otherwise = False

incluido :: (Eq t) => [t] -> [t] -> Bool
incluido [] _ = True
incluido (x:xs) (y:ys) = pertenece x (y:ys) && incluido xs (y:ys)

-- 9)

{-
problema capicua (s: seq⟨T ⟩) : B {
    requiere: { True }
    asegura: { resultado = true ↔(∀i : Z)(0 ≤i < ⌊|s| 2 ⌋→s[i] = s[|s|−1 −i]) }
}
-}

capicua :: (Eq t) => [t] -> Bool
capicua [] = True
capicua [x] = True
capicua (x:xs) = ((x == (ultimo xs)) && (capicua (principio xs)))

--hacerCapicua :: [t] -> [t]
--hacerCapicua (x:xs) = ((x:xs) ++ (reverso(x:xs)))

-- Ejercicio 3 

-- 1)

{-
problema sumatoria (s: seq⟨Z⟩) : Z {
    requiere: { T rue }
    asegura: { resultado = ∑|s|−1
i=0 s[i] }
}
-}

sumatoria :: [Integer] -> Integer
sumatoria [] = 0
sumatoria (x:xs) = x + sumatoria xs

-- 2)

{-
problema productoria (s: seq⟨Z⟩) : Z {
    requiere: { True }
    asegura: { resultado = ∏|s|−1 i=0 s[i] }
}
-}

productoria :: [Integer] -> Integer
productoria [] = 1
productoria (x:xs) = x * productoria xs

-- 3)

{-
problema maximo (s: seq⟨Z⟩) : Z {
    requiere: { |s|> 0 }
    asegura: { resultado ∈s ∧(∀i : Z)(0 ≤i < |s|→resultado ≥s[i] }
}
-}

maximo :: [Integer] -> Integer
maximo [x] = x
maximo (x:xs) | x >= maximo xs = x
              | otherwise = maximo xs

-- 4)

{-
problema sumarN (n: Z, s: seq⟨Z⟩) : seq⟨Z⟩ {
    requiere: { True }
    asegura: {|resultado|= |s|∧(∀i : Z)(0 ≤i < |s|→resultado[i] = s[i] + n }
}
-}

sumarN :: Integer -> [Integer] -> [Integer]
sumarN n [] = []
sumarN n (x:xs) = (n + x) : sumarN n xs

-- 5)

{-
problema sumarElPrimero (s: seq⟨Z⟩) : seq⟨Z⟩ {
    requiere: { |s|> 0 }
    asegura: {|resultado|= |s|∧(∀i : Z)(0 ≤i < |s|→resultado[i] = s[i] + s[0] }
}
-}

sumarElPrimero :: [Integer] -> [Integer]
sumarElPrimero [] = []
sumarElPrimero (x:xs) = sumarN x (x:xs)

-- 6)

{-
problema sumarElUltimo (s: seq⟨Z⟩) : seq⟨Z⟩ {
    requiere: { |s|> 0 }
    asegura: {|resultado|= |s|∧(∀i : Z)(0 ≤i < |s|→resultado[i] = s[i] + s[|s|−1] }
}
-}

sumarElUltimo :: [Integer] -> [Integer]
sumarElUltimo [] = []
sumarElUltimo (x:xs) = sumarN (ultimo (x:xs)) (x:xs)

-- 7)

{-
problema pares (s: seq⟨Z⟩) : seq⟨Z⟩ {
    requiere: { True }
    asegura: {resultado s ́olo tiene los elementos pares de s en el orden dado, respetando las repeticiones.}
}
-}

pares :: [Integer] -> [Integer]
pares [] =  []
pares (x:xs) | mod x 2 == 0 = x : (pares xs)
             | otherwise = pares xs

paresBis :: [Integer] -> [Integer]
paresBis [] =  []
paresBis (x:xs) | even x == True = x : (paresBis xs)
                | otherwise = paresBis xs

paresBis2 :: [Integer] -> [Integer]
paresBis2 [] =  []
paresBis2 (x:xs) = filter even (x:xs)

-- 8)

multiplosDeN :: Integer -> [Integer] -> [Integer]
multiplosDeN _ [] = []
multiplosDeN n (x:xs) | mod x n == 0 = x : multiplosDeN n xs
                      | otherwise = multiplosDeN n xs

-- 9)

ordenar :: [Integer] -> [Integer]
ordenar [] = []
ordenar l = min:(ordenar (quitar min l))
            where min = minimo l

minimo :: [Integer] -> Integer
minimo [x] = x
minimo (x:xs) | x < minimo xs = x
              | otherwise = minimo xs

-- Ejercicio 4

-- 1)

sacarBlancosRepetidos :: [String] -> [String]
sacarBlancosRepetidos [] = []
sacarBlancosRepetidos (x:xs) | x == " " = x : quitarTodos x (sacarBlancosRepetidos xs)
                             | otherwise = x : sacarBlancosRepetidos xs

-- 2)

contarPalabras :: [String] -> Integer 
contarPalabras [] = 0
contarPalabras [x] = 1
contarPalabras (x:xs) | x == " " = 1 + contarPalabras xs
                      | otherwise = contarPalabras xs

-- 3)

-- contarPalabras :: [Char] -> Integer
-- contarPalabras

-- 4)

-- palabraMasLarga :: [Char] -> [Char]
-- palabraMasLarga

-- 5)

aplanar :: [[String]] -> [String]
aplanar [[x]] = [x]
aplanar (x:xs) = x ++ aplanar xs

-- 6)

aplanarConBlancos :: [[String]] -> [String]
aplanarConBlancos [[x]] = [x]
aplanarConBlancos  (x:xs) = x ++ [" "] ++ aplanarConBlancos xs

-- 7)

aplanarConNBlancos :: [[String]] -> Integer -> [String]
aplanarConNBlancos [[x]] _ = [x]
aplanarConNBlancos  (x:xs) n = x ++ nEspacios n ++ aplanarConNBlancos xs n

nEspacios :: Integer -> [String] 
nEspacios 0 = []
nEspacios n = [" "] ++ nEspacios (n-1)

-- Ejercicio 5

-- 1)

nat2bin :: Integer -> [Integer]
nat2bin n | n < 2 = [n]
          | otherwise = nat2bin (div n 2) ++ [mod n 2]

-- 2)

bin2nat :: [Integer] -> Integer
bin2nat [x] = x
bin2nat (x:xs) = x * (2 ^ (longitud (x:xs) -1)) + bin2nat xs

-- 3)

nat2hex :: Integer -> [String]
nat2hex 0 = ["0"]
nat2hex 1 = ["1"]
nat2hex 2 = ["2"]
nat2hex 3 = ["3"]
nat2hex 4 = ["4"]
nat2hex 5 = ["5"]
nat2hex 6 = ["6"]
nat2hex 7 = ["7"]
nat2hex 8 = ["8"]
nat2hex 9 = ["9"]
nat2hex 10 = ["A"]
nat2hex 11 = ["B"]
nat2hex 12 = ["C"]
nat2hex 13 = ["D"]
nat2hex 14 = ["E"]
nat2hex 15 = ["F"]
nat2hex n = nat2hex (div n 16) ++ nat2hex (mod n 16)

-- 4)

-- sumaAcumulada :: (Num t) => [t] -> [t]
-- sumaAcumulada

-- 5)

-- descomponerEnPrimos :: [Integer] -> [[Integer]]
-- descomponerEnPrimos

-- Ejercicio 6

-- 1)

-- agregarATodos :: Integer -> Set (Set Integer) -> Set (Set Intger)
-- agregarATodos n 

-- 2)

agregar :: Integer -> Set Integer -> Set Integer
agregar x a
           | elem x a = a
           | otherwise = x:a

partes :: Integer -> Set (Set Integer)
partes 0 = [[]]
partes n = partesHasta n (partes (n-1)) ++ (partes (n-1))

partesHasta :: Integer -> Set (Set Integer) -> Set (Set Integer)
partesHasta n [] = []
partesHasta n (x:xs) = (agregar n x):(partesHasta n xs)

-- 3)

productoCartesiano :: Set Integer -> Set Integer -> Set (Integer, Integer)
productoCartesiano as [] = []
productoCartesiano [] bs = []
productoCartesiano (a:as) bs = (productoCartesiano as bs) ++ (parOrdenado a bs)

parOrdenado :: Integer -> Set Integer -> Set (Integer, Integer)
parOrdenado a [] = []
parOrdenado a (b:bs) = [(a,b)] ++ parOrdenado a bs
sumatoria :: [Int] -> Int
sumatoria [] = 0
sumatoria (x:xs) = x + sumatoria xs

longitud :: [a] -> Int
longitud [] = 0
longitud (_:xs) = 1 + longitud xs

pertenece :: Int -> [Int] -> Bool
pertenece q [] = False
pertenece q (x:xs) = x == q || pertenece q xs

-- [(-1),(-2)..(-100)]

primerMultiplode45345 :: [Int] -> Int
primerMultiplode45345 (x:xs)
    | x `mod` 45345 == 0 = x
    | otherwise = primerMultiplode45345 xs

productoria :: [Int] -> Int
productoria [] = 1
productoria (x:xs) = x * productoria xs

sumarN :: Int -> [Int] -> [Int]
sumarN n [] = []
sumarN n (x:xs) = x+n : sumarN n xs

sumarElPrimero :: [Int] -> [Int]
sumarElPrimero [] = []
sumarElPrimero l = sumarN (head l) l

-- Esto es lo mismo que la función que ya viene con Haskell "last".
ultimo :: [Int] -> Int
ultimo [x] = x
ultimo (x:xs) = ultimo xs

sumarElUltimo :: [Int] -> [Int]
sumarElUltimo [] = []
sumarElUltimo l = sumarN (ultimo l) l

pares :: [Int] -> [Int]
pares [] = []
pares (x:xs) | x `mod` 2 == 0 = x : pares xs
             | otherwise = pares xs

quitar :: Int -> [Int] -> [Int]
quitar _ [] = []
quitar n (x:xs) | n == x = xs
                | otherwise = x : quitar n xs

quitarTodas :: Int -> [Int] -> [Int]
quitarTodas _ [] = []
quitarTodas n (x:xs)
    | n == x = quitarTodas n xs
    | otherwise = x : quitarTodas n xs

hayRepetidos :: [Int] -> Bool
hayRepetidos [] = False
hayRepetidos (x:xs) = buscar x xs || hayRepetidos xs

buscar :: Int -> [Int] -> Bool
buscar _ [] = False
buscar n (x:xs) = n == x || buscar n xs

eliminarRepetidosAlFinal :: [Int] -> [Int]
eliminarRepetidosAlFinal [] = []
eliminarRepetidosAlFinal (x:xs) = x : eliminarRepetidosAlFinal (quitarTodas x xs)

eliminarRepetidosAlInicio :: [Int] -> [Int]
eliminarRepetidosAlInicio [] = []
eliminarRepetidosAlInicio (x:xs)
    | buscar x xs = eliminarRepetidosAlInicio xs
    | otherwise = x : eliminarRepetidosAlInicio xs

maximo :: [Int] -> Int
maximo [x] = x
maximo (x:xs)
    | x >= maximo xs = x
    | otherwise = maximo xs

minimo :: [Int] -> Int
minimo [x] = x
minimo (x:xs)
    | x <= minimo xs = x
    | otherwise = minimo xs

-- Super ineficiente pero funciona...
ordenar :: [Int] -> [Int]
ordenar [] = []
ordenar l = minimo l : ordenar (quitar (minimo l) l)

reverso :: [Int] -> [Int]
reverso [] = []
reverso l = reverso (tail l) ++ [head l]

concatenar :: [Int] -> [Int] -> [Int]
concatenar [] l2 = l2
concatenar (x:xs) l2 = x : concatenar xs l2

zipi :: [a] -> [b] -> [(a,b)]
zipi [] _ = []
zipi _ [] = []
zipi (x:xs) (y:ys) = (x,y) : zipi xs ys

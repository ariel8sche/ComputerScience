-- Escribir una expresión que denote la lista estrictamente decreciente de enteros que comienza con el n ́umero 1 y termina con el número -100.
-- [1,0..(-100)]

-- Escribir una expresión que denote la lista estrictamente creciente de enteros entre −20 y 20 que son congruentes a 1 módulo 4.
-- [(-19),(-15)..20]

sumatoria :: [Int] -> Int
sumatoria xs
            | xs == [] = 0
            | otherwise = head xs + sumatoria (tail xs)

longitud :: (Eq a) => [a] -> Int
longitud xs
           | xs == [] = 0
           | otherwise = 1 + longitud (tail xs)

pertenece :: Int -> [Int] -> Bool
pertenece x xs
              | xs == [] = False
              | head xs == x = True
              | otherwise = pertenece x (tail xs)

sumatoriaPM :: [Int] -> Int
sumatoriaPM [] = 0
sumatoriaPM ( x : xs ) = sumatoriaPM xs + x

--sumatoriaPM [1,2,3] = sumatoriaPM 1:2:3:[] = sumatoriaPM 2:3:[] + 1 = sumatoriaPM 3:[] + 2 + 1 = sumatoriaPM [] + 3 + 2 + 1 = 0 + 3 + 2 + 1 = 6
--1:[2,3] = 1:2:[3] = 1:2:3:[]

longitudPM :: [a] -> Int
longitudPM [] = 0
longitudPM ( _ : xs ) = 1 + longitudPM xs

pertenecePM :: Int -> [Int] -> Bool
pertenecePM _ [] = False
pertenecePM y ( x : xs ) =  (y == x) || (pertenecePM y xs)

productoria :: [Int] -> Int
productoria xs
              | xs == [] = 1
              | otherwise = head xs * productoria (tail xs)

productoriaPM :: [Int] -> Int
productoriaPM [] = 1
productoriaPM ( x : xs ) = productoriaPM xs * x

sumarN :: Int -> [Int] -> [Int]
sumarN n xs
           | tail xs == [] = (head xs + n) : []
           | otherwise = (head xs + n) : sumarN n (tail xs)

sumarElPrimero :: [Int] -> [Int]
sumarElPrimero xs = sumarN (head xs) xs

sumarElUltimo :: [Int] -> [Int]
sumarElUltimo xs = sumarN (obtenerElUltimo xs) xs

obtenerElUltimo :: [Int] -> Int
obtenerElUltimo xs 
                  | tail xs == [] = head xs
                  | otherwise = obtenerElUltimo (tail xs)

pares :: [Int] -> [Int]
pares xs
        | xs == [] = []
        | mod (head xs) 2 == 0 = head xs : pares (tail xs)
        | otherwise = pares (tail xs)

multiplosDeN :: Int -> [Int] -> [Int]
multiplosDeN n xs
                 | xs == [] = []
                 | mod (head xs) n == 0 = head xs : multiplosDeN n (tail xs)
                 | otherwise = multiplosDeN n (tail xs)

reverso :: [Int] -> [Int]
reverso xs
          | tail xs == [] = head xs : []
          | otherwise = reverso (tail xs) ++ head xs : []

reversoPM :: [Int] -> [Int]
reversoPM [] = []
reversoPM ( x : xs ) = (reverso xs) ++ [x]

maximoPM :: [Int] -> Int
maximoPM ( x : [] ) = x
maximoPM ( x : xs ) = maximoAux x (maximoPM xs)

maximoAux :: Int -> Int -> Int
maximoAux x y
             | x >= y = x
             | otherwise = y

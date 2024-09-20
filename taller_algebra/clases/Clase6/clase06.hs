sumatoria :: [Int] -> Int
sumatoria l | l == [] = 0
            | otherwise = sumatoria(tail l) + head l

longitud :: [Int] -> Int
longitud l | l == [] = 0
           | otherwise = longitud(tail l) + 1

pertenece :: Int -> [Int] -> Bool
pertenece x l | l == [] = False
              | otherwise = (x == head l) || (pertenece x (tail l))

primerMultiplode45345 :: [Int] -> Int
primerMultiplode45345 l | mod (head l) 45345 == 0 = (head l)
                        | otherwise = primerMultiplode45345 (tail l)

productoria :: [Int] -> Int
productoria l | l == [] = 1
              | otherwise = productoria (tail l) * (head l) 

sumatoriaPM :: [Int] -> Int
sumatoriaPM [] = 0
sumatoriaPM (x: xs ) = sumatoriaPM xs + x

longitudPM :: [a] -> Int
longitudPM [] = 0
longitudPM (_: xs ) = 1 + longitudPM xs

sumarN :: Int -> [Int] -> [Int]
sumarN n [] = []
sumarN n (x:xs) = n+x : sumarN n xs

sumarElPrimero :: [Int] -> [Int]
sumarElPrimero l | l == [] = []
                 | otherwise = sumarN (head l) l

sumarElPrimeroPM :: [Int] -> [Int]
sumarElPrimeroPM [] = []
sumarElPrimeroPM (x:xs) = sumarN (x) (x:xs)

ultimo :: [Int] -> Int
ultimo [] = 0  
ultimo [x] = x
ultimo l = last l 

sumarElUltimo :: [Int] -> [Int]
sumarElUltimo [] = []
sumarElUltimo l = sumarN (ultimo l) l

pares :: [Int] -> [Int]
pares [] = []
pares (x:xs) | x `mod` 2 == 0 = x : pares xs
             | otherwise = pares xs  


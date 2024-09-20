import GHC.RTS.Flags (MiscFlags(machineReadable))
import GHC.Natural (signumNatural)
import Distribution.Simple.LocalBuildInfo (prefixRelativeComponentInstallDirs)
f :: (Integer, Integer, Integer) -> Integer
f (i,j,k) | mod i 3 == 0 = div i 3
          | otherwise = (j ^ 2) + k

f2 :: Integer -> Integer
f2 1 = 0
f2 n = f2 (n-1) + (n-1)^2

maximos :: [Integer] -> [Integer] -> [Integer]
maximos [] [] = []
maximos (x:xs) (y:ys) | x >= y = x: maximos xs ys
                      | otherwise = y:maximos xs ys

sumaImpares :: [Integer] -> Integer
sumaImpares [] = 0
sumaImpares [x] | odd x = x
                | otherwise = 0
sumaImpares [x,y] | odd x = x
                | otherwise = 0
sumaImpares (x:y:xs) | odd x = x + sumaImpares xs
                       | otherwise = sumaImpares xs

pertenece :: Integer -> [Integer] -> Bool
pertenece n [] = False
pertenece n (x:xs) | n == x = True
                   | otherwise = pertenece n xs

buscarPosicion :: Integer -> [Integer] -> Integer
buscarPosicion n [] = 0
buscarPosicion n (x:xs) | not (pertenece n (x:xs)) = 0
                        | n == x = 1
                        | otherwise = buscarPosicion n xs + 1

prodBase :: Integer -> Integer
prodBase 1 = 3
prodBase n = (n^2 + 2*n) * prodBase (n-1)

prod :: Integer -> Integer
prod n = prodBase (2*n)

menorDivisorDesde :: Integer -> Integer -> Integer
menorDivisorDesde n k | mod n k == 0 = k
                      | otherwise = menorDivisorDesde n (k+1)

menorDivisor :: Integer -> Integer
menorDivisor 1 = 1 
menorDivisor n = menorDivisorDesde n 2

esPrimo :: Integer -> Bool
esPrimo 1 = False
esPrimo n = menorDivisor n == n 

zipPrimos :: [Integer] -> [Integer] -> [(Integer, Integer)]
zipPrimos [] [] = []
zipPrimos (x:xs) (y:ys) | esPrimo x && esPrimo y = (x,y):zipPrimos xs ys
                        | otherwise = zipPrimos xs ys
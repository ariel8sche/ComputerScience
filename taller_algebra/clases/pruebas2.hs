import Data.List

sumaCuadradosR :: Integer -> Integer
sumaCuadradosR n | n == 0 = 0
                 | n == 1 = 1
                 | otherwise = n ^ 2 + sumaCuadradosR(n-1)

ejercicio2 0 = 0
ejercicio2 n = n * (n+1) * (2 * n + 1 ) / 6


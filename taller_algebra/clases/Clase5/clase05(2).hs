{-
sumaDivisoresHasta :: Int -> Int -> Int
sumaDivisoresHasta x 1 = 1
sumaDivisoresHasta x y | mod x y == 0 + y sumaDivisoresHasa x (y-1) 
                       | otherwise = sumaDivisoresHasta x (y-1)
                       
sumaDivisores :: Int -> Int -> Int
sumaDivisores n = sumaDivisoresHasta n n
-}

menorDivisorDesde :: Int -> Int -> Int
menorDivisorDesde n k | mod n k == 0 = k
                      | otherwise = menorDivisorDesde n (k+1)
menorDivisor :: Int -> Int
menorDivisor 1 = 1 
menorDivisor n = menorDivisorDesde n 2

esPrimo :: Int -> Bool
esPrimo 1 = False
esPrimo n = menorDivisor n == n 

siguientePrimo :: Int -> Int
siguientePrimo n | esPrimo(n+1) == True = (n+1)
                 | otherwise = siguientePrimo (n+1)

nEsimoPrimo :: Int -> Int
nEsimoPrimo 1 = 2
nEsimoPrimo n = siguientePrimo (nEsimoPrimo (n-1)) 

factorial :: Int -> Int
factorial 1 = 1
factorial n = n * factorial (n-1)

menorFactDesde :: Int -> Int
menorFactDesde n = menorFactDD n 1

menorFactDD :: Int -> Int -> Int
menorFactDD n k | factorial k >= n = factorial k
                | otherwise = menorFactDD n (k+1)

mayorFactHasta :: Int -> Int
mayorFactHasta n = mayorFactHH n 1

mayorFactHH :: Int -> Int -> Int
mayorFactHH n k | factorial k > n = factorial (k-1)
                | otherwise = mayorFactHH n (k+1)

esFact :: Int -> Bool
esFact n = esFactAux n 1

esFactAux :: Int -> Int -> Bool
esFactAux n k | factorial k == n = True
              | factorial k > n = False
              | otherwise = esFactAux n (k+1) 


sDH :: Int -> Int -> Int
sDH n 1  = 1
sDH n k | mod n k == 0 = k + sDH n (k-1)
        | otherwise = sDH n (k-1)
              
sD :: Int -> Int 
sD n = sDH n n

mDH :: Int -> Int -> Int
mDH n k | mod n k == 0 = k
                | otherwise = mDH n (k+1)
                
mDivisor :: Int -> Int
mDivisor n = mDH n 2

esPrimo :: Int -> Bool
esPrimo n | sD n == (n+1) = True
                   | otherwise = False

{-
esPrimo2 :: Int -> Bool
esPrimo2 n | mDivisor n == n = True
                     | otherwise = False
-}

proxPrimo :: Int -> Int
proxPrimo n | esPrimo (n+1) = (n+1)
                       | otherwise = proxPrimo (n+1)  
                       
nEsimoPrimo :: Int -> Int
nEsimoPrimo n | n == 1 = 2
                            | otherwise = proxPrimo (nEsimoPrimo (n-1))
                            
factorial :: Int -> Int
factorial n | n == 0 = 1
                   | otherwise = n * factorial(n-1)

auxMenorFactDesde :: Int -> Int -> Int
auxMenorFactDesde n k | factorial (k) > n = factorial k
                                            | otherwise = auxMenorFactDesde n (k+1) 
menorFactDesde :: Int -> Int
menorFactDesde n = auxMenorFactDesde n 1

auxMayorFactHasta :: Int -> Int -> Int
auxMayorFactHasta n k | factorial (k) > n = factorial (k-1)
                                           | otherwise = auxMayorFactHasta n (k+1) 
                                           
mayorFactHasta :: Int -> Int
mayorFactHasta n = auxMayorFactHasta n 1

{-esFact :: Int -> Bool
esFact n-} 

fibonacci :: Int -> Int
fibonacci 0 = 0
fibonacci 1 = 1
fibonacci n = fibonacci (n-2) + fibonacci (n-1)

sumatoria :: Int -> Int
sumatoria 0 = 0
sumatoria n = fibonacci n + fibonacci (n-1)

esFibonacciDesde :: Int -> Int -> Bool
esFibonacciDesde n i
        | n == fibonacci i = True
        | n < fibonacci i = False
        | otherwise = esFibonacciDesde n (i+1)

esFibonacci :: Int -> Bool
esFibonacci n = esFibonacciDesde n 0

sucesionLotharCollatz :: Int -> Int
sucesionLotharCollatz an
        | an `mod` 2 == 0 = an `div` 2
        | an `mod` 2 == 1 = 3 * an + 1
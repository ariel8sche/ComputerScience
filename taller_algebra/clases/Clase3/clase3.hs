suma x y = x + y

factorial :: Int -> Int 
factorial n | n == 0 = 1
            | n > 0 = n * factorial (n-1)  
{-
"Otherwise cepta numeros negativos"            
factorial :: Int -> Int 
factorial n | n == 0 = 1
            | otherwise = n * factorial (n-1)
-}

{-
"Otra forma de hacer factorial"
factorial :: Int -> Int 
factorial 0 = 1
factorial n = n * factorial (n-1)
-}

{-
esPar :: Int -> Bool
esPar n | n == 0 True
        | otherwise = esPar (n-2)
-}

esPar :: Int -> Bool
esPar n | n == 0 = True
        | n == 1 = False
        | otherwise = esPar (n-2)
     
{-     
"Otra forma, con pattern"      
esPar :: Int -> Bool
esPar 0 = True
esPar n = not(esPar(n-1))
-}

fib :: Int -> Int 
fib n | n == 0 = 0
      | n == 1 = 1
      |otherwise = fib(n-1) + fib(n-2)
      
parteEntera :: Float -> Integer
parteEntera n | (-1) < n && n < 1 = 0  
              | n >= n-1 && n < n+1 = 1 + parteEntera(n-1)
              
multiplo3 :: Int -> Bool
multiplo3 n | n == 0 = True
            | n == 1 = False
            | n == 2 = False
            | otherwise = multiplo3(n-3)

sumaImpares :: Int -> Int
sumaImpares n | n == 1 = 1
              | otherwise = ((n*2)-1) + (sumaImpares(n-1))
              
medioFact :: Int -> Int
medioFact n | n == 0 = 1
            | n == 1 = 1
            | otherwise = n * (medioFact(n-2))
            
sumaDig :: Int -> Int
sumaDIg n | 

digIguales :: Int -> Bool
digIguales n | n < 10 = True
             | otherwise = digIguales(div n 10) && mod n 10 == mod (div n 10) 10

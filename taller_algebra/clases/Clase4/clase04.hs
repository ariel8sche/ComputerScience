sumatoria :: Int -> Int
sumatoria n | n == 0 = 0
            | otherwise = n + sumatoria(n - 1) 

f1 :: Int -> Int 
f1 n | n == 0 = 1
     | otherwise = (2 ^ n) + f1 (n - 1) 

f2 :: Int -> Float -> Float
f2 0 q = 0
f2 n q = (q ^ n) + f2 (n-1) q

f3 :: Int -> Float -> Float
f3 0 q = 0
f3 n q = (q ^ (2 * n)) + f2 ((2 * n)-1) q

f4 :: Int -> Float -> Float
f4 n q = (q ^ (2 * n)) + (q ^ ((2 * n)-1)) - (q ^ (n-1)) + f4 (n-1) q 

factorial :: Int -> Int
factorial n | n == 0 = 1
             | otherwise = n * factorial(n-1)

eAprox :: Int -> Float
eAprox n | n == 0 = 1
         | otherwise = 1 / fromIntegral(factorial(n)) + eAprox(n-1)

e :: Float
e = eAprox 10

f5 :: Int -> Int -> Int
f5 0 m = 0
f5 n m = round(f2 m (fromIntegral n)) + f5 (n-1) m

sumaPotencias :: Float -> Int -> Int -> Float
sumaPotencias q n 0 = 0
sumaPotencias q n m = sumaPotencias q n (m-1) + ((q ^ m) * f2 n q)  

sumaRacionales :: Int -> Int -> Float
sumaRacionales n 0 = 0 
sumaRacionales n m = sumaRacionales n (m-1) + fromIntegral(sumatoria n) / fromIntegral(m)
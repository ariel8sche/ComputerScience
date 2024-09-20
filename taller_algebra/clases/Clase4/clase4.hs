sumatoria :: Int -> Int 
sumatoria n | n == 1 = 1
                       | n >  0 = n + sumatoria (n-1)

f1 :: Int -> Int
f1 n | n == 0 = 1
     | otherwise = 2^n + f1 (n-1)

f2 :: Int -> Float -> Float
f2 n q | n == 1 = q
       | otherwise = q^n + f2 (n-1) q

f3 :: Int -> Float -> Float
f3 n q | n == 0 = 1
       | otherwise = q^(2*n) + f2 (2*n-1) q

factorial :: Int -> Int
factorial n | n == 0 = 1
            | otherwise = n * factorial(n-1)
{-
eAprox :: Int -> Float
eAprox n | n == 0 = 1
         | otherwise = 1 / fromIntegral(factorial(n)) + eAprox (n-1)

e :: Float
e = eAprox 10 
-}
eAprox :: Int -> Float
eAprox 0 = 1
eAprox n = 1 / fromIntegral(factorial n) + eAprox (n-1)

e :: Float
e = eAprox 10

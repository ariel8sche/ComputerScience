type Set a = [a]

-- digitos 1537 10 = [7,3,5,1]
-- digitos 29 2 = [1,0,1,1,1]
-- digitos 1024 16 = [0,0,4]
-- digitos 255 16 = [15,15]

digitos :: Integer -> Integer -> [Integer]
digitos 0 _ = []
digitos n b = (n `mod` b) : digitos (n `div` b) b

numero :: [Integer] -> Integer -> Integer
numero [] _ = 0
numero (d:ds) b = d + b * numero ds b

divisores :: Int -> Set Int
divisores n = divisoresDesde (abs n) 1

divisoresDesde :: Int -> Int -> Set Int
divisoresDesde n d
    | d == n = [d]
    | n `mod` d == 0 = d : divisoresDesde n (d+1)
    | otherwise = divisoresDesde n (d+1)

interseccion :: Set Int -> Set Int -> Set Int
interseccion [] ys = []
interseccion (x:xs) ys
    | x `elem` ys = x : interseccion xs ys
    | otherwise = interseccion xs ys

maximo :: Set Int -> Int
maximo [x] = x
maximo (x:xs)
    | x >= maximo xs = x
    | otherwise = maximo xs

mcdDef :: Int -> Int -> Int
mcdDef a 0 = abs a
mcdDef 0 b = abs b
mcdDef a b = maximo (interseccion (divisores a) (divisores b))

mcd :: Int -> Int -> Int
mcd a 0 = abs a
mcd a b = mcd b (a `mod` b)

mcm :: Int -> Int -> Int
mcm a b = abs (a * b) `div` mcd a b

emcd :: Int -> Int -> (Int, Int, Int)
emcd a 0 = (abs a, 1, 0)
emcd a b = (d, t', s' - a `div` b * t')
    where (d, s', t') = emcd b (a `mod` b)

-- Funciona pero no te puedo explicar la teoría.
stmin :: Int -> Int -> (Int, Int)
stmin a b = (s `mod` b, t + s `div` b * a)
    where (_, s, t) = emcd a b

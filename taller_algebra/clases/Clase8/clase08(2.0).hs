type Set a = [a]

fact :: Int -> Int
fact 0 = 1
fact n = n * fact (n-1)

combinatorio :: Int -> Int -> Int
combinatorio n 0 = 1
combinatorio n k | n == k = 1
                | otherwise = combinatorio (n-1) k + combinatorio (n-1) (k-1)

vacio :: Set a
vacio = []

agregar :: Eq a => a -> Set a -> Set a
agregar n c
    | n `elem` c = c
    | otherwise = n:c

union :: Eq a => Set a -> Set a -> Set a
union [] ys = ys
union (x:xs) ys = union xs (agregar x ys)

variaciones :: Set Int -> Int -> Set [Int]
variaciones c 0 = [[]]
variaciones c k = agregarElementosAListas c (variaciones c (k-1))

agregarElementosAListas :: Set Int -> Set [Int] -> Set [Int]
agregarElementosAListas [] _ = []
agregarElementosAListas (x:xs) c = (agregarElementoAdelante x c) `union` (agregarElementosAListas xs c)

agregarElementoAdelante :: Int -> Set [Int] -> Set [Int]
agregarElementoAdelante x [] = []
agregarElementoAdelante x (ys:yss) = agregar (x:ys) (agregarElementoAdelante x yss)

insertarEn :: [a] -> a -> Int -> [a]
insertarEn xs n i
    | i == 1 = n:xs
    | otherwise = (head xs) : (insertarEn (tail xs) n (i-1))

insertarEnCadaPos :: Eq a => [a] -> a -> Int -> Set [a]
insertarEnCadaPos xs c 1 = agregar (insertarEn xs c 1) vacio
insertarEnCadaPos xs c i = agregar (insertarEn xs c i) (insertarEnCadaPos xs c (i-1))

insertarEnCadaPosDeTodasLasListas :: Eq a => Set [a] -> a -> Set [a]
insertarEnCadaPosDeTodasLasListas [] c = []
insertarEnCadaPosDeTodasLasListas (xs:xss) c = (insertarEnCadaPos xs c (length xs + 1)) `union` (insertarEnCadaPosDeTodasLasListas xss c)

permutaciones :: Eq a => Set a -> Set [a]
permutaciones [] = [[]]
permutaciones (c:cs) = insertarEnCadaPosDeTodasLasListas (permutaciones cs) c

bolitasEnCajas :: Int -> Int -> Set [Int]
bolitasEnCajas b c = variaciones [1..c] b

pertenece :: Eq a => a -> Set a -> Bool
pertenece _ [] = False
pertenece x (c:cs) = x == c || pertenece x cs

diferencia :: Eq a => Set a -> Set a -> Set a
diferencia [] ys = []
diferencia (x:xs) ys
    | not (x `elem` ys) = x : diferencia xs ys
    | otherwise = diferencia xs ys

-- Es ineficiente porque calcula todo, ver otra forma mejor.
bolitasEnCajas2 :: Int -> Int -> Set [Int]
bolitasEnCajas2 b 0 = []
bolitasEnCajas2 b c = variaciones [1..c] b `diferencia` variaciones [2..c] b

listasOrdenadas :: Int -> Int -> Set [Int]
listasOrdenadas n 1 = variaciones [1..n] 1
listasOrdenadas n k = agregarElementosAListas2 [1..n] (listasOrdenadas n (k-1))

agregarElementosAListas2 :: Set Int -> Set [Int] -> Set [Int]
agregarElementosAListas2 [] _ = []
agregarElementosAListas2 (x:xs) c = (agregarElementoAdelante2 x c) `union` (agregarElementosAListas2 xs c)

agregarElementoAdelante2 :: Int -> Set [Int] -> Set [Int]
agregarElementoAdelante2 x [] = []
agregarElementoAdelante2 x (ys:yss)
    | x < head ys = agregar (x:ys) (agregarElementoAdelante2 x yss)
    | otherwise = agregarElementoAdelante2 x yss

ab :: Int -> Int -> Set String
ab n m = permutaciones ((armarString 'a' n) ++ (armarString 'b' m))

abc :: Int -> Int -> Int -> Set String
abc n m k = permutaciones ((armarString 'a' n) ++ (armarString 'b' m) ++ (armarString 'c' k))

armarString :: Char -> Int -> String
armarString _ 0 = ""
armarString c n = c : armarString c (n-1)

subconjuntos :: Set Int -> Int -> Set (Set Int)
subconjuntos _ 0 = [[]]
subconjuntos [] _ = []
subconjuntos (x:xs) k = (agregarElementoAdelante x (subconjuntos xs (k-1))) `union` (subconjuntos xs k)

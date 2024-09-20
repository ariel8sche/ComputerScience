factorial :: Integer -> Integer
factorial 0 = 1
factorial n = n * factorial (n-1)

combinatorio :: Integer -> Integer -> Integer
combinatorio n k  = (factorial n) `div` ((factorial k) * (factorial (n-k)))

--Otra forma de la expresion combinatoria

combinatorioP :: Int -> Int -> Int
combinatorioP n 0 = 1
combinatorioP n k | n == k = 1
                  | otherwise = (combinatorioP (n-1) k) + (combinatorioP (n-1) (k-1))

type Set a = [a]

vacio :: Set a
vacio = []

agregar :: Eq a => a -> Set a -> Set a
agregar n c | n `elem` c = c
            | otherwise = n:c

union :: Eq a => Set a -> Set a -> Set a
union [] ys     = ys
union (x:xs) ys = union xs (agregar x ys)

agregarElementossAListas :: Set Int -> Set [Int] -> Set [Int]
agregarElementosAListas (x:xs) c = agregarElementoAdelante x c 

-- agregarElementoAdelante 4 {[4],[7]} ----> {[4,4],[4,7]}
-- agregarElementosAListas {4,7} {[4],[7]} ----> {[4,4],[4,7],[7,4],[7,7]}
variaciones :: Set Int -> Int -> Set [Int]
variaciones c 0 = [[]]
variaciones c k = agregarElementosAListas c (variaciones c (k-1))

-- variaciones [4,7] 1 ----> {[4],[7]}
-- variaciones [4,7] 2 ----> {[4,4],[4,7],[7,4],[7,7]} 
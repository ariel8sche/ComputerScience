{-
vacio :: [Int]
vacio = []

pertenece :: Int -> [Int] -> Bool
pertenece x l | l == [] = False
              | otherwise = (x == head l) || (pertenece x (tail l))

agregar :: Int -> [Int] -> [Int]
agregar x c | pertenece x c = c
            | otherwise = x:c
-}

--Reescribo las funciones anteriores usando el renombre para los tipo conjunto

type Set a = [a]

vacio :: Set Int
vacio = []

pertenece :: Int -> Set Int -> Bool
pertenece x l | l == [] = False
              | otherwise = (x == head l) || (pertenece x (tail l))

agregar :: Int -> Set Int -> Set Int
agregar x c | pertenece x c = c
            | otherwise = x:c

incluido :: Set Int -> Set Int -> Bool
incluido [] c = True
incluido (x:xs) c = pertenece x c && incluido xs c

iguales :: Set Int -> Set Int -> Bool
iguales c1 c2 = incluido c1 c2 && incluido c2 c1

union :: Set Int -> Set Int -> Set Int
union [] ys = ys
union (x:xs) ys = union xs (agregar x ys)

perteneceC :: Set Int -> Set (Set Int) -> Bool
perteneceC xs [] = False
perteneceC xs (ys:yss) = iguales xs ys || perteneceC xs yss

agregarC :: Set Int -> Set (Set Int) -> Set (Set Int)
agregarC xs xss | perteneceC xs xss = xss
                | otherwise = xs:xss

unionC :: Set (Set Int) -> Set (Set Int) -> Set (Set Int)
unionC [] ys = ys
unionC (x:xs) ys = unionC xs (agregarC x ys)

agregarATodos :: Int -> Set (Set Int) -> Set (Set Int) 
agregarATodos x [] = []
agregarATodos x (c:cs) = agregarC (agregar x c) (agregarATodos x cs)

partes :: Set Int -> Set (Set Int)
partes [] = [[]]
partes (x:xs) = unionC (partes xs) (agregarATodos x (partes xs))





















{-            
incluido :: Set Int -> Set Int -> Bool
incluido n m | n == vacio = True
             | elem (head n) m = incluido (tail n) m
             | otherwise = False

iguales :: Set Int -> Set Int -> Bool
iguales n m | incluido n m && incluido m n = True
            | otherwise = False        
             
perteneceC :: Set Int -> Set (Set Int) -> Bool
perteneceC e [] = False
perteneceC e (c:cs) = iguales e c || perteneceC e cs

agregarC :: Set Int -> Set (Set Int) -> Set (Set Int)
agregarC e c | perteneceC e c = c
             | otherwise     = e:c


union :: Set (Set Int) -> Set (Set Int) -> Set (Set Int)
union n [] = n
union n (y:ys) = agregarC ()


agregarATodos :: Int -> Set (Set Int) -> Set (Set Int) 
agregarATodos n [] = []
agregarAtodos n (x:xs) = agregarC (agregar n x) (agregarATodos n xs)


partes :: Int -> Set (Set Int)
partes 0 = [[]]
partes n = union (partes n-1) (agregarATodos n (partes (n-1)))


unionT :: Set (Int,Int) -> Set (Int,Int) -> Set (Int,Int)
unionT [] c2 = c2
unionT (c:cs) c2 | elem c c2 = unionT cs c2
                 | otherwise = c (unionT cs c2)

combConTodos :: Int -> Set Int -> Set (Int,Int)
combConTodos n [] = []
combConTodos n (x:xs) = (n,x) : combConTodos n xs


productoCartesiano :: Set Int -> Set Int -> Set (Set Int)
productoCartesiano [] d = []
productoCartesiano (c:cs) d = unionT (combConTodos c d) (productoCartesiano cs d)
-}
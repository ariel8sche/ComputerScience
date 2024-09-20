type Set a = [a]

vacio :: Set Int
vacio = []

pertenece :: Int -> Set Int -> Bool
pertenece _ [] = False
pertenece x (c:cs) = x == c || pertenece x cs

agregar :: Int -> Set Int -> Set Int
agregar x ys
    | pertenece x ys = ys
    | otherwise = x : ys

incluido :: Set Int -> Set Int -> Bool
incluido [] ys = True
incluido (x:xs) ys = pertenece x ys && incluido xs ys

iguales :: Set Int -> Set Int -> Bool
iguales xs ys = incluido xs ys && incluido ys xs

union :: Set Int -> Set Int -> Set Int
union [] ys = ys
union (x:xs) ys = union xs (agregar x ys)

interseccion :: Set Int -> Set Int -> Set Int
interseccion [] ys = []
interseccion (x:xs) ys
    | pertenece x ys = x : interseccion xs ys
    | otherwise = interseccion xs ys

diferencia :: Set Int -> Set Int -> Set Int
diferencia [] ys = []
diferencia (x:xs) ys
    | not (pertenece x ys) = x : diferencia xs ys
    | otherwise = diferencia xs ys

diferenciaSimetrica :: Set Int -> Set Int -> Set Int
diferenciaSimetrica x y = union (diferencia x y) (diferencia y x)

perteneceC :: Set Int -> Set (Set Int) -> Bool
perteneceC _ [] = False
perteneceC x (y:ys) = iguales x y || perteneceC x ys

agregarC :: Set Int -> Set (Set Int) -> Set (Set Int)
agregarC x ys
    | perteneceC x ys = ys
    | otherwise = x : ys

unionC :: Set (Set Int) -> Set (Set Int) -> Set (Set Int)
unionC [] ys = ys
unionC (x:xs) ys = unionC xs (agregarC x ys)

agregarATodos :: Int -> Set (Set Int) -> Set (Set Int)
agregarATodos _ [] = []
agregarATodos x (y:ys) = agregarC (agregar x y) (agregarATodos x ys)

partes :: Set Int -> Set (Set Int)
partes [] = [[]]
partes (x:xs) = unionC (partes xs) (agregarATodos x (partes xs))

partesN :: Int -> Set (Set Int)
partesN n = partes [1..n]

productoCartesiano :: Set Int -> Set Int -> Set (Int, Int)
productoCartesiano [] _ = []
productoCartesiano (x:xs) ys = armarTuplas x ys ++ productoCartesiano xs ys

armarTuplas :: Int -> Set Int -> Set (Int, Int)
armarTuplas x [] = []
armarTuplas x (y:ys) = [(x,y)] ++ armarTuplas x ys

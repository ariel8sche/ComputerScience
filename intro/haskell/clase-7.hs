type Set a = [a]

vacio :: Set Int
vacio = []

agregar :: Int -> Set Int -> Set Int
agregar x a
           | elem x a = a
           | otherwise = x:a

incluido :: Set Int -> Set Int -> Bool
incluido a b
            | a == [] = True
            | elem (head a) b = incluido (tail a) b
            | otherwise = False

{-
incluido :: Set Int -> Set Int -> Bool
incluido (a:as) b
            | as == [] = True
            | elem a b = incluido as b
            | otherwise = False
-}

iguales :: Set Int -> Set Int -> Bool
iguales a b = (incluido a b) && (incluido b a)

partes :: Int -> Set (Set Int)
partes 0 = [[]]
partes n = partesHasta n (partes (n-1)) ++ (partes (n-1))

partesHasta :: Int -> Set (Set Int) -> Set (Set Int)
partesHasta n [] = []
partesHasta n (cs:css) = (agregar n cs):(partesHasta n css)

productoCartesiano :: Set Int -> Set Int -> Set (Int, Int)
productoCartesiano as [] = []
productoCartesiano [] bs = []
productoCartesiano (a:as) bs = (productoCartesiano as bs) ++ (parOrdenado a bs)

parOrdenado :: Int -> Set Int -> Set (Int, Int)
parOrdenado a [] = []
parOrdenado a (b:bs) = [(a,b)] ++ parOrdenado a bs

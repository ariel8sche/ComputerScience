estanRelacionados :: Float -> Float -> Bool
estanRelacionados x1 x2
    | x1 <= 3 && x2 <= 3 = True
    | (3 < x1 && x1 <= 7) && (3 < x2 && x2 <= 7) = True
    | 7 < x1 && 7 < x2 = True
    | otherwise = False

prodInt :: (Float, Float) -> (Float, Float) -> Float
prodInt (x1, y1) (x2, y2) = x1 * x2 + y1 * y2

todoMenor :: (Float, Float) -> (Float, Float) -> Bool
todoMenor (x1, y1) (x2, y2) = x1 < x2 && y1 < y2

distanciaPuntos :: (Float, Float) -> (Float, Float) -> Float
distanciaPuntos (x1, y1) (x2, y2) = sqrt((x2 - x1)^2 + (y2 - y1)^2)

sumaTerna :: (Int, Int, Int) -> Int
sumaTerna (a, b, c) = a + b + c

-- |Las posiciones arrancan en 1.
posicPrimerPar :: (Int, Int, Int) -> Int
posicPrimerPar (a, b, c)
    | even a = 1
    | even b = 2
    | even c = 3
    | otherwise = 4

crearPar :: a -> b -> (a, b)
crearPar a b = (a, b)

invertir :: (a, b) -> (b, a)
invertir (a, b) = (b, a)

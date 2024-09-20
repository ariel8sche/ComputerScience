--CLASE 1

-- "*" para multiplicar dos o mas variables entre si o con un entero

{-
f x y = x * x + y * y
-}

g x y z = x + y + z * z 

doble x = 2 * x 

{-
suma x y = x + y
-}

-- "sqrt" es para usar la raiz cuadrada

normaVectorial x1 x2 = sqrt (x1**2 + x2**2) 

funcionConstante8 x = 8

-- "==" es para indicar igualdad, y "=/" es para indicar diferencia

{-
f n | n == 0 = 1
    | n /= 0 = 0
-}
    
f n | n == 0 = 1
    | otherwise = 0
    
{-signo n | n > 0 = 1
        | n == 0 = 0
        | n < 0 = -1-} 
        
signo n | n > 0 = 1
        | n == 0 = 0
        | otherwise = -1
        
maximo x y | x >= y = x
           | otherwise = y
           
{-f4 n |n >= 3 = 5
     |n <= 9 = 7
     
f5 n |n <= 9 = 7
     |n >= 3 = 5-}


valorAbsoluto n | n > 1 = n
                | n < 1 = n * (-1) 

maximoAbsoluto x y | x > 0 && y < x = x
                   | x > 0 && y > x = y * (-1)
                   | x < 0 && y > x = y
                   | x < 0 && y < x = x * (-1)

maximo3 :: Integer -> Integer -> Integer -> Integer
maximo3  x y z| x >= y && x >= z = x
              | y >= z = y
              | otherwise = z

{-
algunoEs0 :: Float -> Float -> Bool			  
algunoEs0 x	y | x >= 0 && x <= 0 = True
			  | y >= 0 && y <= 0 = True
              | otherwise = False-}

algunoEs0 :: Float -> Float -> Bool
algunoEs0 x y | x /= 0 && y /= 0 = False
              | otherwise = True
              {-| x == 0 && y == 0 = True
			  | x == 0 && y /= 0 = True-}
              
{-ambosSon0 :: Float -> Float -> Bool			  
ambosSon0 x	y |x >= 0 && x <= 0 && y >= 0 && y <= 0 = True
			  |otherwise = False-}

ambosSon0 :: Float -> Float -> Bool
ambosSon0 x y | x == 0 && y == 0 = True
              | otherwise = False
{-multiploDe :: Integer -> Integer -> Integer
multiploDe x y =-}

--CLASE 2

identidad :: t -> t
identidad x = x

primero :: tx -> ty -> tx
primero x y = x

por1 :: Int -> Int
por1 x = x * 99999999999999999

triple :: (Num t) => t -> t
triple x = 3 * x 

cantidadDeSoluciones :: (Num t, Ord t) =>  t -> t -> Int
cantidadDeSoluciones b c | d > 0 = 2
                         | d == 0 = 1
                         | otherwise = 0
                         where d = (b^2) - (4*c)
                         
f1 x y z = x**y + z <= x+y**z

f2 x y = (sqrt x) / (sqrt y)

-- Usar (ax, by) para ingresar duplas

suma (vx, vy) (wx, wy) = (vx + wx, vy +wy)

sumaR3 (vx, vy, vz) (wx, wy, wz) (ux, uy, uz) = (vx + wx + ux, vy + wy + uy ,vz + wz + uz )

estanRelacionados :: Integer -> Integer -> Bool
estanRelacionados x y | x <= 3 && y <= 3 = True
                      | x > 3 && x <= 7 && y > 3 && y <=7 = True
                      | x > 7 && y > 7 = True
                      | otherwise = False

prodInt :: (Int, Int) -> (Int, Int) -> Int
prodInt (vx, vy) (wx, wy) = vx*wx + vy*wy  

todoMenor :: (Int, Int) -> (Int, Int) -> Bool
todoMenor (vx, vy) (wx, wy) | vx < wx && vy < wy = True
                            | otherwise = False

distanciaPuntos :: (Float, Float) -> (Float, Float) -> Float
distanciaPuntos (vx, vy) (wx, wy) = sqrt((vy - vx)^2 + (wy - wx)^2)

posicPrimerPar :: (Int, Int, Int) -> Int
posicPrimerPar (vx, vy, vz) | mod vx 2 == 0 = 1
                            | mod vy 2 == 0 = 2
                            | mod vz 2 == 0 = 3
                            | otherwise = 4

esPar :: Int -> Bool
esPar n | mod n 2 == 0 = True
        | otherwise = False

--CLASE 3



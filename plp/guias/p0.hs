{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# OPTIONS_GHC -Wno-deferred-out-of-scope-variables #-}
import Data.Binary.Get (Decoder(Fail))
{-# HLINT ignore "Evaluate" #-}

-- Ejercicio 1

    -- null :: Foldable t => t a -> Bool
    -- Devuelve true si la lista es vacia

    -- head :: GHC.Stack.Types.HasCallStack => [a] -> a
    -- Devuelve el primer elemento de la lista

    -- tail :: GHC.Stack.Types.HasCallStack => [a] -> [a]
    -- Devuelve la lista sin el primer elemento de la lista

    -- init :: GHC.Stack.Types.HasCallStack => [a] -> [a]
    -- Devuelve la lista sin el ultimo elemento de la lista

    -- last :: GHC.Stack.Types.HasCallStack => [a] -> a
    -- Devuelve el ultimo elemento de la lista

    -- take :: Int -> [a] -> [a]
    -- Esta función toma un número entero n y una lista y 
    -- devuelve los primeros n elementos de la lista.

    -- drop :: Int -> [a] -> [a]
    -- Esta función toma un número entero n y una lista y 
    -- devuelve la lista sin los primeros n elementos de la lista.

    -- (++) :: [a] -> [a] -> [a]
    -- Toma dos listas y devuelve una lista con la union de esas dos listas

    -- concat :: Foldable t => t [a] -> [a]
    -- Toma una lista de lista y devuelve una union de todas las listas

    -- (!!) :: GHC.Stack.Types.HasCallStack => [a] -> Int -> a
    --  Este es el operador de indexación de listas. Toma una lista 
    -- y un índice, y devuelve el elemento en ese índice de la lista.

    -- elem :: (Foldable t, Eq a) => a -> t a -> Bool
    -- Si un elemento pertenece o no a la lista

-- Ejercicio 2

valorAbsoluto :: Float -> Float
valorAbsoluto n | n < 0 = -n
                | otherwise = n

bisiesto :: Int -> Bool
bisiesto n = (mod n 4 == 0) && (mod n 100 /= 0)|| mod n 400 == 0

factorial :: Int -> Int
factorial n | n == 0 = 1
            | otherwise = n * factorial (n-1)

cantDivisoresPrimos :: Int -> Int
cantDivisoresPrimos n = cantDivisoresPrimosAux n 2

cantDivisoresPrimosAux :: Int -> Int -> Int
cantDivisoresPrimosAux n k | k == n = 0
                           | mod n k == 0 && esPrimo k = 1 + cantDivisoresPrimosAux n (k+1)
                           | otherwise = cantDivisoresPrimosAux n (k+1)

esPrimo :: Int -> Bool
esPrimo n | n < 2 = False
          | cantDivisores n 2 == 0 = True
          | otherwise = False

cantDivisores :: Int -> Int -> Int
cantDivisores n k | k == n = 0
                  | mod n k == 0 = 1 + cantDivisores n (k+1)
                  | otherwise = cantDivisores n (k+1)

-- Ejercicio 3

inverso :: Float -> Maybe Float
inverso n | n >= 1 = Just (1 / n)
          | otherwise = Nothing

aEntero :: Either Int Bool -> Int
aEntero (Left n) = n
aEntero (Right b) = if b then 1 else 0

-- Ejercicio 4

--limpiar :: String -> String -> String
--limpiar [] = 

promedio :: [Float] -> Float
promedio xs = sum xs / fromIntegral (length xs)

difPromedio :: [Float] -> [Float]
difPromedio xs = map (\x -> x - promedio xs) xs

todosIguales :: [Int] -> Bool
todosIguales [x] = True
todosIguales (x:xs) | x == head xs = True && todosIguales xs
                    | otherwise = False

-- Ejercicio 5

data AB a = Nil | Bin (AB a) a (AB a)

vacioAB :: AB a -> Bool
vacioAB Nil = True
vacioAB _ = False

preorder :: AB a -> [a]
preorder Nil = []
preorder (Bin hi r hd) = r : preorder hi ++ preorder hd

inorder :: AB a -> [a]
inorder Nil = []
inorder (Bin hi r hd) = inorder hi ++ [r] ++ inorder hd

insertar :: Ord a => a -> AB a -> AB a
insertar x Nil = Bin Nil x Nil
insertar x (Bin izq y der) | x < y = Bin (insertar x izq) y der
                           | x > y = Bin izq y (insertar x der)
                           | otherwise = Bin izq y der

negacion :: AB Bool -> AB Bool
negacion Nil = Nil
negacion (Bin hi r hd) = mapAB not (Bin hi r hd)

mapAB :: (a -> b) -> AB a -> AB b
mapAB _ Nil = Nil
mapAB f (Bin hi r hd) = Bin (mapAB f hi) (f r) (mapAB f hd)

productoAB :: AB Int -> Int
productoAB Nil = 0
productoAB (Bin hi r hd) = product (inorder (Bin hi r hd))
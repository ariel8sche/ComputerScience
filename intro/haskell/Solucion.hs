module Solucion where

--Ej 5 Guia 5
sumarElPrimero :: [Integer] -> [Integer]
sumarElPrimero (x:xs) = sumarALaLista x (x:xs)

sumarALaLista e [] = []
sumarALaLista e (x:xs) = e + x : sumarALaLista e xs






--Ej 7 Guia 4
todosDigitosIguales :: Integer -> Bool
todosDigitosIguales n | 0 < n, n < 10 = True
                      | otherwise = mod n 10 == mod (div n 10) 10 && todosDigitosIguales (div n 10)











--Ej 9 Guia 5
capicua :: (Eq t) => [t] -> Bool
capicua [] = True
capicua [x] = True
capicua l = head(l)==last(l) && capicua (tail(init(l)))
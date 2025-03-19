{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Redundant lambda" #-}
import Text.Read (Lexeme(Ident))

type MatrizInfinita a = Int -> Int -> a

comparar :: Eq a => MatrizInfinita a -> MatrizInfinita a -> MatrizInfinita Bool
comparar m1 m2 = \x y -> m1 x y == m2 x y

recortar :: Eq a => Int -> Int -> MatrizInfinita a -> [[a]]
recortar x y m = [take y [m i j | i <- [0..x-1]] | j <- [0..x-1]]

identidad :: MatrizInfinita Int
identidad = \x y -> if x==y then 1 else 0



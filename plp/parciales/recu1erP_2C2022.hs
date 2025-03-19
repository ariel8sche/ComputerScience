{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Avoid lambda" #-}
{-# LANGUAGE TemplateHaskell #-}
import Data.Bifoldable (biList)
import Data.Traversable (foldMapDefault)
import Data.Foldable (Foldable(fold))

data Matriz a = NuevaMatriz a | Agregar a Int Int (Matriz a)

foldMatriz :: (a -> b) -> (a -> Int -> Int -> b -> b) -> Matriz a -> b
foldMatriz fNuevaM fAgregar m = case m of
                NuevaMatriz a ->  fNuevaM a
                Agregar v x y i -> fAgregar v x y (rec i)
    where rec = foldMatriz fNuevaM fAgregar

ver :: Int -> Int -> Matriz a -> a
ver x y = foldMatriz id (\v i j rec -> if x == i && y == j then v else rec)

mapMatriz :: (a -> a) -> Matriz a -> Matriz a
mapMatriz f = foldMatriz (NuevaMatriz . f) (Agregar . f)


-- suma :: (Num a) => Matriz a -> Matriz a -> Matriz a
-- suma m1 m2 = 

m1 = Agregar 5 1 2 (Agregar 2 2 1 (Agregar 3 1 1 (NuevaMatriz 0)))
m3 = Agregar 0 1 2 (Agregar 4 0 0 (Agregar 2 1 1 (NuevaMatriz 1)))

-- test1 = ver 1 1 (mapMatriz (\v x y -> if x==1 && y==1 then v+1 else v) m1)
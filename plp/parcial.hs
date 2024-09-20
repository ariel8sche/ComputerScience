{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
import Data.Foldable (Foldable(fold))
import Data.List (nub)
{-# HLINT ignore "Avoid lambda" #-}
data AT a = NilT | Tri a (AT a) (AT a) (AT a)

foldAT :: (a -> b -> b -> b -> b) -> b -> AT a -> b
foldAT f z NilT = z
foldAT f z (Tri r i c d) = f r (foldAT f z i) (foldAT f z c) (foldAT f z d)

preorder :: AT a -> [a]
preorder (Tri r i c d) = foldAT (\r i c d -> r:(i ++ c ++ d)) [] (Tri r i c d)

mapAT :: (a -> b) -> AT a -> AT b
mapAT f (Tri r i c d) = foldAT (\r i c d  -> Tri (f r) i c d) NilT (Tri r i c d)

nivel :: AT a -> Int -> [a]
nivel = foldAT (\r i c d -> \n -> if n == 0 then [r] else i (n-1) ++ c (n-1) ++ d (n-1)) (const [])

armarPares :: [a] -> [b] -> [(a,b)]
armarPares = foldr (\x rec -> \ys -> if null ys then [] else (x,head ys):(rec (tail ys))) (const [])

agarrar :: Int -> [a] -> [a]
agarrar k l = foldr (\x rec -> \n -> if n == 0 then [] else x : (rec (n-1))) (const []) l k

at1 = Tri 1 (Tri 2 NilT NilT NilT) (Tri 3 (Tri 4 NilT NilT NilT) NilT NilT) (Tri 5 NilT NilT NilT)









data Prop = Var String | No Prop | Y Prop Prop | O Prop Prop | Imp Prop Prop

type Valuacion = String -> Bool
expresion = Y (Var "P") (No (Imp (Var "Q") (Var "R")))
expresionFNN = O (Var "P") (No (Var "Q"))

foldProp :: (String -> b) -> (b -> b) -> (b -> b -> b) -> (b -> b -> b) -> (b -> b -> b) -> Prop -> b
foldProp fVar fNo fY fO fImp e = case e of
                                Var p -> fVar p
                                No p -> fNo (rec p)
                                Y p q -> fY (rec p) (rec q)
                                O p q -> fO (rec p) (rec q)
                                Imp p q -> fImp (rec p) (rec q)
    where rec = foldProp fVar fNo fY fO fImp

recProp :: (String -> b) -> (Prop -> b -> b) -> (Prop -> Prop -> b -> b -> b) -> (Prop -> Prop -> b -> b -> b) -> (Prop -> Prop -> b -> b -> b) -> Prop -> b
recProp fVar fNo fY fO fImp e = case e of
                                Var p -> fVar p
                                No p -> fNo p (rec p)
                                Y p q -> fY p q (rec p) (rec q)
                                O p q -> fO p q (rec p) (rec q)
                                Imp p q -> fImp p q (rec p) (rec p)
    where rec = recProp fVar fNo fY fO fImp

variables :: Prop -> [String]
variables (Var p) = [p]
variables (No p) = variables p
variables (Y p q) = variables p ++ variables q
variables (O p q) = variables p ++ variables q
variables (Imp p q) = variables p ++ variables q

variables2 :: Prop -> [String]
variables2 = sacarRepetidos2 . foldProp (:[]) id (++) (++) (++)

sacarRepetidos :: Eq a => [a] -> [a]
sacarRepetidos [] = []
sacarRepetidos (x:xs) = if x `elem` sacarRepetidos xs then sacarRepetidos xs else x : sacarRepetidos xs

sacarRepetidos2 :: Eq a => [a] -> [a]
sacarRepetidos2 = foldr (\x rec -> if x `elem` rec then rec else x:rec) []

variables3 :: Prop -> [String]
variables3 = nub . foldProp (:[]) id (++) (++) (++)

evaluar :: Valuacion -> Prop -> Bool
evaluar v (Var p) = v p
evaluar v (No p) = not (evaluar v p)
evaluar v (Y p q) = evaluar v p && evaluar v q
evaluar v (O p q) = evaluar v p || evaluar v q
evaluar v (Imp p q) = not (evaluar v p) || evaluar v q

valor :: Valuacion
valor "P" = True
valor "Q" = True
valor "R" = True

evaluar2 :: Valuacion -> Prop -> Bool
evaluar2 v = foldProp v (\p -> not p) (&&) (||) (\p q -> not p || q)

estaFNN :: Prop -> Bool
estaFNN (Var p) = True
estaFNN (No p) = esVar p
estaFNN (Y p q) = estaFNN p && estaFNN q
estaFNN (O p q) = estaFNN p && estaFNN q
estaFNN (Imp p q) = False

esVar (Var p) = True
esVar _ = False

estaFNN2 :: Prop -> Bool
estaFNN2 = recProp (const True) (\p rec -> esVar p) (\p q recp recq -> recp && recq) (\p q recp recq -> recp && recq) (\p q recp recq -> False)


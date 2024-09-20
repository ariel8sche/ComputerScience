{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Redundant bracket" #-}
{-# HLINT ignore "Eta reduce" #-}

data Componente
    = Contenedor
    | Motor
    | Escudo
    | Cañon
    deriving Eq

data NaveEspacial
    = Modulo Componente NaveEspacial NaveEspacial
    | Base Componente
    deriving Eq


nave1 :: NaveEspacial
nave1 = (Modulo Motor (Base Escudo) (Base Contenedor))

-- recNave f1 f2 n = case n of
--     Modulo c n1 n2 -> f1 c n1 n2 (recNave f1 f2 n1) (recNave f1 f2 n2)
--     Base c -> f2 c

recNave :: (Componente -> NaveEspacial -> NaveEspacial -> a -> a -> a) -> (Componente -> a) -> NaveEspacial -> a
recNave f1 f2 (Modulo c n1 n2) = f1 c n1 n2 (recNave f1 f2 n1) (recNave f1 f2 n2)
recNave f1 f2 (Base c) = f2 c

foldNave :: (Componente -> a -> a -> a) -> (Componente -> a) -> NaveEspacial -> a
foldNave f1 f2 = recNave (\c _ _ -> f1 c) f2







data ConcList a = Nil | Singleton a | Append (ConcList a) (ConcList a)

foldCL :: b -> (a -> b) -> (b -> b -> b) -> ConcList a -> b 
foldCL nilCase f1 f2 Nil = nilCase
foldCL nilCase f1 f2 (Singleton a) = f1 a
foldCL nilCase f1 f2 (Append a b) = f2 (foldCL nilCase f1 f2 a) (foldCL nilCase f1 f2 b)

logitut :: ConcList a -> Int 
logitut = foldCL 0 (const 1) (+)

duplicarApariciones :: ConcList a -> ConcList a
duplicarApariciones = foldCL Nil (\a -> Append (Singleton a) (Singleton a)) (\a b -> Append a b)

toConcList :: [a] -> ConcList a
toConcList [] = Nil
toConcList (x:xs) = if null xs
                    then
                        Singleton x
                    else
                        let
                            (l1, l2) = split (x:xs)
                        in
                            Append (toConcList l1) (toConcList l2)




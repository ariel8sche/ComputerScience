curry' :: ((a,b) -> c) -> a -> b -> c
curry' f x y = f (x, y)

uncurry' :: (a -> b -> c) -> (a, b) -> c
uncurry' f (x, y) = f x y

mayor :: Int -> Bool
mayor = (<=) 18

mayor' :: (Integral a) => a -> Bool
mayor' = (<= 18)

triple :: Float -> Float
triple = (*) 3.0

comp :: (a -> b) -> (c -> a) -> (c -> b)
comp f g x = f (g x)

flip' :: (a -> b -> c) -> b -> a -> c
flip' f x y = f y x

ss :: (a -> b) -> a -> b 
ss f a = f a

const' :: a -> b -> a
-- const' x y = x
-- const' x = (\y -> x)
const' x _ = x

maximo :: Ord a => [a] -> a
-- maximo (x:[]) = x
--maximo (x:xs) = if x > maximo xs
--                then x
--                else maximo xs
maximo = mejorSegun (>)


minimo :: Ord a => [a] -> a
minimo (x:[]) = x
minimo (x:xs) = if x < minimo xs
                then x
                else minimo xs

listaMasCorta :: [[a]] -> [a]
listaMasCorta (x:[]) = x
listaMasCorta (x:xs) = if length x < length (listaMasCorta xs)
                       then x
                       else listaMasCorta xs

mejorSegun :: (a -> a -> Bool) -> [a] -> a
mejorSegun f [x] = x
--mejorSegun f (x:xs)  
-- | f x (mejorSegun f xs) = x
-- | otherwise = mejorSegun f xs

mejorSegun f (x:y:xs) = if f x y
                        then mejorSegun f (x:xs)
                        else mejorSegun f (y:xs)
                        
filter' :: (a -> Bool) -> [a] -> [a]
filter' p = foldr (\x rec -> if p x
                             then (:) x rec
                             else rec) []
{--
filter' p = foldr (\x -> if p x
                         then (:) x
                         else id) [] 
--}

deLongitudN :: Int -> [[a]] -> [[a]]
deLongitudN n = filter (\x -> length x == n)
-- deLongitudN n = filter ((== n) . length)

soloPuntosFijosEnN :: Int -> [Int->Int] -> [Int->Int]
soloPuntosFijosEnN n = filter (\f -> f n == n)

map' :: (a -> b) -> [a] -> [b]
-- map' f = foldr ((:) . f) []
map' f = foldr (\x rec -> f x : rec) []

reverseAnidado :: [[Char]] -> [[Char]]
reverseAnidado = reverse . (map reverse)

paresCuadrados :: [Int] -> [Int]
paresCuadrados = map (\x -> if even x
                            then x*x
                            else x)
                            
listaComp :: (a -> b) -> [a] -> (a -> Bool) -> [b]
listaComp f xs p = map f (filter p xs)

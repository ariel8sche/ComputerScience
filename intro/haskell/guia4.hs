-- Ejercicio 1

{-
problema fibonacci (n: Z) : Z {
    requiere: { n ≥ 0 }
    asegura: { resultado = f ib(n) }
}
-} 

fibonacci :: Integer -> Integer 
fibonacci x | x == 0 = 0
            | x == 1 = 1
            | otherwise = (fibonacci (x - 1) + fibonacci (x - 2))

-- Ejercicio 2

{-
problema parteEntera (x: R) : Z {
    requiere: {T rue }
    asegura: { resultado ≤ x < resultado + 1 }
}
-}

parteEntera :: Float -> Int
parteEntera x | ((x < 1) && (x >= 0)) = 0
              | x < 0 = parteEntera (x + 1) - 1
              | x >= 1 = parteEntera (x - 1) + 1

-- Ejercicio 3

esDivisible :: Integer -> Integer -> Bool
esDivisible a b | a == 0 = True
                | a < 0 = False
                | otherwise = esDivisible (a-b) (b)

-- EJercicio 4

sumaImpares :: Integer -> Integer
sumaImpares x | x == 1 = 1
              | otherwise = ((iEsimoImpar x) + (sumaImpares (x - 1))) 

iEsimoImpar :: Integer -> Integer
iEsimoImpar x | x == 1 = 1
              | otherwise = iEsimoImpar (x - 1) + 2

-- Ejercicio 5 

medioFact :: Integer -> Integer 
medioFact x | x == 0 = 1
            | x == 1 = 1
            | otherwise = x * medioFact (x - 2)

-- Ejercicio 6

sumaDigitos :: Integer -> Integer
sumaDigitos x | x < 10 = x
              | otherwise = ((sumaDigitos (div x 10)) + (digitoUnidad x))

-- Ejercicio 7

todosDigitosIguales :: Integer -> Bool
todosDigitosIguales x | x < 10 = True
                      | otherwise = todosDigitosIguales (div x 10 ) && mod x 10 == mod (div x 10) 10

digitoUnidad :: Integer -> Integer
digitoUnidad x = mod x 10

digitoDecena :: Integer -> Integer
digitoDecena x = digitoUnidad (div x 10) 

todosDigitosIgualesBis :: Integer -> Bool
todosDigitosIgualesBis x | x < 10 = True
                         | otherwise = ((digitoDecena x) == (digitoUnidad x)) && todosDigitosIgualesBis (div x 10)

-- Ejercicio 8

{-
problema iesimoDigito (n: Z, i: N) : Z {
    requiere: { n ≥ 0 ∧ 1 ≤ i ≤ cantDigitos(n) }
    asegura: { resultado = (n div (10 ^ cantDigitos)(n)−i) mod 10 }
}
-}

iesimoDigito :: Integer -> Integer -> Integer 
iesimoDigito x y | ((cantDigitos x) == y) = (digitoUnidad x)
                 | ((cantDigitos (div x 10 )) == y) = digitoUnidad (div x 10)
                 | otherwise = iesimoDigito (div x 10) y

{-
problema cantDigitos (n: Z) : N {
    requiere: { n ≥ 0 }
    asegura: { n = 0 → resultado = 1}
    asegura: { n =/ 0 → (n div (10 ^ resultado−1) > 0) ∧ (n div (10 ^ resultado) = 0))) }
}
-}

cantDigitos :: Integer -> Integer
cantDigitos x | x < 10 = 1
              | otherwise = ((cantDigitos (div x 10)) + 1)

-- Ejercicio 9 

esCapicua :: Integer -> Bool
esCapicua x | x <= 10 = False
            | ((iesimoDigito x 1) == (iesimoDigito x (cantDigitos (x)))) = True
            | otherwise = False

-- Ejercicio 10

f1 :: Integer -> Integer 
f1 n | n == 0 = 1
     | otherwise = ((f1 (n - 1)) + (2 ^ n))

f2 :: Integer -> Integer -> Integer
f2 n q | n== 0 = 1
       | otherwise = ((f2 (n - 1) q) + (q ^ n))

sumatoriaDesdeHasta :: Integer -> Integer -> Integer -> Integer
sumatoriaDesdeHasta i n q | n == i = q ^ i
                          | otherwise = (sumatoriaDesdeHasta i (n - 1) q) + (q ^ n)   

f3 :: Integer -> Integer -> Integer
f3 n q = ((f2 n q) + (sumatoriaDesdeHasta (2*n) (n+1) q))

f4 :: Integer -> Integer -> Integer 
f4 n q = sumatoriaDesdeHasta n (2 * n) q

-- Ejercicio 11

-- a)

factorial :: Integer -> Integer
factorial x | x == 1 = 1
            | otherwise = x * factorial (x - 1)

eAprox :: Integer -> Float
eAprox x | x == 0 = 1
         | otherwise = ((1 / fromIntegral(factorial (x))) + (eAprox (x - 1)))

-- b)

e :: Float
e = eAprox 10

-- Ejercicio 12

raizDe2Aprox :: Integer -> Float
raizDe2Aprox x = fromIntegral (round (sqrt (fromIntegral x) * 10)) / 10

-- Ejercicio 13

sumatoriaDoble :: Integer -> Integer -> Integer 
sumatoriaDoble n m | n == 1 = m
                   | otherwise = sumatoriaDesdeHasta 1 m n + sumatoriaDoble (n-1) (m)

-- Ejercicio 14

sumaPotencias :: Integer -> Integer -> Integer -> Integer
sumaPotencias q n m | m == 1 = ((sumaPotenciasAux q n 1))
                    | otherwise = ((sumaPotenciasAux q n m) + (sumaPotencias q n (m - 1)))

sumaPotenciasAux :: Integer -> Integer -> Integer -> Integer
sumaPotenciasAux q n m | n == 1 = (q ^ (m + 1))
                       | otherwise = (sumaPotenciasAux q (n - 1) m) + (q ^ (n + m))

-- Ejercicio 15 

{-
problema sumaRacionales (n : N, m : N) : R {
    requiere: { True}
    asegura: { resultado = la sumatoria desde p=1 hasta n que tiene dentro otra sumatoria desde q=1 hasta m de p/q}
}
-}

sumatoria :: Integer -> Integer
sumatoria n | n == 0 = 0
            | otherwise = n + sumatoria(n - 1) 

sumaRacionales :: Integer -> Integer -> Float
sumaRacionales n 0 = 0 
sumaRacionales n m = sumaRacionales n (m-1) + fromIntegral(sumatoria n) / fromIntegral(m)

-- Ejercicio 16

-- a)

menorDivisorDesde :: Integer -> Integer -> Integer
menorDivisorDesde n k | mod n k == 0 = k
                      | otherwise = menorDivisorDesde n (k+1)

menorDivisor :: Integer -> Integer
menorDivisor 1 = 1 
menorDivisor n = menorDivisorDesde n 2

-- b)

esPrimo :: Integer -> Bool
esPrimo 1 = False
esPrimo n = menorDivisor n == n 

-- c)

algoritmoDeEuclides :: Integer -> Integer -> Integer
algoritmoDeEuclides a b =
  if b == 0
    then a
    else algoritmoDeEuclides b (a `mod` b)

sonCoprimos :: Integer -> Integer -> Bool
sonCoprimos x y = algoritmoDeEuclides x y == 1

sonCoprimosBis :: Integer -> Integer -> Bool
sonCoprimosBis x y | esPrimo x && esPrimo y = True
                | esPrimo x && mod y x == 0 || esPrimo y && mod x y == 0 = False
                | (mod y (menorDivisor x) /= 0) && (mod x (menorDivisor y) /= 0) = True
                | otherwise = False

-- d)

siguientePrimo :: Integer -> Integer
siguientePrimo n | esPrimo(n+1) == True = (n+1)
                 | otherwise = siguientePrimo (n+1)

nEsimoPrimo :: Integer -> Integer
nEsimoPrimo 1 = 2
nEsimoPrimo n = siguientePrimo (nEsimoPrimo (n-1)) 

-- Ejericio 17

{-
problema esFibonacci (n: Z) : B {
    requiere: { n ≥ 0 }
    asegura: { resultado = True ↔ (∃i : Z)(i ≥ 0 ∧ n = fib(i)) }
}
-}

esFibonacci :: Integer -> Bool
esFibonacci x = esFibonacciAux x 0

esFibonacciAux :: Integer -> Integer -> Bool
esFibonacciAux x y | x < fibonacci y = False
                   | fibonacci y == x = True 
                   | otherwise = esFibonacciAux x (y+1)

-- Ejericio 18

{-
problema mayorDigitoPar (n: N) : N {
    requiere: { True }
    asegura: { resultado es el mayor de los dígitos pares de n. Si n no tiene ningún dígito par, entonces resultado es -1.}
}
-}

mayorDigitoPar :: Integer -> Integer
mayorDigitoPar n | n < 10 && esPar n   = n
                 | n < 10 && esImpar n = -1
                 | esPar ultimo && ultimo > mayorDigitoPar (div n 10) = ultimo
                 | otherwise           = mayorDigitoPar (div n 10)
      where
            ultimo  = mod n 10
            esPar   = even
            esImpar = not.esPar

-- Ejericio 19

{-
problema esSumaInicialDePrimos (n: Z) : B {
    requiere: { n ≥ 0 }
    asegura: { resultado = True ↔ n es igual a la suma de los m primeros números primos, para algún m}
}   
-}

esSumaInicialDePrimos :: Integer -> Bool
esSumaInicialDePrimos x = esSumaInicialDePrimosDesde x 1

esSumaInicialDePrimosDesde :: Integer -> Integer -> Bool
esSumaInicialDePrimosDesde x y | x < sumaPrimosHasta y = False
                             | x == sumaPrimosHasta y = True
                             | otherwise = esSumaInicialDePrimosDesde x (y + 1) 

sumaPrimosHasta :: Integer -> Integer
sumaPrimosHasta x | x == 1 = nEsimoPrimo 1 
                  | otherwise = ((nEsimoPrimo x) + (sumaPrimosHasta (x-1)))

-- Ejericio 20

tomaValorMax :: Int -> Int -> Int
tomaValorMax n1 n2 | n2 == n1  = n1
                   | sumaDivisores n1 > sumaDivisores (tomaValorMax (n1+1) n2) = n1
                   | otherwise = tomaValorMax (n1+1) n2
      where
            sumaDivisoresHasta :: Int -> Int -> Int
            sumaDivisoresHasta n k | k == 1 = 1
                                   | mod n k == 0 = k + sumaDivisoresHasta n (k-1)
                                   | mod n k /= 0 = sumaDivisoresHasta n (k-1)

            sumaDivisores :: Int -> Int
            sumaDivisores n = sumaDivisoresHasta n n

-- Ejericio 21

pitagoras :: Integer -> Integer -> Integer -> Integer
pitagoras 0 0 r                    = 1

pitagoras 0 m r | m^2 <= r^2       = 1 + pitagoras 0 (m-1) r
                | otherwise        =     pitagoras 0 (m-1) r

pitagoras n 0 r | n^2 <= r^2       = 1 + pitagoras (n-1) 0 r
                | otherwise        =     pitagoras (n-1) 0 r

pitagoras n m r | n^2 + m^2 <= r^2 = 1 + pitagoras n     (m-1) r 
                                       + pitagoras (n-1)  m r 
                                       - pitagoras (n-1) (m-1) r
                
                | otherwise        =     pitagoras n     (m-1) r 
                                       + pitagoras (n-1)  m r 
                                       - pitagoras (n-1) (m-1) r
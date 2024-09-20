module Clase05 where
    import Clase04(factorial)

    sumaDivisoresHasta :: Int -> Int -> Int
    sumaDivisoresHasta n divisor
        | divisor == 0 = 0
        | mod n divisor == 0 = divisor + sumaDivisoresHasta n (divisor-1)
        | otherwise = sumaDivisoresHasta n (divisor-1)

    sumaDivisores :: Int -> Int
    sumaDivisores n = sumaDivisoresHasta n n

    menorDivisor :: Int -> Int
    menorDivisor 1 = 1
    menorDivisor n = menorDivisorDesde n 2
        where menorDivisorDesde :: Int -> Int -> Int
              menorDivisorDesde n divisor
                | mod n divisor == 0 = divisor
                | otherwise = menorDivisorDesde n (divisor+1)

    esPrimo :: Int -> Bool
    esPrimo 1 = False
    esPrimo n = menorDivisor n == n

    buscarNesimoPrimo :: Int -> Int -> Int
    buscarNesimoPrimo n i
        | n == 0 = i-1
        | esPrimo i = buscarNesimoPrimo (n-1) (i+1)
        | otherwise = buscarNesimoPrimo n (i+1)

    nEsimoPrimo :: Int -> Int
    nEsimoPrimo n = buscarNesimoPrimo n 2

    esFactDesde :: Int -> Int -> Bool
    esFactDesde i n
        | i > n = False
        | factorial i == n = True
        | otherwise = esFactDesde (i+1) n

    esFact :: Int -> Bool
    esFact n = esFactDesde 1 n

    -- Otra forma
    -- esFact2 :: Int -> Bool
    -- esFact2 n
    --     | esFact2Aux n 1 = True
    --     | otherwise = False
    --     where esFact2Aux :: Int -> Int -> Bool
    --           esFact2Aux n i
    --             | n == 1 = True
    --             | n `mod` i == 0 = esFact2Aux (n `div` i) (i + 1)
    --             | otherwise = False

    menorFactDesde :: Int -> Int
    menorFactDesde n
        | esFact n = n
        | otherwise = menorFactDesde (n+1)

    mayorFactHasta :: Int -> Int
    mayorFactHasta n
        | esFact n = n
        | otherwise = mayorFactHasta (n-1)

    fibonacci :: Int -> Int
    fibonacci 0 = 0
    fibonacci 1 = 1
    fibonacci n = fibonacci (n-1) + fibonacci (n-2)

    esFibonacciDesde :: Int -> Int -> Bool
    esFibonacciDesde n i
        | n == fibonacci i = True
        | n < fibonacci i = False
        | otherwise = esFibonacciDesde n (i+1)

    esFibonacci :: Int -> Bool
    esFibonacci n = esFibonacciDesde n 0

    -- Más eficiente
    -- esSumaInicialDePrimosDesde :: Int -> Int -> Bool
    -- esSumaInicialDePrimosDesde n i
    --     | n < 0 = False
    --     | n == 0 = True
    --     | esPrimo i = esSumaInicialDePrimosDesde (n-i) (i+1)
    --     | otherwise = esSumaInicialDePrimosDesde n (i+1)

    esSumaInicialDePrimosDesde :: Int -> Int -> Bool
    esSumaInicialDePrimosDesde n i
        | n < 0 = False
        | n == 0 = True
        | otherwise = esSumaInicialDePrimosDesde (n - nEsimoPrimo i) (i+1)

    esSumaInicialDePrimos :: Int -> Bool
    esSumaInicialDePrimos n = esSumaInicialDePrimosDesde n 1

    tomaValorMaxAux :: Int -> Int -> Int -> Int
    tomaValorMaxAux n2 m i
        | i > n2 = m
        | sumaDivisores m >= sumaDivisores i = tomaValorMaxAux n2 m (i+1)
        | sumaDivisores m < sumaDivisores i = tomaValorMaxAux n2 i (i+1)

    tomaValorMax :: Int -> Int -> Int
    tomaValorMax n1 n2 = tomaValorMaxAux n2 n1 n1

    tomaValorMinAux :: Int -> Int -> Int -> Int
    tomaValorMinAux n2 m i
        | i > n2 = m
        | sumaDivisores m <= sumaDivisores i = tomaValorMinAux n2 m (i+1)
        | sumaDivisores m > sumaDivisores i = tomaValorMinAux n2 i (i+1)

    tomaValorMin :: Int -> Int -> Int
    tomaValorMin n1 n2 = tomaValorMinAux n2 n1 n1

    cantidadPrimosGem :: Int -> Int
    cantidadPrimosGem b
        | b <= 2 = 0
        | esPrimo b && esPrimo (b-2) = 1
        | otherwise = 0

    primosGem :: Int -> Int
    primosGem 1 = 0
    primosGem b = cantidadPrimosGem b + primosGem (b-1)

    proxPrimosGem :: Int -> (Int, Int)
    proxPrimosGem a
        | esPrimo (a+1) && esPrimo (a+3) = (a+1, a+3)
        | otherwise = proxPrimosGem (a+1)

    sucesionLotharCollatz :: Int -> Int
    sucesionLotharCollatz an
        | an `mod` 2 == 0 = an `div` 2
        | an `mod` 2 == 1 = 3 * an + 1

    largoSecuencia :: Int -> Int
    largoSecuencia an
        | an == 1 = 0
        | otherwise = 1 + largoSecuencia (sucesionLotharCollatz an)

    largoSecuenciaMaxAux :: Int -> Int -> Int
    largoSecuenciaMaxAux m i
        | i == 1 = m
        | largoSecuencia m >= largoSecuencia i = largoSecuenciaMaxAux m (i-1)
        | largoSecuencia m < largoSecuencia i = largoSecuenciaMaxAux i (i-1)

    largoSecuenciaMax :: Int -> Int
    largoSecuenciaMax n = largoSecuenciaMaxAux n n

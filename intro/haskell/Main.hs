module Main where
import Test.HUnit
import Solucion

main = runTestTT allTests

allTests = test [
    "sumarElPrimero" ~: testsEj1,
    "todosDigitosIguales" ~: testsEj2,
    "capicua" ~: testsEj3
    ]

testsEj1 = test [
    sumarElPrimero [1,2,3] ~?= [2,3,4],
    sumarElPrimero [-1,2,3] ~?= [-2,1,2],
    sumarElPrimero [0] ~?= [0]
    ]

testsEj2 = test [
    todosDigitosIguales 10 ~?= False,
    todosDigitosIguales 101 ~?= False,
    todosDigitosIguales 111 ~?= True
    ]

--Capicua Ej 9 Guia 5
testsEj3 = test [
    capicua "acbbca" ~?= True,
    capicua "acbdca" ~?= False,
    capicua "" ~?= True,
    capicua "acbddca" ~?= False,
    capicua "acdddca" ~?= True
     ]
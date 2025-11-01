!classDefinition: #Falso category: 'EjercicioVerdaderoFalso'!
DenotativeObject subclass: #Falso
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'EjercicioVerdaderoFalso'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Falso class' category: 'EjercicioVerdaderoFalso'!
Falso class
	instanceVariableNames: ''!

!Falso class methodsFor: 'protocolo' stamp: 'JFGO 8/23/2021 20:25:47'!
no
	^Verdadero.! !

!Falso class methodsFor: 'protocolo' stamp: 'JFGO 3/24/2022 20:55:14'!
o: aBooleano 
	^aBooleano.! !

!Falso class methodsFor: 'protocolo' stamp: 'JFGO 8/23/2021 21:34:14'!
siFalso: aBlockClosure 
	aBlockClosure value.! !

!Falso class methodsFor: 'protocolo' stamp: 'JFGO 3/24/2022 20:42:19'!
siVerdadero: unClosure 
	! !

!Falso class methodsFor: 'protocolo' stamp: 'JFGO 3/24/2022 21:11:05'!
y: aBooleano 
	^self.! !


!classDefinition: #Verdadero category: 'EjercicioVerdaderoFalso'!
DenotativeObject subclass: #Verdadero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'EjercicioVerdaderoFalso'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Verdadero class' category: 'EjercicioVerdaderoFalso'!
Verdadero class
	instanceVariableNames: ''!

!Verdadero class methodsFor: 'protocolo' stamp: 'JFGO 8/23/2021 20:21:55'!
no
	^Falso.! !

!Verdadero class methodsFor: 'protocolo' stamp: 'JFGO 3/24/2022 21:10:52'!
o: aBooleano
	^self.! !

!Verdadero class methodsFor: 'protocolo' stamp: 'JFGO 3/24/2022 20:39:02'!
siFalso: unClosure 
	! !

!Verdadero class methodsFor: 'protocolo' stamp: 'JFGO 8/23/2021 21:27:28'!
siVerdadero: aBlockClosure 
	^ aBlockClosure value.! !

!Verdadero class methodsFor: 'protocolo' stamp: 'JFGO 8/23/2021 20:54:43'!
y: aBooleano
	^aBooleano.! !


!classDefinition: #VerdaderoFalsoTest category: 'EjercicioVerdaderoFalso'!
DenotativeObject subclass: #VerdaderoFalsoTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'EjercicioVerdaderoFalso'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'VerdaderoFalsoTest class' category: 'EjercicioVerdaderoFalso'!
VerdaderoFalsoTest class
	instanceVariableNames: ''!

!VerdaderoFalsoTest class methodsFor: 'closures' stamp: 'JFGO 8/23/2021 21:27:03'!
test07VerdaderoSiVerdaderoEjecutaBloque
	| unClosure closureEvaluado |
	
	closureEvaluado := #No.
		
	unClosure:=[closureEvaluado := #Si.].
	
	Verdadero siVerdadero: unClosure.
	
	Assert that: closureEvaluado isEqualTo: #Si.! !

!VerdaderoFalsoTest class methodsFor: 'closures' stamp: 'JFGO 3/24/2022 20:41:16'!
test08VerdaderoSiFalsoNoEjecutaBloque
	| unClosure |
			
	unClosure:=[Assert fail. ].
	
	Verdadero siFalso: unClosure.
	
	! !

!VerdaderoFalsoTest class methodsFor: 'closures' stamp: 'JFGO 3/24/2022 20:37:16'!
test09FalsoSiFalsoEvaluaClosure
| unClosure closureEvaluado |
	
	closureEvaluado := #No.
		
	unClosure:=[closureEvaluado := #Si.].
	
	Falso siFalso: unClosure.
	
	Assert that: closureEvaluado isEqualTo: #Si.
	
	! !

!VerdaderoFalsoTest class methodsFor: 'closures' stamp: 'JFGO 3/24/2022 20:42:02'!
test10FalsoSiVerdaderoNoEjecutaBloque
	| unClosure |
			
	unClosure:=[Assert fail. ].
	
	Falso siVerdadero: unClosure.
	
	! !


!VerdaderoFalsoTest class methodsFor: 'conjuncion' stamp: 'JFGO 8/23/2021 20:52:51'!
test03VerdaderoYVerdaderoEsVerdadero
	Assert that: (Verdadero y: Verdadero) isEqualTo: Verdadero.! !

!VerdaderoFalsoTest class methodsFor: 'conjuncion' stamp: 'JFGO 8/23/2021 20:54:12'!
test04VerdaderoYFalsoEsFalso
	Assert that: (Verdadero y: Falso) isEqualTo: Falso.! !

!VerdaderoFalsoTest class methodsFor: 'conjuncion' stamp: 'JFGO 8/23/2021 20:57:37'!
test05FalsoYFalsoEsFalso
	Assert that: (Falso y: Falso) isEqualTo: Falso.! !

!VerdaderoFalsoTest class methodsFor: 'conjuncion' stamp: 'JFGO 8/23/2021 20:57:57'!
test06FalsoYVerdaderoEsFalso
	Assert that: (Falso y: Verdadero) isEqualTo: Falso.! !


!VerdaderoFalsoTest class methodsFor: 'negacion' stamp: 'JFGO 8/23/2021 20:59:27'!
test01VerdaderoNegadoEsFalso
	Assert that: Falso isEqualTo: Verdadero no.! !

!VerdaderoFalsoTest class methodsFor: 'negacion' stamp: 'JFGO 8/23/2021 20:59:35'!
test02FalsoNegadoEsVerdadero
	Assert that: Verdadero isEqualTo: Falso no.! !

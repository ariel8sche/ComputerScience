!classDefinition: #Falso category: #Ejercicio3!
DenotativeObject subclass: #Falso
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio3'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Falso class' category: #Ejercicio3!
Falso class
	instanceVariableNames: ''!

!Falso class methodsFor: 'Logic Operations'!
negado
	^ Verdadero.! !


!Falso class methodsFor: 'Logic Operations'!
negado
	^ Verdadero.! !

!Falso class methodsFor: '-- all --'!
o: arg1
	^ arg1.! !

!Falso class methodsFor: '-- all --'!
siFalso: arg1
	^ arg1.! !

!Falso class methodsFor: '-- all --'!
siVerdadero: arg1
	^ self.! !

!Falso class methodsFor: '-- all --'!
y: arg1
	^ Falso.! !


!classDefinition: #Test category: #Ejercicio3!
DenotativeObject subclass: #Test
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio3'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Test class' category: #Ejercicio3!
Test class
	instanceVariableNames: ''!

!Test class methodsFor: 'as yet unclassified'!
test01VerdaderoNegadoFalso
	Assert
		that: Verdadero negado
		isEqualTo: Falso.! !

!Test class methodsFor: 'as yet unclassified'!
test02FalsoNegadoVerdadero
	Assert
		that: Falso negado
		isEqualTo: Verdadero.! !


!Test class methodsFor: 'as yet unclassified'!
test01VerdaderoNegadoFalso
	Assert
		that: Verdadero negado
		isEqualTo: Falso.! !

!Test class methodsFor: 'as yet unclassified'!
test02FalsoNegadoVerdadero
	Assert
		that: Falso negado
		isEqualTo: Verdadero.! !

!Test class methodsFor: '-- all --'!
test03VerdaderoYVerdadero
	Assert
		that: (Verdadero y: Verdadero)
		isEqualTo: Verdadero.! !

!Test class methodsFor: '-- all --'!
test04VerdaderoYFalso
	Assert
		that: (Verdadero y: Falso)
		isEqualTo: Falso.! !

!Test class methodsFor: '-- all --'!
test05FalsoYVerdadero
	Assert
		that: (Falso y: Verdadero)
		isEqualTo: Falso.! !

!Test class methodsFor: '-- all --'!
test06FalsoYFalso
	Assert
		that: (Falso y: Falso)
		isEqualTo: Falso.! !

!Test class methodsFor: '-- all --'!
test07FalsoOFalso
	Assert
		that: (Falso o: Falso)
		isEqualTo: Falso.! !

!Test class methodsFor: '-- all --'!
test08FalsoOVerdadero
	Assert
		that: (Falso o: Verdadero)
		isEqualTo: Verdadero.! !

!Test class methodsFor: '-- all --'!
test09VerdaderoOFalso
	Assert
		that: (Verdadero o: Falso)
		isEqualTo: Verdadero.! !

!Test class methodsFor: '-- all --'!
test10VerdaderoOVerdadero
	Assert
		that: (Verdadero o: Verdadero)
		isEqualTo: Verdadero.! !

!Test class methodsFor: '-- all --'!
test11VerdaderoSiVerdadero
	Assert
		that: (Verdadero siVerdadero: 2 + 2)
		isEqualTo: 4.! !

!Test class methodsFor: '-- all --'!
test12VerdaderoSiFalso
	Assert
		that: (Verdadero siFalso: 2 + 2)
		isEqualTo: Verdadero.! !

!Test class methodsFor: '-- all --'!
test13FalsoSiFalso
	Assert
		that: (Falso siFalso: 2 + 2)
		isEqualTo: 4.! !

!Test class methodsFor: '-- all --'!
test14FalsoSiVerdadero
	Assert
		that: (Falso siVerdadero: 2 + 2)
		isEqualTo: Falso.! !


!classDefinition: #Verdadero category: #Ejercicio3!
DenotativeObject subclass: #Verdadero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio3'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Verdadero class' category: #Ejercicio3!
Verdadero class
	instanceVariableNames: ''!

!Verdadero class methodsFor: 'Logic Operations'!
negado
	^ Falso.! !


!Verdadero class methodsFor: 'Logic Operations'!
negado
	^ Falso.! !

!Verdadero class methodsFor: '-- all --'!
o: arg1
	^ Verdadero.! !

!Verdadero class methodsFor: '-- all --'!
siFalso: arg1
	^ self.! !

!Verdadero class methodsFor: '-- all --'!
siVerdadero: arg1
	^ arg1.! !

!Verdadero class methodsFor: '-- all --'!
y: arg1
	^ arg1.! !

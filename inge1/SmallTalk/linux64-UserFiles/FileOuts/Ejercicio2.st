!classDefinition: #Bill category: #Ejercicio2!
DenotativeObject subclass: #Bill
	instanceVariableNames: 'dias'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio2'!

!Bill methodsFor: 'actions'!
caminar: arg1
	dias := dias - (arg1 + 3).! !

!Bill methodsFor: 'actions'!
comer: arg1
	dias := dias + (4 * arg1).! !

!Bill methodsFor: 'actions'!
energia
	^ dias.! !


!Bill methodsFor: 'initialization'!
initializeLive: arg1
	dias := arg1.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Bill class' category: #Ejercicio2!
Bill class
	instanceVariableNames: 'energia'!

!Bill class methodsFor: 'instance creation'!
live
	^ self new initializeLive: 28.! !

!Bill class methodsFor: 'instance creation'!
live: arg1
	^ self new initializeLive: arg1.! !


!Bill class methodsFor: '--** private fileout/in **--'!
initializeCollaboratorsFromFile
	energia := nil.! !

Bill initializeAfterFileIn!
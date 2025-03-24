!classDefinition: #I category: #Ejercicio4!
DenotativeObject subclass: #I
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio4'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'I class' category: #Ejercicio4!
I class
	instanceVariableNames: 'nextNumber'!

!I class methodsFor: '-- all --'!
+ arg1
	^ arg1 next.! !

!I class methodsFor: '--** private fileout/in **--'!
initializeCollaboratorsFromFile
	nextNumber := II.! !

!I class methodsFor: '-- all --'!
next
	nextNumber isNil ifTrue: [ nextNumber := self cloneNamed: self name , 'I' ].
	nextNumber setPrevious: self.
	^ nextNumber.! !


!I class methodsFor: '--** private fileout/in **--'!
initializeCollaboratorsFromFile
	nextNumber := II.! !


!classDefinition: #II category: #Ejercicio4!
DenotativeObject subclass: #II
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio4'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'II class' category: #Ejercicio4!
II class
	instanceVariableNames: 'previousNumber nextNumber'!

!II class methodsFor: '-- all --'!
+ arg1
	^ previousNumber + arg1 next.! !

!II class methodsFor: '--** private fileout/in **--'!
initializeCollaboratorsFromFile
	previousNumber := I.
	nextNumber := III.! !

!II class methodsFor: '-- all --'!
next
	nextNumber isNil ifTrue: [ nextNumber := self cloneNamed: self name , 'I' ].
	nextNumber setPrevious: self.
	^ nextNumber.! !

!II class methodsFor: '-- all --'!
previous
	^ previousNumber.! !

!II class methodsFor: '-- all --'!
setPrevious: arg1
	previousNumber := arg1.! !


!II class methodsFor: '--** private fileout/in **--'!
initializeCollaboratorsFromFile
	previousNumber := I.
	nextNumber := III.! !


!classDefinition: #III category: #Ejercicio4!
DenotativeObject subclass: #III
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio4'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'III class' category: #Ejercicio4!
III class
	instanceVariableNames: 'previousNumber nextNumber'!

!III class methodsFor: '-- all --'!
+ arg1
	^ previousNumber + arg1 next.! !

!III class methodsFor: '--** private fileout/in **--'!
initializeCollaboratorsFromFile
	previousNumber := II.
	nextNumber := IIII.! !

!III class methodsFor: '-- all --'!
next
	nextNumber isNil ifTrue: [ nextNumber := self cloneNamed: self name , 'I' ].
	nextNumber setPrevious: self.
	^ nextNumber.! !

!III class methodsFor: '-- all --'!
previous
	^ previousNumber.! !

!III class methodsFor: '-- all --'!
setPrevious: arg1
	previousNumber := arg1.! !


!III class methodsFor: '--** private fileout/in **--'!
initializeCollaboratorsFromFile
	previousNumber := II.
	nextNumber := IIII.! !


!classDefinition: #IIII category: #Ejercicio4!
DenotativeObject subclass: #IIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio4'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIII class' category: #Ejercicio4!
IIII class
	instanceVariableNames: 'previousNumber nextNumber'!

!IIII class methodsFor: '-- all --'!
+ arg1
	^ previousNumber + arg1 next.! !

!IIII class methodsFor: '--** private fileout/in **--'!
initializeCollaboratorsFromFile
	previousNumber := III.
	nextNumber := IIIII.! !

!IIII class methodsFor: '-- all --'!
next
	nextNumber isNil ifTrue: [ nextNumber := self cloneNamed: self name , 'I' ].
	nextNumber setPrevious: self.
	^ nextNumber.! !

!IIII class methodsFor: '-- all --'!
previous
	^ previousNumber.! !

!IIII class methodsFor: '-- all --'!
setPrevious: arg1
	previousNumber := arg1.! !


!IIII class methodsFor: '--** private fileout/in **--'!
initializeCollaboratorsFromFile
	previousNumber := III.
	nextNumber := IIIII.! !


!classDefinition: #IIIII category: #Ejercicio4!
DenotativeObject subclass: #IIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio4'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIIII class' category: #Ejercicio4!
IIIII class
	instanceVariableNames: 'previousNumber nextNumber'!

!IIIII class methodsFor: '-- all --'!
+ arg1
	^ previousNumber + arg1 next.! !

!IIIII class methodsFor: '--** private fileout/in **--'!
initializeCollaboratorsFromFile
	previousNumber := IIII.
	nextNumber := nil.! !

!IIIII class methodsFor: '-- all --'!
next
	nextNumber isNil ifTrue: [ nextNumber := self cloneNamed: self name , 'I' ].
	nextNumber setPrevious: self.
	^ nextNumber.! !

!IIIII class methodsFor: '-- all --'!
previous
	^ previousNumber.! !

!IIIII class methodsFor: '-- all --'!
setPrevious: arg1
	previousNumber := arg1.! !


!IIIII class methodsFor: '--** private fileout/in **--'!
initializeCollaboratorsFromFile
	previousNumber := IIII.
	nextNumber := nil.! !

I initializeAfterFileIn!
II initializeAfterFileIn!
III initializeAfterFileIn!
IIII initializeAfterFileIn!
IIIII initializeAfterFileIn!
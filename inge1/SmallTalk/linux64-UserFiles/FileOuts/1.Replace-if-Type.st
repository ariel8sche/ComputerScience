!classDefinition: #Vehicle category: #'1.Replace-if-Type'!
Object subclass: #Vehicle
	instanceVariableNames: 'type speed'
	classVariableNames: ''
	poolDictionaries: ''
	category: '1.Replace-if-Type'!

!Vehicle methodsFor: 'initialization' stamp: 'as 4/7/2025 11:27:17'!
initializeWithType: typeToTake

	type := typeToTake.
	speed := 0 * kilometer / hour.
! !


!Vehicle methodsFor: 'move' stamp: 'as 4/4/2025 21:11:55'!
accelerate

	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Vehicle class' category: #'1.Replace-if-Type'!
Vehicle class
	instanceVariableNames: ''!

!Vehicle class methodsFor: 'instance creation' stamp: 'NR 9/7/2024 08:53:59'!
electricMotorcycle

	^ self new initializeWithType: #Motorcycle engineType: #ElectricEngine andSurroundings: #city

! !

!Vehicle class methodsFor: 'instance creation' stamp: 'NR 9/7/2024 08:53:55'!
gasolineMotorcycle

	^ self new initializeWithType: #Motorcycle engineType: #GasolineEngine andSurroundings: #openRoad! !

!Vehicle class methodsFor: 'instance creation' stamp: 'ARM 4/29/2024 11:00:51'!
helicopter

	^self new initializeWithType: #Helicopter! !

!Vehicle class methodsFor: 'instance creation' stamp: 'ARM 4/29/2024 11:00:51'!
motorcycle

	^self new initializeWithType: #Motorcycle! !


!classDefinition: #Helicopter category: #'1.Replace-if-Type'!
Vehicle subclass: #Helicopter
	instanceVariableNames: 'altitude'
	classVariableNames: ''
	poolDictionaries: ''
	category: '1.Replace-if-Type'!

!Helicopter methodsFor: 'initialization' stamp: 'as 4/7/2025 11:27:26'!
initialize

	super initializeWithType: #Helicopter.
	altitude := 0 * meter.! !


!Helicopter methodsFor: 'move' stamp: 'as 4/7/2025 11:30:56'!
accelerate

	speed := speed + (10 * kilometer / hour).
	altitude := altitude + (5 * meter).! !


!classDefinition: #Motorcycle category: #'1.Replace-if-Type'!
Vehicle subclass: #Motorcycle
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '1.Replace-if-Type'!

!Motorcycle methodsFor: 'initialization' stamp: 'as 4/7/2025 11:29:54'!
initialize

	super initializeWithType: #Motorcycle.! !


!Motorcycle methodsFor: 'move' stamp: 'as 4/7/2025 11:30:22'!
accelerate
		
	speed := speed + (20 * kilometer / hour).! !

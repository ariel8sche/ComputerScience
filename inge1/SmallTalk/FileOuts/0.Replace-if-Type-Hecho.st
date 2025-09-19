!classDefinition: #Vehicle category: #'0.Replace-if-Type'!
Object subclass: #Vehicle
	instanceVariableNames: 'speed'
	classVariableNames: ''
	poolDictionaries: ''
	category: '0.Replace-if-Type'!

!Vehicle methodsFor: 'initialization' stamp: 'AS 9/19/2025 12:13:32'!
initialize

	speed := 0 * kilometer / hour.! !


!Vehicle methodsFor: 'move' stamp: 'AS 9/19/2025 12:02:09'!
accelerate

	self subclassResponsibility .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Vehicle class' category: #'0.Replace-if-Type'!
Vehicle class
	instanceVariableNames: ''!

!Vehicle class methodsFor: 'instance creation' stamp: 'AS 9/19/2025 12:04:00'!
helicopter

	^Helicopter new initialize! !

!Vehicle class methodsFor: 'instance creation' stamp: 'AS 9/19/2025 12:03:55'!
motorcycle

	^Motorcycle new initialize! !


!classDefinition: #Helicopter category: #'0.Replace-if-Type'!
Vehicle subclass: #Helicopter
	instanceVariableNames: 'altitude'
	classVariableNames: ''
	poolDictionaries: ''
	category: '0.Replace-if-Type'!

!Helicopter methodsFor: 'initialization' stamp: 'AS 9/19/2025 12:13:48'!
initialize

	super initialize. 
	altitude := 0 * meter.! !


!Helicopter methodsFor: 'move' stamp: 'AS 9/19/2025 12:01:54'!
accelerate

	speed := speed + (10 * kilometer / hour).
	altitude := altitude + (5 * meter).! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Helicopter class' category: #'0.Replace-if-Type'!
Helicopter class
	instanceVariableNames: ''!

!Helicopter class methodsFor: 'as yet unclassified' stamp: 'AS 9/19/2025 12:07:53'!
initialize

	super initialize .! !


!classDefinition: #Motorcycle category: #'0.Replace-if-Type'!
Vehicle subclass: #Motorcycle
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '0.Replace-if-Type'!

!Motorcycle methodsFor: 'initialization' stamp: 'AS 9/19/2025 12:13:59'!
initialize

	super initialize .! !


!Motorcycle methodsFor: 'move' stamp: 'AS 9/19/2025 12:01:19'!
accelerate

	speed := speed + (20 * kilometer / hour)! !

Helicopter initialize!
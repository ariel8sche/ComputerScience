!classDefinition: #Automobile category: #'2.Replace-if-State'!
Object subclass: #Automobile
	instanceVariableNames: 'speed state'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2.Replace-if-State'!

!Automobile methodsFor: 'initialization' stamp: 'as 4/9/2025 10:57:14'!
initialize

	state := MotorOff new initializeWith:  self.
	speed := 0 * kilometer / hour .! !


!Automobile methodsFor: 'move' stamp: 'as 4/7/2025 13:30:31'!
accelerate

	state accelerate .! !

!Automobile methodsFor: 'move' stamp: 'as 4/8/2025 11:55:29'!
increaseSpeed

	speed := speed + (10 * kilometer / hour).! !

!Automobile methodsFor: 'move' stamp: 'as 4/9/2025 10:59:13'!
increaseSpeed: kilometerPerHour

	speed := speed + kilometerPerHour .! !

!Automobile methodsFor: 'move' stamp: 'as 4/8/2025 12:34:02'!
turnOn

	state := MotorOn new initializeWith: self.
	speed := 0.! !


!classDefinition: #MotorState category: #'2.Replace-if-State'!
Object subclass: #MotorState
	instanceVariableNames: 'car'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2.Replace-if-State'!

!MotorState methodsFor: 'initialization' stamp: 'as 4/9/2025 11:00:17'!
initializeWith: aCar

	car := aCar.! !


!MotorState methodsFor: 'move' stamp: 'as 4/8/2025 11:57:22'!
accelerate 

	self subclassResponsibility.! !


!classDefinition: #MotorOff category: #'2.Replace-if-State'!
MotorState subclass: #MotorOff
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2.Replace-if-State'!

!MotorOff methodsFor: 'move' stamp: 'as 4/7/2025 11:56:38'!
accelerate

	 self error: 'Can not accelerate when turned off'.! !


!classDefinition: #MotorOn category: #'2.Replace-if-State'!
MotorState subclass: #MotorOn
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2.Replace-if-State'!

!MotorOn methodsFor: 'move' stamp: 'as 4/9/2025 11:00:30'!
accelerate

	car increaseSpeed: (10 * kilometer / hour).
	! !

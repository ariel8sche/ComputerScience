!classDefinition: #MotorState category: #'3.Replace-if-Type+State'!
Object subclass: #MotorState
	instanceVariableNames: 'vehicle'
	classVariableNames: ''
	poolDictionaries: ''
	category: '3.Replace-if-Type+State'!

!MotorState methodsFor: 'move' stamp: 'as 4/9/2025 11:32:38'!
accelerate

	self subclassResponsibility .! !


!MotorState methodsFor: 'initialization' stamp: 'as 4/9/2025 17:05:02'!
initializeWith: aCar

	vehicle := aCar.! !


!classDefinition: #MotorStateOff category: #'3.Replace-if-Type+State'!
MotorState subclass: #MotorStateOff
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '3.Replace-if-Type+State'!

!MotorStateOff methodsFor: 'as yet unclassified' stamp: 'as 4/9/2025 17:05:02'!
accelerate

	self error: vehicle canNotAccelerateErrorMessage.! !


!classDefinition: #MotorStateOn category: #'3.Replace-if-Type+State'!
MotorState subclass: #MotorStateOn
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '3.Replace-if-Type+State'!

!MotorStateOn methodsFor: 'as yet unclassified' stamp: 'as 4/9/2025 17:46:49'!
accelerate

	vehicle boost.! !


!classDefinition: #Vehicle category: #'3.Replace-if-Type+State'!
Object subclass: #Vehicle
	instanceVariableNames: 'state type speed'
	classVariableNames: ''
	poolDictionaries: ''
	category: '3.Replace-if-Type+State'!

!Vehicle methodsFor: 'initialization' stamp: 'as 4/9/2025 11:18:50'!
initializeWithType: typeToTake

	state := MotorStateOff new initializeWith: self.
	type := typeToTake.
	speed := 0 * kilometer / hour.
! !


!Vehicle methodsFor: 'move' stamp: 'as 4/9/2025 12:18:12'!
accelerate

	self subclassResponsibility .


		
	! !


!Vehicle methodsFor: 'on/off' stamp: 'as 4/9/2025 12:27:15'!
turnOff

	self subclassResponsibility .! !

!Vehicle methodsFor: 'on/off' stamp: 'as 4/9/2025 12:25:09'!
turnOn

	self subclassResponsibility .	! !


!Vehicle methodsFor: 'error messages' stamp: 'as 4/9/2025 12:07:21'!
canNotAccelerateErrorMessage

	self subclassResponsibility .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Vehicle class' category: #'3.Replace-if-Type+State'!
Vehicle class
	instanceVariableNames: ''!

!Vehicle class methodsFor: 'instance creation' stamp: 'ARM 4/29/2024 11:00:51'!
helicopter

	^self new initializeWithType: #Helicopter! !

!Vehicle class methodsFor: 'instance creation' stamp: 'ARM 4/29/2024 11:00:51'!
motorcycle

	^self new initializeWithType: #Motorcycle! !


!classDefinition: #Helicopter category: #'3.Replace-if-Type+State'!
Vehicle subclass: #Helicopter
	instanceVariableNames: 'altitude'
	classVariableNames: ''
	poolDictionaries: ''
	category: '3.Replace-if-Type+State'!

!Helicopter methodsFor: 'move' stamp: 'as 4/9/2025 12:18:32'!
accelerate

		state accelerate .
! !

!Helicopter methodsFor: 'move' stamp: 'as 4/9/2025 17:10:32'!
altitude: meters

		altitude := altitude + meters. 
! !

!Helicopter methodsFor: 'move' stamp: 'as 4/9/2025 17:45:43'!
boost

	self speed: 10 * kilometer / hour.
	self altitude: 5 * meter .
! !

!Helicopter methodsFor: 'move' stamp: 'as 4/9/2025 17:10:49'!
speed: kilometerPerHour  

		speed := speed + kilometerPerHour .! !


!Helicopter methodsFor: 'initialization' stamp: 'as 4/7/2025 12:19:54'!
initialize 

		super initializeWithType: #Helicopter.
		altitude := 0 * meter.! !


!Helicopter methodsFor: 'on/off' stamp: 'as 4/9/2025 12:24:38'!
turnOff

		state := MotorStateOff new initializeWith: self.
		speed := 0.
		altitude := 0.! !

!Helicopter methodsFor: 'on/off' stamp: 'as 4/9/2025 12:25:33'!
turnOn

		state := MotorStateOn new initializeWith: self.
! !


!Helicopter methodsFor: 'error messages' stamp: 'as 4/9/2025 12:08:33'!
canNotAccelerateErrorMessage

	^'Can not fly when turned off'.! !


!classDefinition: #Motorcycle category: #'3.Replace-if-Type+State'!
Vehicle subclass: #Motorcycle
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '3.Replace-if-Type+State'!

!Motorcycle methodsFor: 'initialization' stamp: 'as 4/7/2025 12:20:11'!
initialize 

	super initializeWithType: #Motorcycle.! !


!Motorcycle methodsFor: 'move' stamp: 'as 4/9/2025 17:03:24'!
accelerate

	state accelerate . ! !

!Motorcycle methodsFor: 'move' stamp: 'as 4/9/2025 17:46:22'!
boost

	self speed: 10 * kilometer / hour.! !

!Motorcycle methodsFor: 'move' stamp: 'as 4/9/2025 17:04:06'!
speed: kilometerPerHour

	speed := speed + kilometerPerHour .! !


!Motorcycle methodsFor: 'error messages' stamp: 'as 4/9/2025 12:26:56'!
canNotAccelerateErrorMessage

	^'Can not run when turned off'.! !


!Motorcycle methodsFor: 'on/off' stamp: 'as 4/9/2025 12:26:32'!
turnOff
	
	state := MotorStateOff new initializeWith: self.
	speed := 0.
! !

!Motorcycle methodsFor: 'on/off' stamp: 'as 4/9/2025 12:26:17'!
turnOn
	
	state := MotorStateOn new initializeWith: self.
! !

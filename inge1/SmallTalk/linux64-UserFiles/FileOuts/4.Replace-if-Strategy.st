!classDefinition: #VehicleTests category: #'4.Replace-if-Strategy'!
TestCase subclass: #VehicleTests
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!

!VehicleTests methodsFor: 'testing' stamp: 'NR 9/7/2024 18:25:03'!
test01LandVehicleCannotAccelerateWhileTurnedOff

	| landVehicle |
	
	landVehicle := Vehicle electricMotorcycle.
	
	self should: [ landVehicle accelerate ] 
	raise: Error 
	withExceptionDo: [ :error | error messageText = 'Can not run when turned off'.
		self assert: (landVehicle speedAt: (0 * kilometer / hour)) ]
	
	
	! !

!VehicleTests methodsFor: 'testing' stamp: 'NR 9/7/2024 18:27:17'!
test02AirVehicleCannotAccelerateWhileTurnedOff

	| airVehicle |
	
	airVehicle := Vehicle helicopter.
	
	self should: [ airVehicle accelerate ] 
	raise: Error 
	withExceptionDo: [ :error | error messageText = 'Can not fly when turned off'.
		self assert: (airVehicle speedAt: (0 * kilometer / hour)).
		self assert: (airVehicle altitudeAt: (0 * meter)) ]
	
	
	! !

!VehicleTests methodsFor: 'testing' stamp: 'NR 9/7/2024 18:52:20'!
test03ElectricVehicleAccelerateAsIntended

	| electricVehicle |
	
	electricVehicle := Vehicle electricMotorcycle.
	
	electricVehicle turnOn.
	self assert: (electricVehicle speedAt: 0 * kilometer / hour).
	
	electricVehicle accelerate.
	self assert: (electricVehicle speedAt: 10 * kilometer / hour).
	
	electricVehicle accelerate.
	self assert: (electricVehicle speedAt: 40 * kilometer / hour)
	
	
	
	
	! !

!VehicleTests methodsFor: 'testing' stamp: 'NR 9/7/2024 18:52:16'!
test04GasolineVehicleAccelerateAsIntended

	| gasolineVehicle |
	
	gasolineVehicle := Vehicle gasolineMotorcycle.
	
	gasolineVehicle turnOn.
	self assert: (gasolineVehicle speedAt: 0 * kilometer / hour).
	
	gasolineVehicle accelerate.
	self assert: (gasolineVehicle speedAt: 10 * kilometer / hour).
	
	gasolineVehicle accelerate.
	self assert: (gasolineVehicle speedAt: 20 * kilometer / hour)
	
	
	
	
	! !

!VehicleTests methodsFor: 'testing' stamp: 'NR 9/7/2024 18:52:11'!
test05JetFueledVehicleAccelerateAsIntended

	| jetFueledVehicle |
	
	jetFueledVehicle := Vehicle helicopter.
	
	jetFueledVehicle turnOn.
	self assert: (jetFueledVehicle speedAt: 0 * kilometer / hour).
	
	jetFueledVehicle accelerate.
	self assert: (jetFueledVehicle speedAt: 1 * kilometer / hour).
	
	jetFueledVehicle accelerate.
	self assert: (jetFueledVehicle speedAt: 5 * kilometer / hour).
	
	jetFueledVehicle accelerate.
	self assert: (jetFueledVehicle speedAt: 41 * kilometer / hour)
	
	
	
	
	! !

!VehicleTests methodsFor: 'testing' stamp: 'NR 9/7/2024 18:47:14'!
test06AirVehicleGoesUpAsItAcceleratesAsExpected

	| airVehicle |
	
	airVehicle := Vehicle helicopter.
	
	airVehicle turnOn.
	self assert: (airVehicle altitudeAt: 0 * meter).
	
	airVehicle accelerate.
	self assert: (airVehicle altitudeAt: 5 * meter).
	
	airVehicle accelerate.
	self assert: (airVehicle altitudeAt: 10 * meter)
	
	! !

!VehicleTests methodsFor: 'testing' stamp: 'NR 9/7/2024 18:52:05'!
test07SpeedLimiterForCityLimitsSpeedAt70Kmh

	| cityVehicle |
	
	cityVehicle := Vehicle electricMotorcycle.
	
	cityVehicle turnOn.
	self assert: (cityVehicle speedAt: 0 * kilometer / hour).
	
	20 timesRepeat: [ cityVehicle accelerate ].
	
	self assert: (cityVehicle speedAt: 70 * kilometer / hour)
	
	
	! !

!VehicleTests methodsFor: 'testing' stamp: 'NR 9/7/2024 18:53:50'!
test08SpeedLimiterForOpenRoadLimitsSpeedAt130Kmh

	| openRoadVehicle |
	
	openRoadVehicle := Vehicle gasolineMotorcycle.
	
	openRoadVehicle turnOn.
	self assert: (openRoadVehicle speedAt: 0 * kilometer / hour).
	
	20 timesRepeat: [ openRoadVehicle accelerate ].
	
	self assert: (openRoadVehicle speedAt: 130 * kilometer / hour)
	
	
	! !

!VehicleTests methodsFor: 'testing' stamp: 'NR 9/7/2024 18:55:32'!
test09SpeedLimiterForAirTrafficLimitsSpeedAt500Kmh

	| vehicleInAir |
	
	vehicleInAir := Vehicle helicopter.
	
	vehicleInAir turnOn.
	self assert: (vehicleInAir speedAt: 0 * kilometer / hour).
	
	20 timesRepeat: [ vehicleInAir accelerate ].
	
	self assert: (vehicleInAir speedAt: 500 * kilometer / hour)
	
	
	! !


!classDefinition: #DrivingPlace category: #'4.Replace-if-Strategy'!
Object subclass: #DrivingPlace
	instanceVariableNames: 'maxLimitSpeed'
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!

!DrivingPlace methodsFor: 'move' stamp: 'as 4/11/2025 16:36:26'!
limitChecker: aVehicleSpeed

	self subclassResponsibility.! !

!DrivingPlace methodsFor: 'move' stamp: 'as 4/11/2025 16:37:49'!
limitExceded

	self subclassResponsibility! !

!DrivingPlace methodsFor: 'move' stamp: 'as 4/11/2025 16:37:54'!
limitNotExceded: vehicleSpeed

	self subclassResponsibility! !


!DrivingPlace methodsFor: 'initialization' stamp: 'as 4/11/2025 16:38:38'!
initialize

	self subclassResponsibility! !


!classDefinition: #City category: #'4.Replace-if-Strategy'!
DrivingPlace subclass: #City
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!

!City methodsFor: 'move' stamp: 'as 4/11/2025 16:36:26'!
limitChecker: vehicleSpeed

	vehicleSpeed > (70 * kilometer / hour) ifTrue: [ ^ 70 * kilometer / hour ].
	^vehicleSpeed .! !

!City methodsFor: 'move' stamp: 'as 4/11/2025 16:40:18'!
limitExceded
	
	^maxLimitSpeed .! !

!City methodsFor: 'move' stamp: 'as 4/11/2025 16:40:09'!
limitNotExceded: vehicleSpeed
	
	^vehicleSpeed .! !


!City methodsFor: 'initialization' stamp: 'as 4/11/2025 16:39:29'!
initialize

	maxLimitSpeed := 70 * kilometer / hour .! !


!classDefinition: #OpenRoad category: #'4.Replace-if-Strategy'!
DrivingPlace subclass: #OpenRoad
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!

!OpenRoad methodsFor: 'move' stamp: 'as 4/11/2025 16:38:38'!
initialize

	self subclassResponsibility .! !

!OpenRoad methodsFor: 'move' stamp: 'as 4/11/2025 16:36:26'!
limitChecker: vehicleSpeed

	vehicleSpeed > (130 * kilometer / hour) ifTrue: [ ^ 130 * kilometer / hour ].
	^vehicleSpeed .! !

!OpenRoad methodsFor: 'move' stamp: 'as 4/11/2025 16:37:49'!
limitExceded
	
	self subclassResponsibility .! !

!OpenRoad methodsFor: 'move' stamp: 'as 4/11/2025 16:37:54'!
limitNotExceded: vehicleSpeed
	
	self subclassResponsibility .! !


!classDefinition: #Skie category: #'4.Replace-if-Strategy'!
DrivingPlace subclass: #Skie
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!

!Skie methodsFor: 'move' stamp: 'as 4/11/2025 16:38:38'!
initialize

	self subclassResponsibility .! !

!Skie methodsFor: 'move' stamp: 'as 4/11/2025 16:36:26'!
limitChecker: vehicleSpeed

	vehicleSpeed > (500 * kilometer / hour) ifTrue: [^500 * kilometer / hour ].
	^vehicleSpeed.! !

!Skie methodsFor: 'move' stamp: 'as 4/11/2025 16:37:49'!
limitExceded
	
	self subclassResponsibility .! !

!Skie methodsFor: 'move' stamp: 'as 4/11/2025 16:37:54'!
limitNotExceded: vehicleSpeed
	
	self subclassResponsibility .! !


!classDefinition: #EngineType category: #'4.Replace-if-Strategy'!
Object subclass: #EngineType
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!

!EngineType methodsFor: 'move' stamp: 'as 4/11/2025 15:23:16'!
calculateAcceleration: vehicleSpeed

	self subclassResponsibility .! !


!classDefinition: #ElectricEngine category: #'4.Replace-if-Strategy'!
EngineType subclass: #ElectricEngine
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!

!ElectricEngine methodsFor: 'move' stamp: 'as 4/11/2025 12:08:36'!
calculateAcceleration: vehicleSpeed 

	 ^(vehicleSpeed + (5 * kilometer / hour)) * 2 ! !


!classDefinition: #GasolineEngine category: #'4.Replace-if-Strategy'!
EngineType subclass: #GasolineEngine
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!

!GasolineEngine methodsFor: 'move' stamp: 'as 4/11/2025 12:07:02'!
calculateAcceleration: vehicleSpeed

	^ 10 * kilometer / hour .! !


!classDefinition: #JetFueledEngine category: #'4.Replace-if-Strategy'!
EngineType subclass: #JetFueledEngine
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!

!JetFueledEngine methodsFor: 'move' stamp: 'as 4/11/2025 11:59:26'!
calculateAcceleration: vehicleSpeed

	^((vehicleSpeed amount + 1) ^ 2) * kilometer / hour.! !


!classDefinition: #PowerState category: #'4.Replace-if-Strategy'!
Object subclass: #PowerState
	instanceVariableNames: 'vehicle'
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!

!PowerState methodsFor: 'initialization' stamp: 'as 4/10/2025 16:48:53'!
initializePowerOf: aVehicle

	vehicle := aVehicle .! !


!PowerState methodsFor: 'move' stamp: 'as 4/10/2025 16:48:20'!
accelerate

	self subclassResponsibility .! !


!classDefinition: #PowerStateOff category: #'4.Replace-if-Strategy'!
PowerState subclass: #PowerStateOff
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!

!PowerStateOff methodsFor: 'move' stamp: 'as 4/11/2025 12:19:00'!
accelerate

	vehicle accelerateWhenPowerStateOff.! !


!classDefinition: #PowerStateOn category: #'4.Replace-if-Strategy'!
PowerState subclass: #PowerStateOn
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!

!PowerStateOn methodsFor: 'move' stamp: 'as 4/11/2025 12:49:50'!
accelerate

	vehicle accelerateWhenPowerStateOn .! !


!classDefinition: #SpeedLimitState category: #'4.Replace-if-Strategy'!
Object subclass: #SpeedLimitState
	instanceVariableNames: 'maxSpeedLimit'
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!

!SpeedLimitState methodsFor: 'initialization' stamp: 'as 4/11/2025 16:23:21'!
initializeWithSpeedLimit: aSpeedLimit

	maxSpeedLimit := aSpeedLimit .! !


!SpeedLimitState methodsFor: 'verification' stamp: 'as 4/11/2025 16:25:56'!
limitChecker: speed

	self subclassResponsibility .! !


!classDefinition: #LimitExceeded category: #'4.Replace-if-Strategy'!
SpeedLimitState subclass: #LimitExceeded
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!

!LimitExceeded methodsFor: 'verification' stamp: 'as 4/11/2025 16:25:56'!
limitChecker: vehicleSpeed

	^ maxSpeedLimit.
	! !


!classDefinition: #LimitNotExceeded category: #'4.Replace-if-Strategy'!
SpeedLimitState subclass: #LimitNotExceeded
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!

!LimitNotExceeded methodsFor: 'verification' stamp: 'as 4/11/2025 16:25:56'!
limitChecker: vehicleSpeed

	^vehicleSpeed .

	! !


!classDefinition: #Vehicle category: #'4.Replace-if-Strategy'!
Object subclass: #Vehicle
	instanceVariableNames: 'powerState speed engineType where'
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!

!Vehicle methodsFor: 'initialization' stamp: 'as 4/11/2025 15:55:12'!
initializeWithEngineType: engine withPlace: drivePlace  

	self subclassResponsibility .
! !


!Vehicle methodsFor: 'move' stamp: 'as 4/11/2025 12:08:16'!
accelerate

	powerState accelerate.! !

!Vehicle methodsFor: 'move' stamp: 'as 4/11/2025 12:19:29'!
accelerateWhenPowerStateOff

	self subclassResponsibility .! !

!Vehicle methodsFor: 'move' stamp: 'as 4/11/2025 15:46:01'!
accelerateWhenPowerStateOn

	speed := speed + (engineType calculateAcceleration: speed).
	speed := where limit: speed.! !

!Vehicle methodsFor: 'move' stamp: 'NR 9/7/2024 18:23:27'!
speedAt: aSpeed

	^ speed = aSpeed! !


!Vehicle methodsFor: 'on/off' stamp: 'as 4/11/2025 15:35:12'!
turnOff

	powerState := PowerStateOff new initializePowerOf: self.
	speed  := 0 * kilometer / hour .! !

!Vehicle methodsFor: 'on/off' stamp: 'as 4/10/2025 16:48:54'!
turnOn

	powerState := PowerStateOn new initializePowerOf: self.! !


!Vehicle methodsFor: 'error messages' stamp: 'as 4/10/2025 16:10:13'!
canNotAccelerateErrorMessage

	self subclassResponsibility .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Vehicle class' category: #'4.Replace-if-Strategy'!
Vehicle class
	instanceVariableNames: ''!

!Vehicle class methodsFor: 'instance creation' stamp: 'as 4/11/2025 15:44:43'!
electricMotorcycle

	^ Motorcycle new initializeWithEngineType: ElectricEngine new withPlace: City new.
! !

!Vehicle class methodsFor: 'instance creation' stamp: 'as 4/11/2025 15:43:45'!
gasolineMotorcycle

	^ Motorcycle new initializeWithEngineType: GasolineEngine new withPlace: OpenRoad new.! !

!Vehicle class methodsFor: 'instance creation' stamp: 'as 4/11/2025 15:58:46'!
helicopter

	^ Helicopter new initializeWithEngineType: JetFueledEngine new withPlace: Skie new.! !


!classDefinition: #Helicopter category: #'4.Replace-if-Strategy'!
Vehicle subclass: #Helicopter
	instanceVariableNames: 'altitude'
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!

!Helicopter methodsFor: 'error messages' stamp: 'as 4/10/2025 16:11:58'!
canNotAccelerateErrorMessage
	
	^'Can not fly when turned off'! !


!Helicopter methodsFor: 'initialization' stamp: 'as 4/11/2025 15:56:49'!
initializeWithEngineType: engine withPlace: drivePlace 

		self turnOff.
		where := drivePlace .
		engineType := engine.! !


!Helicopter methodsFor: 'move' stamp: 'as 4/11/2025 12:18:00'!
accelerateWhenPowerStateOff

	self error: self canNotAccelerateErrorMessage .! !

!Helicopter methodsFor: 'move' stamp: 'as 4/11/2025 15:47:59'!
accelerateWhenPowerStateOn

	super accelerateWhenPowerStateOn .
	altitude := altitude + (5 * meter).
! !

!Helicopter methodsFor: 'move' stamp: 'as 4/10/2025 17:08:09'!
altitudeAt: anAltitude

	^ altitude = anAltitude.
! !


!Helicopter methodsFor: 'on/off' stamp: 'as 4/11/2025 15:34:45'!
turnOff

	super turnOff .
	altitude := 0 * meter.
! !


!classDefinition: #Motorcycle category: #'4.Replace-if-Strategy'!
Vehicle subclass: #Motorcycle
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!

!Motorcycle methodsFor: 'error messages' stamp: 'as 4/10/2025 16:13:43'!
canNotAccelerateErrorMessage

	^'Can not run when turned off'.! !


!Motorcycle methodsFor: 'initialization' stamp: 'as 4/11/2025 15:53:46'!
initializeWithEngineType: engine withPlace: drivePlace 

	super turnOff.
	where := drivePlace .
	engineType := engine .! !


!Motorcycle methodsFor: 'move' stamp: 'as 4/11/2025 12:20:31'!
accelerateWhenPowerStateOff

	self error: self canNotAccelerateErrorMessage .! !

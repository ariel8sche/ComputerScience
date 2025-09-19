!classDefinition: #Automobile category: #'1.Replace-if-Strategy'!
Object subclass: #Automobile
	instanceVariableNames: 'speed engineType'
	classVariableNames: ''
	poolDictionaries: ''
	category: '1.Replace-if-Strategy'!

!Automobile methodsFor: 'initialization' stamp: 'AS 9/19/2025 12:51:29'!
initializeWithEngineType: anEngineType
	
	engineType := anEngineType.
	speed := 0 * kilometer / hour! !


!Automobile methodsFor: 'move' stamp: 'AS 9/19/2025 12:51:17'!
accelerate
	
	engineType accelerate: self.! !

!Automobile methodsFor: 'move' stamp: 'AS 9/19/2025 12:39:10'!
accelerateElectricEngine
	
	speed := speed + ((speed + (5 * kilometer / hour))* 2)! !

!Automobile methodsFor: 'move' stamp: 'AS 9/19/2025 12:39:34'!
accelerateGasolineEngine
	
	speed := speed + (10 * kilometer / hour)! !

!Automobile methodsFor: 'move' stamp: 'AS 9/19/2025 12:39:56'!
accelerateJetFueledEngine
	
	speed := speed + (((speed amount + 1) ^ 2) * kilometer / hour).! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Automobile class' category: #'1.Replace-if-Strategy'!
Automobile class
	instanceVariableNames: ''!

!Automobile class methodsFor: 'instance creation' stamp: 'AS 9/19/2025 12:51:34'!
electric

	^ self new initializeWithEngineType: ElectricEngine new

! !

!Automobile class methodsFor: 'instance creation' stamp: 'AS 9/19/2025 12:51:37'!
gasoline

	^ self new initializeWithEngineType: GasolineEngine new! !

!Automobile class methodsFor: 'instance creation' stamp: 'AS 9/19/2025 12:51:40'!
jetFueled

	^ self new initializeWithEngineType:  JetFueledEngine new! !


!classDefinition: #EngineType category: #'1.Replace-if-Strategy'!
Object subclass: #EngineType
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '1.Replace-if-Strategy'!

!EngineType methodsFor: 'move' stamp: 'AS 9/19/2025 12:48:16'!
accelerate: anAutomobile

	self subclassResponsibility! !


!classDefinition: #ElectricEngine category: #'1.Replace-if-Strategy'!
EngineType subclass: #ElectricEngine
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '1.Replace-if-Strategy'!

!ElectricEngine methodsFor: 'move' stamp: 'AS 9/19/2025 12:48:26'!
accelerate: anAutomobile

	anAutomobile accelerateElectricEngine .! !


!classDefinition: #GasolineEngine category: #'1.Replace-if-Strategy'!
EngineType subclass: #GasolineEngine
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '1.Replace-if-Strategy'!

!GasolineEngine methodsFor: 'move' stamp: 'AS 9/19/2025 12:48:30'!
accelerate: anAutomobile

	anAutomobile accelerateGasolineEngine .! !


!classDefinition: #JetFueledEngine category: #'1.Replace-if-Strategy'!
EngineType subclass: #JetFueledEngine
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '1.Replace-if-Strategy'!

!JetFueledEngine methodsFor: 'move' stamp: 'AS 9/19/2025 12:48:34'!
accelerate: anAutomobile

	anAutomobile accelerateJetFueledEngine .! !

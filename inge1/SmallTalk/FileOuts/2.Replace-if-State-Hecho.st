!classDefinition: #Automobile category: #'2.Replace-if-State'!
Object subclass: #Automobile
	instanceVariableNames: 'state speed'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2.Replace-if-State'!

!Automobile methodsFor: 'initialization' stamp: 'AS 9/19/2025 13:29:06'!
initialize

	state := PowerOff new.
	speed := 0 * kilometer / hour! !


!Automobile methodsFor: 'move' stamp: 'AS 9/19/2025 13:31:42'!
accelerate

	state accelerate: self.! !

!Automobile methodsFor: 'move' stamp: 'AS 9/19/2025 13:31:01'!
accelerateWhenPowerOff

	self error: 'Can not accelerate when turned off'! !

!Automobile methodsFor: 'move' stamp: 'AS 9/19/2025 13:31:19'!
accelerateWhenPowerOn

	speed := speed + (10 * kilometer / hour)! !

!Automobile methodsFor: 'move' stamp: 'AS 9/19/2025 13:29:21'!
turnOn

	state := PowerOn new! !


!classDefinition: #PowerState category: #'2.Replace-if-State'!
Object subclass: #PowerState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2.Replace-if-State'!

!PowerState methodsFor: 'move' stamp: 'AS 9/19/2025 13:32:08'!
accelerate: anAutomobile

	self subclassResponsibility! !


!classDefinition: #PowerOff category: #'2.Replace-if-State'!
PowerState subclass: #PowerOff
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2.Replace-if-State'!

!PowerOff methodsFor: 'move' stamp: 'AS 9/19/2025 13:32:29'!
accelerate: anAutomobile

	anAutomobile accelerateWhenPowerOff ! !


!classDefinition: #PowerOn category: #'2.Replace-if-State'!
PowerState subclass: #PowerOn
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2.Replace-if-State'!

!PowerOn methodsFor: 'move' stamp: 'AS 9/19/2025 13:32:21'!
accelerate: anAutomobile

	anAutomobile accelerateWhenPowerOn ! !

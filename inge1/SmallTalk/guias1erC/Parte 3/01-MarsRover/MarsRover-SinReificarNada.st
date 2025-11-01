!classDefinition: #MarsRoverTestCase category: #MarsRover!
TestCase subclass: #MarsRoverTestCase
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverTestCase methodsFor: 'testing' stamp: 'HAW 10/23/2017 16:55:29'!
test00MarsRoverStartsAtInitialPositionHeadingNorth

	| initialPosition rover |
	
	initialPosition := 1@1.
	rover := MarsRover startingAt: initialPosition.
	
	self assert: initialPosition equals: rover position.
	self assert: rover isHeadingNorth! !

!MarsRoverTestCase methodsFor: 'testing' stamp: 'HAW 10/23/2017 16:55:46'!
test01MarsRoverDoesNothingWhenNoCommandIsSent

	| initialPosition rover |
	
	initialPosition := 1@1.
	rover := MarsRover startingAt: initialPosition.
	
	rover move: ''.
	
	self assert: initialPosition equals: rover position.
	self assert: rover isHeadingNorth! !

!MarsRoverTestCase methodsFor: 'testing' stamp: 'HAW 10/23/2017 16:56:43'!
test02MovesForwardAddsOneHeadingPoint

	| initialPosition rover |
	
	initialPosition := 1@1.
	rover := MarsRover startingAt: initialPosition.
	
	rover move: 'f'.
	
	self assert: initialPosition + (0@1) equals: rover position.
	self assert: rover isHeadingNorth! !

!MarsRoverTestCase methodsFor: 'testing' stamp: 'HAW 10/23/2017 16:57:25'!
test03ManyMoveForwardCanBeSent

	| initialPosition rover |
	
	initialPosition := 1@1.
	rover := MarsRover startingAt: initialPosition.
	
	rover move: 'ff'.
	
	self assert: initialPosition + (0@2) equals: rover position.
	self assert: rover isHeadingNorth! !

!MarsRoverTestCase methodsFor: 'testing' stamp: 'HAW 10/23/2017 16:57:58'!
test04HeadsWestWhenHeadingNorthAndLeftCommandIsIssued

	| initialPosition rover |
	
	initialPosition := 1@1.
	rover := MarsRover startingAt: initialPosition.
	
	rover move: 'l'.
	
	self assert: initialPosition equals: rover position.
	self assert: rover isHeadingWest! !

!MarsRoverTestCase methodsFor: 'testing' stamp: 'HAW 10/23/2017 16:58:37'!
test05MoveForwardMovesWestOnePointWhenHeadingWest

	| initialPosition rover |
	
	initialPosition := 1@1.
	rover := MarsRover startingAt: initialPosition.
	
	rover move: 'lf'.
	
	self assert: initialPosition + (-1@0) equals: rover position.
	self assert: rover isHeadingWest! !

!MarsRoverTestCase methodsFor: 'testing' stamp: 'HAW 10/23/2017 16:59:12'!
test06MoveForwardMovesEastOnePointWhenHeadingEast

	| initialPosition rover |
	
	initialPosition := 1@1.
	rover := MarsRover startingAt: initialPosition.
	
	rover move: 'rf'.
	
	self assert: initialPosition + (1@0) equals: rover position.
	self assert: rover isHeadingEast! !

!MarsRoverTestCase methodsFor: 'testing' stamp: 'HAW 10/23/2017 16:59:41'!
test07RotateLeftMovesHeadingCounterClockwise

	| initialPosition rover |
	
	initialPosition := 1@1.
	rover := MarsRover startingAt: initialPosition.
	
	rover move: 'llf'.
	
	self assert: initialPosition + (0@-1) equals: rover position.
	self assert: rover isHeadingSouth! !

!MarsRoverTestCase methodsFor: 'testing' stamp: 'HAW 10/23/2017 17:00:23'!
test08FourRotateRigthMakesACompleteCircle

	| initialPosition rover |
	
	initialPosition := 1@1.
	rover := MarsRover startingAt: initialPosition.
	
	rover move: 'rrrrf'.
	
	self assert: initialPosition + (0@1) equals: rover position.
	self assert: rover isHeadingNorth! !

!MarsRoverTestCase methodsFor: 'testing' stamp: 'HAW 10/23/2017 17:00:40'!
test09FourRotateLeftMakesACompleteCircle

	| initialPosition rover |
	
	initialPosition := 1@1.
	rover := MarsRover startingAt: initialPosition.
	
	rover move: 'llllf'.
	
	self assert: initialPosition + (0@1) equals: rover position.
	self assert: rover isHeadingNorth! !

!MarsRoverTestCase methodsFor: 'testing' stamp: 'HAW 10/23/2017 17:01:49'!
test10BackwardsMovesOnePointToTheOpositeHeadingPositionWhenHeadingVertical

	| initialPosition rover |
	
	initialPosition := 1@1.
	rover := MarsRover startingAt: initialPosition.
	
	rover move: 'b'.
	
	self assert: initialPosition + (0@-1) equals: rover position.
	self assert: rover isHeadingNorth! !

!MarsRoverTestCase methodsFor: 'testing' stamp: 'HAW 10/23/2017 17:02:05'!
test11BackwardsMovesOnePointToTheOpositeHeadingPositionWhenHeadingHorizontal

	| initialPosition rover |
	
	initialPosition := 1@1.
	rover := MarsRover startingAt: initialPosition.
	
	rover move: 'lb'.
	
	self assert: initialPosition + (1@0) equals: rover position.
	self assert: rover isHeadingWest! !

!MarsRoverTestCase methodsFor: 'testing' stamp: 'HAW 10/23/2017 17:02:20'!
test12InvalidCommandAreNotAccepted

	| initialPosition rover |
	
	initialPosition := 1@1.
	rover := MarsRover startingAt: initialPosition.
	
	self 
		should: [ rover move: 'x' ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [:anError |
			self assert: MarsRover invalidCommandErrorMessage equals: anError messageText.
			self assert: initialPosition equals: rover position.
			self assert: rover isHeadingNorth ]! !

!MarsRoverTestCase methodsFor: 'testing' stamp: 'HAW 10/23/2017 17:02:38'!
test13PreviousCommandsBeforeAnInvalidOneAreExecuted

	| initialPosition rover |
	
	initialPosition := 1@1.
	rover := MarsRover startingAt: initialPosition.
	
	self 
		should: [ rover move: 'fx' ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [:anError |
			self assert: MarsRover invalidCommandErrorMessage equals: anError messageText.
			self assert: initialPosition + (0@1) equals: rover position.
			self assert: rover isHeadingNorth ]! !


!classDefinition: #MarsRover category: #MarsRover!
Object subclass: #MarsRover
	instanceVariableNames: 'position headingIndex'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRover methodsFor: 'initialization' stamp: 'HAW 10/23/2017 16:10:10'!
initializeStartingAt: initialPosition

	position := initialPosition.
	headingIndex := 1! !


!MarsRover methodsFor: 'position' stamp: 'HAW 10/23/2017 15:36:14'!
position
	
	^position! !


!MarsRover methodsFor: 'moving' stamp: 'HAW 10/23/2017 16:33:51'!
move: aCommandSequence

	aCommandSequence do: [ :aCommand | self processCommand: aCommand ]! !


!MarsRover methodsFor: 'moving - private' stamp: 'HAW 10/23/2017 16:26:15'!
moveBackward
	
	position := position + self moveBackwardPoint! !

!MarsRover methodsFor: 'moving - private' stamp: 'HAW 10/23/2017 16:18:41'!
moveForward
	
	position := position + self headingPoint! !

!MarsRover methodsFor: 'moving - private' stamp: 'HAW 7/6/2018 18:29:04'!
processCommand: aCommand

	(self isForwardCommand: aCommand) ifTrue: [ ^ self moveForward ].
	(self isBackwardCommand: aCommand) ifTrue: [ ^ self moveBackward ].
	(self isRotateRightCommand: aCommand) ifTrue: [ ^ self rotateRight ].
	(self isRotateLeftCommand: aCommand) ifTrue: [ ^ self rotateLeft ].

	self signalInvalidCommandError.! !

!MarsRover methodsFor: 'moving - private' stamp: 'HAW 10/23/2017 16:37:43'!
rotateLeft
	
	headingIndex := headingIndex - 1.
	headingIndex = 0 ifTrue: [ headingIndex := self headingPointsSize ].! !

!MarsRover methodsFor: 'moving - private' stamp: 'HAW 10/23/2017 16:38:15'!
rotateRight
	
	headingIndex := headingIndex + 1.
	headingIndex > self headingPointsSize ifTrue: [ headingIndex := 1 ].! !

!MarsRover methodsFor: 'moving - private' stamp: 'HAW 10/23/2017 16:34:53'!
signalInvalidCommandError
	
	self error: self class invalidCommandErrorMessage! !


!MarsRover methodsFor: 'heading points - private' stamp: 'HAW 10/23/2017 16:07:52'!
eastHeadingPoint
	
	^self class eastHeadingPoint ! !

!MarsRover methodsFor: 'heading points - private' stamp: 'HAW 10/23/2017 16:11:55'!
headingPoint

	^self headingPoints at: headingIndex ! !

!MarsRover methodsFor: 'heading points - private' stamp: 'HAW 10/23/2017 16:12:18'!
headingPoints
	
	^self class headingPoints ! !

!MarsRover methodsFor: 'heading points - private' stamp: 'HAW 10/23/2017 16:37:57'!
headingPointsSize
	
	^self headingPoints size! !

!MarsRover methodsFor: 'heading points - private' stamp: 'HAW 10/23/2017 16:26:37'!
moveBackwardPoint
	
	^self headingPoints at: headingIndex + 1 \\ 4 + 1! !

!MarsRover methodsFor: 'heading points - private' stamp: 'HAW 10/23/2017 16:07:31'!
northHeadingPoint
	
	^self class northHeadingPoint ! !

!MarsRover methodsFor: 'heading points - private' stamp: 'HAW 10/23/2017 16:14:50'!
southHeadingPoint
	
	^self class southHeadingPoint ! !

!MarsRover methodsFor: 'heading points - private' stamp: 'HAW 10/23/2017 16:08:42'!
westHeadingPoint
	
	^self class westHeadingPoint 
	! !


!MarsRover methodsFor: 'testing' stamp: 'HAW 7/6/2018 18:16:51'!
isBackwardCommand: aCommand

	^aCommand = $b! !

!MarsRover methodsFor: 'testing' stamp: 'HAW 7/6/2018 18:16:19'!
isForwardCommand: aCommand

	^aCommand = $f ! !

!MarsRover methodsFor: 'testing' stamp: 'HAW 10/23/2017 16:11:05'!
isHeadingEast
	
	^self headingPoint = self eastHeadingPoint ! !

!MarsRover methodsFor: 'testing' stamp: 'HAW 10/23/2017 16:11:24'!
isHeadingNorth
	
	^self headingPoint = self northHeadingPoint ! !

!MarsRover methodsFor: 'testing' stamp: 'HAW 10/23/2017 16:14:36'!
isHeadingSouth
	
	^self headingPoint = self southHeadingPoint! !

!MarsRover methodsFor: 'testing' stamp: 'HAW 10/23/2017 16:11:28'!
isHeadingWest
	
	^self headingPoint = self westHeadingPoint! !

!MarsRover methodsFor: 'testing' stamp: 'HAW 7/6/2018 18:17:51'!
isRotateLeftCommand: aCommand

	^aCommand = $l! !

!MarsRover methodsFor: 'testing' stamp: 'HAW 7/6/2018 18:17:21'!
isRotateRightCommand: aCommand

	^aCommand = $r! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: #MarsRover!
MarsRover class
	instanceVariableNames: 'headingPoints'!

!MarsRover class methodsFor: 'instance creation' stamp: 'HAW 10/23/2017 15:35:21'!
startingAt: initialPosition

	^self new initializeStartingAt: initialPosition 
	
	! !


!MarsRover class methodsFor: 'heading points' stamp: 'HAW 10/23/2017 16:07:58'!
eastHeadingPoint
	
	^1@0! !

!MarsRover class methodsFor: 'heading points' stamp: 'HAW 10/23/2017 16:09:27'!
headingPoints

	headingPoints ifNil: [headingPoints := Array 
		with: self northHeadingPoint 
		with: self eastHeadingPoint
		with: self southHeadingPoint
		with: self westHeadingPoint ].
	
	^headingPoints! !

!MarsRover class methodsFor: 'heading points' stamp: 'HAW 10/23/2017 16:07:35'!
northHeadingPoint
	
	^0@1! !

!MarsRover class methodsFor: 'heading points' stamp: 'HAW 10/23/2017 16:08:25'!
southHeadingPoint
	
	^0@-1! !

!MarsRover class methodsFor: 'heading points' stamp: 'HAW 10/23/2017 16:08:46'!
westHeadingPoint
	
	^-1@0! !


!MarsRover class methodsFor: 'exceptions' stamp: 'HAW 10/23/2017 16:35:15'!
invalidCommandErrorMessage
	
	^'Invalid command'! !

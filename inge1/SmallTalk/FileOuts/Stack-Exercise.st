!classDefinition: #OOStack category: #'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'items state'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'as yet unclassified' stamp: 'AS 9/19/2025 21:55:10'!
initialize

	items := OrderedCollection new.
	state := EmptyOOStackState for: self.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'AS 9/19/2025 21:14:42'!
isEmpty

	^items size = 0.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'AS 9/19/2025 22:03:59'!
pop

	^state pop.
	! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'AS 9/19/2025 21:59:44'!
popFromEmptyStack

	^self error: OOStack stackEmptyErrorDescription .
	! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'AS 9/19/2025 21:57:18'!
popFromNotEmptyStack

	^items removeLast .
	! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'AS 9/19/2025 21:56:04'!
push: anItem

	state := NonEmptyOOStackState for: self.
	items add: anItem.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'AS 9/19/2025 21:19:39'!
size

	^items size.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'AS 9/19/2025 22:07:51'!
top

	^state top.
	! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'AS 9/19/2025 21:59:48'!
topFromEmptyStack

	^self error: OOStack stackEmptyErrorDescription .
	! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'AS 9/19/2025 21:57:35'!
topFromNotEmptyStack

	^items at: items size .
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: #'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'NR 9/14/2023 08:12:21'!
stackEmptyErrorDescription
	
	^ 'stack is empty!!!!!!'! !


!classDefinition: #OOStackState category: #'Stack-Exercise'!
Object subclass: #OOStackState
	instanceVariableNames: 'stack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackState methodsFor: 'as yet unclassified' stamp: 'AS 9/19/2025 21:54:59'!
initializeStack: aStack

	stack := aStack .! !

!OOStackState methodsFor: 'as yet unclassified' stamp: 'AS 9/19/2025 22:01:42'!
pop

	self subclassResponsibility.! !

!OOStackState methodsFor: 'as yet unclassified' stamp: 'AS 9/19/2025 22:01:44'!
top

	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStackState class' category: #'Stack-Exercise'!
OOStackState class
	instanceVariableNames: ''!

!OOStackState class methodsFor: 'as yet unclassified' stamp: 'AS 9/19/2025 22:02:51'!
for: aStack

	^self new initializeStack: aStack .! !


!classDefinition: #EmptyOOStackState category: #'Stack-Exercise'!
OOStackState subclass: #EmptyOOStackState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!EmptyOOStackState methodsFor: 'as yet unclassified' stamp: 'AS 9/19/2025 22:00:48'!
pop

	stack popFromEmptyStack .! !

!EmptyOOStackState methodsFor: 'as yet unclassified' stamp: 'AS 9/19/2025 22:00:55'!
top

	stack topFromEmptyStack .! !


!classDefinition: #NonEmptyOOStackState category: #'Stack-Exercise'!
OOStackState subclass: #NonEmptyOOStackState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!NonEmptyOOStackState methodsFor: 'as yet unclassified' stamp: 'AS 9/19/2025 22:03:41'!
pop

	^stack popFromNotEmptyStack ! !

!NonEmptyOOStackState methodsFor: 'as yet unclassified' stamp: 'AS 9/19/2025 22:01:18'!
top

	stack topFromNotEmptyStack ! !


!classDefinition: #SentenceFinderByPrefix category: #'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!


!classDefinition: #OOStackTest category: #'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:29:55'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:01'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:09'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'NR 9/16/2021 17:40:17'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'firstSomething'.
	secondPushedObject := 'secondSomething'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:20'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:24'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:26'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:31'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:44'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !


!classDefinition: #SentenceFinderByPrefixTest category: #'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

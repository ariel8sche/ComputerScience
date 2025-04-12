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


!classDefinition: #OOStack category: #'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'stack stackState'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'initialization' stamp: 'as 4/11/2025 21:44:07'!
initialize

	stack := OrderedCollection new.
	stackState := EmptyStack new initializeWithStack: self.! !


!OOStack methodsFor: 'accessing' stamp: 'as 4/11/2025 21:44:22'!
isEmpty

	^ stack isEmpty.! !

!OOStack methodsFor: 'accessing' stamp: 'as 4/11/2025 21:05:05'!
size

	^ stack size.! !

!OOStack methodsFor: 'accessing' stamp: 'as 4/12/2025 11:23:59'!
top

	^stackState top.! !

!OOStack methodsFor: 'accessing' stamp: 'as 4/11/2025 21:46:28'!
topAsEmpty

	self error: OOStack stackEmptyErrorDescription.! !

!OOStack methodsFor: 'accessing' stamp: 'as 4/11/2025 21:49:57'!
topAsNotEmpty

	^stack first.! !


!OOStack methodsFor: 'modifiers' stamp: 'as 4/11/2025 21:40:10'!
pop

	^ stackState pop.! !

!OOStack methodsFor: 'modifiers' stamp: 'as 4/11/2025 21:46:08'!
popAsEmpty

	self error: OOStack stackEmptyErrorDescription! !

!OOStack methodsFor: 'modifiers' stamp: 'as 4/11/2025 21:48:30'!
popAsNotEmpty

	^stack removeFirst .! !

!OOStack methodsFor: 'modifiers' stamp: 'as 4/12/2025 11:23:03'!
push: anElement

	stackState push: anElement .! !

!OOStack methodsFor: 'modifiers' stamp: 'as 4/11/2025 21:43:48'!
pushAsEmpty: anElement

	stackState := NotEmptyStack new initializeWithStack: self.
	stack addFirst: anElement .! !

!OOStack methodsFor: 'modifiers' stamp: 'as 4/11/2025 21:49:24'!
pushAsNotEmpty: anElement

	stack addFirst: anElement .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: #'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'NR 9/14/2023 08:12:21'!
stackEmptyErrorDescription
	
	^ 'stack is empty!!!!!!'! !


!classDefinition: #OOStackState category: #'Stack-Exercise'!
Object subclass: #OOStackState
	instanceVariableNames: 'linkedStack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackState methodsFor: 'as yet unclassified' stamp: 'as 4/11/2025 21:38:44'!
initializeWithStack: aStack

	linkedStack := aStack .! !

!OOStackState methodsFor: 'as yet unclassified' stamp: 'as 4/11/2025 21:37:28'!
pop

	self subclassResponsibility! !

!OOStackState methodsFor: 'as yet unclassified' stamp: 'as 4/11/2025 21:41:10'!
push: anElement

	self subclassResponsibility! !

!OOStackState methodsFor: 'as yet unclassified' stamp: 'as 4/11/2025 21:37:33'!
top

	self subclassResponsibility! !


!classDefinition: #EmptyStack category: #'Stack-Exercise'!
OOStackState subclass: #EmptyStack
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!EmptyStack methodsFor: 'as yet unclassified' stamp: 'as 4/11/2025 21:52:51'!
pop

	^linkedStack popAsEmpty .! !

!EmptyStack methodsFor: 'as yet unclassified' stamp: 'as 4/11/2025 21:52:42'!
push: anElement

	^linkedStack pushAsEmpty: anElement .
	! !

!EmptyStack methodsFor: 'as yet unclassified' stamp: 'as 4/11/2025 21:52:57'!
top

	^linkedStack topAsEmpty.! !


!classDefinition: #NotEmptyStack category: #'Stack-Exercise'!
OOStackState subclass: #NotEmptyStack
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!NotEmptyStack methodsFor: 'as yet unclassified' stamp: 'as 4/11/2025 21:50:13'!
pop

	^linkedStack popAsNotEmpty .! !

!NotEmptyStack methodsFor: 'as yet unclassified' stamp: 'as 4/11/2025 21:50:42'!
push: anElement

	^linkedStack pushAsNotEmpty: anElement .! !

!NotEmptyStack methodsFor: 'as yet unclassified' stamp: 'as 4/11/2025 21:50:52'!
top

	^ linkedStack topAsNotEmpty.! !


!classDefinition: #SentenceFinderByPrefix category: #'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

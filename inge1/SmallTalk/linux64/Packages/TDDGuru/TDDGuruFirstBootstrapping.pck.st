'From Cuis 5.0 [latest update: #4129] on 2 May 2020 at 12:43:36 pm'!
'Description Fix due to move of stampFrom: to CompiledMethod'!
!provides: 'TDDGuruFirstBootstrapping' 1 4!
SystemOrganization addCategory: #TDDGuruFirstBootstrapping!


!classDefinition: #TestRunChangeRecord category: #TDDGuruFirstBootstrapping!
ChangeListElement subclass: #TestRunChangeRecord
	instanceVariableNames: 'className selector result stamp'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDDGuruFirstBootstrapping'!
!classDefinition: 'TestRunChangeRecord class' category: #TDDGuruFirstBootstrapping!
TestRunChangeRecord class
	instanceVariableNames: ''!


!TestRunChangeRecord methodsFor: 'accessing' stamp: 'MGD 9/24/2019 16:13:01'!
changeClass
	^ nil ! !

!TestRunChangeRecord methodsFor: 'accessing' stamp: 'MGD 9/3/2019 11:59:45'!
changeClassName
	^ className ! !

!TestRunChangeRecord methodsFor: 'accessing' stamp: 'MGD 3/14/2019 10:40:37'!
changeType
	^ #testRun! !

!TestRunChangeRecord methodsFor: 'accessing' stamp: 'MGD 5/2/2019 18:45:49'!
isError
	^ result = 'ERROR'! !

!TestRunChangeRecord methodsFor: 'accessing' stamp: 'MGD 4/6/2019 18:46:26'!
isFailure
	^ result = 'FAILURE'! !

!TestRunChangeRecord methodsFor: 'accessing' stamp: 'MGD 4/6/2019 16:13:26'!
isPassed
	^ result = 'PASSED'! !

!TestRunChangeRecord methodsFor: 'accessing' stamp: 'MGD 4/6/2019 16:46:00'!
methodSelector
	^selector! !

!TestRunChangeRecord methodsFor: 'accessing' stamp: 'MGD 9/27/2019 00:23:31'!
result
	^ result! !

!TestRunChangeRecord methodsFor: 'accessing' stamp: 'HAW 10/26/2019 22:57:12'!
stamp

	^ stamp! !

!TestRunChangeRecord methodsFor: 'accessing' stamp: 'MGD 9/27/2019 00:24:53'!
string
	^ 'testRun: ', self changeClassName,' ', self methodSelector, ' ', self result, '; ', self stamp.! !

!TestRunChangeRecord methodsFor: 'initialization' stamp: 'MGD 11/26/2019 14:39:58'!
fileIn
! !

!TestRunChangeRecord methodsFor: 'initialization' stamp: 'HAW 10/26/2019 22:57:18'!
testCase: aClassName selector: aSelector result: aString stamp: aStamp

	className := aClassName.
	selector := aSelector.
	result := aString.
	stamp := aStamp.! !

!ChangeList methodsFor: '*TDDGuruFirstBootstrapping' stamp: 'MGD 3/24/2020 15:16:12'!
scanSpecificChangeRecordType
	"Scan anything that involves more than one chunk"

	| itemPosition item tokens firstToken secondToken |

	itemPosition _ file position.
	item _ file nextChunk.

	(self itemIsRecognized: item) ifFalse: [
		"Maybe a preamble, but not one we recognize; bail out with the preamble trick"
		^ self scanAndIgnore: item in: itemPosition ].

	tokens _ Scanner new scanTokens: item.
	tokens size >= 2 ifTrue: [
		firstToken _ tokens first.
		secondToken _ tokens second.

		firstToken == #classDefinition:
			ifTrue: [ ^ self scanClassDefinition: tokens ].
		(firstToken == #classRemoval: or: [ firstToken == #classMoveToSomePackage: ])
			ifTrue: [ ^ self scanClassRemoval: tokens ].
		(firstToken == #methodRemoval: or: [ firstToken == #methodMoveToSomePackage: ])
			ifTrue: [ ^ self scanMethodRemoval: tokens ].
		(secondToken == #methodsFor: or: [ tokens third == #methodsFor: ])
			ifTrue: [ ^ self scanMethodDefinition: tokens ].
		secondToken == #commentStamp:
			ifTrue: [ ^ self scanClassComment: tokens ].
		firstToken == #provides:
			ifTrue: [ ^ self scanFeatureProvision: tokens ].
		firstToken == #requires:
			ifTrue: [ ^ self scanFeatureRequirement: tokens ].
		firstToken == #classRenamed:
			ifTrue: [ ^ self scanClassRenamed: tokens ].
		firstToken == #testRun: 
			ifTrue: [ ^ self scanTestRun: tokens ].
		]! !

!ChangeList methodsFor: '*TDDGuruFirstBootstrapping' stamp: 'HAW 5/2/2020 12:39:10'!
scanTestRun: tokens

	| result record stamp |
	
	result _ file nextChunk.
	stamp _ CompiledMethod stampFrom: tokens.
	record _ TestRunChangeRecord new testCase: tokens second selector: tokens third result: result stamp: stamp.					
	
	self addItem: record text: record string.! !

!ChangeList class methodsFor: '*TDDGuruFirstBootstrapping' stamp: 'MGD 3/24/2020 15:09:35'!
knownFileInPreambles

	^ `{
	'classDefinition:'. 
	'classRemoval:'. 
	'methodRemoval:'. 
	'methodMoveToSomePackage:'. 
	'classMoveToSomePackage:'. 
	'provides:'. 
	'requires:'.
	'classRenamed:'.
	'testRun:' }`! !

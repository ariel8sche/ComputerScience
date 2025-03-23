'From Cuis6.3 [latest update: #6169] on 28 April 2024 at 11:02:08 pm'!
'Description '!
!provides: 'MoveMethodRefactoring' 1 101!
SystemOrganization addCategory: #MoveMethodRefactoring!


!classDefinition: #MessageToMoveShouldNotExistOnClass category: #MoveMethodRefactoring!
RefactoringError subclass: #MessageToMoveShouldNotExistOnClass
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MoveMethodRefactoring'!
!classDefinition: 'MessageToMoveShouldNotExistOnClass class' category: #MoveMethodRefactoring!
MessageToMoveShouldNotExistOnClass class
	instanceVariableNames: ''!

!classDefinition: #CodeForNodeToMove category: #MoveMethodRefactoring!
ParseNodeVisitor subclass: #CodeForNodeToMove
	instanceVariableNames: 'compiledMethod methodNode intervalsToReject node intervalsToModify nodeInterval nodeOffsetInSourceCode parameterNeeded variableToAccesThrough hasImplicitSelfReturn gettersToCreate settersToCreate'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MoveMethodRefactoring'!
!classDefinition: 'CodeForNodeToMove class' category: #MoveMethodRefactoring!
CodeForNodeToMove class
	instanceVariableNames: ''!

!classDefinition: #MethodWorksAsGetterVisitor category: #MoveMethodRefactoring!
ParseNodeVisitor subclass: #MethodWorksAsGetterVisitor
	instanceVariableNames: 'getterCandidate classVariableName returnMethodIsNotGetterClousure returnMethodIsGetterClousure'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MoveMethodRefactoring'!
!classDefinition: 'MethodWorksAsGetterVisitor class' category: #MoveMethodRefactoring!
MethodWorksAsGetterVisitor class
	instanceVariableNames: ''!

!classDefinition: #NeedParameterName category: #MoveMethodRefactoring!
ParseNodeVisitor subclass: #NeedParameterName
	instanceVariableNames: 'needParameterName instanceVariableNameToAccessThrough compiledMethod methodNode'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MoveMethodRefactoring'!
!classDefinition: 'NeedParameterName class' category: #MoveMethodRefactoring!
NeedParameterName class
	instanceVariableNames: ''!

!classDefinition: #NeedParameterNameForClassMethod category: #MoveMethodRefactoring!
ParseNodeVisitor subclass: #NeedParameterNameForClassMethod
	instanceVariableNames: 'needParameterName'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MoveMethodRefactoring'!
!classDefinition: 'NeedParameterNameForClassMethod class' category: #MoveMethodRefactoring!
NeedParameterNameForClassMethod class
	instanceVariableNames: ''!

!classDefinition: #MoveMethodRefactoringTest category: #MoveMethodRefactoring!
RefactoringTest subclass: #MoveMethodRefactoringTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MoveMethodRefactoring'!
!classDefinition: 'MoveMethodRefactoringTest class' category: #MoveMethodRefactoring!
MoveMethodRefactoringTest class
	instanceVariableNames: ''!

!classDefinition: #MoveMethodRefactoring category: #MoveMethodRefactoring!
TransferMethod subclass: #MoveMethodRefactoring
	instanceVariableNames: 'methodName sourceClass targetClass collectionOfSendersToChange instanceVariableToAccessTarget parameterNeeded compiledMethodToMove resultAfterReplaceDependencies selectorForDelegation codeForDelegation'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MoveMethodRefactoring'!
!classDefinition: 'MoveMethodRefactoring class' category: #MoveMethodRefactoring!
MoveMethodRefactoring class
	instanceVariableNames: ''!

!classDefinition: #MoveMethodApplier category: #MoveMethodRefactoring!
TransferMethodApplier subclass: #MoveMethodApplier
	instanceVariableNames: 'model methodReference methodToMove sourceClass accessingThroughinstanceVariableName targetClass extraParameter'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MoveMethodRefactoring'!
!classDefinition: 'MoveMethodApplier class' category: #MoveMethodRefactoring!
MoveMethodApplier class
	instanceVariableNames: ''!

!classDefinition: #MoveMethodWithActualScopeApplier category: #MoveMethodRefactoring!
MoveMethodApplier subclass: #MoveMethodWithActualScopeApplier
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MoveMethodRefactoring'!
!classDefinition: 'MoveMethodWithActualScopeApplier class' category: #MoveMethodRefactoring!
MoveMethodWithActualScopeApplier class
	instanceVariableNames: ''!

!classDefinition: #CodeForNodeToMoveResult category: #MoveMethodRefactoring!
Object subclass: #CodeForNodeToMoveResult
	instanceVariableNames: 'sourceCode hasImplicitSelfReturn gettersToCreate sourceClass settersToCreate'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MoveMethodRefactoring'!
!classDefinition: 'CodeForNodeToMoveResult class' category: #MoveMethodRefactoring!
CodeForNodeToMoveResult class
	instanceVariableNames: ''!

!classDefinition: #MoveMethodExtraParameterName category: #MoveMethodRefactoring!
Object subclass: #MoveMethodExtraParameterName
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MoveMethodRefactoring'!
!classDefinition: 'MoveMethodExtraParameterName class' category: #MoveMethodRefactoring!
MoveMethodExtraParameterName class
	instanceVariableNames: ''!

!classDefinition: #ExtraParameterNameNeeded category: #MoveMethodRefactoring!
MoveMethodExtraParameterName subclass: #ExtraParameterNameNeeded
	instanceVariableNames: 'parameterName'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MoveMethodRefactoring'!
!classDefinition: 'ExtraParameterNameNeeded class' category: #MoveMethodRefactoring!
ExtraParameterNameNeeded class
	instanceVariableNames: ''!

!classDefinition: #ExtraParameterNameNeededAndExtraKeyword category: #MoveMethodRefactoring!
MoveMethodExtraParameterName subclass: #ExtraParameterNameNeededAndExtraKeyword
	instanceVariableNames: 'parameterName extraKeyword'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MoveMethodRefactoring'!
!classDefinition: 'ExtraParameterNameNeededAndExtraKeyword class' category: #MoveMethodRefactoring!
ExtraParameterNameNeededAndExtraKeyword class
	instanceVariableNames: ''!

!classDefinition: #NonExtraParameterNameNeeded category: #MoveMethodRefactoring!
MoveMethodExtraParameterName subclass: #NonExtraParameterNameNeeded
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MoveMethodRefactoring'!
!classDefinition: 'NonExtraParameterNameNeeded class' category: #MoveMethodRefactoring!
NonExtraParameterNameNeeded class
	instanceVariableNames: ''!

!classDefinition: #TesisMoveMethodRefactoringMenu category: #MoveMethodRefactoring!
Object subclass: #TesisMoveMethodRefactoringMenu
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MoveMethodRefactoring'!
!classDefinition: 'TesisMoveMethodRefactoringMenu class' category: #MoveMethodRefactoring!
TesisMoveMethodRefactoringMenu class
	instanceVariableNames: ''!


!CodeForNodeToMove methodsFor: 'initialization' stamp: 'mc 4/25/2024 22:36:57'!
initializeFor: aCompiledMethod methodNode: aMethodNode variableToAcessThrough: aVariableToAccesoThroughName rejectingIntervals: aFewIntervalsToReject onNode: aNodeToGetCode parameterNeeded: aParameterNeeded 
	compiledMethod := aCompiledMethod.
	methodNode := aMethodNode.
	intervalsToReject := aFewIntervalsToReject.
	node := aNodeToGetCode.
	intervalsToModify := OrderedCollection new.
	parameterNeeded := aParameterNeeded.
	variableToAccesThrough := aVariableToAccesoThroughName.
	hasImplicitSelfReturn := false.
	gettersToCreate := Dictionary new.
	settersToCreate := Dictionary new.! !

!CodeForNodeToMove methodsFor: 'visiting' stamp: 'mc 4/28/2024 22:43:07'!
visitAssignmentNode: anAssignmentNode 
	| assigmentValue completeRangesOfassigmentNode resultForValue setterSelectorAsString |
	"self halt."
	anAssignmentNode variable isTemp ifTrue: [^super visitAssignmentNode: anAssignmentNode].
	completeRangesOfassigmentNode := self firstUnseenIntervalFor: anAssignmentNode.
	resultForValue :=			(CodeForNodeToMove 
					for: compiledMethod
					methodNode: methodNode
					variableToAcessThrough: variableToAccesThrough 
					rejectingIntervals: intervalsToReject 
					onNode: anAssignmentNode value
					parameterNeeded: parameterNeeded) value.
	(self shouldAddParenthesisOnValueOf: anAssignmentNode)
		ifTrue: [assigmentValue := '(', resultForValue sourceCode , ')'.] 
		ifFalse: [assigmentValue := resultForValue sourceCode .].
	
	anAssignmentNode variable isLiteralVariableNode 
		ifTrue: [setterSelectorAsString := self setterForClassVariable: anAssignmentNode variable name.]
		ifFalse: [setterSelectorAsString := self setterForInstanceVariable: anAssignmentNode variable name.].
	
	compiledMethod methodClass methodDict 
					at: setterSelectorAsString asSymbol 
					ifPresent: [ :aMethod | ]
					ifAbsent: [settersToCreate at: anAssignmentNode variable name put: setterSelectorAsString].

	
	self registerInterval: completeRangesOfassigmentNode withModification: (parameterNeeded parameterName , ' ', setterSelectorAsString, ' ', assigmentValue).
	gettersToCreate addAll: resultForValue gettersToCreate.
	settersToCreate addAll: resultForValue settersToCreate.
	! !

!CodeForNodeToMove methodsFor: 'visiting' stamp: 'mc 4/28/2024 22:47:10'!
visitInstanceVariableNode: anInstanceVariableNode 
	| sourceCodeForInterval anInterval getterToUse |
	"self halt."
	anInterval := self firstUnseenIntervalFor: anInstanceVariableNode.
	(anInstanceVariableNode name = variableToAccesThrough)
		ifTrue: [sourceCodeForInterval := 'self'.]
		ifFalse: [
			getterToUse := self getterForInstanceVariable: anInstanceVariableNode key.
			sourceCodeForInterval := parameterNeeded parameterName, ' ', getterToUse.
			(compiledMethod methodClass selectors includes: getterToUse) 
				ifFalse: [gettersToCreate at: anInstanceVariableNode key put: getterToUse.].
			].
	self registerInterval: anInterval withModification: sourceCodeForInterval.
	! !

!CodeForNodeToMove methodsFor: 'visiting' stamp: 'mc 1/14/2024 18:31:36'!
visitLiteralVariableNode: aLiteralVariableNode 
	| sourceCodeForInterval anInterval getterToUse |
	"self halt."
	aLiteralVariableNode isReferencingGlobal ifTrue: [^self].
	anInterval := self firstUnseenIntervalFor: aLiteralVariableNode.
	getterToUse := self getterForClassVariable: aLiteralVariableNode name.
	sourceCodeForInterval := parameterNeeded parameterName, ' ', getterToUse.
	(compiledMethod methodClass selectors includes: getterToUse) 
				ifFalse: [gettersToCreate at: aLiteralVariableNode name put: getterToUse.].
	
	self registerInterval: anInterval withModification: sourceCodeForInterval.
! !

!CodeForNodeToMove methodsFor: 'visiting' stamp: 'mc 4/28/2024 22:51:42'!
visitMessageNode: aMessageNode 
	| rangeMessageNode newSend |
	"self halt."
	aMessageNode receiver referencesSuper
		ifTrue:[
			rangeMessageNode := self firstUnseenIntervalFor: aMessageNode.
			aMessageNode isKeywordMessageSend
				ifTrue: [ 
					newSend := self newSenderFor: aMessageNode.
					self registerInterval: rangeMessageNode withModification: newSend.
					self encapsulateSuperColaboration: aMessageNode.
					]
				ifFalse: [
					self registerInterval: rangeMessageNode withModification: (parameterNeeded parameterName, ' ', (self newSelectorForSuperColaboration: aMessageNode)).
					"self encapsulateSuperColaboration: aMessageNode."
					compiledMethod methodClass compile:(self newSelectorForSuperColaboration: aMessageNode), String newLineString, String tab, '^super ', aMessageNode selector key asString, '.'.
					].
			
			]
		ifFalse:[ super visitMessageNode: aMessageNode ].
	! !

!CodeForNodeToMove methodsFor: 'visiting' stamp: 'mc 4/26/2024 23:08:44'!
visitReturnNode: aReturnNode 
	"self halt."
	(aReturnNode isImplicitSelfReturnIn: methodNode)
		ifTrue: [hasImplicitSelfReturn := true]
		ifFalse: [super visitReturnNode: aReturnNode]! !

!CodeForNodeToMove methodsFor: 'visiting' stamp: 'mc 9/14/2023 01:21:49'!
visitVariableNode: aVariableNode 
	| anInterval sourceCodeForInterval |
	"self halt."
	anInterval := self firstUnseenIntervalFor: aVariableNode ifAbsent: [^self].
	sourceCodeForInterval := parameterNeeded parameterName.
	self registerInterval: anInterval withModification: sourceCodeForInterval.! !

!CodeForNodeToMove methodsFor: 'private' stamp: 'mc 1/20/2024 03:35:10'!
compiledMethodAt: aSelector

	^ compiledMethod methodClass compiledMethodAt: aSelector! !

!CodeForNodeToMove methodsFor: 'private' stamp: 'mc 4/24/2024 02:32:56'!
encapsulateSuperColaboration: aMessageNode
	
	| colaborationEncapsulated indexSourceCode newSelector newSourceCode |
	newSelector := self newKeywordSelector: aMessageNode .
	indexSourceCode := 1.
	newSourceCode := ''.
	aMessageNode selector key keywords do: [:aKeyword | 
		newSourceCode := newSourceCode, ' ', aKeyword, ' ', 'arg', indexSourceCode asString. 
		indexSourceCode := indexSourceCode +1 ].
	newSourceCode := newSourceCode withBlanksTrimmed.
	newSourceCode := '^super ', newSourceCode, '.'.
	colaborationEncapsulated := newSelector, String newLineString, String tab, newSourceCode.
	compiledMethod methodClass compile: colaborationEncapsulated.! !

!CodeForNodeToMove methodsFor: 'private' stamp: 'mc 9/10/2023 00:28:47'!
filterRangesThatDoNotBelongToTheCurrentNodeIn: aCollectionOfRanges

	^ self firstIntervalOn: (aCollectionOfRanges select: [ :anInterval | nodeInterval includesAllOf: anInterval ])! !

!CodeForNodeToMove methodsFor: 'private' stamp: 'mc 4/14/2023 02:12:28'!
firstIntervalOn: aCollectionOfIntervals
	^aCollectionOfIntervals detectMin: [ :anInterval | anInterval first]! !

!CodeForNodeToMove methodsFor: 'private' stamp: 'mc 9/14/2023 01:52:37'!
firstUnseenIntervalFor: aNode 
	^self firstUnseenIntervalFor: aNode ifAbsent: [] ! !

!CodeForNodeToMove methodsFor: 'private' stamp: 'mc 4/25/2024 22:42:10'!
firstUnseenIntervalFor: aNode ifAbsent: anAbsentBlock 
	
	| completeRangesOfassigmentNode |
	
	completeRangesOfassigmentNode := methodNode completeSourceRangesOf: aNode ifAbsent: anAbsentBlock.
	self removeSeenRanges: completeRangesOfassigmentNode.
	^self filterRangesThatDoNotBelongToTheCurrentNodeIn: completeRangesOfassigmentNode.! !

!CodeForNodeToMove methodsFor: 'private' stamp: 'mc 1/14/2024 23:14:39'!
generateNewGetterForVariable: aVariableName withSelector: aSelectorForGetter
	| getterCandidate |
	
	getterCandidate := aSelectorForGetter.
	[compiledMethod methodClass selectors includes: getterCandidate] whileTrue: [
		getterCandidate := (getterCandidate copyFrom: 1 to: getterCandidate size), '_'.].
	^getterCandidate.! !

!CodeForNodeToMove methodsFor: 'private' stamp: 'mc 1/15/2024 00:40:15'!
generateNewSetterForVariable: aVariableName withSelector: aSelectorForSetter
	| setterCandidate |
	
	setterCandidate := aSelectorForSetter, ':'.
	[compiledMethod methodClass selectors includes: setterCandidate] whileTrue: [
		setterCandidate := (setterCandidate copyFrom: 1 to: setterCandidate size -1), '_:'.].
	^setterCandidate.! !

!CodeForNodeToMove methodsFor: 'private' stamp: 'mc 1/20/2024 03:35:10'!
getterForClassVariable: aClassVariableName 
	| gettersCandidates |
	gettersCandidates := self selectorsWhichSatisfy: [ :aSelector | 
				aSelector ~= compiledMethod selector and: [self method: (self compiledMethodAt: aSelector) isGetterOfClassVariable: aClassVariableName ]
			].
	gettersCandidates 
		ifEmpty: [^self generateNewGetterForVariable: aClassVariableName withSelector: aClassVariableName uncapitalized]
		ifNotEmpty: [^gettersCandidates first] .! !

!CodeForNodeToMove methodsFor: 'private' stamp: 'mc 1/20/2024 03:35:10'!
getterForInstanceVariable: anInstanceVariableName 
	| gettersCandidates |
	gettersCandidates := self selectorsWhichSatisfy: [ :aSelector | 
				aSelector ~= compiledMethod selector and: [self method: (self compiledMethodAt: aSelector) isGetterOf: anInstanceVariableName ]
			].
	gettersCandidates 
		ifEmpty: [^self generateNewGetterForVariable: anInstanceVariableName withSelector: anInstanceVariableName] 
		ifNotEmpty: [^gettersCandidates first].
		! !

!CodeForNodeToMove methodsFor: 'private' stamp: 'mc 4/25/2024 22:42:26'!
initializeNodeInterval

	| posibleRangesForNode |

	node isMethodNode 
		ifTrue:[ 
			nodeInterval := 1 to: (compiledMethod sourceCode size).
			]
		ifFalse:[ 
			posibleRangesForNode := (methodNode completeSourceRangesOf: node ifAbsent: []).
			self removeSeenRanges: posibleRangesForNode.
			nodeInterval := self firstIntervalOn: posibleRangesForNode.
			]! !

!CodeForNodeToMove methodsFor: 'private' stamp: 'mc 4/14/2023 02:19:49'!
initializeOffset

	^ nodeOffsetInSourceCode := nodeInterval first -1! !

!CodeForNodeToMove methodsFor: 'private' stamp: 'mc 12/28/2023 01:41:16'!
method: getterCandidate isGetterOf: anInstanceVariableName 
	| anInstVarIndex |
	
	anInstVarIndex := compiledMethod methodClass allInstVarNames indexOf: anInstanceVariableName.
	^getterCandidate isReturnField and: [ getterCandidate returnField + 1 = anInstVarIndex ]! !

!CodeForNodeToMove methodsFor: 'private' stamp: 'mc 12/30/2023 18:32:44'!
method: getterCandidate isGetterOfClassVariable: aClassVariableName 
	^(MethodWorksAsGetterVisitor method: getterCandidate forClassVariable: aClassVariableName) value
	"^true"! !

!CodeForNodeToMove methodsFor: 'private' stamp: 'mc 1/3/2024 01:36:40'!
method: setterCandidate isSetterOf: anInstVarName 
	| anInstVarIndex varIndexCode scanner |

	anInstVarIndex := compiledMethod methodClass allInstVarNames indexOf: anInstVarName.

	"setterCandidate selector = (anInstVarName, ':') ifFalse: [ ^false ]."
	
	"I could have use the AST of the method, but parsing the source code could generate errors
	that it is why I decided to check the bytecodes - Hernan"
	varIndexCode := anInstVarIndex - 1.
	scanner := InstructionStream on: setterCandidate.
	scanner nextByte = 16r10 ifFalse: [ ^false ].
	scanner movePcForward.
	(setterCandidate writesFieldCode: varIndexCode with: scanner nextByte using: scanner) ifFalse: [ ^false ].
	scanner movePcForward.
	^scanner nextByte = 16r7C! !

!CodeForNodeToMove methodsFor: 'private' stamp: 'mc 4/24/2024 02:29:40'!
newKeywordSelector: aMessageNode
	
	| indexNewSelector newSelector |
	newSelector := ''.
	indexNewSelector := 1.
	aMessageNode selector key keywords do: [:aKeyword | 
		newSelector := newSelector, ' ', aKeyword, ' ', 'arg', indexNewSelector asString.
		indexNewSelector := indexNewSelector +1 ].
	newSelector := newSelector withBlanksTrimmed.
	newSelector := 'CHANGE_ME_super_', newSelector.
	^newSelector! !

!CodeForNodeToMove methodsFor: 'private' stamp: 'mc 4/23/2024 22:50:19'!
newSelectorForSuperColaboration: aMessageNode

	^ 'CHANGE_ME_super_', aMessageNode selector key asString! !

!CodeForNodeToMove methodsFor: 'private' stamp: 'mc 4/25/2024 22:38:45'!
newSenderFor: aMessageNode
	|  newSend argumentsCode argumentIndex replacer replacerResult argumentNode |
	argumentsCode := OrderedCollection new.
	argumentIndex := 1.
	"self halt."
	aMessageNode selector key keywords do: [ :aKeyword | 
		argumentNode := aMessageNode argumentsInEvaluationOrder at: argumentIndex.
		replacer := CodeForNodeToMove 
					for: compiledMethod
					methodNode: methodNode
					variableToAcessThrough: variableToAccesThrough
					rejectingIntervals: intervalsToReject
					onNode: argumentNode
					parameterNeeded: parameterNeeded.
		replacerResult := replacer value.
		(self shouldAddParenthesis: argumentNode) 
			ifTrue: [argumentsCode add: '(', replacerResult sourceCode, ')'.]
			ifFalse: [argumentsCode add: replacerResult sourceCode.].
		gettersToCreate addAll: replacerResult gettersToCreate .
		settersToCreate addAll: replacerResult settersToCreate .
		argumentIndex := argumentIndex +1].
	argumentIndex := 1.
	newSend := ''.
	aMessageNode selector key keywords do: [ :aKeyword | newSend := newSend, ' ', aKeyword, ' ', (argumentsCode at: argumentIndex). argumentIndex := argumentIndex +1].
	^parameterNeeded parameterName, ' CHANGE_ME_super_', (newSend copyFrom: 2 to: newSend size).
! !

!CodeForNodeToMove methodsFor: 'private' stamp: 'mc 4/14/2023 00:53:08'!
registerInterval: anInterval withModification: sourceCodeForInterval 
	intervalsToReject add: anInterval.
	intervalsToModify add: anInterval -> sourceCodeForInterval! !

!CodeForNodeToMove methodsFor: 'private' stamp: 'mc 4/14/2023 00:53:08'!
removeSeenRanges: rangesOfNode 
	^rangesOfNode removeAllSuchThat: [ :aSourceInterval | intervalsToReject anySatisfy: [ :aSourceIntervalToModify | aSourceIntervalToModify includesAllOf: aSourceInterval ] ]! !

!CodeForNodeToMove methodsFor: 'private' stamp: 'mc 1/2/2024 03:55:10'!
selectorsWhichSatisfy: aBlock

	^ compiledMethod methodClass selectors select: aBlock! !

!CodeForNodeToMove methodsFor: 'private' stamp: 'mc 1/20/2024 03:35:10'!
setterForClassVariable: aClassVariableName 
	| settersCandidates |
	settersCandidates := self selectorsWhichSatisfy: [ :aSelector | 
				aSelector ~= compiledMethod selector and: [self method: (self compiledMethodAt: aSelector) isSetterOf: aClassVariableName ]
			].
	settersCandidates isEmpty
		ifTrue: [^self generateNewSetterForVariable: aClassVariableName withSelector: aClassVariableName uncapitalized]
		ifFalse: [^settersCandidates first] .! !

!CodeForNodeToMove methodsFor: 'private' stamp: 'mc 1/20/2024 03:35:10'!
setterForInstanceVariable: anInstanceVariableName 
	| settersCandidates |
	"self halt."
	settersCandidates := self selectorsWhichSatisfy: [ :aSelector | 
				aSelector ~= compiledMethod selector and: [self method: (self compiledMethodAt: aSelector) isSetterOf: anInstanceVariableName ]
			].
	settersCandidates isEmpty
		ifTrue: [^self generateNewSetterForVariable: anInstanceVariableName withSelector: anInstanceVariableName]
		ifFalse: [^settersCandidates first] .
		! !

!CodeForNodeToMove methodsFor: 'private' stamp: 'mc 5/14/2023 19:51:27'!
shouldAddParenthesis: argumentNode 
	^argumentNode isAssignmentNode! !

!CodeForNodeToMove methodsFor: 'private' stamp: 'mc 4/28/2024 19:37:58'!
shouldAddParenthesisOnValueOf: anAssignmentNode

	^ ((anAssignmentNode value isMessageNode and: [anAssignmentNode value isKeywordMessageSend])) or: [anAssignmentNode value isAssignmentNode ]! !

!CodeForNodeToMove methodsFor: 'accessing' stamp: 'mc 4/6/2024 02:34:57'!
value
	| newCode newCodeForNode result |
	"self halt."
	self initializeNodeInterval.
	self initializeOffset.
	node accept: self.
	intervalsToModify := intervalsToModify collect: [ :anAssociation | (anAssociation key - nodeOffsetInSourceCode) -> anAssociation value ].
	newCodeForNode := compiledMethod sourceCode copyFrom: nodeInterval first to: nodeInterval last.
	
	(node isMethodNode) ifTrue: [
		parameterNeeded associationToModifySelectorAndArgumentsOn: compiledMethod addOn: intervalsToModify
		].
	"self halt."
	intervalsToModify sort: [ :left :right | left key first < right key first ].
	newCode := newCodeForNode copyReplacing: intervalsToModify.
	 
	hasImplicitSelfReturn	ifTrue: [ 
			(newCode last = $.) ifFalse: [newCode := newCode append: '.'].
			newCode := newCode append: String newLineString, String tab, '^', parameterNeeded parameterName, '.'
			].
	result := CodeForNodeToMoveResult 
				newWith: newCode 
				gettersToCreate: gettersToCreate
				settersToCreate: settersToCreate 
				sourceClass: compiledMethod methodClass.
	^result! !

!CodeForNodeToMove class methodsFor: 'instance creation' stamp: 'mc 4/25/2024 22:37:39'!
for: aCompiledMethod methodNode: aMethodNode variableToAcessThrough: aVariableToAccesoThroughName rejectingIntervals: aFewIntervalsToReject onNode: aNodeToGetCode parameterNeeded: parameterNeeded
	^self new 
		initializeFor: aCompiledMethod
		methodNode: aMethodNode
		variableToAcessThrough: aVariableToAccesoThroughName
		rejectingIntervals: aFewIntervalsToReject
		onNode: aNodeToGetCode
		parameterNeeded: parameterNeeded! !

!CodeForNodeToMove class methodsFor: 'instance creation' stamp: 'mc 4/26/2024 23:06:05'!
for: compiledMethod variableToAccesThrough: aVariableToAccesoThroughName parameterNeeded: parameterNeeded
	| methodNode |
	methodNode := compiledMethod methodNode.
	^self 
		for: compiledMethod
		methodNode: methodNode
		variableToAcessThrough: aVariableToAccesoThroughName 
		rejectingIntervals: OrderedCollection new
		onNode: methodNode
		parameterNeeded: parameterNeeded.
	! !

!MethodWorksAsGetterVisitor methodsFor: 'initialization' stamp: 'mc 4/27/2024 18:22:34'!
initializeMethod: aGetterCandidate forClassVariable: aClassVariableName 
	
	getterCandidate := aGetterCandidate.
	classVariableName := aClassVariableName.! !

!MethodWorksAsGetterVisitor methodsFor: 'as yet unclassified' stamp: 'mc 4/27/2024 18:22:28'!
value
	returnMethodIsNotGetterClousure := [^false].
	returnMethodIsGetterClousure := [^true].
	getterCandidate methodNode accept: self.
	^false! !

!MethodWorksAsGetterVisitor methodsFor: 'visiting' stamp: 'mc 4/27/2024 18:20:13'!
visitBlockNode: aBlockNode 
	(aBlockNode statements size = 1) ifFalse: [returnMethodIsNotGetterClousure value].
	(aBlockNode statements first expr name = classVariableName) 
		ifFalse: [returnMethodIsNotGetterClousure value]
		ifTrue: [returnMethodIsGetterClousure value].! !

!MethodWorksAsGetterVisitor class methodsFor: 'instance creation' stamp: 'mc 12/30/2023 18:33:55'!
method: getterCandidate forClassVariable: aClassVariableName 
	
	^self new initializeMethod: getterCandidate forClassVariable: aClassVariableName ! !

!NeedParameterName methodsFor: 'public' stamp: 'mc 8/24/2023 23:53:43'!
needParameterName
	^needParameterName! !

!NeedParameterName methodsFor: 'public' stamp: 'mc 4/25/2024 14:52:31'!
value
	  
	methodNode := compiledMethod methodNode.
	methodNode accept: self.
	^self needParameterName ! !

!NeedParameterName methodsFor: 'visiting' stamp: 'mc 11/13/2023 02:01:02'!
visitInstanceVariableNode: anInstanceVariableNode 
	
	needParameterName := needParameterName or: [instanceVariableNameToAccessThrough ~= anInstanceVariableNode name].! !

!NeedParameterName methodsFor: 'visiting' stamp: 'mc 11/26/2023 02:53:23'!
visitLiteralVariableNode: aLiteralVariableNode 

	needParameterName := aLiteralVariableNode  isReferencingGlobal not.! !

!NeedParameterName methodsFor: 'visiting' stamp: 'mc 4/27/2024 00:09:15'!
visitReturnNode: aReturnNode 
	"self halt."
	(aReturnNode isImplicitSelfReturnIn: methodNode)
		ifTrue: [needParameterName := true]
		ifFalse: [super visitReturnNode: aReturnNode ]! !

!NeedParameterName methodsFor: 'visiting' stamp: 'mc 8/24/2023 23:53:27'!
visitVariableNode: aVariableNode 
	needParameterName := true.! !

!NeedParameterName methodsFor: 'initialization' stamp: 'mc 12/16/2023 02:20:37'!
initializeFor: aCompiledMethod newAccessingThrough: instanceVariable 
	
	compiledMethod := aCompiledMethod.
	instanceVariableNameToAccessThrough := instanceVariable.
	needParameterName := false.! !

!NeedParameterName methodsFor: 'private' stamp: 'mc 12/15/2023 23:22:39'!
isImplicitSelfReturn: aReturnNode In: aMethodNode
	
	aReturnNode isReturnSelf ifFalse: [^false]. 
	aMethodNode completeSourceRangesOf: aReturnNode ifAbsent: [^true].
	
	^false! !

!NeedParameterName class methodsFor: 'instance creation' stamp: 'mc 12/12/2023 23:33:47'!
for: compiledMethod newAccessingThrough: instanceVariable 
	
	^self new initializeFor: compiledMethod newAccessingThrough: instanceVariable ! !

!NeedParameterNameForClassMethod methodsFor: 'accessing' stamp: 'mc 12/9/2023 02:44:10'!
needParameterName
	^needParameterName! !

!NeedParameterNameForClassMethod methodsFor: 'initialization' stamp: 'mc 12/9/2023 02:45:20'!
initialize
	needParameterName := false.
	super initialize.! !

!NeedParameterNameForClassMethod methodsFor: 'visiting' stamp: 'mc 12/9/2023 03:47:00'!
visitInstanceVariableNode: anInstanceVariableNode 
	needParameterName := true! !

!NeedParameterNameForClassMethod methodsFor: 'visiting' stamp: 'mc 12/9/2023 02:46:56'!
visitLiteralVariableNode: aLiteralVariableNode 
	needParameterName := true.! !

!NeedParameterNameForClassMethod methodsFor: 'visiting' stamp: 'mc 12/9/2023 03:41:54'!
visitVariableNode: aVariableNode 
	needParameterName := true.! !

!MoveMethodRefactoringTest methodsFor: 'validations' stamp: 'mc 4/2/2024 00:16:12'!
test001SelectorShouldExistsOnSourceClass
	
	| sourceClass targetClass |
	
	sourceClass := self createClassNamed: #SourceClass instanceVariableNames: 'iv1'.
	targetClass := self createClassNamed: #TargetClass.
	
	
	
	self
		assertCreation: [
			MoveMethodRefactoring 
				methodNamed: #m1
				from: sourceClass
				to: targetClass
				accessingThrough: 'iv1' ] 
		failsWith: [MoveMethodRefactoring methodShouldExistsOnSourceClassErrorMessage].! !

!MoveMethodRefactoringTest methodsFor: 'validations' stamp: 'mc 4/2/2024 00:16:18'!
test002SelectorShouldNotExistsOnTargetClass
	
	| sourceClass targetClass |
	
	sourceClass := self createClassNamed: #SourceClass instanceVariableNames: 'iv1'.
	targetClass := self createClassNamed: #TargetClass.
	sourceClass compile: 'm1 ^1' .
	targetClass compile: 'm1 ^1' .
	
	self 
		should: [
			MoveMethodRefactoring 
				methodNamed: #m1
				from: sourceClass
				to: targetClass
				accessingThrough: 'iv1' ] 
		raise: MessageToMoveShouldNotExistOnClass
		withExceptionDo: [ :anError | 
			self assert: anError messageText equals: MoveMethodRefactoring methodShouldNotExistsOnTargertClassErrorMessage].
	! !

!MoveMethodRefactoringTest methodsFor: 'validations' stamp: 'mc 4/2/2024 00:27:54'!
test003SelectorWithNewParameterShouldNotExistsOnTargetClass
	
	| sourceClass targetClass |
	
	sourceClass := self createClassNamed: #SourceClass instanceVariableNames: 'iv1 iv2'.
	targetClass := self createClassNamed: #TargetClass.
	sourceClass compile: 'm1 ^iv2' .
	targetClass compile: 'm1: anObject ^1' .
	
	self
		assertCreation: [
			MoveMethodRefactoring 
				methodNamed: #m1 
				from: sourceClass 
				to: targetClass 
				accessingThrough: 'iv1'
				parameterNeeded: (ExtraParameterNameNeeded 
									parameterName: 'originalObject') ] 
		failsWith: [
			MoveMethodRefactoring methodShouldNotExistsOnTargertClassErrorMessage].! !

!MoveMethodRefactoringTest methodsFor: 'validations' stamp: 'mc 4/2/2024 00:27:48'!
test004SelectorWithNewParameterAndKeywordShouldNotExistsOnTargetClass
	
	| sourceClass targetClass |
	
	sourceClass := self createClassNamed: #SourceClass instanceVariableNames: 'iv1 iv2'.
	targetClass := self createClassNamed: #TargetClass.
	sourceClass compile: 'm1: anInt ^iv2'.
	targetClass compile: 'm1: anInt originalObject: originalObject ^originalObject + anInt' .
	
	self
		assertCreation: [
			MoveMethodRefactoring 
				methodNamed: #m1: 
				from: sourceClass 
				to: targetClass 
				accessingThrough: 'iv1'
				parameterNeeded: (ExtraParameterNameNeededAndExtraKeyword
									parameterName: 'originalObject'
									extraKeyword: 'originalObject') ] 
		failsWith: [
			MoveMethodRefactoring methodShouldNotExistsOnTargertClassErrorMessage].! !

!MoveMethodRefactoringTest methodsFor: 'validations' stamp: 'mc 4/2/2024 00:27:43'!
test005TargetClassShouldNotBeNil
	
	| sourceClass targetClass |
	
	sourceClass := self createClassNamed: #SourceClass instanceVariableNames: 'iv1'.
	targetClass := nil.
	sourceClass compile: 'm1 ^1' .
	
	
	self
		assertCreation: [
			MoveMethodRefactoring 
				methodNamed: #m1
				from: sourceClass
				to: targetClass
				accessingThrough: 'iv1' ] 
		failsWith: [MoveMethodRefactoring targetClassShouldNotBeNilErrorMessage].! !

!MoveMethodRefactoringTest methodsFor: 'validations' stamp: 'mc 4/2/2024 00:27:39'!
test006SourceClassShouldNotBeNil
	
	| sourceClass targetClass |
	
	sourceClass := nil.
	targetClass := self createClassNamed: #TargetClass.
	
	
	
	self
		assertCreation: [
			MoveMethodRefactoring 
				methodNamed: #m1
				from: sourceClass
				to: targetClass
				accessingThrough: 'iv1' ] 
		failsWith: [MoveMethodRefactoring sourceClassShouldNotBeNilErrorMessage].! !

!MoveMethodRefactoringTest methodsFor: 'validations' stamp: 'mc 4/2/2024 00:27:34'!
test007SelectorShouldNotBeNil
	
	| sourceClass targetClass |
	
	sourceClass := self createClassNamed: #SourceClass instanceVariableNames: 'iv1'.
	targetClass := self createClassNamed: #TargetClass.
	sourceClass compile: 'm1 ^1' .
	
	
	self
		assertCreation: [
			MoveMethodRefactoring
				methodNamed: nil
				from: sourceClass
				to: targetClass
				accessingThrough: 'iv1' ] 
		failsWith: [MoveMethodRefactoring methodShouldNotBeNilErrorMessage].! !

!MoveMethodRefactoringTest methodsFor: 'validations' stamp: 'mc 4/2/2024 00:27:23'!
test008InstanceVariableToAccessingThroughShouldNotBeNil
	
	| sourceClass targetClass |
	
	sourceClass := self createClassNamed: #SourceClass instanceVariableNames: 'iv1'.
	targetClass := self createClassNamed: #TargetClass.
	sourceClass compile: 'm1 ^1' .
	
	
	self
		assertCreation: [
			MoveMethodRefactoring
				methodNamed: #m1
				from: sourceClass
				to: targetClass
				accessingThrough: nil ] 
		failsWith: [MoveMethodRefactoring instanceVariableToAccessingThroughShouldNotBeNilErrorMessage].! !

!MoveMethodRefactoringTest methodsFor: 'validations' stamp: 'mc 4/2/2024 00:27:17'!
test009InstanceVariableToAccessingThroughShouldExistsInSourceClass
	
	| sourceClass targetClass |
	
	sourceClass := self createClassNamed: #SourceClass instanceVariableNames: 'iv1'.
	targetClass := self createClassNamed: #TargetClass.
	sourceClass compile: 'm1 ^1' .
	
	
	self
		assertCreation: [
			MoveMethodRefactoring 
				methodNamed: #m1 
				from: sourceClass 
				to: targetClass 
				accessingThrough: 'iv2' ] 
		failsWith: [
			MoveMethodRefactoring instanceVariableToAccessingThroughShouldExistsInSourceClassErrorMessage].! !

!MoveMethodRefactoringTest methodsFor: 'validations' stamp: 'mc 12/14/2023 01:12:37'!
test010NameForANewParameterShouldBeProvidedIfNeeded
	
	| sourceClass targetClass |
	
	sourceClass := self createClassNamed: #SourceClass instanceVariableNames: 'iv1'.
	targetClass := self createClassNamed: #TargetClass.
	sourceClass compile: 'initializeIv1 iv1 := TargetClass new.' .
	sourceClass compile: 'm1 ^self' .
	
	self
		assertCreation: [
			MoveMethodRefactoring 
				methodNamed: #m1 
				from: sourceClass 
				to: targetClass 
				accessingThrough: 'iv1' ] 
		failsWith: [
			MoveMethodRefactoring nameForNewParameterShouldBeProvidedClassErrorMessage].! !

!MoveMethodRefactoringTest methodsFor: 'validations' stamp: 'mc 4/2/2024 00:27:12'!
test011NameForANewParameterKeywordShouldBeProvidedIfNeeded
	
	| sourceClass targetClass |
	
	sourceClass := self createClassNamed: #SourceClass instanceVariableNames: 'iv1'.
	targetClass := self createClassNamed: #TargetClass.
	sourceClass compile: 'm1: anInt ^self' .
	
	
	self
		assertCreation: [
			MoveMethodRefactoring 
				methodNamed: #m1: 
				from: sourceClass 
				to: targetClass 
				accessingThrough: 'iv1' 
				parameterNeeded: (ExtraParameterNameNeeded 
									parameterName: 'sourceObject') ] 
		failsWith: [
			MoveMethodRefactoring nameForNewParameterKeywordShouldBeProvidedClassErrorMessage].! !

!MoveMethodRefactoringTest methodsFor: 'validations' stamp: 'mc 12/20/2023 01:12:54'!
test012NeedNameForNewParameterWhenClassVariable
	
	| sourceClass targetClass |
	
	sourceClass := self createClassNamed: #SourceClass  subclassOf: Object instanceVariableNames: 'iv1' classVariableNames: 'CV1' poolDictionaries: '' category: self class classCategoryOfTestData.
	targetClass := self createClassNamed: #TargetClass.
	sourceClass compile: 'm1 ^CV1.' .
	
	self
		assertCreation: [
			MoveMethodRefactoring 
				methodNamed: #m1
				from: sourceClass
				to: targetClass
				accessingThrough: 'iv1'. ] 
		failsWith: [
			MoveMethodRefactoring nameForNewParameterShouldBeProvidedClassErrorMessage].
! !

!MoveMethodRefactoringTest methodsFor: 'validations' stamp: 'mc 4/2/2024 00:26:56'!
test013NeedNameForNewParameterWhenInstanceVariable
	
	| sourceClass targetClass |
	
	sourceClass := self createClassNamed: #SourceClass instanceVariableNames: 'iv1 iv2'.
	targetClass := self createClassNamed: #TargetClass.
	sourceClass compile: 'm1 ^iv2.' .
	
	
	self
		assertCreation: [
			MoveMethodRefactoring 
				methodNamed: #m1
				from: sourceClass
				to: targetClass
				accessingThrough: 'iv1'. ] 
		failsWith: [
			MoveMethodRefactoring nameForNewParameterShouldBeProvidedClassErrorMessage].
! !

!MoveMethodRefactoringTest methodsFor: 'validations' stamp: 'mc 4/2/2024 00:26:52'!
test014NeedNameForNewParameterWhenSelfReference
	
	| sourceClass targetClass |
	
	sourceClass := self createClassNamed: #SourceClass instanceVariableNames: 'iv1 iv2'.
	targetClass := self createClassNamed: #TargetClass.
	sourceClass compile: 'm1 ^self.' .
	
	
	self
		assertCreation: [
			MoveMethodRefactoring 
				methodNamed: #m1
				from: sourceClass
				to: targetClass
				accessingThrough: 'iv1'. ] 
		failsWith: [
			MoveMethodRefactoring nameForNewParameterShouldBeProvidedClassErrorMessage].
! !

!MoveMethodRefactoringTest methodsFor: 'validations' stamp: 'mc 4/2/2024 00:26:46'!
test015NeedNameForNewParameterWhenSuperReference
	
	| sourceClass targetClass |
	
	sourceClass := self createClassNamed: #SourceClass instanceVariableNames: 'iv1 iv2'.
	targetClass := self createClassNamed: #TargetClass.
	sourceClass compile: 'm1 ^super.' .
	
	
	self
		assertCreation: [
			MoveMethodRefactoring 
				methodNamed: #m1
				from: sourceClass
				to: targetClass
				accessingThrough: 'iv1'. ] 
		failsWith: [
			MoveMethodRefactoring nameForNewParameterShouldBeProvidedClassErrorMessage].
! !

!MoveMethodRefactoringTest methodsFor: 'validations' stamp: 'mc 4/2/2024 00:26:40'!
test016ShouldNotPassNameForNewParameterWhenIsNotNeeded
	
	| sourceClass targetClass |
	
	sourceClass := self createClassNamed: #SourceClass instanceVariableNames: 'iv1'.
	targetClass := self createClassNamed: #TargetClass.
	sourceClass compile: 'm1 ^1.' .
	
	
	self
		assertCreation: [
			MoveMethodRefactoring 
				methodNamed: #m1 
				from: sourceClass 
				to: targetClass 
				accessingThrough: 'iv1' 
				parameterNeeded: (ExtraParameterNameNeeded 
									parameterName: 'extraParameterName'). ] 
		failsWith: [
			MoveMethodRefactoring nameForNewParameterShouldNotBeProvidedClassErrorMessage].
! !

!MoveMethodRefactoringTest methodsFor: 'validations' stamp: 'mc 4/2/2024 00:26:30'!
test017ShouldNotPassNameForNewParameterWhenIsNotNeeded
	
	| sourceClass targetClass |
	
	sourceClass := self createClassNamed: #SourceClass instanceVariableNames: 'iv1 iv2'.
	targetClass := self createClassNamed: #TargetClass.
	sourceClass compile: 'm1 ^iv2.' .
	
	
	self
		assertCreation: [
			MoveMethodRefactoring 
				methodNamed: #m1
				from: sourceClass
				to: targetClass
				accessingThrough: 'iv1'
				parameterNeeded: (ExtraParameterNameNeededAndExtraKeyword 
								parameterName: 'extraParameterName' 
								extraKeyword: 'extraKeywordName'). ] 
		failsWith: [
			MoveMethodRefactoring nameForNewParameterKeywordShouldNotBeProvidedClassErrorMessage].
! !

!MoveMethodRefactoringTest methodsFor: 'validations' stamp: 'mc 4/2/2024 00:28:09'!
test018InstanceVariableToAccessingThroughShouldHaveAtLeastOneAssignation
	
	| sourceClass targetClass |
	
	sourceClass := self createClassNamed: #SourceClass instanceVariableNames: 'iv1'.
	targetClass := self createClassNamed: #TargetClass.
	sourceClass compile: 'm1 ^1' .
	
	
	self 
		should: [
			MoveMethodRefactoring 
				methodNamed: #m1 
				from: sourceClass 
				to: targetClass 
				accessingThrough: 'iv1'
				parameterNeeded: NonExtraParameterNameNeeded new ]  
		raise: self refactoringWarning 
		withMessageText: [MoveMethodRefactoring instanceVariableToAccessingThroughShouldHaveAtLeastOneAssignationErrorMessage: 'iv1'].
		! !

!MoveMethodRefactoringTest methodsFor: 'validations' stamp: 'mc 4/2/2024 00:28:16'!
test019ClassMethodToMoveShouldNotBeNil
	
	| sourceClass targetClass |
	
	sourceClass := self createClassNamed: #SourceClass.
	targetClass := self createClassNamed: #TargetClass.
	sourceClass class compile: 'm1 ^1' .
	
	
	self 
		assertCreation: [
			MoveMethodRefactoring 
				classMethodNamed: nil
				from: sourceClass
				to: targetClass
				parameterNeeded: NonExtraParameterNameNeeded new.]  
		failsWith: [MoveMethodRefactoring classMethodToMoveShouldNotBeNilErrorMessage].
		! !

!MoveMethodRefactoringTest methodsFor: 'validations' stamp: 'mc 4/2/2024 00:26:16'!
test020SourceClassShouldNotBeNil
	
	| sourceClass targetClass |
	
	sourceClass := nil.
	targetClass := self createClassNamed: #TargetClass.
	
	
	
	self 
		assertCreation: [
			MoveMethodRefactoring 
				classMethodNamed: #m1
				from: sourceClass
				to: targetClass
				parameterNeeded: NonExtraParameterNameNeeded new.]  
		failsWith: [MoveMethodRefactoring sourceClassShouldNotBeNilErrorMessage ].
		! !

!MoveMethodRefactoringTest methodsFor: 'validations' stamp: 'mc 4/2/2024 00:26:08'!
test021TargetClassShouldNotBeNil
	
	| sourceClass targetClass |
	
	sourceClass := self createClassNamed: #SourceClass.
	targetClass := nil.
	
	
	
	self 
		assertCreation: [
			MoveMethodRefactoring 
				classMethodNamed: #m1
				from: sourceClass
				to: targetClass
				parameterNeeded: NonExtraParameterNameNeeded new.]  
		failsWith: [MoveMethodRefactoring targetClassShouldNotBeNilErrorMessage ].
		! !

!MoveMethodRefactoringTest methodsFor: 'validations' stamp: 'mc 4/2/2024 00:25:44'!
test022ClassMethodShouldNotExistsInTarget
	
	| sourceClass targetClass |
	
	sourceClass := self createClassNamed: #SourceClass.
	targetClass := self createClassNamed: #TargetClass.
	sourceClass class compile: 'm1 ^1' .
	targetClass class compile: 'm1 ^2' .
	
	self 
		assertCreation: [
			MoveMethodRefactoring 
				classMethodNamed: #m1
				from: sourceClass
				to: targetClass
				parameterNeeded: NonExtraParameterNameNeeded new.]  
		failsWith: [MoveMethodRefactoring classMethodShouldNotExistsOnTargertClassErrorMessage ].
		! !

!MoveMethodRefactoringTest methodsFor: 'validations' stamp: 'mc 4/2/2024 00:25:36'!
test023ClassMethodShouldExistsInSouceClass
	
	| sourceClass targetClass |
	
	sourceClass := self createClassNamed: #SourceClass.
	targetClass := self createClassNamed: #TargetClass.
	
	
	
	self 
		assertCreation: [
			MoveMethodRefactoring 
				classMethodNamed: #m1
				from: sourceClass
				to: targetClass
				parameterNeeded: NonExtraParameterNameNeeded new.]  
		failsWith: [MoveMethodRefactoring classMethodShouldExistsOnSourceClassErrorMessage ].
		! !

!MoveMethodRefactoringTest methodsFor: 'validations' stamp: 'mc 4/2/2024 00:25:16'!
test024ClassSelectorWithNewParameterShouldNotExistsOnTargetClass
	
	| sourceClass targetClass |
	
	sourceClass := self createClassNamed: #SourceClass.
	targetClass := self createClassNamed: #TargetClass.
	sourceClass class addInstVarName: 'iv2'.
	sourceClass class compile: 'm1 ^iv2' .
	targetClass class compile: 'm1: anObject ^1' .
	self 
		assertCreation: [
			MoveMethodRefactoring 
				classMethodNamed: #m1
				from: sourceClass
				to: targetClass
				parameterNeeded: (ExtraParameterNameNeeded 
							parameterName: 'originalClass').]  
		failsWith: [MoveMethodRefactoring classMethodShouldNotExistsOnTargertClassErrorMessage ].
		! !

!MoveMethodRefactoringTest methodsFor: 'validations' stamp: 'mc 4/2/2024 00:24:25'!
test025ClassSelectorWithNewParameterAndKeywordShouldNotExistsOnTargetClass
	
	| sourceClass targetClass |
	
	sourceClass := self createClassNamed: #SourceClass.
	targetClass := self createClassNamed: #TargetClass.
	sourceClass class addInstVarName: 'iv2'.
	sourceClass class compile: 'm1: anInt ^iv2'.
	targetClass class compile: 'm1: anInt originalObject: originalObject ^originalObject + anInt' .
	self 
		assertCreation: [
			MoveMethodRefactoring 
				classMethodNamed: #m1:
				from: sourceClass
				to: targetClass
				parameterNeeded: (ExtraParameterNameNeededAndExtraKeyword
							parameterName: 'originalObject'
							extraKeyword: 'originalObject').]  
		failsWith: [MoveMethodRefactoring classMethodShouldNotExistsOnTargertClassErrorMessage ].
		! !

!MoveMethodRefactoringTest methodsFor: 'validations' stamp: 'mc 4/2/2024 00:25:02'!
test026ClassSelectorWithNewParameterAndKeywordShouldNotExistsOnTargetClass
	
	| sourceClass targetClass |
	
	sourceClass := self createClassNamed: #SourceClass.
	targetClass := self createClassNamed: #TargetClass.
	sourceClass class compile: 'm1: anInt ^self'.

	
	self 
		assertCreation: [
			MoveMethodRefactoring 
				classMethodNamed: #m1:
				from: sourceClass
				to: targetClass
				parameterNeeded: (ExtraParameterNameNeeded 
									parameterName: 'sourceObject').]  
		failsWith: [MoveMethodRefactoring nameForNewParameterKeywordShouldBeProvidedClassErrorMessage ].
		! !

!MoveMethodRefactoringTest methodsFor: 'validations' stamp: 'mc 4/2/2024 00:24:43'!
test027NameForANewParameterShouldBeProvidedIfNeeded
	
	| sourceClass targetClass |
	
	sourceClass := self createClassNamed: #SourceClass.
	targetClass := self createClassNamed: #TargetClass.
	sourceClass class compile: 'm1 ^self'.

	
	self 
		assertCreation: [
			MoveMethodRefactoring 
				classMethodNamed: #m1
				from: sourceClass
				to: targetClass
				parameterNeeded: NonExtraParameterNameNeeded new.]  
		failsWith: [MoveMethodRefactoring nameForNewParameterShouldBeProvidedClassErrorMessage ].
		! !

!MoveMethodRefactoringTest methodsFor: 'validations' stamp: 'mc 4/2/2024 00:24:36'!
test028NameForANewParameterKeywordShouldBeProvidedIfNeeded
	
	| sourceClass targetClass |
	
	sourceClass := self createClassNamed: #SourceClass.
	targetClass := self createClassNamed: #TargetClass.
	sourceClass class compile: 'm1: anInt ^self'.

	
	self 
		assertCreation: [
			MoveMethodRefactoring 
				classMethodNamed: #m1: 
				from: sourceClass
				to: targetClass
				parameterNeeded: (ExtraParameterNameNeeded 
					parameterName: 'sourceObject').]  
		failsWith: [MoveMethodRefactoring nameForNewParameterKeywordShouldBeProvidedClassErrorMessage ].
		! !

!MoveMethodRefactoringTest methodsFor: 'validations' stamp: 'mc 4/2/2024 00:23:59'!
test029ShouldNotPassNameForNewParameterWhenIsNotNeeded
	
	| sourceClass targetClass |
	
	sourceClass := self createClassNamed: #SourceClass.
	targetClass := self createClassNamed: #TargetClass.
	sourceClass class compile: 'm1 ^1.'.

	
	self 
		assertCreation: [
			MoveMethodRefactoring 
				classMethodNamed: #m1
				from: sourceClass
				to: targetClass
				parameterNeeded: (ExtraParameterNameNeeded 
							parameterName: 'extraParameterName').]  
		failsWith: [MoveMethodRefactoring nameForNewParameterShouldNotBeProvidedClassErrorMessage ].
		! !

!MoveMethodRefactoringTest methodsFor: 'validations' stamp: 'mc 4/2/2024 00:23:13'!
test030ShouldNotPassNameForNewParameterWhenIsNotNeeded
	
	| sourceClass targetClass |
	
	sourceClass := self createClassNamed: #SourceClass.
	targetClass := self createClassNamed: #TargetClass.
	sourceClass class addInstVarName: 'iv2'.
	sourceClass class compile: 'm1 ^iv2.'.
	
	self 
		assertCreation: [
			MoveMethodRefactoring 
				classMethodNamed: #m1
				from: sourceClass
				to: targetClass
				parameterNeeded: (ExtraParameterNameNeededAndExtraKeyword 
						parameterName: 'extraParameterName' 
						extraKeyword: 'extraKeywordName').]  
		failsWith: [MoveMethodRefactoring nameForNewParameterKeywordShouldNotBeProvidedClassErrorMessage ].
		! !

!MoveMethodRefactoringTest methodsFor: 'tests' stamp: 'mc 11/23/2023 00:00:02'!
test100CanMoveMethodWithoutReferences
	
	| sourceClass targetClass refactoring |
	
	sourceClass := self createClassNamed: #SourceClass instanceVariableNames: 'iv1'.
	targetClass := self createClassNamed: #TargetClass.
	sourceClass compile: 'initializeIv1 iv1 := TargetClass new.' .
	sourceClass compile: 'm1 ^1.' .
	
	refactoring := MoveMethodRefactoring methodNamed: #m1 from: sourceClass to: targetClass accessingThrough: 'iv1' .
	refactoring apply.
	
	self assert: 'm1 ^1.' equals: (targetClass sourceCodeAt: #m1).
	self assert: 'm1
	^iv1 m1.' equals: (sourceClass sourceCodeAt: #m1).
	self deny: (sourceClass includesSelector: #iv1).
	! !

!MoveMethodRefactoringTest methodsFor: 'tests' stamp: 'mc 11/23/2023 00:00:16'!
test101CanMoveMethodWithoutReferences
	
	| sourceClass targetClass refactoring |
	
	sourceClass := self createClassNamed: #SourceClass instanceVariableNames: 'iv1'.
	targetClass := self createClassNamed: #TargetClass.
	sourceClass compile: 'initializeIv1 iv1 := TargetClass new.' .
	sourceClass compile: 'm1 ^2.' .
	
	refactoring := MoveMethodRefactoring methodNamed: #m1 from: sourceClass to: targetClass accessingThrough: 'iv1' .
	refactoring apply.
	
	self assert: 'm1 ^2.' equals: (targetClass sourceCodeAt: #m1).
	self assert: 'm1
	^iv1 m1.' equals: (sourceClass sourceCodeAt: #m1).
	self deny: (sourceClass includesSelector: #iv1).! !

!MoveMethodRefactoringTest methodsFor: 'tests' stamp: 'mc 11/23/2023 00:01:32'!
test102CanMoveMethodWhenReferencesAnInstanceVariable
	
	| sourceClass targetClass refactoring |
	
	sourceClass := self createClassNamed: #SourceClass instanceVariableNames: 'iv1 iv2'.
	targetClass := self createClassNamed: #TargetClass.
	sourceClass compile: 'm1 ^iv2.' .
	sourceClass compile: 'initializeIv1 iv1 := TargetClass new.' .
	
	refactoring := MoveMethodRefactoring 
				methodNamed: #m1 
				from: sourceClass 
				to: targetClass 
				accessingThrough: 'iv1'
				parameterNeeded: (ExtraParameterNameNeeded 
									parameterName: 'sourceObject') .
	refactoring apply.
	
	self assert: 'm1: sourceObject ^sourceObject iv2.' equals: (targetClass sourceCodeAt: #m1:).
	self assert: 'm1
	^iv1 m1: self.' equals: (sourceClass sourceCodeAt: #m1).
	self deny: (sourceClass includesSelector: #iv1).
	self assert: 'iv2', String newLineString, String tab, '^iv2.' equals: (sourceClass sourceCodeAt: #iv2).
	! !

!MoveMethodRefactoringTest methodsFor: 'tests' stamp: 'mc 11/23/2023 00:01:56'!
test103CanMoveMethodWhenReferencesAnInstanceVariableForReading
	
	| sourceClass targetClass refactoring |
	
	sourceClass := self createClassNamed: #SourceClass instanceVariableNames: 'iv1 iv3'.
	targetClass := self createClassNamed: #TargetClass.
	sourceClass compile: 'initializeIv1 iv1 := TargetClass new.' .
	sourceClass compile: 'm1 ^iv3.' .
	
	
	refactoring := MoveMethodRefactoring 
		methodNamed: #m1 
		from: sourceClass 
		to: targetClass 
		accessingThrough: 'iv1' 
		parameterNeeded: (ExtraParameterNameNeeded 
							parameterName: 'sourceObject') .
	refactoring apply.
	
	self assert: 'm1: sourceObject ^sourceObject iv3.' equals: (targetClass sourceCodeAt: #m1:).
	self assert: 'm1
	^iv1 m1: self.' equals: (sourceClass sourceCodeAt: #m1).
	self deny: (sourceClass includesSelector: #iv1).
	self assert: 'iv3', String newLineString, String tab, '^iv3.' equals: (sourceClass sourceCodeAt: #iv3).! !

!MoveMethodRefactoringTest methodsFor: 'tests' stamp: 'mc 11/23/2023 00:02:05'!
test104CanMoveMethodWhenReferencesTwoInstanceVariableForReading
	
	| sourceClass targetClass refactoring |
	
	sourceClass := self createClassNamed: #SourceClass instanceVariableNames: 'iv1 iv3 iv4'.
	targetClass := self createClassNamed: #TargetClass.
	sourceClass compile: 'initializeIv1 iv1 := TargetClass new.' .
	sourceClass compile: 'm1 ^iv3 + iv4.' .
	
	
	refactoring := MoveMethodRefactoring 
		methodNamed: #m1 
		from: sourceClass 
		to: targetClass 
		accessingThrough: 'iv1' 
		parameterNeeded: (ExtraParameterNameNeeded 
							parameterName: 'sourceObject').
	refactoring apply.
	
	self assert: 'm1: sourceObject ^sourceObject iv3 + sourceObject iv4.' equals: (targetClass sourceCodeAt: #m1:).
	self assert: 'm1
	^iv1 m1: self.' equals: (sourceClass sourceCodeAt: #m1).
	self deny: (sourceClass includesSelector: #iv1).
	self assert: 'iv3', String newLineString, String tab, '^iv3.' equals: (sourceClass sourceCodeAt: #iv3).
	self assert: 'iv4', String newLineString, String tab, '^iv4.' equals: (sourceClass sourceCodeAt: #iv4).! !

!MoveMethodRefactoringTest methodsFor: 'tests' stamp: 'mc 11/23/2023 00:02:14'!
test105CanMoveMethodWhenReferencesAnInstanceVariableForWriting
	
	| sourceClass targetClass refactoring |
	
	sourceClass := self createClassNamed: #SourceClass instanceVariableNames: 'iv1 iv3'.
	targetClass := self createClassNamed: #TargetClass.
	sourceClass compile: 'initializeIv1 iv1 := TargetClass new.' .
	sourceClass compile: 'm1 ^iv3 := 1.' .
	
	
	refactoring := MoveMethodRefactoring 
		methodNamed: #m1 
		from: sourceClass 
		to: targetClass 
		accessingThrough: 'iv1' 
		parameterNeeded: (ExtraParameterNameNeeded 
							parameterName: 'sourceObject').
	refactoring apply.
	
	self assert: 'm1: sourceObject ^sourceObject iv3: 1.' equals: (targetClass sourceCodeAt: #m1:).
	self assert: 'm1
	^iv1 m1: self.' equals: (sourceClass sourceCodeAt: #m1).
	self deny: (sourceClass includesSelector: #iv1).
	self assert: 'iv3: anObject', String newLineString, String tab, '^iv3 := anObject.' equals: (sourceClass sourceCodeAt: #iv3:).
	! !

!MoveMethodRefactoringTest methodsFor: 'tests' stamp: 'mc 4/2/2024 00:05:20'!
test106CanMoveMethodWhenReferencesTwoInstanceVariableForWriting
	
	| sourceClass targetClass refactoring |
	
	sourceClass := self createClassNamed: #SourceClass instanceVariableNames: 'iv1 iv3 iv4'.
	targetClass := self createClassNamed: #TargetClass.
	sourceClass compile: 'initializeIv1 iv1 := TargetClass new.' .
	sourceClass compile: 'm1 iv3 := iv4 := 1.' .
	
	
	refactoring := MoveMethodRefactoring 
					methodNamed: #m1 
					from: sourceClass 
					to: targetClass 
					accessingThrough: 'iv1' 
					parameterNeeded: (ExtraParameterNameNeeded 
										parameterName: 'sourceObject').
	refactoring apply.
	
	self assert: 'm1: sourceObject sourceObject iv3: (sourceObject iv4: 1).
	^sourceObject.' equals: (targetClass sourceCodeAt: #m1:).
	self assert: 'm1
	^iv1 m1: self.' equals: (sourceClass sourceCodeAt: #m1).
	self deny: (sourceClass includesSelector: #iv1).
	self assert: 'iv3: anObject', String newLineString, String tab, '^iv3 := anObject.' equals: (sourceClass sourceCodeAt: #iv3:).
	self assert: 'iv4: anObject', String newLineString, String tab, '^iv4 := anObject.' equals: (sourceClass sourceCodeAt: #iv4:).! !

!MoveMethodRefactoringTest methodsFor: 'tests' stamp: 'mc 11/23/2023 00:02:43'!
test107CanMoveMethodWhenReferencesInstanceVariableAnd2Params
	
	| sourceClass targetClass refactoring |
	
	sourceClass := self createClassNamed: #SourceClass instanceVariableNames: 'iv1 iv3 iv4'.
	targetClass := self createClassNamed: #TargetClass.
	sourceClass compile: 'initializeIv1 iv1 := TargetClass new.' .
	sourceClass compile: 'm1: anInt param: anInt2 ^iv2 := anInt + anInt2 + iv2.' .
	
	
	refactoring := MoveMethodRefactoring 
					methodNamed: #m1:param:
					from: sourceClass 
					to: targetClass 
					accessingThrough: 'iv1' 
					parameterNeeded: (ExtraParameterNameNeededAndExtraKeyword 
										parameterName: 'anIv2Object' 
										extraKeyword: 'iv2Object' ).
	refactoring apply.
	
	self assert: 'm1: anInt param: anInt2 iv2Object: anIv2Object ^anIv2Object iv2: anInt + anInt2 + anIv2Object iv2.' equals: (targetClass sourceCodeAt: #m1:param:iv2Object:).
	self assert: 'm1: anInt param: anInt2
	^iv1 m1: anInt param: anInt2 iv2Object: self.' equals: (sourceClass sourceCodeAt: #m1:param:).
	self deny: (sourceClass includesSelector: #iv1).
	! !

!MoveMethodRefactoringTest methodsFor: 'tests' stamp: 'mc 4/2/2024 00:06:51'!
test107CanMoveMethodWhenReferencesTwoInstanceVariableForWritingAndOneForReading
	
	| sourceClass targetClass refactoring |
	
	sourceClass := self createClassNamed: #SourceClass instanceVariableNames: 'iv1 iv3 iv4 iv5'.
	targetClass := self createClassNamed: #TargetClass.
	sourceClass compile: 'initializeIv1 iv1 := TargetClass new.' .
	sourceClass compile: 'm1 iv3 := iv4 := iv5.' .
	
	
	refactoring := MoveMethodRefactoring 
		methodNamed: #m1 
		from: sourceClass 
		to: targetClass 
		accessingThrough: 'iv1'
		parameterNeeded: (ExtraParameterNameNeeded 
							parameterName: 'sourceObject') .
	refactoring apply.
	
	self assert: 'm1: sourceObject sourceObject iv3: (sourceObject iv4: sourceObject iv5).
	^sourceObject.' equals: (targetClass sourceCodeAt: #m1:).
	self assert: 'm1
	^iv1 m1: self.' equals: (sourceClass sourceCodeAt: #m1).
	self deny: (sourceClass includesSelector: #iv1).
	! !

!MoveMethodRefactoringTest methodsFor: 'tests' stamp: 'mc 11/23/2023 00:53:46'!
test108CanMoveMethodWhenReferencesAnInstanceVariableAndHasAParameter
	
	| sourceClass targetClass refactoring |
	
	sourceClass := self createClassNamed: #SourceClass instanceVariableNames: 'iv1 iv2'.
	targetClass := self createClassNamed: #TargetClass.
	sourceClass compile: 'initializeIv1 iv1 := TargetClass new.' .
	sourceClass compile: 'm1: anObject ^iv2.' .
	
	
	refactoring := MoveMethodRefactoring 
					methodNamed: #m1:
					from: sourceClass
					to: targetClass
					accessingThrough: 'iv1'
					parameterNeeded: (ExtraParameterNameNeededAndExtraKeyword 
										parameterName: 'sourceObject' 
										extraKeyword: 'sourceObject').
	refactoring apply.
	
	self assert: 'm1: anObject sourceObject: sourceObject ^sourceObject iv2.' equals: (targetClass sourceCodeAt: #m1:sourceObject:).
	self assert: 'm1: anObject
	^iv1 m1: anObject sourceObject: self.' equals: (sourceClass sourceCodeAt: #m1:).
	self deny: (sourceClass includesSelector: #iv1).
	! !

!MoveMethodRefactoringTest methodsFor: 'tests' stamp: 'mc 11/23/2023 00:54:23'!
test109AfterMovingMethodWhichReferencesAnInstanceVariableForReadingShouldUseTheExistentGetter
	
	| sourceClass targetClass refactoring |
	
	sourceClass := self createClassNamed: #SourceClass instanceVariableNames: 'iv1 iv3'.
	targetClass := self createClassNamed: #TargetClass.
	sourceClass compile: 'iv3 ^iv3.'.
	sourceClass compile: 'initializeIv1 iv1 := TargetClass new.' .
	sourceClass compile: 'm1 ^iv3 + 1.'.
	
	
	refactoring := MoveMethodRefactoring 
		methodNamed: #m1 
		from: sourceClass 
		to: targetClass 
		accessingThrough: 'iv1' 
		parameterNeeded: (ExtraParameterNameNeeded 
							parameterName: 'sourceObject').
	refactoring apply.
	
	self assert: 'iv3 ^iv3.' equals: (sourceClass sourceCodeAt: #iv3).
	self assert: 'm1: sourceObject ^sourceObject iv3 + 1.' equals: (targetClass sourceCodeAt: #m1:).
	self assert: 'm1
	^iv1 m1: self.' equals: (sourceClass sourceCodeAt: #m1).
	self deny: (sourceClass includesSelector: #iv1).! !

!MoveMethodRefactoringTest methodsFor: 'tests' stamp: 'mc 11/23/2023 00:54:37'!
test110AfterMovingMethodWhichReferencesAnInstanceVariableForWritingShouldUseTheExistentSetter
	
	| sourceClass targetClass refactoring |
	
	sourceClass := self createClassNamed: #SourceClass instanceVariableNames: 'iv1 iv3'.
	targetClass := self createClassNamed: #TargetClass.
	sourceClass compile: 'iv3: anObject ^iv3 := anObject.'.
	sourceClass compile: 'initializeIv1 iv1 := TargetClass new.' .
	sourceClass compile: 'm1 ^iv3 := 1.'.
	
	
	refactoring := MoveMethodRefactoring 
		methodNamed: #m1 
		from: sourceClass 
		to: targetClass 
		accessingThrough: 'iv1' 
		parameterNeeded: (ExtraParameterNameNeeded 
							parameterName: 'sourceObject').
	refactoring apply.
	
	self assert: 'iv3: anObject ^iv3 := anObject.' equals: (sourceClass sourceCodeAt: #iv3:)! !

!MoveMethodRefactoringTest methodsFor: 'tests' stamp: 'mc 12/29/2023 03:25:44'!
test111AfterMovingMethodWhichReferencesAnInstanceVariableForWritingShouldUseTheExistentSetter
	
	| sourceClass targetClass refactoring |
	
	sourceClass := self createClassNamed: #SourceClass instanceVariableNames: 'iv1 iv3'.
	targetClass := self createClassNamed: #TargetClass.
	sourceClass compile: 'iv3: anObject iv3 := anObject.'.
	sourceClass compile: 'initializeIv1 iv1 := TargetClass new.' .
	sourceClass compile: 'm1 ^iv3 := 1.'.
	
	
	refactoring := MoveMethodRefactoring 
		methodNamed: #m1 
		from: sourceClass 
		to: targetClass 
		accessingThrough: 'iv1' 
		parameterNeeded: (ExtraParameterNameNeeded 
							parameterName: 'sourceObject').
	refactoring apply.
	
	self assert: 'm1: sourceObject ^sourceObject iv3_: 1.' equals: (targetClass sourceCodeAt: #m1:).
	self assert: 'iv3_: anObject', String newLineString, String tab, '^iv3 := anObject.' equals: (sourceClass sourceCodeAt: #iv3_:).
	self assert: 'm1
	^iv1 m1: self.' equals: (sourceClass sourceCodeAt: #m1).! !

!MoveMethodRefactoringTest methodsFor: 'tests' stamp: 'mc 1/3/2024 02:46:25'!
test111AfterMovingMethodWhichReferencesAnInstanceVariableForWritingShouldUseTheExistentSetter2
	
	| sourceClass targetClass refactoring |
	
	sourceClass := self createClassNamed: #SourceClass instanceVariableNames: 'iv1 iv3'.
	targetClass := self createClassNamed: #TargetClass.
	sourceClass compile: 'iv3_2: anObject ^iv3 := anObject.'.
	sourceClass compile: 'iv3_: anObject ^iv3 := anObject.'.
	sourceClass compile: 'iv3: anObject ^1.'.
	sourceClass compile: 'initializeIv1 iv1 := TargetClass new.' .
	
	
	refactoring := MoveMethodRefactoring 
		methodNamed: #iv3_:
		from: sourceClass 
		to: targetClass 
		accessingThrough: 'iv1' 
		parameterNeeded: (ExtraParameterNameNeededAndExtraKeyword 
							parameterName: 'sourceObject'
							extraKeyword: 'originalObject').
	refactoring apply.
	
	self assert: 'iv3_: anObject originalObject: sourceObject ^sourceObject iv3_2: anObject.' equals: (targetClass sourceCodeAt: #iv3_:originalObject:).
	self assert: 'iv3: anObject ^1.' equals: (sourceClass sourceCodeAt: #iv3:).
	self assert: 'iv3_2: anObject ^iv3 := anObject.' equals: (sourceClass sourceCodeAt: #iv3_2:).
	self assert: 'iv3_: anObject
	^iv1 iv3_: anObject originalObject: self.' equals: (sourceClass sourceCodeAt: #iv3_:).! !

!MoveMethodRefactoringTest methodsFor: 'tests' stamp: 'mc 1/3/2024 02:45:47'!
test111AfterMovingMethodWhichReferencesAnInstanceVariableForWritingShouldUseTheExistentSetter3
	
	| sourceClass targetClass refactoring |
	
	sourceClass := self createClassNamed: #SourceClass instanceVariableNames: 'iv1 iv3'.
	targetClass := self createClassNamed: #TargetClass.
	sourceClass compile: 'iv3_: anObject ^iv3 := anObject.'.
	sourceClass compile: 'iv3: anObject ^1.'.
	sourceClass compile: 'initializeIv1 iv1 := TargetClass new.' .
	
	
	refactoring := MoveMethodRefactoring 
		methodNamed: #iv3_:
		from: sourceClass 
		to: targetClass 
		accessingThrough: 'iv1' 
		parameterNeeded: (ExtraParameterNameNeededAndExtraKeyword 
							parameterName: 'sourceObject'
							extraKeyword: 'originalObject').
	refactoring apply.
	
	self assert: 'iv3_: anObject originalObject: sourceObject ^sourceObject iv3__: anObject.' equals: (targetClass sourceCodeAt: #iv3_:originalObject:).
	self assert: 'iv3: anObject ^1.' equals: (sourceClass sourceCodeAt: #iv3:).
	self assert: 'iv3__: anObject
	^iv3 := anObject.' equals: (sourceClass sourceCodeAt: #iv3__:).
	self assert: 'iv3_: anObject
	^iv1 iv3_: anObject originalObject: self.' equals: (sourceClass sourceCodeAt: #iv3_:).! !

!MoveMethodRefactoringTest methodsFor: 'tests' stamp: 'mc 1/14/2024 22:56:20'!
test111AfterMovingMethodWhichReferencesAnInstanceVariableForWritingShouldUseTheExistentSetter4
	
	| sourceClass targetClass refactoring |
	
	sourceClass := self createClassNamed: #SourceClass instanceVariableNames: 'iv1 iv3'.
	targetClass := self createClassNamed: #TargetClass.
	sourceClass compile: 'iv3_: anObject iv3 := anObject.'.
	sourceClass compile: 'initializeIv1 iv1 := TargetClass new.' .
	sourceClass compile: 'm1 ^iv3 := 1.'.
	
	
	refactoring := MoveMethodRefactoring 
		methodNamed: #m1 
		from: sourceClass 
		to: targetClass 
		accessingThrough: 'iv1' 
		parameterNeeded: (ExtraParameterNameNeeded 
							parameterName: 'sourceObject').
	refactoring apply.
	
	self assert: 'm1: sourceObject ^sourceObject iv3: 1.' equals: (targetClass sourceCodeAt: #m1:).
	self assert: 'iv3: anObject
	^iv3 := anObject.' equals: (sourceClass sourceCodeAt: #iv3:).
	self assert: 'iv3_: anObject iv3 := anObject.' equals: (sourceClass sourceCodeAt: #iv3_:).
	! !

!MoveMethodRefactoringTest methodsFor: 'tests' stamp: 'mc 11/23/2023 00:55:07'!
test112AfterMovingMethodWhichReferencesAnClassVariableForReadingShouldCreateGetter
	
	| sourceClass targetClass refactoring |
	
	sourceClass := self createClassNamed: #SourceClass  subclassOf: Object instanceVariableNames: 'iv1' classVariableNames: 'Icv1' poolDictionaries: '' category: self class classCategoryOfTestData.
	targetClass := self createClassNamed: #TargetClass.
	sourceClass compile: 'initializeIv1 iv1 := TargetClass new.' .
	sourceClass compile: 'm1 ^Icv1.'.
	
	
	refactoring := MoveMethodRefactoring 
		methodNamed: #m1 
		from: sourceClass 
		to: targetClass 
		accessingThrough: 'iv1' 
		parameterNeeded: (ExtraParameterNameNeeded 
							parameterName: 'sourceObject').
	refactoring apply.
	
	self assert: 'm1: sourceObject ^sourceObject icv1.' equals: (targetClass sourceCodeAt: #m1:).
	self assert: 'icv1', String newLineString, String tab, '^Icv1.' equals: (sourceClass sourceCodeAt: #icv1).! !

!MoveMethodRefactoringTest methodsFor: 'tests' stamp: 'mc 12/30/2023 02:54:41'!
test112AfterMovingMethodWhichReferencesAnClassVariableForReadingShouldCreateGetter2
	
	| sourceClass targetClass refactoring |
	
	sourceClass := self createClassNamed: #SourceClass  subclassOf: Object instanceVariableNames: 'iv1' classVariableNames: 'Icv1' poolDictionaries: '' category: self class classCategoryOfTestData.
	targetClass := self createClassNamed: #TargetClass.
	sourceClass compile: 'initializeIv1 iv1 := TargetClass new.' .
	sourceClass compile: 'icv1 ^1.' .
	sourceClass compile: 'm1 ^Icv1.'.
	
	
	refactoring := MoveMethodRefactoring 
		methodNamed: #m1 
		from: sourceClass 
		to: targetClass 
		accessingThrough: 'iv1' 
		parameterNeeded: (ExtraParameterNameNeeded 
							parameterName: 'sourceObject').
	refactoring apply.
	
	self assert: 'm1: sourceObject ^sourceObject icv1_.' equals: (targetClass sourceCodeAt: #m1:).
	self assert: 'icv1 ^1.' equals: (sourceClass sourceCodeAt: #icv1).
	self assert: 'icv1_
	^Icv1.' equals: (sourceClass sourceCodeAt: #icv1_).! !

!MoveMethodRefactoringTest methodsFor: 'tests' stamp: 'mc 4/2/2024 00:09:57'!
test112AfterMovingMethodWhichReferencesAnClassVariableForReadingShouldCreateGetter3
	
	| sourceClass targetClass refactoring |
	
	sourceClass := self 
					createClassNamed: #SourceClass
					subclassOf: Object
					instanceVariableNames: 'iv1'
					classVariableNames: 'Icv1'
					poolDictionaries: ''
					category: self class classCategoryOfTestData.
	targetClass := self createClassNamed: #TargetClass.
	sourceClass compile: 'initializeIv1 iv1 := TargetClass new.' .
	sourceClass compile: 'icv1_ ^Icv1.' .
	sourceClass compile: 'icv1 .' .
	
	
	refactoring := MoveMethodRefactoring 
		methodNamed: #icv1 
		from: sourceClass 
		to: targetClass 
		accessingThrough: 'iv1' 
		parameterNeeded: (ExtraParameterNameNeeded parameterName: 'sourceObject').
	refactoring apply.
	
	self assert: 'icv1: sourceObject .
	^sourceObject.' equals: (targetClass sourceCodeAt: #icv1:).
	self assert: 'icv1_ ^Icv1.' equals: (sourceClass sourceCodeAt: #icv1_).
	self assert: 'icv1
	^iv1 icv1: self.' equals: (sourceClass sourceCodeAt: #icv1).! !

!MoveMethodRefactoringTest methodsFor: 'tests' stamp: 'mc 12/31/2023 02:27:41'!
test112AfterMovingMethodWhichReferencesAnClassVariableForReadingShouldCreateGetter4
	
	| sourceClass targetClass refactoring |
	
	sourceClass := self createClassNamed: #SourceClass  subclassOf: Object instanceVariableNames: 'iv1' classVariableNames: 'Icv1' poolDictionaries: '' category: self class classCategoryOfTestData.
	targetClass := self createClassNamed: #TargetClass.
	sourceClass compile: 'initializeIv1 iv1 := TargetClass new.' .
	sourceClass compile: 'icv1_ ^Icv1.' .
	sourceClass compile: 'icv1 .' .
	
	
	refactoring := MoveMethodRefactoring 
		methodNamed: #icv1_
		from: sourceClass 
		to: targetClass 
		accessingThrough: 'iv1' 
		parameterNeeded: (ExtraParameterNameNeeded 
							parameterName: 'sourceObject').
	refactoring apply.
	
	self assert: 'icv1_: sourceObject ^sourceObject icv1__.' equals: (targetClass sourceCodeAt: #icv1_:).
	self assert: 'icv1 .' equals: (sourceClass sourceCodeAt: #icv1).
	self assert: 'icv1_
	^iv1 icv1_: self.' equals: (sourceClass sourceCodeAt: #icv1_).
	self assert: 'icv1__
	^Icv1.' equals: (sourceClass sourceCodeAt: #icv1__).! !

!MoveMethodRefactoringTest methodsFor: 'tests' stamp: 'mc 12/31/2023 02:28:57'!
test112AfterMovingMethodWhichReferencesAnClassVariableForReadingShouldCreateGetter5
	
	| sourceClass targetClass refactoring |
	
	sourceClass := self createClassNamed: #SourceClass  subclassOf: Object instanceVariableNames: 'iv1' classVariableNames: 'Icv1' poolDictionaries: '' category: self class classCategoryOfTestData.
	targetClass := self createClassNamed: #TargetClass.
	sourceClass compile: 'initializeIv1 iv1 := TargetClass new.' .
	sourceClass compile: 'icv1_ ^Icv1.' .
	sourceClass compile: 'icv1 ^1+1.' .
	
	
	refactoring := MoveMethodRefactoring 
		methodNamed: #icv1_
		from: sourceClass 
		to: targetClass 
		accessingThrough: 'iv1' 
		parameterNeeded: (ExtraParameterNameNeeded 
							parameterName: 'sourceObject').
	refactoring apply.
	
	self assert: 'icv1_: sourceObject ^sourceObject icv1__.' equals: (targetClass sourceCodeAt: #icv1_:).
	self assert: 'icv1 ^1+1.' equals: (sourceClass sourceCodeAt: #icv1).
	self assert: 'icv1_
	^iv1 icv1_: self.' equals: (sourceClass sourceCodeAt: #icv1_).
	self assert: 'icv1__
	^Icv1.' equals: (sourceClass sourceCodeAt: #icv1__).! !

!MoveMethodRefactoringTest methodsFor: 'tests' stamp: 'mc 1/14/2024 23:11:56'!
test112AfterMovingMethodWhichReferencesAnClassVariableForReadingShouldCreateGetter6
	
	| sourceClass targetClass refactoring |
	
	sourceClass := self createClassNamed: #SourceClass  subclassOf: Object instanceVariableNames: 'iv1' classVariableNames: 'Icv1' poolDictionaries: '' category: self class classCategoryOfTestData.
	targetClass := self createClassNamed: #TargetClass.
	sourceClass compile: 'initializeIv1 iv1 := TargetClass new.' .
	sourceClass compile: 'icv1_ ^1.' .
	sourceClass compile: 'm1 ^Icv1+1.' .
	
	
	refactoring := MoveMethodRefactoring 
		methodNamed: #m1
		from: sourceClass 
		to: targetClass 
		accessingThrough: 'iv1' 
		parameterNeeded: (ExtraParameterNameNeeded 
							parameterName: 'sourceObject').
	refactoring apply.
	
	self assert: 'm1: sourceObject ^sourceObject icv1+1.' equals: (targetClass sourceCodeAt: #m1:).
	self assert: 'icv1
	^Icv1.' equals: (sourceClass sourceCodeAt: #icv1).
	self assert: 'icv1_ ^1.' equals: (sourceClass sourceCodeAt: #icv1_).
	self assert: 'm1
	^iv1 m1: self.' equals: (sourceClass sourceCodeAt: #m1).! !

!MoveMethodRefactoringTest methodsFor: 'tests' stamp: 'mc 11/23/2023 00:55:20'!
test113AfterMovingMethodWhichReferencesAnClassVariableForReadingShouldCreateSetter
	
	| sourceClass targetClass refactoring |
	
	sourceClass := self createClassNamed: #SourceClass  subclassOf: Object instanceVariableNames: 'iv1' classVariableNames: 'Icv1' poolDictionaries: '' category: self class classCategoryOfTestData.
	targetClass := self createClassNamed: #TargetClass.
	sourceClass compile: 'initializeIv1 iv1 := TargetClass new.' .
	sourceClass compile: 'm1 ^Icv1 := 1.'.
	
	
	refactoring := MoveMethodRefactoring 
		methodNamed: #m1 
		from: sourceClass 
		to: targetClass 
		accessingThrough: 'iv1' 
		parameterNeeded: (ExtraParameterNameNeeded 
							parameterName: 'sourceObject').
	refactoring apply.
	
	self assert: 'm1: sourceObject ^sourceObject icv1: 1.' equals: (targetClass sourceCodeAt: #m1:).
	self assert: 'icv1: anObject', String newLineString, String tab, '^Icv1 := anObject.' equals: (sourceClass sourceCodeAt: #icv1:).! !

!MoveMethodRefactoringTest methodsFor: 'tests' stamp: 'mc 12/31/2023 03:26:50'!
test113AfterMovingMethodWhichReferencesAnClassVariableForReadingShouldCreateSetter2
	
	| sourceClass targetClass refactoring |
	
	sourceClass := self createClassNamed: #SourceClass  subclassOf: Object instanceVariableNames: 'iv1' classVariableNames: 'Icv1' poolDictionaries: '' category: self class classCategoryOfTestData.
	targetClass := self createClassNamed: #TargetClass.
	sourceClass compile: 'initializeIv1 iv1 := TargetClass new.' .
	sourceClass compile: 'icv1: anObject ^Icv1 := anObject.'.
	
	
	refactoring := MoveMethodRefactoring 
		methodNamed: #icv1:
		from: sourceClass 
		to: targetClass 
		accessingThrough: 'iv1' 
		parameterNeeded: (ExtraParameterNameNeededAndExtraKeyword 
							parameterName: 'sourceObject'
							extraKeyword: 'originalObject').
	refactoring apply.
	
	self assert: 'icv1: anObject originalObject: sourceObject ^sourceObject icv1_: anObject.' equals: (targetClass sourceCodeAt: #icv1:originalObject:).
	self assert: 'icv1: anObject
	^iv1 icv1: anObject originalObject: self.' equals: (sourceClass sourceCodeAt: #icv1:).
	self assert: 'icv1_: anObject
	^Icv1 := anObject.' equals: (sourceClass sourceCodeAt: #icv1_:).
	! !

!MoveMethodRefactoringTest methodsFor: 'tests' stamp: 'mc 11/23/2023 00:55:28'!
test114ParameterNameShouldBeRespected
	
	| sourceClass targetClass refactoring |
	
	sourceClass := self createClassNamed: #SourceClass instanceVariableNames: 'iv1 iv3'.
	targetClass := self createClassNamed: #TargetClass.
	sourceClass compile: 'iv3 ^iv3.'.
	sourceClass compile: 'initializeIv1 iv1 := TargetClass new.' .
	sourceClass compile: 'm1: anInt ^iv3 + anInt.'.
	
	
	refactoring := MoveMethodRefactoring 
					methodNamed: #m1:
					from: sourceClass 
					to: targetClass 
					accessingThrough: 'iv1'
					parameterNeeded: (ExtraParameterNameNeededAndExtraKeyword 
										parameterName: 'originalObject' 
										extraKeyword: 'extractIv3From').
	refactoring apply.
	
	self assert: 'iv3 ^iv3.' equals: (sourceClass sourceCodeAt: #iv3).
	self assert: 'm1: anInt extractIv3From: originalObject ^originalObject iv3 + anInt.' equals: (targetClass sourceCodeAt: #m1:extractIv3From:).
	self assert: 'm1: anInt
	^iv1 m1: anInt extractIv3From: self.' equals: (sourceClass sourceCodeAt: #m1:).
	self deny: (sourceClass includesSelector: #iv1).! !

!MoveMethodRefactoringTest methodsFor: 'tests' stamp: 'mc 11/23/2023 00:55:35'!
test115ParameterNameShouldBeRespected
	
	| sourceClass targetClass refactoring |
	
	sourceClass := self createClassNamed: #SourceClass instanceVariableNames: 'iv1 iv3'.
	targetClass := self createClassNamed: #TargetClass.
	sourceClass compile: 'iv3 ^iv3.'.
	sourceClass compile: 'initializeIv1 iv1 := TargetClass new.' .
	sourceClass compile: 'm1 ^iv3 + 1.'.
	
	
	refactoring := MoveMethodRefactoring 
		methodNamed: #m1 
		from: sourceClass 
		to: targetClass 
		accessingThrough: 'iv1' 
		parameterNeeded: (ExtraParameterNameNeeded 
							parameterName: 'originalObject').
	refactoring apply.
	
	self assert: 'iv3 ^iv3.' equals: (sourceClass sourceCodeAt: #iv3).
	self assert: 'm1: originalObject ^originalObject iv3 + 1.' equals: (targetClass sourceCodeAt: #m1:).
	self assert: 'm1
	^iv1 m1: self.' equals: (sourceClass sourceCodeAt: #m1).
	self deny: (sourceClass includesSelector: #iv1).! !

!MoveMethodRefactoringTest methodsFor: 'tests' stamp: 'mc 11/23/2023 00:55:42'!
test116ParameterNameShouldBeRespectedWithSelf
	
	| sourceClass targetClass refactoring |
	
	sourceClass := self createClassNamed: #SourceClass instanceVariableNames: 'iv1 iv3'.
	targetClass := self createClassNamed: #TargetClass.
	sourceClass compile: 'justOne ^1.'.
	sourceClass compile: 'initializeIv1 iv1 := TargetClass new.' .
	sourceClass compile: 'm1 ^self justOne.'.
	
	
	refactoring := MoveMethodRefactoring 
		methodNamed: #m1 
		from: sourceClass 
		to: targetClass 
		accessingThrough: 'iv1' 
		parameterNeeded: (ExtraParameterNameNeeded 
							parameterName: 'originalObject').
	refactoring apply.
	
	self assert: 'm1: originalObject ^originalObject justOne.' equals: (targetClass sourceCodeAt: #m1:).! !

!MoveMethodRefactoringTest methodsFor: 'tests' stamp: 'mc 11/23/2023 00:55:53'!
test199TmpVariablesShoulNotBeAffected
	
	| sourceClass targetClass refactoring |
	
	sourceClass := self createClassNamed: #SourceClass instanceVariableNames: 'iv1 iv3'.
	targetClass := self createClassNamed: #TargetClass.
	sourceClass compile: 'initializeIv1 iv1 := TargetClass new.' .
	sourceClass compile: 'm1 |tmp| ^tmp:=1.'.
	
	
	refactoring := MoveMethodRefactoring methodNamed: #m1 from: sourceClass to: targetClass accessingThrough: 'iv1' .
	refactoring apply.
	
	self assert: 'm1 |tmp| ^tmp:=1.' equals: (targetClass sourceCodeAt: #m1).! !

!MoveMethodRefactoringTest methodsFor: 'tests' stamp: 'mc 11/23/2023 00:56:00'!
test200CanMoveMethodWhenSendsMessageToSelf
	
	| sourceClass targetClass refactoring |
	
	sourceClass := self createClassNamed: #SourceClass instanceVariableNames: 'iv1 iv3'.
	targetClass := self createClassNamed: #TargetClass.
	sourceClass compile: 'justOne ^1.'.
	sourceClass compile: 'initializeIv1 iv1 := TargetClass new.' .
	sourceClass compile: 'm1 ^self justOne.'.
	
	
	refactoring := MoveMethodRefactoring 
		methodNamed: #m1 
		from: sourceClass 
		to: targetClass 
		accessingThrough: 'iv1' 
		parameterNeeded: (ExtraParameterNameNeeded 
							parameterName: 'sourceObject').
	refactoring apply.
	
	self assert: 'm1: sourceObject ^sourceObject justOne.' equals: (targetClass sourceCodeAt: #m1:).! !

!MoveMethodRefactoringTest methodsFor: 'tests' stamp: 'mc 11/23/2023 00:56:20'!
test200CanMoveMethodWhenSendsUnaryMessageToSuper
	
	| sourceClass targetClass refactoring sourceSuperClass |
	sourceSuperClass := self createClassNamed: #SourceSuperClass.
	sourceClass := self createClassNamed: #SourceClass  subclassOf: sourceSuperClass instanceVariableNames: 'iv1 iv3'.
	targetClass := self createClassNamed: #TargetClass.
	sourceSuperClass compile: 'justOne ^1.'.
	sourceClass compile: 'initializeIv1 iv1 := TargetClass new.' .
	sourceClass compile: 'justOne ^2.'.
	sourceClass compile: 'm1 ^super justOne.'.
	
	
	refactoring := MoveMethodRefactoring 
		methodNamed: #m1 
		from: sourceClass 
		to: targetClass 
		accessingThrough: 'iv1' 
		parameterNeeded: (ExtraParameterNameNeeded 
							parameterName: 'sourceObject').
	refactoring apply.
	
	self assert: 'm1: sourceObject ^sourceObject CHANGE_ME_super_justOne.' equals: (targetClass sourceCodeAt: #m1:).
	self assert: 'CHANGE_ME_super_justOne', String newLineString, String tab, '^super justOne.' equals: (sourceClass sourceCodeAt: #CHANGE_ME_super_justOne)! !

!MoveMethodRefactoringTest methodsFor: 'tests' stamp: 'mc 11/23/2023 00:56:30'!
test201CanMoveMethodWhenSendsKeywordMessageToSuperWithOneColaborators
	
	| sourceClass targetClass refactoring sourceSuperClass |
	sourceSuperClass := self createClassNamed: #SourceSuperClass.
	sourceClass := self createClassNamed: #SourceClass  subclassOf: sourceSuperClass instanceVariableNames: 'iv1 iv3'.
	targetClass := self createClassNamed: #TargetClass.
	sourceSuperClass compile: 'increment: aSmallinteger ^1+aSmallinteger.'.
	sourceClass compile: 'initializeIv1 iv1 := TargetClass new.' .
	sourceClass compile: 'increment: aSmallinteger ^2+aSmallinteger.'.
	sourceClass compile: 'm1 ^super increment: 1.'.
	
	
	refactoring := MoveMethodRefactoring 
		methodNamed: #m1 
		from: sourceClass 
		to: targetClass 
		accessingThrough: 'iv1' 
		parameterNeeded: (ExtraParameterNameNeeded 
							parameterName: 'sourceObject').
	refactoring apply.
	
	self assert: 'm1: sourceObject ^sourceObject CHANGE_ME_super_increment: 1.' equals: (targetClass sourceCodeAt: #m1:).
	self assert: 'CHANGE_ME_super_increment: arg1', String newLineString, String tab, '^super increment: arg1.' equals: (sourceClass sourceCodeAt: #CHANGE_ME_super_increment:)! !

!MoveMethodRefactoringTest methodsFor: 'tests' stamp: 'mc 11/23/2023 00:56:47'!
test202CanMoveMethodWhenSendsKeywordMessageToSuperWithTwoColaborators
	
	| sourceClass targetClass refactoring sourceSuperClass |
	sourceSuperClass := self createClassNamed: #SourceSuperClass.
	sourceClass := self createClassNamed: #SourceClass  subclassOf: sourceSuperClass instanceVariableNames: 'iv1 iv3'.
	targetClass := self createClassNamed: #TargetClass.
	sourceSuperClass compile: 'increment: aSmallinteger andIncrement: anotherSmallinteger ^1+aSmallinteger+anotherSmallinteger.'.
	sourceClass compile: 'increment: aSmallinteger andIncrement: anotherSmallinteger ^2+aSmallinteger+anotherSmallinteger.'.
	sourceClass compile: 'initializeIv1 iv1 := TargetClass new.' .
	sourceClass compile: 'm1 ^super increment: 1 andIncrement: 2.'.
	
	
	refactoring := MoveMethodRefactoring 
		methodNamed: #m1 
		from: sourceClass 
		to: targetClass 
		accessingThrough: 'iv1' 
		parameterNeeded: (ExtraParameterNameNeeded 
							parameterName: 'sourceObject').
	refactoring apply.
	
	self assert: 'm1: sourceObject ^sourceObject CHANGE_ME_super_increment: 1 andIncrement: 2.' equals: (targetClass sourceCodeAt: #m1:).
	self assert: 'CHANGE_ME_super_increment: arg1 andIncrement: arg2', String newLineString, String tab, '^super increment: arg1 andIncrement: arg2.' equals: (sourceClass sourceCodeAt: #CHANGE_ME_super_increment:andIncrement:)! !

!MoveMethodRefactoringTest methodsFor: 'tests' stamp: 'mc 11/23/2023 00:56:54'!
test203CanMoveMethodWhenSendsKeywordMessageToSuperWithOneInstVarAsColaborators
	
	| sourceClass targetClass refactoring sourceSuperClass |
	sourceSuperClass := self createClassNamed: #SourceSuperClass.
	sourceClass := self createClassNamed: #SourceClass  subclassOf: sourceSuperClass instanceVariableNames: 'iv1 iv2 iv3'.
	targetClass := self createClassNamed: #TargetClass.
	sourceSuperClass compile: 'increment: aSmallinteger ^1+aSmallinteger.'.
	sourceClass compile: 'increment: aSmallinteger ^2+aSmallinteger.'.
	sourceClass compile: 'initializeIv1 iv1 := TargetClass new.' .
	sourceClass compile: 'm1 ^super increment: iv2.'.
	
	
	refactoring := MoveMethodRefactoring 
		methodNamed: #m1 
		from: sourceClass 
		to: targetClass 
		accessingThrough: 'iv1' 
		parameterNeeded: (ExtraParameterNameNeeded 
							parameterName: 'sourceObject').
	refactoring apply.
	
	self assert: 'm1: sourceObject ^sourceObject CHANGE_ME_super_increment: sourceObject iv2.' equals: (targetClass sourceCodeAt: #m1:).
	self assert: 'CHANGE_ME_super_increment: arg1', String newLineString, String tab, '^super increment: arg1.' equals: (sourceClass sourceCodeAt: #CHANGE_ME_super_increment:)! !

!MoveMethodRefactoringTest methodsFor: 'tests' stamp: 'mc 11/23/2023 00:57:01'!
test204CanMoveMethodWhenSendsKeywordMessageToSuperWithOneInstVarAsColaborators
	
	| sourceClass targetClass refactoring sourceSuperClass |
	sourceSuperClass := self createClassNamed: #SourceSuperClass.
	sourceClass := self createClassNamed: #SourceClass  subclassOf: sourceSuperClass instanceVariableNames: 'iv1 iv2 iv3'.
	targetClass := self createClassNamed: #TargetClass.
	sourceSuperClass compile: 'increment: aSmallinteger ^1+aSmallinteger.'.
	sourceClass compile: 'increment: aSmallinteger ^2+aSmallinteger.'.
	sourceClass compile: 'initializeIv1 iv1 := TargetClass new.' .
	sourceClass compile: 'm1 ^super increment: (iv2 := 1).'.
	
	
	refactoring := MoveMethodRefactoring 
		methodNamed: #m1 
		from: sourceClass 
		to: targetClass 
		accessingThrough: 'iv1' 
		parameterNeeded: (ExtraParameterNameNeeded 
							parameterName: 'sourceObject').
	refactoring apply.
	
	self assert: 'm1: sourceObject ^sourceObject CHANGE_ME_super_increment: (sourceObject iv2: 1).' equals: (targetClass sourceCodeAt: #m1:).
	self assert: 'CHANGE_ME_super_increment: arg1', String newLineString, String tab, '^super increment: arg1.' equals: (sourceClass sourceCodeAt: #CHANGE_ME_super_increment:).
	self assert: 'iv2: anObject', String newLineString, String tab, '^iv2 := anObject.' equals: (sourceClass sourceCodeAt: #iv2:)! !

!MoveMethodRefactoringTest methodsFor: 'tests' stamp: 'mc 11/23/2023 00:57:08'!
test205CanMoveMethodWhenSendsKeywordMessageToSuperWithOneTmpVarAsColaborators
	
	| sourceClass targetClass refactoring sourceSuperClass |
	sourceSuperClass := self createClassNamed: #SourceSuperClass.
	sourceClass := self createClassNamed: #SourceClass  subclassOf: sourceSuperClass instanceVariableNames: 'iv1 iv3'.
	targetClass := self createClassNamed: #TargetClass.
	sourceSuperClass compile: 'increment: aSmallinteger ^1+aSmallinteger.'.
	sourceClass compile: 'increment: aSmallinteger ^2+aSmallinteger.'.
	sourceClass compile: 'initializeIv1 iv1 := TargetClass new.' .
	sourceClass compile: 'm1 |asd| ^super increment: asd.'.
	
	
	refactoring := MoveMethodRefactoring 
		methodNamed: #m1 
		from: sourceClass 
		to: targetClass 
		accessingThrough: 'iv1' 
		parameterNeeded: (ExtraParameterNameNeeded 
							parameterName: 'sourceObject').
	refactoring apply.
	
	self assert: 'm1: sourceObject |asd| ^sourceObject CHANGE_ME_super_increment: asd.' equals: (targetClass sourceCodeAt: #m1:).
	self assert: 'CHANGE_ME_super_increment: arg1', String newLineString, String tab, '^super increment: arg1.' equals: (sourceClass sourceCodeAt: #CHANGE_ME_super_increment:)! !

!MoveMethodRefactoringTest methodsFor: 'tests' stamp: 'mc 12/28/2023 01:01:14'!
test206moveGetterShouldNotMakeDoubleRecursion
	
	| sourceClass targetClass refactoring |
	
	sourceClass := self createClassNamed: #SourceClass instanceVariableNames: 'iv1 iv2'.
	targetClass := self createClassNamed: #TargetClass.
	sourceClass compile: 'initializeIv1 iv1 := TargetClass new.' .
	sourceClass compile: 'iv2 ^iv2.'.
	
	
	refactoring := MoveMethodRefactoring 
		methodNamed: #iv2 
		from: sourceClass 
		to: targetClass 
		accessingThrough: 'iv1' 
		parameterNeeded: (ExtraParameterNameNeeded 
							parameterName: 'sourceObject').
	refactoring apply.
	
	self assert: 'iv2: sourceObject ^sourceObject iv2_.' equals: (targetClass sourceCodeAt: #iv2:).
	self assert: 'iv2_
	^iv2.' equals: (sourceClass sourceCodeAt: #iv2_).
	self assert: 'iv2
	^iv1 iv2: self.' equals: (sourceClass sourceCodeAt: #iv2).
	
	! !

!MoveMethodRefactoringTest methodsFor: 'tests' stamp: 'mc 12/28/2023 01:04:55'!
test207moveGetterShouldNotMakeDoubleRecursion
	
	| sourceClass targetClass refactoring |
	
	sourceClass := self createClassNamed: #SourceClass instanceVariableNames: 'iv1 iv2'.
	targetClass := self createClassNamed: #TargetClass.
	sourceClass compile: 'initializeIv1 iv1 := TargetClass new.' .
	sourceClass compile: 'iv2 ^1.'.
	sourceClass compile: 'iv2_ ^iv2.'.
	
	
	refactoring := MoveMethodRefactoring 
		methodNamed: #iv2_ 
		from: sourceClass 
		to: targetClass 
		accessingThrough: 'iv1' 
		parameterNeeded: (ExtraParameterNameNeeded 
							parameterName: 'sourceObject').
	refactoring apply.
	
	self assert: 'iv2 ^1.' equals: (sourceClass sourceCodeAt: #iv2).
	self assert: 'iv2_: sourceObject ^sourceObject iv2__.' equals: (targetClass sourceCodeAt: #iv2_:).
	self assert: 'iv2__
	^iv2.' equals: (sourceClass sourceCodeAt: #iv2__).
	self assert: 'iv2_
	^iv1 iv2_: self.' equals: (sourceClass sourceCodeAt: #iv2_).
	
	! !

!MoveMethodRefactoringTest methodsFor: 'tests' stamp: 'mc 11/23/2023 00:57:18'!
test300MovingMethodWichUsesAccesingThroughVariableShouldBeRepalcedForSelf
	
	| sourceClass targetClass refactoring |
	
	sourceClass := self createClassNamed: #SourceClass instanceVariableNames: 'iv1 iv3'.
	targetClass := self createClassNamed: #TargetClass.
	sourceClass compile: 'initializeIv1 iv1 := TargetClass new.' .
	sourceClass compile: 'm1 ^iv3 + iv1 number.' .
	
	
	refactoring := MoveMethodRefactoring 
		methodNamed: #m1 
		from: sourceClass 
		to: targetClass 
		accessingThrough: 'iv1' 
		parameterNeeded: (ExtraParameterNameNeeded 
							parameterName: 'sourceObject').
	refactoring apply.
	
	self assert: 'm1: sourceObject ^sourceObject iv3 + self number.' equals: (targetClass sourceCodeAt: #m1:).
	self assert: 'm1
	^iv1 m1: self.' equals: (sourceClass sourceCodeAt: #m1).
	self deny: (sourceClass includesSelector: #iv1).
	self assert: 'iv3', String newLineString, String tab, '^iv3.' equals: (sourceClass sourceCodeAt: #iv3).! !

!MoveMethodRefactoringTest methodsFor: 'tests' stamp: 'mc 11/23/2023 00:57:25'!
test301MovingMethodWichUsesAccesingThroughVariableShouldBeRepalcedForSelf
	
	| sourceClass targetClass refactoring |
	
	sourceClass := self createClassNamed: #SourceClass instanceVariableNames: 'iv1'.
	targetClass := self createClassNamed: #TargetClass.
	sourceClass compile: 'initializeIv1 iv1 := TargetClass new.' .
	sourceClass compile: 'm1 ^iv1 number.' .
	
	
	refactoring := MoveMethodRefactoring 
		methodNamed: #m1 
		from: sourceClass 
		to: targetClass 
		accessingThrough: 'iv1' 
		parameterNeeded: (NonExtraParameterNameNeeded new).
	refactoring apply.
	
	self assert: 'm1 ^self number.' equals: (targetClass sourceCodeAt: #m1).
	self assert: 'm1
	^iv1 m1.' equals: (sourceClass sourceCodeAt: #m1).
	self deny: (sourceClass includesSelector: #iv1).! !

!MoveMethodRefactoringTest methodsFor: 'tests' stamp: 'mc 11/24/2023 00:05:26'!
test302CanMoveMethodWhenVariableToAccesThroughIsInSuperClass
	
	| sourceClass targetClass refactoring sourceSuperClass |
	sourceSuperClass := self createClassNamed: #SourceSuperClass instanceVariableNames: 'iv1 iv3'..
	sourceClass := self createClassNamed: #SourceClass  subclassOf: sourceSuperClass.
	targetClass := self createClassNamed: #TargetClass.
	sourceSuperClass compile: 'iv1: anObject ^iv1 := anObject.'.
	sourceClass compile: 'm1 ^1.'.
	
	refactoring := MoveMethodRefactoring 
		methodNamed: #m1 
		from: sourceClass 
		to: targetClass 
		accessingThrough: 'iv1' 
		parameterNeeded: (NonExtraParameterNameNeeded new).
	refactoring apply.
	
	self assert: 'm1 ^1.' equals: (targetClass sourceCodeAt: #m1).
	self assert: 'm1
	^iv1 m1.' equals: (sourceClass sourceCodeAt: #m1)! !

!MoveMethodRefactoringTest methodsFor: 'tests' stamp: 'mc 11/26/2023 02:50:36'!
test303AfterMovingMethodWhichReferencesAClassShouldKeepTheClass
	
	| sourceClass targetClass refactoring |
	
	sourceClass := self createClassNamed: #SourceClass  subclassOf: Object instanceVariableNames: 'iv1' classVariableNames: 'Icv1' poolDictionaries: '' category: self class classCategoryOfTestData.
	targetClass := self createClassNamed: #TargetClass.
	sourceClass compile: 'initializeIv1 iv1 := TargetClass new.' .
	sourceClass compile: 'm1 ^Array new.'.
	
	
	refactoring := MoveMethodRefactoring 
		methodNamed: #m1 
		from: sourceClass 
		to: targetClass 
		accessingThrough: 'iv1' 
		parameterNeeded: NonExtraParameterNameNeeded new.
	refactoring apply.
	
	self assert: 'm1 ^Array new.' equals: (targetClass sourceCodeAt: #m1).
	self assert: 'm1
	^iv1 m1.' equals: (sourceClass sourceCodeAt: #m1)! !

!MoveMethodRefactoringTest methodsFor: 'tests' stamp: 'mc 12/3/2023 01:48:51'!
test304ClassMethodsShouldBleMoverWithoutVariableToAccessTargetClass
	
	| sourceClass targetClass refactoring |
	
	sourceClass := self createClassNamed: #SourceClass. 
	targetClass := self createClassNamed: #TargetClass.
	sourceClass class compile: 'm1 ^1.'.
	
	refactoring := MoveMethodRefactoring 
		classMethodNamed: #m1 
		from: sourceClass 
		to: targetClass
		parameterNeeded: NonExtraParameterNameNeeded new.
	refactoring apply.
	
	self assert: 'm1 ^1.' equals: (targetClass class sourceCodeAt: #m1).
	self assert: 'm1
	^TargetClass m1.' equals: (sourceClass class sourceCodeAt: #m1)! !

!MoveMethodRefactoringTest methodsFor: 'tests' stamp: 'mc 12/4/2023 16:51:57'!
test305ClassMethodsShouldBleMovedWithoutVariableToAccessTargetClass
	
	| sourceClass targetClass refactoring |
	
	sourceClass := self createClassNamed: #SourceClass. 
	targetClass := self createClassNamed: #TargetClass.
	sourceClass class compile: 'm1 ^self new.'.
	
	refactoring := MoveMethodRefactoring 
		classMethodNamed: #m1 
		from: sourceClass 
		to: targetClass
		parameterNeeded: (ExtraParameterNameNeeded parameterName: 'aSourceClassClass').
	refactoring apply.
	
	self assert: 'm1: aSourceClassClass ^aSourceClassClass new.' equals: (targetClass class sourceCodeAt: #m1:).
	self assert: 'm1
	^TargetClass m1: self.' equals: (sourceClass class sourceCodeAt: #m1)! !

!MoveMethodRefactoringTest methodsFor: 'tests' stamp: 'mc 12/6/2023 00:21:02'!
test306ClassMethodsShouldBleMovedWithoutVariableToAccessTargetClass
	
	| sourceClass targetClass refactoring |
	
	sourceClass := self createClassNamed: #SourceClass. 
	targetClass := self createClassNamed: #TargetClass.
	sourceClass class compile: 'm1 ^super new.'.
	
	refactoring := MoveMethodRefactoring 
		classMethodNamed: #m1 
		from: sourceClass 
		to: targetClass
		parameterNeeded: (ExtraParameterNameNeeded parameterName: 'aSourceClassClass').
	refactoring apply.
	
	self assert: 'm1: aSourceClassClass ^aSourceClassClass CHANGE_ME_super_new.' equals: (targetClass class sourceCodeAt: #m1:).
	self assert: 'm1
	^TargetClass m1: self.' equals: (sourceClass class sourceCodeAt: #m1).
	self assert: 'CHANGE_ME_super_new
	^super new.' equals: (sourceClass class sourceCodeAt: #CHANGE_ME_super_new).! !

!MoveMethodRefactoringTest methodsFor: 'tests' stamp: 'mc 12/6/2023 00:18:12'!
test307ClassMethodsShouldBleMovedWithoutVariableToAccessTargetClass
	
	| sourceClass targetClass refactoring |
	
	sourceClass := self createClassNamed: #SourceClass.
	targetClass := self createClassNamed: #TargetClass.
	sourceClass class addInstVarName: 'iv3'.
	sourceClass class compile: 'iv3 ^iv3.'.
	sourceClass class compile: 'm1 ^iv3 + 1.'.
	
	refactoring := MoveMethodRefactoring 
		classMethodNamed: #m1
		from: sourceClass 
		to: targetClass
		parameterNeeded: (ExtraParameterNameNeeded parameterName: 'aSourceClassClass').
	refactoring apply.

	self assert: 'iv3 ^iv3.' equals: (sourceClass class sourceCodeAt: #iv3).
	self assert: 'm1: aSourceClassClass ^aSourceClassClass iv3 + 1.' equals: (targetClass class sourceCodeAt: #m1:).
	self assert: 'm1
	^TargetClass m1: self.' equals: (sourceClass class sourceCodeAt: #m1)! !

!MoveMethodRefactoringTest methodsFor: 'tests' stamp: 'mc 12/6/2023 02:03:52'!
test308ClassMethodsShouldBleMovedWithoutVariableToAccessTargetClass
	
	| sourceClass targetClass refactoring |
	
	sourceClass := self createClassNamed: #SourceClass.
	targetClass := self createClassNamed: #TargetClass.
	sourceClass class addInstVarName: 'iv3'.
	sourceClass class compile: 'iv3: anObject ^iv3 := anObject.'.
	sourceClass class compile: 'm1 ^iv3 := 1.'.
	
	refactoring := MoveMethodRefactoring 
		classMethodNamed: #m1
		from: sourceClass 
		to: targetClass
		parameterNeeded: (ExtraParameterNameNeeded parameterName: 'aSourceClassClass').
	refactoring apply.

	self assert: 'iv3: anObject ^iv3 := anObject.' equals: (sourceClass class sourceCodeAt: #iv3:).
	self assert: 'm1: aSourceClassClass ^aSourceClassClass iv3: 1.' equals: (targetClass class sourceCodeAt: #m1:).
	self assert: 'm1
	^TargetClass m1: self.' equals: (sourceClass class sourceCodeAt: #m1)! !

!MoveMethodRefactoringTest methodsFor: 'tests' stamp: 'mc 12/6/2023 23:48:01'!
test309ClassMethodsShouldBleMovedWithoutVariableToAccessTargetClass
	
	| sourceClass targetClass refactoring sourceSuperClass |
	sourceSuperClass := self createClassNamed: #SourceSuperClass.
	sourceClass := self createClassNamed: #SourceClass subclassOf: sourceSuperClass.
	targetClass := self createClassNamed: #TargetClass.
	sourceClass class compile: 'm1 ^super increment: 1.'.
	
	refactoring := MoveMethodRefactoring 
		classMethodNamed: #m1
		from: sourceClass 
		to: targetClass
		parameterNeeded: (ExtraParameterNameNeeded parameterName: 'aSourceClassClass').
	refactoring apply.

	self assert: 'm1: aSourceClassClass ^aSourceClassClass CHANGE_ME_super_increment: 1.' equals: (targetClass class sourceCodeAt: #m1:).
	self assert: 'm1
	^TargetClass m1: self.' equals: (sourceClass class sourceCodeAt: #m1).
	self assert: 'CHANGE_ME_super_increment: arg1
	^super increment: arg1.' equals: (sourceClass class sourceCodeAt: #CHANGE_ME_super_increment:).
	! !

!MoveMethodRefactoringTest methodsFor: 'tests' stamp: 'mc 3/31/2024 02:03:49'!
test401ImplicitReturnShouldBeMoved
	
	| sourceClass targetClass refactoring |
	sourceClass := self createClassNamed: #SourceClass instanceVariableNames: 'iv1'.
	targetClass := self createClassNamed: #TargetClass.
	sourceClass compile: 'initializeIv1 iv1 := TargetClass new.' .
	sourceClass compile: 'm1 .'.
	
	refactoring := MoveMethodRefactoring 
					methodNamed: #m1 
					from: sourceClass 
					to: targetClass 
					accessingThrough: 'iv1' 
					parameterNeeded: (ExtraParameterNameNeeded parameterName: 'aSourceObject').
	refactoring apply.

	self assert: 'm1: aSourceObject .
	^aSourceObject.' equals: (targetClass sourceCodeAt: #m1:).
	self assert: 'm1
	^iv1 m1: self.' equals: (sourceClass sourceCodeAt: #m1).
	! !

!MoveMethodRefactoringTest methodsFor: 'tests' stamp: 'mc 4/25/2024 14:43:16'!
test402ImplicitReturnShouldBeMovedAndAddADotInLastWritedSentence
	
	| sourceClass targetClass refactoring |
	sourceClass := self createClassNamed: #SourceClass instanceVariableNames: 'iv1'.
	targetClass := self createClassNamed: #TargetClass.
	sourceClass compile: 'initializeIv1 iv1 := TargetClass new.' .
	sourceClass compile: 'm1 1'.
	
	refactoring := MoveMethodRefactoring 
					methodNamed: #m1 
					from: sourceClass 
					to: targetClass 
					accessingThrough: 'iv1' 
					parameterNeeded: (ExtraParameterNameNeeded parameterName: 'aSourceObject').
	refactoring apply.

	self assert: 'm1: aSourceObject 1.
	^aSourceObject.' equals: (targetClass sourceCodeAt: #m1:).
	self assert: 'm1
	^iv1 m1: self.' equals: (sourceClass sourceCodeAt: #m1).
	! !

!MoveMethodRefactoringTest methodsFor: 'tests' stamp: 'mc 4/25/2024 14:41:32'!
test403aNonImplicitReturnShouldBeMoved
	
	| sourceClass targetClass refactoring |
	sourceClass := self createClassNamed: #SourceClass instanceVariableNames: 'iv1'.
	targetClass := self createClassNamed: #TargetClass.
	sourceClass compile: 'initializeIv1 iv1 := TargetClass new.' .
	sourceClass compile: 'm1 ^self'.
	
	refactoring := MoveMethodRefactoring 
					methodNamed: #m1 
					from: sourceClass 
					to: targetClass 
					accessingThrough: 'iv1' 
					parameterNeeded: (ExtraParameterNameNeeded parameterName: 'aSourceObject').
	refactoring apply.

	self assert: 'm1: aSourceObject ^aSourceObject' equals: (targetClass sourceCodeAt: #m1:).
	self assert: 'm1
	^iv1 m1: self.' equals: (sourceClass sourceCodeAt: #m1).
	! !

!MoveMethodRefactoring methodsFor: 'initialization' stamp: 'mc 12/3/2023 02:51:03'!
initializeClassMethodNamed: aMethodName from: aSourceClass to: aTargetClass parameterNeeded: anExtraParameterNeeded 
	methodName := aMethodName.
	sourceClass := aSourceClass.
	targetClass := aTargetClass.
	parameterNeeded := anExtraParameterNeeded.! !

!MoveMethodRefactoring methodsFor: 'initialization' stamp: 'mc 4/7/2024 02:14:28'!
initializeMethodNamed: aMethodName from: aSourceClass to: aTargetClass accessingThrough: anInstanceVariable parameterNeeded: anExtraParameterNeeded 
	methodName := aMethodName.
	sourceClass := aSourceClass.
	targetClass := aTargetClass.
	instanceVariableToAccessTarget := anInstanceVariable.
	parameterNeeded := anExtraParameterNeeded ! !

!MoveMethodRefactoring methodsFor: 'applying' stamp: 'mc 4/7/2024 02:00:45'!
apply
	self
		findMethodToMove;
		replaceDependenciesOnMethodToMove;
		compileInTargetClass;
		createAccessors;
		replaceMethodForDelegation.! !

!MoveMethodRefactoring methodsFor: 'private' stamp: 'mc 4/7/2024 01:51:44'!
compileInTargetClass

	^ targetClass compile: resultAfterReplaceDependencies sourceCode! !

!MoveMethodRefactoring methodsFor: 'private' stamp: 'mc 4/7/2024 01:54:45'!
createAccessors

	^ resultAfterReplaceDependencies createAccessors! !

!MoveMethodRefactoring methodsFor: 'private' stamp: 'mc 4/7/2024 01:53:30'!
findMethodToMove

	^ compiledMethodToMove := sourceClass methodDict at: methodName! !

!MoveMethodRefactoring methodsFor: 'private' stamp: 'mc 4/7/2024 02:12:37'!
replaceDependenciesOnMethodToMove
	| replacer |
	
	replacer := CodeForNodeToMove for: compiledMethodToMove variableToAccesThrough: instanceVariableToAccessTarget parameterNeeded: parameterNeeded.
	resultAfterReplaceDependencies := replacer value.! !

!MoveMethodRefactoring methodsFor: 'private' stamp: 'mc 4/7/2024 02:12:37'!
replaceMethodForDelegation

	selectorForDelegation := parameterNeeded newSenderFor: compiledMethodToMove.
	
	codeForDelegation := compiledMethodToMove selectorAndArgumentsAsString, String newLineString, String tab, '^'.
	
	sourceClass isMeta ifTrue: [ instanceVariableToAccessTarget := (targetClass soleInstance name) ].
	codeForDelegation := codeForDelegation, instanceVariableToAccessTarget, ' ', selectorForDelegation, '.'.
	sourceClass compile: codeForDelegation! !

!MoveMethodRefactoring class methodsFor: 'instance creation' stamp: 'mc 12/9/2023 02:34:17'!
classMethodNamed: methodName from: sourceClass to: targetClass parameterNeeded: anExtraParameterNeeded 
	(methodName isNil) ifTrue: [ self refactoringError: self classMethodToMoveShouldNotBeNilErrorMessage ].
	(sourceClass isNil) ifTrue: [ self refactoringError: self sourceClassShouldNotBeNilErrorMessage].
	(targetClass isNil) ifTrue: [ self refactoringError: self targetClassShouldNotBeNilErrorMessage ].
	(targetClass class includesSelector: methodName) ifTrue: [ self refactoringError: self classMethodShouldNotExistsOnTargertClassErrorMessage ].
	(sourceClass class includesSelector: methodName) ifFalse: [ self refactoringError: self classMethodShouldExistsOnSourceClassErrorMessage ].

	anExtraParameterNeeded 
		assertIfCanMoveClassMethod: methodName
		from: sourceClass
		to: targetClass.
	
	^self new initializeClassMethodNamed: methodName from: sourceClass class to: targetClass class parameterNeeded: anExtraParameterNeeded ! !

!MoveMethodRefactoring class methodsFor: 'instance creation' stamp: 'mc 9/7/2023 22:56:57'!
methodNamed: methodName from: sourceClass to: targetClass accessingThrough: instanceVariable    

	^self 
		methodNamed: methodName 
		from: sourceClass
		to: targetClass
		accessingThrough: instanceVariable
		parameterNeeded: NonExtraParameterNameNeeded new
		! !

!MoveMethodRefactoring class methodsFor: 'instance creation' stamp: 'mc 4/7/2024 02:14:28'!
methodNamed: methodName from: sourceClass to: targetClass accessingThrough: instanceVariable parameterNeeded: anExtraParameterNeeded  
	
	
	(targetClass isNil) ifTrue: [ self refactoringError: self targetClassShouldNotBeNilErrorMessage ].
	(sourceClass isNil) ifTrue: [ self refactoringError: self sourceClassShouldNotBeNilErrorMessage].
	(methodName isNil) ifTrue: [ self refactoringError: self methodShouldNotBeNilErrorMessage ].
	(instanceVariable isNil) ifTrue: [ self refactoringError: self instanceVariableToAccessingThroughShouldNotBeNilErrorMessage ].
	(sourceClass includesSelector: methodName) ifFalse: [ self refactoringError: self methodShouldExistsOnSourceClassErrorMessage ].
	(sourceClass allInstVarNames includes: instanceVariable) ifFalse: [ self refactoringError: self instanceVariableToAccessingThroughShouldExistsInSourceClassErrorMessage ].
	(targetClass includesSelector: methodName) ifTrue: [ MessageToMoveShouldNotExistOnClass signal: self methodShouldNotExistsOnTargertClassErrorMessage ].
	anExtraParameterNeeded assertIfCanMove: methodName from: sourceClass to: targetClass accessingThrough: instanceVariable.
	
	(self existsAssignationOf: instanceVariable inHierarchyOf: sourceClass ) ifFalse: [ self refactoringWarning: (self instanceVariableToAccessingThroughShouldHaveAtLeastOneAssignationErrorMessage: instanceVariable) ].
	
	^self new 
		initializeMethodNamed: methodName 
		from: sourceClass 
		to: targetClass 
		accessingThrough: instanceVariable 
		parameterNeeded: anExtraParameterNeeded 
		! !

!MoveMethodRefactoring class methodsFor: 'error messages' stamp: 'mc 12/9/2023 01:30:44'!
classMethodShouldExistsOnSourceClassErrorMessage
	
	^'class method should exists on source class'! !

!MoveMethodRefactoring class methodsFor: 'error messages' stamp: 'mc 12/9/2023 01:01:16'!
classMethodShouldNotExistsOnTargertClassErrorMessage
	
	^'class method should not exists on targert class'! !

!MoveMethodRefactoring class methodsFor: 'error messages' stamp: 'mc 12/8/2023 02:35:10'!
classMethodToMoveShouldNotBeNilErrorMessage
	^'class method to move should not be nil'! !

!MoveMethodRefactoring class methodsFor: 'error messages' stamp: 'mc 4/5/2023 02:12:56'!
instanceVariableToAccessingThroughShouldExistsInSourceClassErrorMessage
	^'InstanceVariable to accessing through should exists in source class'! !

!MoveMethodRefactoring class methodsFor: 'error messages' stamp: 'mc 11/23/2023 20:44:43'!
instanceVariableToAccessingThroughShouldHaveAtLeastOneAssignationErrorMessage: instanceVariableName
	^'Instance variable ', instanceVariableName, ' should have at least one assignation'! !

!MoveMethodRefactoring class methodsFor: 'error messages' stamp: 'mc 4/5/2023 02:09:17'!
instanceVariableToAccessingThroughShouldNotBeNilErrorMessage
	^'InstanceVariable to accessing through should not be nil'! !

!MoveMethodRefactoring class methodsFor: 'error messages' stamp: 'mc 4/4/2023 00:28:01'!
methodShouldExistsOnSourceClassErrorMessage
	^'Method should exists on source class'! !

!MoveMethodRefactoring class methodsFor: 'error messages' stamp: 'mc 4/4/2023 18:59:52'!
methodShouldNotBeNilErrorMessage
	^'Method should not be nil'! !

!MoveMethodRefactoring class methodsFor: 'error messages' stamp: 'mc 4/4/2023 01:27:48'!
methodShouldNotExistsOnTargertClassErrorMessage
	^'Method should not exists on targert class'! !

!MoveMethodRefactoring class methodsFor: 'error messages' stamp: 'mc 8/25/2023 00:23:07'!
nameForNewParameterKeywordShouldBeProvidedClassErrorMessage
	^'name for new parameter keyword should be provided'! !

!MoveMethodRefactoring class methodsFor: 'error messages' stamp: 'mc 9/1/2023 00:16:41'!
nameForNewParameterKeywordShouldNotBeProvidedClassErrorMessage
	^'name for new parameter keyword should not be provided'.! !

!MoveMethodRefactoring class methodsFor: 'error messages' stamp: 'mc 8/24/2023 23:10:27'!
nameForNewParameterShouldBeProvidedClassErrorMessage
	^'name for new parameter should be provided.'! !

!MoveMethodRefactoring class methodsFor: 'error messages' stamp: 'mc 8/31/2023 23:47:27'!
nameForNewParameterShouldNotBeProvidedClassErrorMessage
	^'name for new parameter should not be provided.'! !

!MoveMethodRefactoring class methodsFor: 'error messages' stamp: 'mc 4/4/2023 18:26:41'!
sourceClassShouldNotBeNilErrorMessage
	^'Source class should not be nil'! !

!MoveMethodRefactoring class methodsFor: 'error messages' stamp: 'mc 4/4/2023 18:23:46'!
targetClassShouldNotBeNilErrorMessage
	^'Target class should not be nil'! !

!MoveMethodRefactoring class methodsFor: 'testing' stamp: 'mc 11/24/2023 02:12:44'!
existsAssignationOf: instanceVariable inHierarchyOf: sourceClass 
	| existsAssignation |
	existsAssignation := false.
	sourceClass withAllSuperAndSubclassesDoGently: [ :aClassInSourceHierachy |  
		existsAssignation := existsAssignation or: [(aClassInSourceHierachy whichSelectorsStoreInto: instanceVariable) notEmpty] 
	].
	^existsAssignation.! !

!MoveMethodRefactoring class methodsFor: 'testing' stamp: 'mc 12/17/2023 22:37:00'!
needParameterNameToMove: methodName from: sourceClass accessingThrough: instanceVariable 
	| compiledMethod needParameterNameVisitor |
	compiledMethod := sourceClass compiledMethodAt: methodName.
	needParameterNameVisitor := NeedParameterName for: compiledMethod newAccessingThrough: instanceVariable .
	^needParameterNameVisitor value! !

!MoveMethodRefactoring class methodsFor: 'testing' stamp: 'mc 12/9/2023 02:42:59'!
needParameterNameToMoveClassMethod: methodName from: sourceClass 
	
	| compiledMethod methodNode needParameterName needParameterNameVisitor |
	
	compiledMethod := sourceClass class compiledMethodAt: methodName.
	methodNode := compiledMethod methodNode.
	needParameterName := false.
	needParameterNameVisitor := NeedParameterNameForClassMethod new.
	methodNode accept: needParameterNameVisitor.
	^needParameterNameVisitor needParameterName! !

!MoveMethodApplier methodsFor: 'initialization' stamp: 'mc 9/7/2023 23:12:10'!
initializeInitializeOn: aModel forMethod: aMethodReference 
	model := aModel.
	methodReference := aMethodReference.! !

!MoveMethodApplier methodsFor: 'refactoring - creation' stamp: 'mc 12/7/2023 23:34:11'!
createRefactoring
	"self halt."
	sourceClass isMeta 
		ifTrue: [
			^MoveMethodRefactoring 
				classMethodNamed: methodToMove
				from: sourceClass soleInstance
				to: targetClass
				parameterNeeded: extraParameter.]
		ifFalse: [
			^MoveMethodRefactoring 
				methodNamed: methodToMove 
				from: sourceClass 
				to: targetClass 
				accessingThrough: accessingThroughinstanceVariableName 
				parameterNeeded: extraParameter . ]
! !

!MoveMethodApplier methodsFor: 'refactoring - parameters request' stamp: 'mc 11/13/2023 02:06:51'!
askExtraParameterIfNeeded
	
	| parameterKeyword parameterName |
	(MoveMethodRefactoring needParameterNameToMove: methodToMove from: sourceClass accessingThrough: accessingThroughinstanceVariableName)
		ifTrue: [
			methodToMove isKeyword 
				ifTrue: [
					parameterName := self request: 'Enter new parameter name' initialAnswer: 'a', sourceClass name asString.
					parameterKeyword := self request: 'Enter new parameter keyword' initialAnswer: 'a', sourceClass name asString.
					extraParameter := ExtraParameterNameNeededAndExtraKeyword 
										parameterName: parameterName 
										extraKeyword: parameterKeyword.
					]
				ifFalse: [
					parameterName := self request: 'Enter new parameter name' initialAnswer: 'a', sourceClass name asString.
					extraParameter := ExtraParameterNameNeeded parameterName: parameterName.
					].
			]
		ifFalse: [
			extraParameter := NonExtraParameterNameNeeded new.
			]! !

!MoveMethodApplier methodsFor: 'refactoring - parameters request' stamp: 'mc 12/10/2023 03:38:12'!
askTargetClassName
	| targetClassNameTmp initialAnswer |
	initialAnswer := self initialAnswerForInstanceVariable: accessingThroughinstanceVariableName in: sourceClass.
	targetClassNameTmp := ClassNameRequestMorph request: 'Enter target class name:' initialAnswer: initialAnswer orCancel: requestExitBlock.
	targetClassNameTmp := targetClassNameTmp withoutSeparators.
	targetClass := Smalltalk at: targetClassNameTmp asSymbol ifAbsent: [Refactoring refactoringErrorClass signal: 'Cant find the target class'].! !

!MoveMethodApplier methodsFor: 'refactoring - parameters request' stamp: 'mc 12/7/2023 23:29:52'!
chooseInstanceVariableToAccessThrough
	| vars index |
	"self halt."
	sourceClass isMeta ifTrue: [^self].
	vars := sourceClass allInstVarNames sorted.
	"vars := vars reject: [ :anInstanceVariable | anInstanceVariable = instanceVariableName ]."
	vars isEmpty ifTrue: [Refactoring refactoringErrorClass signal: 'There is no instance variable to access through' ].
	
	index := (PopUpMenu labelArray: vars lines: #()) startUpWithCaption: self selectVariableLabel.
	index = 0 ifTrue: [^self endRequest].
	accessingThroughinstanceVariableName := vars at: index.! !

!MoveMethodApplier methodsFor: 'refactoring - parameters request' stamp: 'mc 8/6/2023 17:42:37'!
chooseMethodToMove
	methodToMove := methodReference selector! !

!MoveMethodApplier methodsFor: 'refactoring - parameters request' stamp: 'mc 12/10/2023 23:44:41'!
initialAnswerForInstanceVariable: anAccessingThroughinstanceVariableName in: aSourceClass 
	
	^''
		
	! !

!MoveMethodApplier methodsFor: 'refactoring - parameters request' stamp: 'mc 8/30/2023 01:38:48'!
requestRefactoringParameters
	self 
		chooseMethodToMove;
		selectClassWichMethodIsDefined;
		chooseInstanceVariableToAccessThrough;
		askTargetClassName;
		askExtraParameterIfNeeded.
		! !

!MoveMethodApplier methodsFor: 'refactoring - parameters request' stamp: 'mc 8/6/2023 17:44:36'!
selectClassWichMethodIsDefined
	sourceClass := methodReference actualClass ! !

!MoveMethodApplier methodsFor: 'refactoring - parameters request' stamp: 'mc 8/6/2023 17:48:35'!
selectVariableLabel
	^'Select variable to access through'! !

!MoveMethodApplier methodsFor: 'refactoring - parameters request' stamp: 'mc 9/10/2023 14:41:14'!
showChanges
	"nothing to inform"! !

!MoveMethodApplier class methodsFor: 'instance creation' stamp: 'mc 7/6/2023 23:09:15'!
createAndValueHandlingExceptionsOn: aModel forMethod: aMethodReference 
	self createAndValueHandlingExceptions: [ self initializeOn: aModel forMethod: aMethodReference ].! !

!MoveMethodApplier class methodsFor: 'instance creation' stamp: 'mc 12/11/2023 00:37:44'!
initialize
	(Smalltalk classNamed: #LiveTyping) ifNotNil: [
		RefactoringApplier 
			registerMoveMethodApplier: MoveMethodWithActualScopeApplier.
	].
	! !

!MoveMethodApplier class methodsFor: 'instance creation' stamp: 'mc 8/6/2023 16:51:50'!
initializeOn: aModel forMethod: aMethodReference 
	^self new initializeInitializeOn: aModel forMethod: aMethodReference ! !

!MoveMethodWithActualScopeApplier methodsFor: 'refactoring - parameters request' stamp: 'mc 1/8/2024 00:36:35'!
initialAnswerForInstanceVariable: anAccessingThroughinstanceVariableName in: aSourceClass 
	
	| liveTypingTypes |
	"self halt."
	sourceClass shouldLiveTypingBeDisabled 
		ifTrue: [^'']
		ifFalse: [
			liveTypingTypes := sourceClass commonSupertypeOfInstanceVariableNamed: accessingThroughinstanceVariableName ifNoTypes: [^''].
			
			"typeInfoOfInstanceVariableNamed: accessingThroughinstanceVariableName ifAbsent: [^''].
			((liveTypingTypes types includes: UndefinedObject) or: [liveTypingTypes types isEmpty]) ifTrue: [^'']."
			^liveTypingTypes name asString 
		]! !

!CodeForNodeToMoveResult methodsFor: 'public' stamp: 'mc 12/29/2023 02:49:36'!
createAccessors
	gettersToCreate keysAndValuesDo: [ :anInstanceVariable :aSelector | sourceClass compile: aSelector, String newLineString, String tab, '^', anInstanceVariable, '.' ].
	settersToCreate keysAndValuesDo: [ :anInstanceVariable :aSelector | sourceClass compile: aSelector, ' anObject', String newLineString, String tab, '^', anInstanceVariable, ' := anObject.' ]! !

!CodeForNodeToMoveResult methodsFor: 'public' stamp: 'mc 12/29/2023 02:53:30'!
gettersToCreate
	^gettersToCreate! !

!CodeForNodeToMoveResult methodsFor: 'public' stamp: 'mc 12/29/2023 02:53:41'!
settersToCreate
	^settersToCreate! !

!CodeForNodeToMoveResult methodsFor: 'public' stamp: 'mc 3/31/2024 01:59:10'!
sourceCode
	^sourceCode
	! !

!CodeForNodeToMoveResult methodsFor: 'initialization' stamp: 'mc 4/6/2024 02:31:35'!
initializeNewWith: newCode gettersToCreate: aGettersToCreate settersToCreate: aSettersToCreate sourceClass: aSourceClass
	sourceCode := newCode.
	gettersToCreate := aGettersToCreate.
	settersToCreate := aSettersToCreate.
	sourceClass := aSourceClass.
	! !

!CodeForNodeToMoveResult class methodsFor: 'instance creation' stamp: 'mc 4/6/2024 02:31:51'!
newWith: newCode gettersToCreate: aGettersToCreate settersToCreate: aSettersToCreate sourceClass: aSourceClass
	^self new 
		initializeNewWith: newCode
		gettersToCreate: aGettersToCreate
		settersToCreate: aSettersToCreate
		sourceClass: aSourceClass
! !

!MoveMethodExtraParameterName methodsFor: 'accessing' stamp: 'mc 11/13/2023 02:04:19'!
assertIfCanMove: methodName from: sourceClass to: targetClass accessingThrough: instanceVariable 

	self subclassResponsibility! !

!MoveMethodExtraParameterName methodsFor: 'accessing' stamp: 'mc 12/10/2023 03:05:21'!
assertIfCanMoveClassMethod: methodName from: sourceClass to: targetClass 

	self subclassResponsibility! !

!MoveMethodExtraParameterName methodsFor: 'accessing' stamp: 'mc 9/7/2023 22:58:23'!
associationToModifySelectorAndArgumentsOn: aCompiledMethod addOn: aCollection

	self subclassResponsibility! !

!MoveMethodExtraParameterName methodsFor: 'accessing' stamp: 'mc 9/7/2023 22:58:06'!
newSenderFor: compiledMethodToMove

	self subclassResponsibility! !

!ExtraParameterNameNeeded methodsFor: 'initialization' stamp: 'mc 8/31/2023 02:03:56'!
initializeParameterName: aParameterName 
	parameterName := aParameterName.! !

!ExtraParameterNameNeeded methodsFor: 'accessing' stamp: 'mc 11/13/2023 01:54:51'!
assertIfCanMove: methodName from: sourceClass to: targetClass accessingThrough: instanceVariable 
	| needParameter |
	
	needParameter := MoveMethodRefactoring needParameterNameToMove: methodName from: sourceClass accessingThrough: instanceVariable.
	
	needParameter ifFalse: [Refactoring refactoringError: MoveMethodRefactoring nameForNewParameterShouldNotBeProvidedClassErrorMessage].
	
	methodName isUnary ifFalse: [Refactoring refactoringError: MoveMethodRefactoring nameForNewParameterKeywordShouldBeProvidedClassErrorMessage].
	
	(targetClass includesSelector: (methodName asString, ':') asSymbol ) ifTrue: [Refactoring refactoringError: MoveMethodRefactoring methodShouldNotExistsOnTargertClassErrorMessage]! !

!ExtraParameterNameNeeded methodsFor: 'accessing' stamp: 'mc 12/10/2023 03:02:26'!
assertIfCanMoveClassMethod: methodName from: sourceClass to: targetClass 
	| needParameter |
	needParameter := MoveMethodRefactoring needParameterNameToMoveClassMethod: methodName from: sourceClass.
	
	needParameter ifFalse: [Refactoring refactoringError: MoveMethodRefactoring nameForNewParameterShouldNotBeProvidedClassErrorMessage].
	
	(methodName isUnary) ifFalse: [Refactoring refactoringError: MoveMethodRefactoring nameForNewParameterKeywordShouldBeProvidedClassErrorMessage].
	
	(targetClass class includesSelector: (methodName asString, ':') asSymbol) ifTrue: [Refactoring refactoringError: MoveMethodRefactoring classMethodShouldNotExistsOnTargertClassErrorMessage]! !

!ExtraParameterNameNeeded methodsFor: 'accessing' stamp: 'mc 9/7/2023 22:53:28'!
associationToModifySelectorAndArgumentsOn: aCompiledMethod addOn: aCollection  
	| assoc |
	assoc := (1 to: aCompiledMethod methodNode selectorLastPosition ) -> (aCompiledMethod methodNode selectorAndArgumentsAsString, ': ', parameterName).
	aCollection add: assoc.! !

!ExtraParameterNameNeeded methodsFor: 'accessing' stamp: 'mc 9/3/2023 02:45:04'!
newSenderFor: compiledMethodToMove 
	^compiledMethodToMove methodNode selectorAndArgumentsAsString, ': self'! !

!ExtraParameterNameNeeded methodsFor: 'accessing' stamp: 'mc 9/1/2023 00:36:55'!
parameterName
	^parameterName! !

!ExtraParameterNameNeeded class methodsFor: 'instance creation' stamp: 'mc 8/31/2023 02:03:38'!
parameterName: aParameterName 
	^self new initializeParameterName: aParameterName ! !

!ExtraParameterNameNeededAndExtraKeyword methodsFor: 'initialization' stamp: 'mc 8/31/2023 01:56:19'!
initializeParameterName: aParameterName extraKeyword: anExtraKeyword 
	parameterName := aParameterName.
	extraKeyword := anExtraKeyword.! !

!ExtraParameterNameNeededAndExtraKeyword methodsFor: 'accessing' stamp: 'mc 11/13/2023 01:56:23'!
assertIfCanMove: methodName from: sourceClass to: targetClass accessingThrough: instanceVariable 
	| needParameter |
	needParameter := MoveMethodRefactoring needParameterNameToMove: methodName from: sourceClass accessingThrough: instanceVariable..
	needParameter ifFalse:[Refactoring refactoringError: MoveMethodRefactoring nameForNewParameterShouldNotBeProvidedClassErrorMessage].
	
	methodName isKeyword
		ifFalse:[Refactoring refactoringError: MoveMethodRefactoring nameForNewParameterKeywordShouldNotBeProvidedClassErrorMessage].
	
	(targetClass includesSelector: (methodName asString, extraKeyword, ':') asSymbol ) ifTrue: [Refactoring refactoringError: MoveMethodRefactoring methodShouldNotExistsOnTargertClassErrorMessage]! !

!ExtraParameterNameNeededAndExtraKeyword methodsFor: 'accessing' stamp: 'mc 12/9/2023 20:08:15'!
assertIfCanMoveClassMethod: methodName from: sourceClass to: targetClass 
	| needParameter |
	
	needParameter := MoveMethodRefactoring needParameterNameToMoveClassMethod: methodName from: sourceClass.
	
	needParameter ifFalse:[Refactoring refactoringError: MoveMethodRefactoring nameForNewParameterShouldNotBeProvidedClassErrorMessage].
	
	methodName isKeyword
		ifFalse:[Refactoring refactoringError: MoveMethodRefactoring nameForNewParameterKeywordShouldNotBeProvidedClassErrorMessage].
	
	(targetClass class includesSelector: (methodName asString, extraKeyword, ':') asSymbol) ifTrue: [Refactoring refactoringError: MoveMethodRefactoring classMethodShouldNotExistsOnTargertClassErrorMessage]! !

!ExtraParameterNameNeededAndExtraKeyword methodsFor: 'accessing' stamp: 'mc 9/7/2023 22:49:35'!
associationToModifySelectorAndArgumentsOn: aCompiledMethod addOn: aCollection  
	| assoc |
	assoc := (1 to: aCompiledMethod methodNode selectorLastPosition ) -> (aCompiledMethod methodNode selectorAndArgumentsAsString, ' ', extraKeyword , ': ',  parameterName).
	aCollection add: assoc! !

!ExtraParameterNameNeededAndExtraKeyword methodsFor: 'accessing' stamp: 'mc 9/3/2023 02:49:35'!
newSenderFor: compiledMethodToMove 
	^compiledMethodToMove methodNode selectorAndArgumentsAsString, ' ', extraKeyword, ': self'! !

!ExtraParameterNameNeededAndExtraKeyword methodsFor: 'accessing' stamp: 'mc 9/1/2023 00:37:56'!
parameterName
	^parameterName! !

!ExtraParameterNameNeededAndExtraKeyword class methodsFor: 'instance creation' stamp: 'mc 8/31/2023 01:55:50'!
parameterName: aParameterName extraKeyword: anExtraKeyword 
	
	^self new initializeParameterName: aParameterName extraKeyword: anExtraKeyword! !

!NonExtraParameterNameNeeded methodsFor: 'accessing' stamp: 'mc 12/10/2023 03:04:48'!
assertIfCanMove: methodName from: sourceClass to: targetClass accessingThrough: instanceVariable 
	| needParameter |
	
	needParameter := MoveMethodRefactoring needParameterNameToMove: methodName from: sourceClass accessingThrough: instanceVariable.
	
	needParameter ifTrue: [Refactoring refactoringError: MoveMethodRefactoring nameForNewParameterShouldBeProvidedClassErrorMessage]! !

!NonExtraParameterNameNeeded methodsFor: 'accessing' stamp: 'mc 12/9/2023 04:00:17'!
assertIfCanMoveClassMethod: methodName from: sourceClass to: targetClass 
	
	| needParameter |
	
	needParameter := MoveMethodRefactoring needParameterNameToMoveClassMethod: methodName from: sourceClass.
	needParameter ifTrue: [Refactoring refactoringError: MoveMethodRefactoring nameForNewParameterShouldBeProvidedClassErrorMessage].
	! !

!NonExtraParameterNameNeeded methodsFor: 'accessing' stamp: 'mc 9/7/2023 22:50:59'!
associationToModifySelectorAndArgumentsOn: aCompiledMethod addOn: aCollection 
	! !

!NonExtraParameterNameNeeded methodsFor: 'accessing' stamp: 'mc 9/3/2023 02:43:47'!
newSenderFor: compiledMethodToMove 
	^compiledMethodToMove methodNode selectorAndArgumentsAsString.! !

!TesisMoveMethodRefactoringMenu class methodsFor: 'as yet unclassified' stamp: 'mc 8/30/2023 01:25:29'!
messageListMenuOptions

	self flag: #assumesKeyboardShortcuts.
	^ `{
			{
				#submenuOf -> 					RefactoringMenues refactoringsLabel.
				#itemGroup 			-> 		20.
				#itemOrder 			-> 		80.
				#label 			-> 		'move method...'.
				#selector 			-> 		#moveMethod.
				#icon 			-> 		#saveAsIcon
			} asDictionary.
		}`.
	! !

!TesisMoveMethodRefactoringMenu class methodsFor: 'as yet unclassified' stamp: 'mc 8/6/2023 13:13:16'!
smalltalkEditorCmdShortcutsSpec
	"
	SmalltalkEditor initializeCmdShortcuts
	"
	^#(
		#($7	 #contextualMoveMethod:  'Move Method what is under cursor')
	)! !

!TesisMoveMethodRefactoringMenu class methodsFor: 'as yet unclassified' stamp: 'mc 9/11/2023 22:12:00'!
smalltalkEditorMenuOptions

	^`{
		{
				#submenuOf -> RefactoringMenues refactoringsLabel.
				#itemGroup 		-> 		40.
				#itemOrder 		-> 		50.
				#label 			-> 		'Move Method'.
				#selector 		-> 		#contextualMoveMethod.
				#icon 			-> 		#saveAsIcon
		} asDictionary.
	}`! !

!SmalltalkEditor methodsFor: '*MoveMethodRefactoring' stamp: 'mc 8/9/2023 15:14:57'!
contextualMoveMethod
	"self halt."
	self isEditingClassDefinition ifTrue: [ ^morph flash ].
	self ifSourceCodeRefactoringCanBeAppliedDo: [
		self
			withMethodNodeAndClassDo: [ :methodNode :selectedClass | self contextualMoveMethodOf: methodNode in: selectedClass ]
			ifErrorsParsing: [ :anError | morph flash ]	]	
	! !

!SmalltalkEditor methodsFor: '*MoveMethodRefactoring' stamp: 'mc 8/6/2023 14:13:38'!
contextualMoveMethod: aKeyboardEvent
"self halt."
	self contextualMoveMethod.
	^true
	! !

!SmalltalkEditor methodsFor: '*MoveMethodRefactoring' stamp: 'mc 9/10/2023 19:35:01'!
contextualMoveMethodOf: aMethodNode in: aSelectedClass
	| aReference |
	aMethodNode
		withParseNodeIncluding: self startIndex
		do: [ :nodeUnderCursor | ^morph flash ]
		ifAbsent: [
			self startIndex <= aMethodNode selectorLastPosition ifFalse: [ ^ morph flash ].
			aReference := MethodReference class: aSelectedClass selector: aMethodNode selector.
			RefactoringApplier moveMethodApplier
				createAndValueHandlingExceptionsOn: model textProvider
				forMethod: aReference]

! !

!BrowserWindow methodsFor: '*MoveMethodRefactoring' stamp: 'mc 4/28/2024 20:29:11'!
moveMethod
	
	model selectedMessageName ifNotNil: [ :selectorToInline |
		RefactoringApplier moveMethodApplier
			createAndValueHandlingExceptionsOn: model
			forMethod: (MethodReference class: model selectedClassOrMetaClass selector: selectorToInline )]! !

!RefactoringApplier class methodsFor: '*MoveMethodRefactoring' stamp: 'mc 12/11/2023 00:26:05'!
moveMethodApplier
	"self halt."
	^self applierAt: self moveMethodApplierId ifAbsent: [ MoveMethodApplier ]! !

!RefactoringApplier class methodsFor: '*MoveMethodRefactoring' stamp: 'mc 8/6/2023 15:07:01'!
moveMethodApplierId
	^#moveMethodApplier! !

!RefactoringApplier class methodsFor: '*MoveMethodRefactoring' stamp: 'mc 8/6/2023 15:13:19'!
registerMoveMethodApplier: aMoveMethodApplierClass

	self registerApplierAt: self moveMethodApplierId with: aMoveMethodApplierClass
! !
MoveMethodApplier initialize!

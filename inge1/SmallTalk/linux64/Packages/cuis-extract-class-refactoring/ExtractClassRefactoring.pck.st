'From Cuis6.3 [latest update: #6231] on 25 February 2024 at 11:56:18 pm'!
'Description '!
!provides: 'ExtractClassRefactoring' 1 27!
SystemOrganization addCategory: #ExtractClassRefactoring!


!classDefinition: #ExtractClassForm category: #ExtractClassRefactoring!
SystemWindow subclass: #ExtractClassForm
	instanceVariableNames: 'messageSendingListSection newClassNameModel variableNameToAccessNewClassModel indexVariableList variableList messageList indexMessageList labelHasReferencesToVariables buttonsSection newClassNameLabeledInput variableNameToAccessNewClassLabeledInput instanceVariableListSection instanceVariablesToMoveTitle methodsToMoveTitle'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ExtractClassRefactoring'!
!classDefinition: 'ExtractClassForm class' category: #ExtractClassRefactoring!
ExtractClassForm class
	instanceVariableNames: ''!

!classDefinition: #ExtractClassRefactoringTest category: #ExtractClassRefactoring!
RefactoringTest subclass: #ExtractClassRefactoringTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ExtractClassRefactoring'!
!classDefinition: 'ExtractClassRefactoringTest class' category: #ExtractClassRefactoring!
ExtractClassRefactoringTest class
	instanceVariableNames: ''!

!classDefinition: #ExtractClassRefactoring category: #ExtractClassRefactoring!
Refactoring subclass: #ExtractClassRefactoring
	instanceVariableNames: 'sourceClass targetClassName instVarsToExtract methodsToExtract variableToAccessToNewClass'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ExtractClassRefactoring'!
!classDefinition: 'ExtractClassRefactoring class' category: #ExtractClassRefactoring!
ExtractClassRefactoring class
	instanceVariableNames: ''!

!classDefinition: #ExtractClassApplier category: #ExtractClassRefactoring!
RefactoringApplier subclass: #ExtractClassApplier
	instanceVariableNames: 'class classToRefactor form extractClassRequest'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ExtractClassRefactoring'!
!classDefinition: 'ExtractClassApplier class' category: #ExtractClassRefactoring!
ExtractClassApplier class
	instanceVariableNames: ''!

!classDefinition: #ExtractClassObjectRequest category: #ExtractClassRefactoring!
Object subclass: #ExtractClassObjectRequest
	instanceVariableNames: 'newClassNameModel methodsToMoveModel instanceVariblesToMoveModel messageListModel instanceVariableListModel variableNameToAccessNewClassModel'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ExtractClassRefactoring'!
!classDefinition: 'ExtractClassObjectRequest class' category: #ExtractClassRefactoring!
ExtractClassObjectRequest class
	instanceVariableNames: ''!

!classDefinition: #TesisExtractClassRefactoringMenu category: #ExtractClassRefactoring!
Object subclass: #TesisExtractClassRefactoringMenu
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ExtractClassRefactoring'!
!classDefinition: 'TesisExtractClassRefactoringMenu class' category: #ExtractClassRefactoring!
TesisExtractClassRefactoringMenu class
	instanceVariableNames: ''!


!ExtractClassForm methodsFor: 'initialization' stamp: 'mc 1/16/2024 23:13:47'!
initializeWithModel: aModel 

	super model: aModel.
	indexVariableList := 0.
	indexMessageList := 0.
	variableList := self variableListAsString collect: [:ea | false].
	messageList := self selectorList collect: [:ea | false].
	! !

!ExtractClassForm methodsFor: 'accessing' stamp: 'mc 1/5/2024 01:23:50'!
canDiscardEdits
	^true! !

!ExtractClassForm methodsFor: 'accessing' stamp: 'mc 1/5/2024 02:01:05'!
hasVariablesSelected: aMessage
	"self halt."
	^self instanceVariablesToExtract anySatisfy: [ :anInstanceVariable | 
		(model compiledMethodAt: aMessage) accessesInstanceVariable: anInstanceVariable].
	! !

!ExtractClassForm methodsFor: 'accessing' stamp: 'mc 1/5/2024 01:23:50'!
indexVariableList
	^indexVariableList! !

!ExtractClassForm methodsFor: 'accessing' stamp: 'mc 1/5/2024 01:23:50'!
indexVariableList: anIndex
	indexVariableList := anIndex! !

!ExtractClassForm methodsFor: 'accessing' stamp: 'mc 1/7/2024 23:55:41'!
instanceVariableList
	^self variableListAsString collect: [ :aVariable | 
		(Text fromString: aVariable) color: self colorForInstVar ]! !

!ExtractClassForm methodsFor: 'accessing' stamp: 'mc 1/5/2024 01:23:50'!
instanceVariableListIndex
	^indexVariableList ! !

!ExtractClassForm methodsFor: 'accessing' stamp: 'mc 1/5/2024 01:23:50'!
instanceVariableListIndex: anIndex 
	indexVariableList := anIndex ! !

!ExtractClassForm methodsFor: 'accessing' stamp: 'mc 1/7/2024 23:55:41'!
instanceVariablesToExtract
	| retval |
	"self halt."
	retval := OrderedCollection new.
	self variableListAsString with: variableList do: [ :str :sel | sel ifTrue: [ retval add: str ]].
	^retval! !

!ExtractClassForm methodsFor: 'accessing' stamp: 'mc 1/7/2024 01:12:55'!
messageList
	"self halt."
	labelHasReferencesToVariables ifNotNil: [labelHasReferencesToVariables visible: (self selectorList anySatisfy: [ :aMessage | self hasVariablesSelected: aMessage])].
	^self selectorList collect: [ :aMessage | 
		"self halt."
		(self hasVariablesSelected: aMessage)
			ifTrue: [(Text fromString: aMessage) color: Color blue]
			ifFalse: [Text fromString: aMessage]
	]! !

!ExtractClassForm methodsFor: 'accessing' stamp: 'mc 1/5/2024 01:23:50'!
messageListMenu
	! !

!ExtractClassForm methodsFor: 'accessing' stamp: 'mc 1/5/2024 01:23:50'!
messagelistSelectionAt: anIndex
	^messageList at: anIndex ! !

!ExtractClassForm methodsFor: 'accessing' stamp: 'mc 1/5/2024 01:23:50'!
messagelistSelectionAt: anIndex put: aBoolean 
	messageList at: anIndex put: aBoolean ! !

!ExtractClassForm methodsFor: 'accessing' stamp: 'mc 1/5/2024 02:28:51'!
methodsToExtract
	| retval |
	retval := OrderedCollection new.
	self selectorList with: messageList do: [ :str :sel | sel ifTrue: [ retval add: str ]].
	^retval! !

!ExtractClassForm methodsFor: 'accessing' stamp: 'mc 1/5/2024 01:23:50'!
selectedSuite
	^indexMessageList! !

!ExtractClassForm methodsFor: 'accessing' stamp: 'mc 1/5/2024 01:23:50'!
selectedSuite: anInteger
	indexMessageList := anInteger ! !

!ExtractClassForm methodsFor: 'accessing' stamp: 'mc 1/5/2024 01:23:50'!
selectorList
	^model selectorList! !

!ExtractClassForm methodsFor: 'accessing' stamp: 'mc 1/18/2024 02:15:36'!
variableListAsString

	^ model instanceVariableList! !

!ExtractClassForm methodsFor: 'accessing' stamp: 'mc 1/5/2024 01:23:50'!
variablelistSelectionAt: anIndex
	^variableList at: anIndex ! !

!ExtractClassForm methodsFor: 'accessing' stamp: 'mc 1/5/2024 01:23:50'!
variablelistSelectionAt: anIndex put: aBoolean 
	variableList at: anIndex put: aBoolean.
	messageSendingListSection updateList; redrawNeeded
	! !

!ExtractClassForm methodsFor: 'GUI building' stamp: 'mc 2/8/2024 00:51:54'!
buildActionButtonsSection

	|  sectionLayoutSpec submorphsWidth sectionWidth submorphsHeight |

	buttonsSection := LayoutMorph newRow.
	buttonsSection separation: 10.
	buttonsSection color: self backgroundColor.

	buttonsSection addMorph: self buildCancelButton.
	buttonsSection addMorph: self buildSubmitButton.

	submorphsWidth := (buttonsSection submorphs collect: [:aSubmorph | aSubmorph layoutSpec fixedOrMinimumLayoutWidth]) sum.
	sectionWidth := submorphsWidth + (buttonsSection xSeparation * (buttonsSection submorphs size + 1)).
	submorphsHeight := (buttonsSection submorphs collect: [:aSubmorph | aSubmorph layoutSpec fixedOrMinimumLayoutHeight]) max.
	sectionLayoutSpec := LayoutSpec fixedWidth: sectionWidth fixedHeight: submorphsHeight * 2.
	sectionLayoutSpec offAxisEdgeWeight: 0.95.

	buttonsSection layoutSpec: sectionLayoutSpec.
	self layoutMorph addMorph: buttonsSection.
	
	! !

!ExtractClassForm methodsFor: 'GUI building' stamp: 'mc 1/17/2024 23:06:37'!
buildCancelButton

	| button |

	button := IndependentlyColoredButton 
				model: self
				action: #cancelButtonClicked
				label: self labelButtonCancel.
	button color: self cancelButtonColor.
	^button! !

!ExtractClassForm methodsFor: 'GUI building' stamp: 'mc 2/8/2024 01:14:29'!
buildMethodsToMoveListSection
	| list |
	"self halt."
	list := PluggableListMorphOfMany
				model: self
				listGetter: #messageList
				primarySelectionGetter: #selectedSuite
				primarySelectionSetter: #selectedSuite:
				listSelectionGetter: #messagelistSelectionAt:
				listSelectionSetter: #messagelistSelectionAt:put:
				mainView: self
				menuGetter: nil
				keystrokeAction: nil.
	
	list color: Color white.
	list layoutSpec: (LayoutSpec proportionalWidth: 1.0).
	
	messageSendingListSection := list.
	self layoutMorph addMorph: messageSendingListSection.
	! !

!ExtractClassForm methodsFor: 'GUI building' stamp: 'mc 2/8/2024 01:14:54'!
buildMethodsToMoveListTitle
	 
	methodsToMoveTitle := LabelMorph contents: self labelSelectMethodsToMove.
	methodsToMoveTitle layoutSpec offAxisEdgeWeight: 0.0.
	self layoutMorph addMorph: methodsToMoveTitle.
	! !

!ExtractClassForm methodsFor: 'GUI building' stamp: 'mc 2/8/2024 01:15:31'!
buildMorphicWindow
	
	self 
		setWindowTitle;
		setConfigurationOnLayoutMorph;
		buildNewClassNameSection;
		buildVariableToAccessNewClassSection;
		buildinstanceVariableListTitle;
		buildinstanceVariableListSection;
		buildMethodsToMoveListTitle;
		buildMethodsToMoveListSection;
		buildReferencesToVariablesLabel;
		buildActionButtonsSection;
		setExtents
	! !

!ExtractClassForm methodsFor: 'GUI building' stamp: 'mc 2/8/2024 01:02:09'!
buildNewClassNameSection

	| maxLabelWidth  nameForNewClassLabel |
	"self halt."
	nameForNewClassLabel := self labelNameForNewClass..
	maxLabelWidth := self recommendedWidthForLabels: (Array with: nameForNewClassLabel with: self labelVariableToAccessNewClass).
	newClassNameModel := TextModel withText: (((Text fromString: 'NameOfNewClass') color: self colorForClassName) bold).

	newClassNameLabeledInput := LabeledInput 
					withLabel: nameForNewClassLabel
					withLabelFixedWidth: maxLabelWidth
					withModel: newClassNameModel
					usingAs: self.
	newClassNameLabeledInput emptyTextDisplayMessage: self labelPleaseProvideNewClassName.
	self layoutMorph addMorph: newClassNameLabeledInput.
	! !

!ExtractClassForm methodsFor: 'GUI building' stamp: 'mc 1/17/2024 20:40:42'!
buildReferencesToVariablesLabel

	labelHasReferencesToVariables := LabelMorph new.
	labelHasReferencesToVariables contents: self labelReferenceToSelectedInstanceVariable.
	labelHasReferencesToVariables color: Color blue.
	labelHasReferencesToVariables layoutSpec offAxisEdgeWeight: 0.0.
	labelHasReferencesToVariables visible: false.
	self layoutMorph addMorph: labelHasReferencesToVariables! !

!ExtractClassForm methodsFor: 'GUI building' stamp: 'mc 1/17/2024 23:07:22'!
buildSubmitButton

	| submitButton |

	submitButton := IndependentlyColoredButton 
					model: self
					action: #submitButtonClicked
					label: self labelButtonRefactor.
	submitButton color: self acceptButtonColor.
	^submitButton! !

!ExtractClassForm methodsFor: 'GUI building' stamp: 'mc 2/8/2024 01:04:12'!
buildVariableToAccessNewClassSection

	| maxLabelWidth  variableToAccessNewClassLabel |
	variableToAccessNewClassLabel := self labelVariableToAccessNewClass.
	maxLabelWidth := self recommendedWidthForLabels: (Array with: self labelNameForNewClass with: variableToAccessNewClassLabel).
	
	variableNameToAccessNewClassModel := TextModel withText: 'aNameOfVariable'.
	variableNameToAccessNewClassModel actualContents color: self colorForInstVar .
	variableNameToAccessNewClassLabeledInput := LabeledInput 
					withLabel: variableToAccessNewClassLabel
					withLabelFixedWidth: maxLabelWidth
					withModel: variableNameToAccessNewClassModel
					usingAs: self.
	
	variableNameToAccessNewClassLabeledInput emptyTextDisplayMessage: self labelPleaseProvideNewInstVarName.
	self layoutMorph addMorph: variableNameToAccessNewClassLabeledInput.
	
! !

!ExtractClassForm methodsFor: 'GUI building' stamp: 'mc 2/8/2024 01:11:38'!
buildinstanceVariableListSection
	
	instanceVariableListSection := PluggableListMorphOfMany
				model: self
				listGetter: #instanceVariableList
				primarySelectionGetter: #instanceVariableListIndex
				primarySelectionSetter: #instanceVariableListIndex:
				listSelectionGetter: #variablelistSelectionAt:
				listSelectionSetter: #variablelistSelectionAt:put:
				mainView: self
				menuGetter: nil
				keystrokeAction: nil.
	
	instanceVariableListSection color: Color white.
	instanceVariableListSection layoutSpec: (LayoutSpec proportionalWidth: 1.0 fixedHeight: ExtractClassForm fontProportionalUnitOfReferenceForHeight * 7).
	self layoutMorph addMorph: instanceVariableListSection.
! !

!ExtractClassForm methodsFor: 'GUI building' stamp: 'mc 2/8/2024 01:13:08'!
buildinstanceVariableListTitle
	
	instanceVariablesToMoveTitle := LabelMorph contents: self labelSelectInstVarToMove.
	instanceVariablesToMoveTitle layoutSpec offAxisEdgeWeight: 0.0.
	self layoutMorph addMorph: instanceVariablesToMoveTitle.
! !

!ExtractClassForm methodsFor: 'GUI building' stamp: 'mc 2/10/2024 20:55:18'!
initialHeight

	^ newClassNameLabeledInput layoutSpec fixedOrMinimumLayoutHeight
	+ variableNameToAccessNewClassLabeledInput layoutSpec fixedOrMinimumLayoutHeight
	+ instanceVariablesToMoveTitle layoutSpec fixedOrMinimumLayoutHeight
	+ instanceVariableListSection layoutSpec fixedOrMinimumLayoutHeight
	+ methodsToMoveTitle layoutSpec fixedOrMinimumLayoutHeight
	+ messageSendingListSection layoutSpec fixedHeight
	+ labelHasReferencesToVariables layoutSpec fixedOrMinimumLayoutHeight
	+ buttonsSection layoutSpec fixedOrMinimumLayoutHeight! !

!ExtractClassForm methodsFor: 'GUI building' stamp: 'mc 2/10/2024 20:54:50'!
initialWidth

	^ {
	newClassNameLabeledInput layoutSpec fixedOrMinimumLayoutHeight.
	variableNameToAccessNewClassLabeledInput layoutSpec fixedOrMinimumLayoutHeight.
	instanceVariablesToMoveTitle layoutSpec fixedOrMinimumLayoutHeight.
	instanceVariableListSection layoutSpec fixedOrMinimumLayoutHeight.
	methodsToMoveTitle layoutSpec fixedOrMinimumLayoutHeight.
	messageSendingListSection layoutSpec fixedHeight.
	labelHasReferencesToVariables layoutSpec fixedOrMinimumLayoutHeight.
	buttonsSection layoutSpec fixedOrMinimumLayoutHeight
	} max! !

!ExtractClassForm methodsFor: 'GUI building' stamp: 'mc 1/5/2024 01:23:50'!
recommendedWidthForLabels: labels

	| rightMargin |

	rightMargin := 20.
	^(labels collect: [:aLabel | FontFamily defaultFamilyAndPointSize widthOfString: aLabel]) max + rightMargin! !

!ExtractClassForm methodsFor: 'GUI building' stamp: 'mc 1/16/2024 00:28:37'!
setConfigurationOnLayoutMorph

	self layoutMorph separation: 5; color: self backgroundColor.
	
	self layoutMorph color: self backgroundColor.
	self layoutMorph axisEdgeWeight: #columnTop! !

!ExtractClassForm methodsFor: 'GUI building' stamp: 'mc 2/10/2024 20:55:37'!
setExtents
	| requiredExtent intialHeight intialWidth |
	 
	intialHeight := self initialHeight.
	intialWidth  := self initialWidth.
	"requiredExtent := 636.7669122572003@834.6393034159412."
	"requiredExtent := 636.7669122572003@intialHeight."
	"self halt."
	requiredExtent := intialWidth@intialHeight.
	self layoutMorph morphExtent: requiredExtent.
	! !

!ExtractClassForm methodsFor: 'GUI building' stamp: 'mc 1/17/2024 20:38:09'!
setWindowTitle

	^ self setLabel: self labelExtractClassTitle! !

!ExtractClassForm methodsFor: 'as yet unclassified' stamp: 'mc 1/17/2024 23:11:45'!
addFocusReceiver: anInnerTextMorph
	"this method is requeried by LabeledInput"

	! !

!ExtractClassForm methodsFor: 'as yet unclassified' stamp: 'mc 1/5/2024 02:37:43'!
moveFrom: aTabPassingInnerTextMorph 
	"this method is to disable tab key"! !

!ExtractClassForm methodsFor: 'as yet unclassified' stamp: 'mc 1/17/2024 23:09:01'!
widgetsColor: aColor
	"this method is to not make a transparent background"! !

!ExtractClassForm methodsFor: 'colors' stamp: 'mc 1/17/2024 01:18:25'!
acceptButtonColor

	^ Theme current acceptButton! !

!ExtractClassForm methodsFor: 'colors' stamp: 'mc 1/5/2024 01:23:50'!
backgroundColor

	^Color lightGray! !

!ExtractClassForm methodsFor: 'colors' stamp: 'mc 1/16/2024 23:06:02'!
cancelButtonColor

	^ Theme current cancelButton! !

!ExtractClassForm methodsFor: 'colors' stamp: 'mc 1/5/2024 01:23:50'!
colorForClassName

	^ Color blue! !

!ExtractClassForm methodsFor: 'colors' stamp: 'mc 1/5/2024 01:23:50'!
colorForInstVar

	^ Color magenta muchDarker! !

!ExtractClassForm methodsFor: 'colors' stamp: 'mc 1/5/2024 01:23:50'!
windowColor
	^Color lightGray! !

!ExtractClassForm methodsFor: 'actions' stamp: 'mc 1/5/2024 01:23:50'!
cancelButtonClicked
	
	model cancel.! !

!ExtractClassForm methodsFor: 'actions' stamp: 'mc 1/16/2024 23:41:56'!
submitButtonClicked
	
	| request |
	"self halt."
	request := ExtractClassObjectRequest 
					newWithNameModel: newClassNameModel
					methodsToMoveModel: self
					instanceVariableListModel: self
					variableNameToAccessThroughModel: variableNameToAccessNewClassModel .
	model userSubmitted: request.
	self delete! !

!ExtractClassForm methodsFor: 'label' stamp: 'mc 1/17/2024 23:05:44'!
labelButtonCancel

	^ 'Cancel'! !

!ExtractClassForm methodsFor: 'label' stamp: 'mc 1/17/2024 23:04:47'!
labelButtonRefactor

	^ 'Refactor'! !

!ExtractClassForm methodsFor: 'label' stamp: 'mc 1/17/2024 20:38:09'!
labelExtractClassTitle

	^ 'Extract class from ', model classToRefactorName! !

!ExtractClassForm methodsFor: 'label' stamp: 'mc 1/17/2024 20:37:41'!
labelNameForNewClass

	^ 'Name for new class'! !

!ExtractClassForm methodsFor: 'label' stamp: 'mc 1/17/2024 20:37:06'!
labelPleaseProvideNewClassName

	^ 'Please provide a new class name'! !

!ExtractClassForm methodsFor: 'label' stamp: 'mc 1/17/2024 23:01:56'!
labelPleaseProvideNewInstVarName

	^ 'Please provide a new instance variable name'! !

!ExtractClassForm methodsFor: 'label' stamp: 'mc 1/17/2024 20:40:42'!
labelReferenceToSelectedInstanceVariable

	^ '*Reference to selected instance variables'! !

!ExtractClassForm methodsFor: 'label' stamp: 'mc 1/17/2024 23:03:36'!
labelSelectInstVarToMove

	^ 'Select instance variables to move:'! !

!ExtractClassForm methodsFor: 'label' stamp: 'mc 1/17/2024 20:38:45'!
labelSelectMethodsToMove

	^ 'Select methods to move:'! !

!ExtractClassForm methodsFor: 'label' stamp: 'mc 1/17/2024 20:39:02'!
labelVariableToAccessNewClass

	^ 'Variable name to access new class'! !

!ExtractClassForm class methodsFor: 'instance creation' stamp: 'mc 1/16/2024 23:08:41'!
fontProportionalUnitOfReferenceForHeight

	^(Preferences at: #windowTitleFont) lineSpacing+1 ! !

!ExtractClassForm class methodsFor: 'instance creation' stamp: 'mc 1/16/2024 23:18:34'!
open: aModel label: aString

	|  window |
	
	window := self withModel: aModel.
	window buildMorphicWindow.
	aString ifNotNil: [ window setLabel: aString ].
	window openInWorld.
	^window! !

!ExtractClassForm class methodsFor: 'instance creation' stamp: 'mc 1/5/2024 01:23:50'!
withModel: aModel

	^self new initializeWithModel: aModel! !

!ExtractClassRefactoringTest methodsFor: 'as yet unclassified' stamp: 'mc 1/19/2024 01:45:47'!
test001TargetClassNameShouldNotBeEmpty
	
	| targetClassName instVarToExtract sourceClass |
	targetClassName := #''.
	sourceClass := self createClassNamed: #SourceClass.
	instVarToExtract := OrderedCollection new.
	
	self
		assertCreation: [
			ExtractClassRefactoring 
				from: sourceClass
				to: targetClassName
				instanceVariableNamed: 'aTargetClass'
				instVarToExtract: instVarToExtract
				methodToExtract: OrderedCollection new ] 
		failsWith: [ExtractClassRefactoring targetClassShouldNotBeEmptyErrorMessage].
	! !

!ExtractClassRefactoringTest methodsFor: 'as yet unclassified' stamp: 'mc 1/19/2024 23:09:42'!
test001TargetClassNameShouldStartWithUppercase
	
	| targetClassName instVarToExtract sourceClass |
	targetClassName := #dddd.
	sourceClass := self createClassNamed: #SourceClass.
	instVarToExtract := OrderedCollection new.
	
	self
		assertCreation: [
			ExtractClassRefactoring 
				from: sourceClass
				to: targetClassName
				instanceVariableNamed: 'aTargetClass'
				instVarToExtract: instVarToExtract
				methodToExtract: OrderedCollection new ] 
		failsWith: [ExtractClassRefactoring targetClassShouldStartWithUppercaseErrorMessage].
	! !

!ExtractClassRefactoringTest methodsFor: 'as yet unclassified' stamp: 'mc 1/5/2024 01:23:51'!
test001TargetClassShouldNotExist
	
	| targetClassName instVarToExtract sourceClass |
	self createClassNamed: #TargetClass.
	targetClassName := #TargetClass.
	sourceClass := self createClassNamed: #SourceClass.
	instVarToExtract := OrderedCollection new.
	
	self
		assertCreation: [ExtractClassRefactoring from: sourceClass to: targetClassName instanceVariableNamed: 'aTargetClass' instVarToExtract: instVarToExtract methodToExtract: OrderedCollection new ] 
		failsWith: [ExtractClassRefactoring targetClassShouldNotExistsErrorMessage].
	! !

!ExtractClassRefactoringTest methodsFor: 'as yet unclassified' stamp: 'mc 1/5/2024 01:23:51'!
test002InstanceVariableToExtractShouldExists
	
	| targetClassName sourceClass instVarToExtract |
	targetClassName := #TargetClass.
	sourceClass := self createClassNamed: #SourceClass.
	instVarToExtract := OrderedCollection new.
	instVarToExtract add: 'iv1'.
	
	
	self
		assertCreation: [ExtractClassRefactoring from: sourceClass to: targetClassName instanceVariableNamed: 'aTargetClass' instVarToExtract: instVarToExtract methodToExtract: OrderedCollection new ] 
		failsWith: [ExtractClassRefactoring instanceVariable: 'iv1' shouldExistsOn: 'SourceClass'].
	! !

!ExtractClassRefactoringTest methodsFor: 'as yet unclassified' stamp: 'mc 2/23/2024 20:10:45'!
test003InstanceVariableToExtractShouldExists
	
	| targetClassName sourceClass instVarToExtract |
	targetClassName := #TargetClass.
	sourceClass := self createClassNamed: #SourceClass instanceVariableNames: 'iv1'.
	instVarToExtract := OrderedCollection new.
	instVarToExtract add: 'iv1'.
	instVarToExtract add: 'iv2'.
	
	self
		assertCreation: [ExtractClassRefactoring from: sourceClass to: targetClassName instanceVariableNamed: 'aTargetClass' instVarToExtract: instVarToExtract methodToExtract: OrderedCollection new ] 
		failsWith: [ExtractClassRefactoring instanceVariable: 'iv2' shouldExistsOn: 'SourceClass'].
	! !

!ExtractClassRefactoringTest methodsFor: 'as yet unclassified' stamp: 'mc 1/5/2024 01:23:51'!
test004methodToExtractShouldExists
	
	| targetClassName sourceClass instVarsToExtract methodsToExtract |
	targetClassName := #TargetClass.
	sourceClass := self createClassNamed: #SourceClass instanceVariableNames: 'iv1'.
	instVarsToExtract := OrderedCollection new.
	methodsToExtract := OrderedCollection new.
	methodsToExtract add: #m1.
	
	self
		assertCreation: [ ExtractClassRefactoring from: sourceClass to: targetClassName instanceVariableNamed: 'aTargetClass' instVarToExtract: instVarsToExtract methodToExtract: methodsToExtract ] 
		failsWith: [ExtractClassRefactoring selector: #m1 shouldExistsOn: 'SourceClass'].
	! !

!ExtractClassRefactoringTest methodsFor: 'as yet unclassified' stamp: 'mc 1/5/2024 01:23:51'!
test005methodToExtractShouldExists
	
	| targetClassName sourceClass instVarsToExtract methodsToExtract |
	targetClassName := #TargetClass.
	sourceClass := self createClassNamed: #SourceClass instanceVariableNames: 'iv1'.
	sourceClass compile: 'm1 ^self.' .
	instVarsToExtract := OrderedCollection new.
	methodsToExtract := OrderedCollection new.
	methodsToExtract add: #m1.
	methodsToExtract add: #m2.
	
	self
		assertCreation: [ ExtractClassRefactoring from: sourceClass to: targetClassName instanceVariableNamed: 'aTargetClass' instVarToExtract: instVarsToExtract methodToExtract: methodsToExtract ] 
		failsWith: [ExtractClassRefactoring selector: #m2 shouldExistsOn: 'SourceClass'].
	! !

!ExtractClassRefactoringTest methodsFor: 'as yet unclassified' stamp: 'mc 1/20/2024 01:46:48'!
test006variableToAccessNewClassShouldBeInLowercase
	
	| targetClassName sourceClass instVarsToExtract methodsToExtract |
	targetClassName := #TargetClass.
	sourceClass := self createClassNamed: #SourceClass instanceVariableNames: 'iv1'.
	instVarsToExtract := OrderedCollection new.
	methodsToExtract := OrderedCollection new.
	
	self
		assertCreation: [ ExtractClassRefactoring
						from: sourceClass
						to: targetClassName
						instanceVariableNamed: 'FFF'
						instVarToExtract: instVarsToExtract
						methodToExtract: methodsToExtract ] 
		failsWith: [ExtractClassRefactoring variableToAccessNewClassShouldBeInLowercaseErrorMessage].
	! !

!ExtractClassRefactoringTest methodsFor: 'as yet unclassified' stamp: 'mc 2/17/2024 01:27:12'!
test007variableToAccessNewClassShouldNotBeEmpty
	
	| targetClassName sourceClass instVarsToExtract methodsToExtract |
	targetClassName := #TargetClass.
	sourceClass := self createClassNamed: #SourceClass instanceVariableNames: 'iv1'.
	instVarsToExtract := OrderedCollection new.
	methodsToExtract := OrderedCollection new.
	
	self
		assertCreation: [ 
			ExtractClassRefactoring 
				from: sourceClass
				to: targetClassName
				instanceVariableNamed: ''
				instVarToExtract: instVarsToExtract
				methodToExtract: methodsToExtract ] 
		failsWith: [ExtractClassRefactoring variableToAccessNewClassShouldNotBeEmptyErrorMessage].
	! !

!ExtractClassRefactoringTest methodsFor: 'as yet unclassified' stamp: 'mc 2/17/2024 01:27:36'!
test008variableToAccessNewClassShouldNotBeInUse
	
	| targetClassName sourceClass instVarsToExtract methodsToExtract |
	targetClassName := #TargetClass.
	sourceClass := self createClassNamed: #SourceClass instanceVariableNames: 'iv1'.
	instVarsToExtract := OrderedCollection new.
	methodsToExtract := OrderedCollection new.
	
	self
		assertCreation: [ ExtractClassRefactoring from: sourceClass to: targetClassName instanceVariableNamed: 'iv1' instVarToExtract: instVarsToExtract methodToExtract: methodsToExtract ] 
		failsWith: [ExtractClassRefactoring variableToAccessNewClassShouldNotBeInUseErrorMessage].
	! !

!ExtractClassRefactoringTest methodsFor: 'as yet unclassified' stamp: 'mc 2/17/2024 01:27:52'!
test009variableToAccessNewClassShouldNotBeNil
	
	| targetClassName sourceClass instVarsToExtract methodsToExtract |
	targetClassName := #TargetClass.
	sourceClass := self createClassNamed: #SourceClass instanceVariableNames: 'iv1'.
	instVarsToExtract := OrderedCollection new.
	methodsToExtract := OrderedCollection new.
	
	self
		assertCreation: [ ExtractClassRefactoring from: sourceClass to: targetClassName instanceVariableNamed: nil instVarToExtract: instVarsToExtract methodToExtract: methodsToExtract ] 
		failsWith: [ExtractClassRefactoring variableToAccessNewClassShouldNotBeNilErrorMessage].
	! !

!ExtractClassRefactoringTest methodsFor: 'as yet unclassified' stamp: 'mc 1/5/2024 01:23:51'!
test100extractClassWithNoVariablesAndNoMethodShouldOnlyCreateClass
	
	| targetClassName sourceClass instVarsToExtract methodsToExtract refactoring targetClass |
	targetClassName := #TargetClass.
	sourceClass := self createClassNamed: #SourceClass instanceVariableNames: 'iv1'.
	sourceClass compile: 'm1 ^self.' .
	instVarsToExtract := OrderedCollection new.
	methodsToExtract := OrderedCollection new.
	
	refactoring := ExtractClassRefactoring 
						from: sourceClass
						to: targetClassName
						instanceVariableNamed: 'aTargetClass'
						instVarToExtract: instVarsToExtract
						methodToExtract: methodsToExtract.
	refactoring apply.
	
	targetClass := Smalltalk classNamed: #TargetClass.
	self assert: [ targetClass notNil ].
	self assert: [sourceClass instVarNames includes: 'aTargetClass'].
	self assert: 'initialize
	aTargetClass := TargetClass new.
	super initialize.' equals: (sourceClass sourceCodeAt: #initialize).! !

!ExtractClassRefactoringTest methodsFor: 'as yet unclassified' stamp: 'mc 2/18/2024 02:08:10'!
test101ExtractClassShouldReuseInitialize
	
	| targetClassName sourceClass instVarsToExtract methodsToExtract refactoring targetClass |
	targetClassName := #TargetClass.
	sourceClass := self createClassNamed: #SourceClass instanceVariableNames: 'iv1'.
	sourceClass compile: 'initialize
	^self.' .
	instVarsToExtract := OrderedCollection new.
	methodsToExtract := OrderedCollection new.
	
	refactoring := ExtractClassRefactoring 
						from: sourceClass
						to: targetClassName
						instanceVariableNamed: 'aTargetClass'
						instVarToExtract: instVarsToExtract
						methodToExtract: methodsToExtract.
	refactoring apply.
	
	targetClass := Smalltalk classNamed: #TargetClass.
	self assert: [ targetClass notNil ].
	self assert: [sourceClass instVarNames includes: 'aTargetClass'].
	self assert: 'initialize
	aTargetClass := TargetClass new.
	^self.' equals: (sourceClass sourceCodeAt: #initialize).! !

!ExtractClassRefactoringTest methodsFor: 'as yet unclassified' stamp: 'mc 2/18/2024 02:08:17'!
test102ExtractClassShouldReuseInitialize
	
	| targetClassName sourceClass instVarsToExtract methodsToExtract refactoring targetClass |
	targetClassName := #TargetClass.
	sourceClass := self createClassNamed: #SourceClass instanceVariableNames: 'iv1'.
	sourceClass compile: 'initialize
	| tmpvar |
	tmpvar := 1.
	^self.' .
	instVarsToExtract := OrderedCollection new.
	methodsToExtract := OrderedCollection new.
	
	refactoring := ExtractClassRefactoring 
						from: sourceClass
						to: targetClassName
						instanceVariableNamed: 'aTargetClass'
						instVarToExtract: instVarsToExtract
						methodToExtract: methodsToExtract.
	refactoring apply.
	
	targetClass := Smalltalk classNamed: #TargetClass.
	self assert: [ targetClass notNil ].
	self assert: [sourceClass instVarNames includes: 'aTargetClass'].
	self assert: 'initialize
	| tmpvar |
	aTargetClass := TargetClass new.
	tmpvar := 1.
	^self.' equals: (sourceClass sourceCodeAt: #initialize).! !

!ExtractClassRefactoringTest methodsFor: 'as yet unclassified' stamp: 'mc 2/21/2024 00:29:04'!
test103GivenSourceClassAndTwoInstanceVariableWhenExtractClassThenInstanceVariablesShouldBeInTargetClass
	
	| targetClassName sourceClass instVarsToExtract methodsToExtract refactoring targetClass |
	targetClassName := #TargetClass.
	sourceClass := self createClassNamed: #SourceClass instanceVariableNames: 'iv1 iv2'.
	instVarsToExtract := OrderedCollection new.
	methodsToExtract := OrderedCollection new.
	instVarsToExtract add: 'iv1'.
	instVarsToExtract add: 'iv2'.
	
	refactoring := ExtractClassRefactoring 
						from: sourceClass
						to: targetClassName
						instanceVariableNamed: 'aTargetClass' 
						instVarToExtract: instVarsToExtract
						methodToExtract: methodsToExtract.
	refactoring apply.
	
	targetClass := Smalltalk classNamed: #TargetClass.
	self assert: [ targetClass notNil ].
	self assert: 2 equals: targetClass instVarNames size.
	self assert: targetClass instVarNames includes: 'iv1'.
	self assert: targetClass instVarNames includes: 'iv2'.! !

!ExtractClassRefactoringTest methodsFor: 'as yet unclassified' stamp: 'mc 2/18/2024 02:08:33'!
test104GivenMethodAndInstanceVariableWhenExtractClassThenInstanceVariableShouldBeInTargetClass
	
	| targetClassName sourceClass instVarsToExtract methodsToExtract refactoring targetClass |
	targetClassName := #TargetClass.
	sourceClass := self createClassNamed: #SourceClass instanceVariableNames: 'iv1'.
	instVarsToExtract := OrderedCollection new.
	methodsToExtract := OrderedCollection new.
	instVarsToExtract add: 'iv1'.
	sourceClass compile: 'm1 ^iv1+1.' .
	
	refactoring := ExtractClassRefactoring 
						from: sourceClass
						to: targetClassName
						instanceVariableNamed: 'aTargetClass' 
						instVarToExtract: instVarsToExtract
						methodToExtract: methodsToExtract.
	refactoring apply.
	
	targetClass := Smalltalk classNamed: #TargetClass.
	self assert: [ targetClass notNil ].
	self assert: 1 equals: targetClass instVarNames size.
	self assert: targetClass instVarNames includes: 'iv1'.
	self assert: 'm1 ^aTargetClass iv1+1.' equals: (sourceClass sourceCodeAt: #m1).! !

!ExtractClassRefactoringTest methodsFor: 'as yet unclassified' stamp: 'mc 2/18/2024 02:08:42'!
test105GivenSourceClassAndOneInstanceVariableWhenExtractClassThenInstanceVariableShouldBeInTargetClass
	
	| targetClassName sourceClass instVarsToExtract methodsToExtract refactoring targetClass |
	targetClassName := #TargetClass.
	sourceClass := self createClassNamed: #SourceClass instanceVariableNames: 'iv1'.
	instVarsToExtract := OrderedCollection new.
	methodsToExtract := OrderedCollection new.
	instVarsToExtract add: 'iv1'.
	
	refactoring := ExtractClassRefactoring 
						from: sourceClass
						to: targetClassName
						instanceVariableNamed: 'aTargetClass' 
						instVarToExtract: instVarsToExtract
						methodToExtract: methodsToExtract.
	refactoring apply.
	
	targetClass := Smalltalk classNamed: #TargetClass.
	self assert: [ targetClass notNil ].
	self assert: 1 equals: targetClass instVarNames size.
	self assert: 'iv1' equals: targetClass instVarNames first.! !

!ExtractClassRefactoringTest methodsFor: 'as yet unclassified' stamp: 'mc 2/18/2024 02:08:48'!
test106GivenMethodWhenExtractClassThenMoveMethodShouldBePerformed
	
	| targetClassName sourceClass instVarsToExtract methodsToExtract refactoring targetClass |
	targetClassName := #TargetClass.
	sourceClass := self createClassNamed: #SourceClass instanceVariableNames: 'iv1'.
	instVarsToExtract := OrderedCollection new.
	methodsToExtract := OrderedCollection new.
	sourceClass compile: 'm1 ^iv1+1.' .
	methodsToExtract add: #m1.
	
	
	refactoring := ExtractClassRefactoring 
						from: sourceClass
						to: targetClassName
						instanceVariableNamed: 'aTargetClass' 
						instVarToExtract: instVarsToExtract
						methodToExtract: methodsToExtract.
	refactoring apply.
	
	targetClass := Smalltalk classNamed: #TargetClass.
	self assert: [ targetClass notNil ].
	self assert: 0 equals: targetClass instVarNames size.
	self assert: 'm1
	^aTargetClass m1: self.' equals: (sourceClass sourceCodeAt: #m1).
	self assert: 'm1: aSourceClass ^aSourceClass iv1+1.' equals: (targetClass sourceCodeAt: #m1:).! !

!ExtractClassRefactoringTest methodsFor: 'as yet unclassified' stamp: 'mc 2/18/2024 02:08:55'!
test107Given2MethodsWhenExtractClassThenMoveMethodShouldBePerformed
	
	| targetClassName sourceClass instVarsToExtract methodsToExtract refactoring targetClass |
	targetClassName := #TargetClass.
	sourceClass := self createClassNamed: #SourceClass instanceVariableNames: 'iv1'.
	instVarsToExtract := OrderedCollection new.
	methodsToExtract := OrderedCollection new.
	sourceClass compile: 'm1 ^iv1+1.' .
	sourceClass compile: 'm2 ^1.' .
	methodsToExtract add: #m1.
	methodsToExtract add: #m2.
	
	
	refactoring := ExtractClassRefactoring 
						from: sourceClass
						to: targetClassName
						instanceVariableNamed: 'aTargetClass' 
						instVarToExtract: instVarsToExtract
						methodToExtract: methodsToExtract.
	refactoring apply.
	
	targetClass := (Smalltalk classNamed: #TargetClass).
	self assert: [ targetClass notNil ].
	self assert: 0 equals: targetClass instVarNames size.
	self assert: 'm1
	^aTargetClass m1: self.' equals: (sourceClass sourceCodeAt: #m1).
	self assert: 'm1: aSourceClass ^aSourceClass iv1+1.' equals: (targetClass sourceCodeAt: #m1:).
	self assert: 'm2
	^aTargetClass m2.' equals: (sourceClass sourceCodeAt: #m2).
	self assert: 'm2 ^1.' equals: (targetClass sourceCodeAt: #m2).! !

!ExtractClassRefactoringTest methodsFor: 'as yet unclassified' stamp: 'mc 2/22/2024 00:16:35'!
test108GivenAGetterAndInstvarWithSameNameWhenExtractClassThenGetterShouldHaveSameName
	
	| targetClassName sourceClass instVarsToExtract methodsToExtract refactoring targetClass |
	targetClassName := #TargetClass.
	sourceClass := self createClassNamed: #SourceClass instanceVariableNames: 'cbu'.
	instVarsToExtract := OrderedCollection new.
	methodsToExtract := OrderedCollection new.
	sourceClass compile: 'cbu ^cbu.' .
	sourceClass compile: 'cbuPlusOne ^cbu+1 .' .
	methodsToExtract add: #cbu.
	instVarsToExtract add: 'cbu'.
	
	refactoring := ExtractClassRefactoring 
						from: sourceClass
						to: targetClassName
						instanceVariableNamed: 'aCbu' 
						instVarToExtract: instVarsToExtract
						methodToExtract: methodsToExtract.
	refactoring apply.
	
	targetClass := (Smalltalk classNamed: #TargetClass).
	self assert: [ targetClass notNil ].
	self assert: 1 equals: targetClass instVarNames size.
	self assert: 'cbu ^aCbu cbu.' equals: (sourceClass sourceCodeAt: #cbu).
	self assert: 'cbuPlusOne ^aCbu cbu+1 .' equals: (sourceClass sourceCodeAt: #cbuPlusOne).
	self assert: 'cbu
	^cbu' equals: (targetClass sourceCodeAt: #cbu).

	! !

!ExtractClassRefactoringTest methodsFor: 'as yet unclassified' stamp: 'mc 2/22/2024 00:16:10'!
test109GivenAGetterAndInstvarWithSameNameWhenExtractClassThenGetterShouldHaveSameName
	
	| targetClassName sourceClass instVarsToExtract methodsToExtract refactoring targetClass |
	targetClassName := #TargetClass.
	sourceClass := self createClassNamed: #SourceClass instanceVariableNames: 'cbu'.
	instVarsToExtract := OrderedCollection new.
	methodsToExtract := OrderedCollection new.
	sourceClass compile: 'cbu ^cbu.' .
	sourceClass compile: 'cbu_ ^cbu.' .
	sourceClass compile: 'cbuPlusOne ^cbu+1 .' .
	methodsToExtract add: #cbu.
	methodsToExtract add: #cbu_.
	instVarsToExtract add: 'cbu'.
	
	refactoring := ExtractClassRefactoring 
						from: sourceClass
						to: targetClassName
						instanceVariableNamed: 'aCbu' 
						instVarToExtract: instVarsToExtract
						methodToExtract: methodsToExtract.
	refactoring apply.
	
	targetClass := (Smalltalk classNamed: #TargetClass).
	self assert: [ targetClass notNil ].
	self assert: 1 equals: targetClass instVarNames size.
	self assert: 'cbu ^aCbu cbu.' equals: (sourceClass sourceCodeAt: #cbu).
	self assert: 'cbu_
	^aCbu cbu_.' equals: (sourceClass sourceCodeAt: #cbu_).
	self assert: 'cbuPlusOne ^aCbu cbu+1 .' equals: (sourceClass sourceCodeAt: #cbuPlusOne).
	self assert: 'cbu
	^cbu' equals: (targetClass sourceCodeAt: #cbu).
	! !

!ExtractClassRefactoringTest methodsFor: 'as yet unclassified' stamp: 'mc 2/22/2024 00:14:58'!
test110GivenANonGetterAndInstvarWithSameNameWhenExtractClassThenGetterShouldHaveUndescore
	
	| targetClassName sourceClass instVarsToExtract methodsToExtract refactoring targetClass |
	targetClassName := #TargetClass.
	sourceClass := self createClassNamed: #SourceClass instanceVariableNames: 'cbu'.
	instVarsToExtract := OrderedCollection new.
	methodsToExtract := OrderedCollection new.
	sourceClass compile: 'cbu ^1.' .
	sourceClass compile: 'cbu_ ^cbu.' .
	sourceClass compile: 'cbuPlusOne ^cbu+1 .' .
	methodsToExtract add: #cbu.
	methodsToExtract add: #cbu_.
	instVarsToExtract add: 'cbu'.
	
	refactoring := ExtractClassRefactoring 
						from: sourceClass
						to: targetClassName
						instanceVariableNamed: 'aCbu' 
						instVarToExtract: instVarsToExtract
						methodToExtract: methodsToExtract.
	refactoring apply.
	
	targetClass := (Smalltalk classNamed: #TargetClass).
	self assert: [ targetClass notNil ].
	self assert: 1 equals: targetClass instVarNames size.
	self assert: 'cbu
	^aCbu cbu.' equals: (sourceClass sourceCodeAt: #cbu).
	self assert: 'cbu_
	^aCbu cbu_.' equals: (sourceClass sourceCodeAt: #cbu_).
	self assert: 'cbuPlusOne ^aCbu cbu__+1 .' equals: (sourceClass sourceCodeAt: #cbuPlusOne).
	self assert: 'cbu ^1.' equals: (targetClass sourceCodeAt: #cbu).
	self assert: 'cbu_ ^self cbu__.' equals: (targetClass sourceCodeAt: #cbu_).
	self assert: 'cbu__
	^cbu' equals: (targetClass sourceCodeAt: #cbu__).
	
	! !

!ExtractClassRefactoringTest methodsFor: 'as yet unclassified' stamp: 'mc 2/25/2024 23:48:21'!
test111GivenASetterAndInstvarWithSameNameWhenExtractClassThenSetterShouldHaveSameName
	
	| targetClassName sourceClass instVarsToExtract methodsToExtract refactoring targetClass |
	targetClassName := #TargetClass.
	sourceClass := self createClassNamed: #SourceClass instanceVariableNames: 'counter'.
	instVarsToExtract := OrderedCollection new.
	methodsToExtract := OrderedCollection new.
	sourceClass compile: 'counter: anInt ^counter := anInt.' .
	sourceClass compile: 'counterReset
	counter := 1.
	^counter' .
	methodsToExtract add: #counter:.
	instVarsToExtract add: 'counter'.
	
	refactoring := ExtractClassRefactoring 
						from: sourceClass
						to: targetClassName
						instanceVariableNamed: 'aCounter' 
						instVarToExtract: instVarsToExtract
						methodToExtract: methodsToExtract.
	refactoring apply.
	
	targetClass := (Smalltalk classNamed: #TargetClass).
	self assert: [ targetClass notNil ].
	self assert: 1 equals: targetClass instVarNames size.
	self assert: 'counter: anInt ^aCounter counter: anInt.' equals: (sourceClass sourceCodeAt: #counter:).
	self assert: 'counterReset
	aCounter counter: 1.
	^aCounter counter' equals: (sourceClass sourceCodeAt: #counterReset).
	self assert: 'counter: anObject
	^counter := anObject.' equals: (targetClass sourceCodeAt: #counter:).
	! !

!ExtractClassRefactoringTest methodsFor: 'as yet unclassified' stamp: 'mc 2/21/2024 01:12:08'!
test112GivenASetterAndInstvarWithSameNameWhenExtractClassThenSetterShouldHaveSameName
	
	| targetClassName sourceClass instVarsToExtract methodsToExtract refactoring targetClass |
	targetClassName := #TargetClass.
	sourceClass := self createClassNamed: #SourceClass instanceVariableNames: 'counter'.
	instVarsToExtract := OrderedCollection new.
	methodsToExtract := OrderedCollection new.
	sourceClass compile: 'counter: anInt ^counter := anInt.' .
	sourceClass compile: 'counter_: anInt ^counter := anInt.' .
	sourceClass compile: 'counterReset
	counter := 1.
	^counter' .
	methodsToExtract add: #counter:.
	methodsToExtract add: #counter_:.
	instVarsToExtract add: 'counter'.
	
	refactoring := ExtractClassRefactoring 
						from: sourceClass
						to: targetClassName
						instanceVariableNamed: 'aCounter' 
						instVarToExtract: instVarsToExtract
						methodToExtract: methodsToExtract.
	refactoring apply.
	
	targetClass := (Smalltalk classNamed: #TargetClass).
	self assert: [ targetClass notNil ].
	self assert: 1 equals: targetClass instVarNames size.
	self assert: 'counter: anInt ^aCounter counter: anInt.' equals: (sourceClass sourceCodeAt: #counter:).
	self assert: 'counter_: anInt
	^aCounter counter_: anInt.' equals: (sourceClass sourceCodeAt: #counter_:).
	self assert: 'counterReset
	aCounter counter: 1.
	^aCounter counter' equals: (sourceClass sourceCodeAt: #counterReset).
	self assert: 'counter: anObject
	^counter := anObject.' equals: (targetClass sourceCodeAt: #counter:).
	self assert: 'counter_: anInt ^self counter: anInt.' equals: (targetClass sourceCodeAt: #counter_:).

	! !

!ExtractClassRefactoringTest methodsFor: 'as yet unclassified' stamp: 'mc 2/25/2024 23:53:49'!
test113GivenASetterWhichDoesntReturnAssigmentAndInstvarWithSameNameWhenExtractClassThenSetterShouldHaveSameName
	
	| targetClassName sourceClass instVarsToExtract methodsToExtract refactoring targetClass |
	targetClassName := #TargetClass.
	sourceClass := self createClassNamed: #SourceClass instanceVariableNames: 'counter'.
	instVarsToExtract := OrderedCollection new.
	methodsToExtract := OrderedCollection new.
	sourceClass compile: 'counter: anInt counter := anInt.' .
	sourceClass compile: 'counterReset
	counter := 1.
	^counter' .
	methodsToExtract add: #counter:.
	instVarsToExtract add: 'counter'.
	
	refactoring := ExtractClassRefactoring 
						from: sourceClass
						to: targetClassName
						instanceVariableNamed: 'aCounter' 
						instVarToExtract: instVarsToExtract
						methodToExtract: methodsToExtract.
	refactoring apply.
	
	targetClass := (Smalltalk classNamed: #TargetClass).
	self assert: [ targetClass notNil ].
	self assert: 1 equals: targetClass instVarNames size.
	self assert: 'counter: anInt aCounter counter: anInt.' equals: (sourceClass sourceCodeAt: #counter:).
	self assert: 'counterReset
	aCounter counter: 1.
	^aCounter counter' equals: (sourceClass sourceCodeAt: #counterReset).
	self assert: 'counter: anObject
	^counter := anObject.' equals: (targetClass sourceCodeAt: #counter:).
	! !

!ExtractClassRefactoringTest methodsFor: 'as yet unclassified' stamp: 'mc 2/25/2024 23:53:57'!
test114GivenANonSetterAndInstvarWithSameNameWhenExtractClassThenSetterShouldHaveUndescore
	
	| targetClassName sourceClass instVarsToExtract methodsToExtract refactoring targetClass |
	targetClassName := #TargetClass.
	sourceClass := self createClassNamed: #SourceClass instanceVariableNames: 'counter'.
	instVarsToExtract := OrderedCollection new.
	methodsToExtract := OrderedCollection new.
	sourceClass compile: 'counter: anInt ^1.' .
	sourceClass compile: 'counter_: anInt ^2.' .
	sourceClass compile: 'counterReset
	counter := 1.
	^counter' .
	methodsToExtract add: #counter:.
	methodsToExtract add: #counter_:.
	instVarsToExtract add: 'counter'.
	
	refactoring := ExtractClassRefactoring 
						from: sourceClass
						to: targetClassName
						instanceVariableNamed: 'aCounter' 
						instVarToExtract: instVarsToExtract
						methodToExtract: methodsToExtract.
	refactoring apply.
	
	targetClass := (Smalltalk classNamed: #TargetClass).
	self assert: [ targetClass notNil ].
	self assert: 1 equals: targetClass instVarNames size.
	self assert: 'counter: anInt
	^aCounter counter: anInt.' equals: (sourceClass sourceCodeAt: #counter:).
	self assert: 'counter_: anInt
	^aCounter counter_: anInt.' equals: (sourceClass sourceCodeAt: #counter_:).
	self assert: 'counterReset
	aCounter counter__: 1.
	^aCounter counter' equals: (sourceClass sourceCodeAt: #counterReset).
	self assert: 'counter: anInt ^1.' equals: (targetClass sourceCodeAt: #counter:).
	self assert: 'counter_: anInt ^2.' equals: (targetClass sourceCodeAt: #counter_:).
	self assert: 'counter__: anObject
	^counter := anObject.' equals: (targetClass sourceCodeAt: #counter__:).

	! !

!ExtractClassRefactoring methodsFor: 'initialization' stamp: 'mc 1/5/2024 01:23:51'!
initializeFrom: aSourceClassName to: aTargetClassName instanceVariableNamed: anInstanceVariableNameForSourceClass instVarToExtract: collectionOfInstVarsToExtract methodToExtract: collectionOfMethodsToExtract  
	sourceClass := aSourceClassName.
	targetClassName := aTargetClassName.
	instVarsToExtract := collectionOfInstVarsToExtract.
	methodsToExtract := collectionOfMethodsToExtract.
	variableToAccessToNewClass := anInstanceVariableNameForSourceClass.
	! !

!ExtractClassRefactoring methodsFor: 'applying' stamp: 'mc 2/9/2024 10:03:41'!
apply
	
	self 
		createNewClass;
		initializeNewObject;
		addInstanceVariableToAccessNewClass;
		moveInstanceVariables;
		moveMethods.
		! !

!ExtractClassRefactoring methodsFor: 'private' stamp: 'mc 1/5/2024 01:23:51'!
addInstanceVariableToAccessNewClass

	^ sourceClass addInstVarName: variableToAccessToNewClass! !

!ExtractClassRefactoring methodsFor: 'private' stamp: 'mc 1/5/2024 01:23:51'!
createNewClass

	^ Object 
		subclass: targetClassName 
		instanceVariableNames: ''
		classVariableNames: ''
		poolDictionaries: ''
		category: sourceClass category! !

!ExtractClassRefactoring methodsFor: 'private' stamp: 'mc 2/23/2024 01:34:52'!
dontMoveMethod: selectorToMove

	^ methodsToExtract remove: selectorToMove! !

!ExtractClassRefactoring methodsFor: 'private' stamp: 'mc 2/23/2024 02:27:52'!
getterSelectorFor: anInstanceVariableToMove 
	| getterCandidate |
	getterCandidate := anInstanceVariableToMove asSymbol.
	(self isGoingToMove: getterCandidate andIsGetterOf: anInstanceVariableToMove)
		ifTrue: [self dontMoveMethod: getterCandidate ].
	
	[methodsToExtract includes: getterCandidate] whileTrue: [
		getterCandidate := (getterCandidate copyFrom: 1 to: getterCandidate size), '_'.].
	^getterCandidate.! !

!ExtractClassRefactoring methodsFor: 'private' stamp: 'mc 1/5/2024 01:23:51'!
initializeNewObject
	| newSourceInitialize |
	sourceClass methodDict 
		at: #initialize 
		ifPresent:  [ :initializeCompiledMethod |
			newSourceInitialize := self newSourceCodeForInitializeWhenExists: initializeCompiledMethod.
			]
		ifAbsent: [
			newSourceInitialize := 'initialize', String newLineString, String tab, variableToAccessToNewClass, ' := ', targetClassName, ' new.'.
			newSourceInitialize := newSourceInitialize, String newLineString, String tab, 'super initialize.'.
			].
	sourceClass compile: newSourceInitialize! !

!ExtractClassRefactoring methodsFor: 'private' stamp: 'mc 2/23/2024 02:27:04'!
isGoingToMove: getterCandidate andIsGetterOf: anInstanceVariableToMove

	^ (methodsToExtract includes: getterCandidate) and: [(sourceClass compiledMethodAt: getterCandidate) isGetterOf: anInstanceVariableToMove at: (sourceClass allInstVarNames indexOf: anInstanceVariableToMove)]! !

!ExtractClassRefactoring methodsFor: 'private' stamp: 'mc 2/24/2024 02:09:25'!
isGoingToMove: setterCandidate andIsSetterOf: anInstanceVariableToMove

	^(methodsToExtract includes: setterCandidate) 
	and: [self method: (sourceClass compiledMethodAt: setterCandidate) isSetterOf: anInstanceVariableToMove]! !

!ExtractClassRefactoring methodsFor: 'private' stamp: 'mc 2/25/2024 23:52:19'!
method: setterCandidate isSetterOf: anInstVarName 
	| anInstVarIndex varIndexCode scanner |

	anInstVarIndex := sourceClass allInstVarNames indexOf: anInstVarName.

	"setterCandidate selector = (anInstVarName, ':') ifFalse: [ ^false ]."
	
	"I could have use the AST of the method, but parsing the source code could generate errors
	that it is why I decided to check the bytecodes - Hernan"
	varIndexCode := anInstVarIndex - 1.
	scanner := InstructionStream on: setterCandidate.
	scanner nextByte = 16r10 ifFalse: [ ^false ].
	scanner movePcForward.
	(setterCandidate writesFieldCode: varIndexCode with: scanner nextByte using: scanner) ifFalse: [ ^false ].
	scanner movePcForward.
	^scanner nextByte = 16r7C or: [scanner nextByte = 16r78]! !

!ExtractClassRefactoring methodsFor: 'private' stamp: 'mc 2/7/2024 02:13:04'!
moveInstanceVariables

	| newGetter newSetter |
	"self halt."
	^ instVarsToExtract do: [ :anInstanceVariableToMove | 
		
		"(methodsToExtract includes: anInstanceVariableToMove asSymbol) 
			ifTrue: [newGetter := (anInstanceVariableToMove, '_') asSymbol.]
			ifFalse: [newGetter := anInstanceVariableToMove asSymbol]."
		newGetter := self getterSelectorFor: anInstanceVariableToMove.
		
		newSetter := self setterSelectorFor: anInstanceVariableToMove.

		(MoveInstanceVariableRefactoring 
			named: anInstanceVariableToMove
			from: sourceClass
			to: (Smalltalk classNamed: targetClassName) 
			accessingThrough: variableToAccessToNewClass
			usingGetter: newGetter
			usingSetter: newSetter) apply.
		
		]! !

!ExtractClassRefactoring methodsFor: 'private' stamp: 'mc 2/4/2024 03:12:26'!
moveMethods
	"self halt."
	^ methodsToExtract do: [ :aMethodToMove | |extraParameter|
		(MoveMethodRefactoring needParameterNameToMove: aMethodToMove from: sourceClass accessingThrough: variableToAccessToNewClass)
			ifTrue: [
				aMethodToMove isKeyword 
					ifTrue: [extraParameter := ExtraParameterNameNeededAndExtraKeyword parameterName: ('a', sourceClass name) extraKeyword: ('with', sourceClass name) ]
					ifFalse: [extraParameter := ExtraParameterNameNeeded parameterName: ('a', sourceClass name).]]
			ifFalse: [extraParameter := NonExtraParameterNameNeeded new].
		
		(MoveMethodRefactoring 
			methodNamed: aMethodToMove
			from: sourceClass 
			to: (Smalltalk classNamed: targetClassName)
			accessingThrough: variableToAccessToNewClass
			parameterNeeded: extraParameter) apply.]! !

!ExtractClassRefactoring methodsFor: 'private' stamp: 'mc 1/5/2024 01:23:51'!
newSourceCodeForInitializeWhenExists: initializeCompiledMethod 
	| codeForTemporaries newSourceInitialize originalSourceInitialize rangesForTmpVars |
	originalSourceInitialize := sourceClass sourceCodeAt: #initialize.
	rangesForTmpVars := initializeCompiledMethod methodNode 
							completeSourceRangesOf: initializeCompiledMethod methodNode
							temporariesDeclaration ifAbsent: [
								newSourceInitialize := 'initialize', String newLineString, String tab, variableToAccessToNewClass, ' := ', targetClassName, ' new.'.
								newSourceInitialize := newSourceInitialize, (originalSourceInitialize copyFrom: 11 to: originalSourceInitialize size).
								^newSourceInitialize].
	rangesForTmpVars := rangesForTmpVars detectMin: [ :anInterval | anInterval first].
	codeForTemporaries := initializeCompiledMethod sourceCode copyFrom: rangesForTmpVars first to: rangesForTmpVars last.
	newSourceInitialize := 'initialize', String newLineString, String tab, codeForTemporaries, String newLineString, String tab, variableToAccessToNewClass, ' := ', targetClassName, ' new.'.
	newSourceInitialize := newSourceInitialize, (originalSourceInitialize copyFrom: (rangesForTmpVars last + 1) to: originalSourceInitialize size).
	^newSourceInitialize! !

!ExtractClassRefactoring methodsFor: 'private' stamp: 'mc 2/23/2024 01:37:49'!
setterSelectorFor: anInstanceVariableToMove 
	| setterCandidate |
	setterCandidate := (anInstanceVariableToMove, ':') asSymbol .
	(self isGoingToMove: setterCandidate andIsSetterOf: anInstanceVariableToMove)
		ifTrue: [self dontMoveMethod: setterCandidate ].
	
	[methodsToExtract includes: setterCandidate] whileTrue: [
		setterCandidate := (setterCandidate copyFrom: 1 to: setterCandidate size -1), '_:'.].
	^setterCandidate.! !

!ExtractClassRefactoring class methodsFor: 'instance creation' stamp: 'mc 1/20/2024 01:48:29'!
from: sourceClass to: targetClassName instanceVariableNamed: anInstanceVariableNameForSourceClass instVarToExtract: instVarToExtract methodToExtract: methodsToExtract  
	
	Smalltalk
		at: targetClassName 
		ifPresent: [ :actualClass | self refactoringError: self targetClassShouldNotExistsErrorMessage. ]
		ifAbsent: [].
	targetClassName isEmptyOrNil ifTrue: [ self refactoringError: self targetClassShouldNotBeEmptyErrorMessage ].
	targetClassName first isUppercase ifFalse: [ self refactoringError: self targetClassShouldStartWithUppercaseErrorMessage ].
	(sourceClass instVarNames includesAllOf: instVarToExtract) ifFalse: [ self refactoringError: (self instanceVariable: ((instVarToExtract difference: sourceClass instVarNames) first) shouldExistsOn: sourceClass name) ].
	
	(sourceClass selectors includesAllOf: methodsToExtract) ifFalse: [self refactoringError: ( self selector: ((methodsToExtract difference: sourceClass selectors) first) shouldExistsOn: 'SourceClass' )].
	"self refactoringError: (self selector: methodsToExtract first shouldExistsOn: sourceClass name)."
	anInstanceVariableNameForSourceClass ifNil: [self refactoringError: self variableToAccessNewClassShouldNotBeNilErrorMessage].
	anInstanceVariableNameForSourceClass ifEmpty: [ self refactoringError: self variableToAccessNewClassShouldNotBeEmptyErrorMessage ].
	anInstanceVariableNameForSourceClass first isLowercase ifFalse: [ self refactoringError: self variableToAccessNewClassShouldBeInLowercaseErrorMessage ].
	(sourceClass instVarNames includes: anInstanceVariableNameForSourceClass  ) ifTrue: [self refactoringError: self variableToAccessNewClassShouldNotBeInUseErrorMessage].
	
	^self new initializeFrom: sourceClass to: targetClassName instanceVariableNamed: anInstanceVariableNameForSourceClass instVarToExtract: instVarToExtract methodToExtract: methodsToExtract  ! !

!ExtractClassRefactoring class methodsFor: 'message handling' stamp: 'mc 1/5/2024 01:23:51'!
instanceVariable: anInsVarName shouldExistsOn: aClassName 
	^'instance variable ', anInsVarName, ' should exists on ', aClassName! !

!ExtractClassRefactoring class methodsFor: 'message handling' stamp: 'mc 1/5/2024 01:23:51'!
instanceVariableToExtractShouldExistsOnSourceClass
	^'instance variable to extract should exists on source class'.! !

!ExtractClassRefactoring class methodsFor: 'message handling' stamp: 'mc 1/5/2024 01:23:51'!
selector: aSelector shouldExistsOn: aClassName 
	^'selector ', aSelector, ' should exists on ', aClassName! !

!ExtractClassRefactoring class methodsFor: 'message handling' stamp: 'mc 1/19/2024 01:48:11'!
targetClassShouldNotBeEmptyErrorMessage
	^'Target class should not be empty'! !

!ExtractClassRefactoring class methodsFor: 'message handling' stamp: 'mc 1/5/2024 01:23:51'!
targetClassShouldNotExistsErrorMessage
	^'Target class should not exists'! !

!ExtractClassRefactoring class methodsFor: 'message handling' stamp: 'mc 1/20/2024 00:23:16'!
targetClassShouldStartWithUppercaseErrorMessage
	^'Target class should start with uppercase'! !

!ExtractClassRefactoring class methodsFor: 'message handling' stamp: 'mc 1/20/2024 01:49:24'!
variableToAccessNewClassShouldBeInLowercaseErrorMessage
	^'Variable to access new class should be in lowercase'! !

!ExtractClassRefactoring class methodsFor: 'message handling' stamp: 'mc 1/19/2024 01:52:35'!
variableToAccessNewClassShouldNotBeEmptyErrorMessage
	^'Variable to access new class should not be empty'! !

!ExtractClassRefactoring class methodsFor: 'message handling' stamp: 'mc 1/5/2024 01:23:51'!
variableToAccessNewClassShouldNotBeInUseErrorMessage
	^'variable to access new class should not be in use'! !

!ExtractClassRefactoring class methodsFor: 'message handling' stamp: 'mc 1/5/2024 01:23:51'!
variableToAccessNewClassShouldNotBeNilErrorMessage
	^'variable to access new class should not be nil'! !

!ExtractClassApplier methodsFor: 'initialization' stamp: 'mc 1/5/2024 01:23:50'!
initializeToApplyOn: aClass

	classToRefactor := aClass.! !

!ExtractClassApplier methodsFor: 'refactoring - creation' stamp: 'mc 1/13/2024 01:58:48'!
createRefactoring
	"self halt."
	
	^ExtractClassRefactoring 
		from: classToRefactor 
		to: extractClassRequest newClassName
		instanceVariableNamed: extractClassRequest variableNameToAccessNewClass
		instVarToExtract: extractClassRequest instanceVariablesToExtract
		methodToExtract: extractClassRequest methodsToExtract.! !

!ExtractClassApplier methodsFor: 'refactoring - parameters request' stamp: 'mc 1/5/2024 01:23:50'!
requestRefactoringParameters

	"ver si hay que agregar check si la clase esta vacia"
"	self chooseInstanceVariable.

	instanceVariable ifNil: [^self].

	ifNilChecks := (IfNilChecksFinder on: classToRefactor for: instanceVariable) value.

	ifNilChecks ifEmpty: [^self inform: ('There are no ifNil checks on ', instanceVariable)].
"
	form := ExtractClassForm open: self.! !

!ExtractClassApplier methodsFor: 'evaluating' stamp: 'mc 1/18/2024 03:13:58'!
value
	self requestRefactoringParametersHandlingRefactoringExceptions.! !

!ExtractClassApplier methodsFor: 'accessing' stamp: 'mc 1/5/2024 01:23:50'!
classToRefactorName
	^classToRefactor name! !

!ExtractClassApplier methodsFor: 'accessing' stamp: 'mc 1/5/2024 01:23:50'!
compiledMethodAt: aMessage 
	^classToRefactor compiledMethodAt: aMessage! !

!ExtractClassApplier methodsFor: 'accessing' stamp: 'mc 1/18/2024 02:15:42'!
instanceVariableList
	^classToRefactor instVarNames sorted! !

!ExtractClassApplier methodsFor: 'accessing' stamp: 'mc 1/5/2024 01:23:50'!
selectorList
	^classToRefactor selectors sort! !

!ExtractClassApplier methodsFor: 'actions' stamp: 'mc 1/5/2024 01:23:50'!
cancel
	form delete.! !

!ExtractClassApplier methodsFor: 'actions' stamp: 'mc 1/5/2024 01:23:50'!
userSubmitted: request 
	
	extractClassRequest := request.
	self createRefactoringHandlingRefactoringExceptions.
	refactoring ifNotNil: [self applyRefactoring].
	! !

!ExtractClassApplier class methodsFor: 'instance creation' stamp: 'mc 1/5/2024 01:23:50'!
applyOn: aClass 
	
	^self new initializeToApplyOn: aClass! !

!ExtractClassObjectRequest methodsFor: 'accessing' stamp: 'mc 1/5/2024 01:23:50'!
instanceVariablesToExtract

	^instanceVariableListModel instanceVariablesToExtract! !

!ExtractClassObjectRequest methodsFor: 'accessing' stamp: 'mc 1/5/2024 01:23:50'!
methodsToExtract
	^messageListModel methodsToExtract! !

!ExtractClassObjectRequest methodsFor: 'accessing' stamp: 'mc 1/5/2024 01:23:50'!
newClassName
	^newClassNameModel actualContents asString asSymbol ! !

!ExtractClassObjectRequest methodsFor: 'accessing' stamp: 'mc 1/5/2024 01:23:50'!
variableNameToAccessNewClass
	^variableNameToAccessNewClassModel actualContents string ! !

!ExtractClassObjectRequest methodsFor: 'initialization' stamp: 'mc 1/5/2024 01:23:50'!
initializeNewWithNameModel: aNewClassNameModel methodsToMoveModel: aMessageListModel instanceVariableListModel: anInstanceVariableListModel variableNameToAccessThroughModel: aVariableNameToAccessNewClassModel 
	newClassNameModel := aNewClassNameModel.
	messageListModel := aMessageListModel.
	instanceVariableListModel := anInstanceVariableListModel.
	variableNameToAccessNewClassModel := aVariableNameToAccessNewClassModel.! !

!ExtractClassObjectRequest class methodsFor: 'instance creation' stamp: 'mc 1/5/2024 01:23:50'!
newWithNameModel: aNewClassNameModel methodsToMoveModel: aMessageListModel instanceVariableListModel: anInstanceVariableListModel variableNameToAccessThroughModel: aVariableNameToAccessNewClassModel 
	^self new 
		initializeNewWithNameModel: aNewClassNameModel 
		methodsToMoveModel: aMessageListModel 
		instanceVariableListModel: anInstanceVariableListModel 
		variableNameToAccessThroughModel: aVariableNameToAccessNewClassModel ! !

!TesisExtractClassRefactoringMenu class methodsFor: 'as yet unclassified' stamp: 'mc 1/5/2024 01:23:51'!
classListMenuOptions

	^ `{	
			{
				#submenuOf -> RefactoringMenues refactoringsLabel.
				#itemGroup 		-> 		40.
				#itemOrder 		-> 		20.
				#label 			-> 		'Extract class...'.
				#selector 		-> 		#contextualExtractClass.
				#icon 			-> 		#newFolderIcon
			} asDictionary.			
	}`.! !

!LabeledInput methodsFor: '*ExtractClassRefactoring-as yet unclassified' stamp: 'mc 1/17/2024 19:25:32'!
emptyTextDisplayMessage: aString

	inputMorph emptyTextDisplayMessage: aString! !

!LabeledInput methodsFor: '*ExtractClassRefactoring-as yet unclassified' stamp: 'mc 12/28/2023 12:16:43'!
withLabel: aLabel withLabelFixedWidth: aWidth withModel: aTextModel usingAs: focusMover

	| labelLayoutSpec inputMorphLayoutSpec |

	"self separation: 5."
	self layoutSpec: (LayoutSpec proportionalWidth: 1.0 fixedHeight: LabeledInput recommendedHeight).

	labelMorph := LabelMorph contents: aLabel.
	labelLayoutSpec := LayoutSpec
		fixedWidth: aWidth
		fixedHeight: labelMorph morphHeight
		offAxisEdgeWeight: #center.
	self addMorph: labelMorph layoutSpec: labelLayoutSpec.

	inputMorph := TabPassingTextModelMorph withModel: aTextModel.
	inputMorph innerTextMorph focusMover: focusMover.
	focusMover addFocusReceiver: inputMorph innerTextMorph.
	inputMorph hideScrollBarsIndefinitely.
	inputMorphLayoutSpec :=
		LayoutSpec
			proportionalWidth: 1.0
			fixedHeight: labelMorph morphHeight + 2.
	self addMorph: inputMorph layoutSpec: inputMorphLayoutSpec.



	! !

!LabeledInput class methodsFor: '*ExtractClassRefactoring-instance creation' stamp: 'mc 12/28/2023 12:13:39'!
withLabel: aLabel withLabelFixedWidth: aWidth withModel: aPreviewModel usingAs: aFocusMover

	^self newRow withLabel: aLabel withLabelFixedWidth: aWidth withModel: aPreviewModel usingAs: aFocusMover! !

!BrowserWindow methodsFor: '*ExtractClassRefactoring' stamp: 'mc 10/18/2023 01:10:37'!
contextualExtractClass

	| classToRefactor |
	"self halt."
	classToRefactor := model selectedClassOrMetaClass.

	classToRefactor ifNotNil: [(ExtractClassApplier applyOn: classToRefactor) value.].! !

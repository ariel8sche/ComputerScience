'From Cuis 5.0 [latest update: #3938] on 28 October 2019 at 9:56:40 am'!
'Description Please enter a description for this package'!
!provides: 'Tests-Changes' 1 8!
SystemOrganization addCategory: #'Tests-Changes'!


!classDefinition: #ChangesTest category: #'Tests-Changes' stamp: 'HAW 10/28/2019 09:56:41'!
TestCase subclass: #ChangesTest
	instanceVariableNames: 'testClass author previousUserChangesFile'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Tests-Changes'!
!classDefinition: 'ChangesTest class' category: #'Tests-Changes' stamp: 'HAW 10/28/2019 09:56:41'!
ChangesTest class
	instanceVariableNames: ''!

!classDefinition: #LogChangesTest category: #'Tests-Changes' stamp: 'HAW 10/28/2019 09:56:41'!
ChangesTest subclass: #LogChangesTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Tests-Changes'!
!classDefinition: 'LogChangesTest class' category: #'Tests-Changes' stamp: 'HAW 10/28/2019 09:56:41'!
LogChangesTest class
	instanceVariableNames: ''!

!classDefinition: #ScanChangesTest category: #'Tests-Changes' stamp: 'HAW 10/28/2019 09:56:41'!
ChangesTest subclass: #ScanChangesTest
	instanceVariableNames: 'mockClass'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Tests-Changes'!
!classDefinition: 'ScanChangesTest class' category: #'Tests-Changes' stamp: 'HAW 10/28/2019 09:56:41'!
ScanChangesTest class
	instanceVariableNames: ''!


!ChangesTest methodsFor: 'as yet unclassified' stamp: 'MGD 1/4/2019 09:30:57'!
changesFileForTests
	^ 'test.changes'! !

!ChangesTest methodsFor: 'as yet unclassified' stamp: 'MGD 10/1/2019 20:18:37'!
setUp
	author := Utilities authorName.
	previousUserChangesFile := Preferences userChangesFileName.

	self changesFileForTests asFileEntry delete.

	Preferences setPreference: #userChangesFileName toValue: self changesFileForTests.

	testClass := TestCase subclass: #NewTestCase instanceVariableNames: '' classVariableNames: '' poolDictionaries: '' category: 'Tests-Changes'.

	testClass compile: 'testPassed self assert: true'.
	testClass compile: 'testFailure self assert: false'.
	testClass compile: 'testError self error: ''Unexpected error'''.! !

!ChangesTest methodsFor: 'as yet unclassified' stamp: 'MGD 10/1/2019 20:18:46'!
tearDown
	Preferences setPreference: #userChangesFileName toValue: previousUserChangesFile.
	self changesFileForTests asFileEntry delete.

	testClass removeFromSystem.
! !

!ChangesTest methodsFor: 'as yet unclassified' stamp: 'MGD 1/4/2019 09:31:12'!
userChangesFile
	^ Smalltalk defaultUserChangesName asFileEntry! !

!LogChangesTest methodsFor: 'tests' stamp: 'MGD 12/30/2018 16:03:57'!
assertIsLogged: aString times: stringCount
	| logContent startPosition indexOfSubstring |

	logContent := self userChangesFile textContents.

	(stringCount <= 0)
		ifTrue: [ self deny: (logContent includesSubString: aString) ]
		ifFalse:	[
			startPosition := 1.
			self assert: (logContent includesSubString: aString).
			stringCount timesRepeat: [
				indexOfSubstring := logContent findString: aString startingAt: startPosition.

				self assert: indexOfSubstring > 0.
				startPosition := indexOfSubstring.
			]
		]


	! !

!LogChangesTest methodsFor: 'tests' stamp: 'MGD 12/30/2018 16:04:58'!
assertIsLoggedOnce: aString
	self assertIsLogged: aString times: 1.! !

!LogChangesTest methodsFor: 'tests' stamp: 'MGD 12/30/2018 16:44:01'!
assertIsLoggedTwice: aString
	self assertIsLogged: aString times: 2.! !

!LogChangesTest methodsFor: 'tests' stamp: 'MGD 5/23/2019 09:25:08'!
test01AddingAClassShouldBeLogged
	" Log format expected:

	!!classDefinition: #ClassName category: #'Category' stamp: changeStamp!!
	Object subclass: #ClassName
		instanceVariableNames: '...'
		classVariableNames: '...'
		poolDictionaries: '....'
		category: 'Category'!!
	"
	| newClass |
	[
		newClass := Object subclass: #NewClass instanceVariableNames: '' classVariableNames: '' poolDictionaries: '' category: 'Tests-Changes'.

		self assertIsLoggedOnce: '!!classDefinition: #NewClass category: #''Tests-Changes'' stamp:'.
		self assertIsLoggedOnce: newClass definition.
	] ensure: [
		newClass removeFromSystem
	]
! !

!LogChangesTest methodsFor: 'tests' stamp: 'MGD 1/2/2019 19:48:25'!
test02AddingANewMethodShouldBeLogged
	" Log format expected:

	!!Class methodsFor: 'category' stamp: 'author stamp'!!
	methodSourceCode
	"
	| aClass |
	[
		aClass := Object subclass: #NewClass instanceVariableNames: '' classVariableNames: '' poolDictionaries: '' category: 'Tests-Changes'.
		aClass compile: 'm1 ^ 1' classified: 'a-category'.

		self assertIsLoggedOnce: '!!NewClass methodsFor: ''a-category'' stamp:'.
		self assertIsLoggedOnce: 'm1 ^ 1'.
	] ensure: [
		aClass removeFromSystem
	]
! !

!LogChangesTest methodsFor: 'tests' stamp: 'MGD 5/24/2019 10:20:47'!
test03ChangingAMethodShouldBeLogged
	" Log format expected:

	!!Class methodsFor: 'category' stamp: 'author stamp'!!
	newMethodSourceCode
	"
	| aClass |
	[
		aClass := Object subclass: #NewClass instanceVariableNames: '' classVariableNames: '' poolDictionaries: '' category: 'Tests-Changes'.
		aClass compile: 'm1 ^ 1' classified: 'a-category'.
		aClass compile: 'm1 ^ 2' classified: 'a-category'.

		self assertIsLoggedTwice: '!!NewClass methodsFor: ''a-category'' stamp:'.
		self assertIsLoggedOnce: 'prior: '.
		self assertIsLoggedOnce: 'm1 ^ 2'.
	] ensure: [
		aClass removeFromSystem
	]
! !

!LogChangesTest methodsFor: 'tests' stamp: 'HAW 10/28/2019 09:55:12'!
test04RemovingAMethodShouldBeLogged
	" Log format expected:

	!!methodRemoval: #ClassName selector stamp: changeStamp!!
	methodSourceCode
	"
	| aClass |
	[
		aClass := Object subclass: #NewClass instanceVariableNames: '' classVariableNames: '' poolDictionaries: '' category: 'Tests-Changes'.
		aClass compile: 'm1 ^ 1' classified: 'a-category'.
		aClass removeSelector: #m1.

		self assertIsLoggedOnce: '!!methodRemoval: NewClass #m1 stamp:'.
		self assertIsLoggedOnce: 'm1 ^ 1'.
	] ensure: [
		aClass removeFromSystem
	]
! !

!LogChangesTest methodsFor: 'tests' stamp: 'MGD 5/23/2019 10:36:28'!
test05RemovingAClassShouldBeLogged
	" Log format expected:

	!!classRemoval: #ClassName stamp: changeStamp!!
	classDefinitionMessage
	"
	| aClass definition |

	aClass := Object subclass: #NewClass instanceVariableNames: '' classVariableNames: '' poolDictionaries: '' category: 'Tests-Changes'.
	definition := aClass definition.
	aClass removeFromSystem.

	self assertIsLoggedOnce: '!!classRemoval: #NewClass stamp:'.
	self assertIsLoggedOnce: definition.

! !

!LogChangesTest methodsFor: 'tests' stamp: 'MGD 5/23/2019 10:45:35'!
test06RunningAPassingTestShouldBeLogged
	" Log format expected:

	!!testRun: #TestCase #testSelector stamp: changeStamp!!
	PASSED
	"
	testClass run: #testPassed.

	self assertIsLoggedOnce: '!!testRun: #NewTestCase #testPassed stamp:'.
	self assertIsLoggedOnce: 'PASSED!!'.

! !

!LogChangesTest methodsFor: 'tests' stamp: 'MGD 5/23/2019 10:47:02'!
test07RunningAFailingTestShouldBeLogged
	" Log format expected:

	!!testRun #NewTestCase #testSelector stamp: changeStamp!!
	FAILURE
	"
	testClass run: #testFailure.

	self assertIsLoggedOnce: '!!testRun: #NewTestCase #testFailure stamp:'.
	self assertIsLoggedOnce: 'FAILURE!!'.

! !

!LogChangesTest methodsFor: 'tests' stamp: 'MGD 7/28/2019 16:49:51'!
test08RunningATestWithAnErrorShouldBeLogged
	" Log format expected:

	!!testRun #NewTestCase #testSelector stamp: changeStamp!!
	ERROR
	"
	testClass run: #testError.

	self assertIsLoggedOnce: '!!testRun: #NewTestCase #testError stamp:'.
	self assertIsLoggedOnce: 'ERROR!!'.

! !

!LogChangesTest methodsFor: 'tests' stamp: 'MGD 5/23/2019 10:49:14'!
test09RunningATestSuiteShouldBeLogged
	" Log format expected:

	!!testRun: #TestCase #testSelector stamp: changeStamp!!
	PASSED
	!!testRun #NewTestCase #testSelector stamp: changeStamp!!
	FAILURE
	!!testRun #NewTestCase #testSelector stamp: changeStamp!!
	ERROR
	"
	testClass buildSuiteFromAllSelectors run.

	self assertIsLoggedOnce: '!!testRun: #NewTestCase #testPassed'.
	self assertIsLoggedOnce: '!!testRun: #NewTestCase #testFailure'.
	self assertIsLoggedOnce: '!!testRun: #NewTestCase #testError'.

! !

!LogChangesTest methodsFor: 'tests' stamp: 'MGD 5/23/2019 10:49:42'!
test10AddingATestClassShouldBeLogged
	" Log format expected:

	!!classDefinition: #ClassName category: #'Category' stamp: changeStamp!!
	Object subclass: #ClassName
		instanceVariableNames: '...'
		classVariableNames: '...'
		poolDictionaries: '....'
		category: 'Category'!!
	"
	| newClass |
	[
		newClass := TestCase subclass: #NewClass instanceVariableNames: '' classVariableNames: '' poolDictionaries: '' category: 'Tests-Changes'.

		self assertIsLoggedOnce: '!!classDefinition: #NewClass category: #''Tests-Changes'' stamp:'.
		self assertIsLoggedOnce: newClass definition.
	] ensure: [
		newClass removeFromSystem
	]

! !

!ScanChangesTest methodsFor: 'tests' stamp: 'MGD 1/18/2019 20:45:17'!
scanChangesFromFile
	| fileStream changeList |

	fileStream := self changesFileForTests asFileEntry readStream.
	changeList := ChangeList new scanFile: fileStream from: 0 to: fileStream size.

	^ changeList changeList.
! !

!ScanChangesTest methodsFor: 'tests' stamp: 'MGD 2/4/2019 17:21:33'!
setUp

	super setUp.
	mockClass := Object subclass: #TestClass instanceVariableNames: '' classVariableNames: '' poolDictionaries: '' category: 'Tests-Changes'.
! !

!ScanChangesTest methodsFor: 'tests' stamp: 'MGD 2/4/2019 17:21:58'!
tearDown

	super tearDown.
	mockClass removeFromSystem.! !

!ScanChangesTest methodsFor: 'tests' stamp: 'MGD 5/23/2019 09:06:54'!
test01ScanNewClassChange
	| newClass newClassChange |
	[
		newClass := Object subclass: #NewClass instanceVariableNames: '' classVariableNames: '' poolDictionaries: '' category: 'Tests-Changes'.

		newClassChange := self scanChangesFromFile last.

		self assert: newClassChange changeType equals: #classDefinition.
		self assert: newClassChange changeClass equals: newClass.
		self deny: newClassChange stamp isNil.
		self deny: newClassChange isTestClassChange.
	] ensure: [
		newClass removeFromSystem
	]
! !

!ScanChangesTest methodsFor: 'tests' stamp: 'HAW 10/28/2019 09:49:52'!
test02ScanNewMethodChange
	| newMethodChange |

	mockClass compile: 'm1 ^ 1' classified: 'a-category'.

	newMethodChange := self scanChangesFromFile last.

	self assert: newMethodChange changeType equals: #method.
	self assert: newMethodChange methodSelector equals: #m1.
	self assert: newMethodChange changeClass equals: mockClass.
	self assert: newMethodChange prior isNil.
	self deny: newMethodChange stamp isNil.
! !

!ScanChangesTest methodsFor: 'tests' stamp: 'HAW 10/28/2019 09:49:57'!
test03ScanMethodModifiedChange
	| methodModifiedChange |

	mockClass compile: 'm1 ^ 1' classified: 'a-category'.
	mockClass compile: 'm1 ^ 2' classified: 'a-category'.

	methodModifiedChange := self scanChangesFromFile last.

	self assert: methodModifiedChange changeType equals: #method.
	self assert: methodModifiedChange methodSelector equals: #m1.
	self assert: methodModifiedChange changeClass equals: mockClass.
	self deny: methodModifiedChange prior isNil.
	self deny: methodModifiedChange stamp isNil.
! !

!ScanChangesTest methodsFor: 'tests' stamp: 'MGD 5/23/2019 09:32:29'!
test04ScanMethodRemovalChange
	| methodRemovalChange |

	mockClass compile: 'm1 ^ 1' classified: 'a-category'.
	mockClass removeSelector: #m1.

	methodRemovalChange := self scanChangesFromFile last.

	self assert: methodRemovalChange isMethodDeletion.
	self assert: methodRemovalChange methodSelector equals: #m1.
	self deny: methodRemovalChange stamp isNil.
! !

!ScanChangesTest methodsFor: 'tests' stamp: 'MGD 10/1/2019 20:30:52'!
test05ScanClassRemovalChange
	| classRemovalChange |

	mockClass removeFromSystem.

	classRemovalChange := self scanChangesFromFile last.

	self assert: classRemovalChange changeType equals: #classRemoval.
	self assert: classRemovalChange changeClassName equals: #TestClass.
	self assert: classRemovalChange isClassDeletion.
	self deny: classRemovalChange stamp isNil.

! !

!ScanChangesTest methodsFor: 'tests' stamp: 'MGD 9/3/2019 11:59:20'!
test06ScanPassingTestChange
	| testRunChange |

	testClass run: #testPassed.

	testRunChange := self scanChangesFromFile last.

	self assert: testRunChange changeType equals: #testRun.
	self assert: testRunChange changeClassName equals: #NewTestCase.
	self assert: testRunChange methodSelector equals: #testPassed.
	self assert: testRunChange isPassed.
	self deny: testRunChange stamp isNil.! !

!ScanChangesTest methodsFor: 'tests' stamp: 'MGD 9/3/2019 11:59:25'!
test07ScanFailedTestChange
	| testRunChange |

	testClass run: #testFailure.

	testRunChange := self scanChangesFromFile last.

	self assert: testRunChange changeType equals: #testRun.
	self assert: testRunChange changeClassName equals: #NewTestCase.
	self assert: testRunChange methodSelector equals: #testFailure.
	self assert: testRunChange isFailure.! !

!ScanChangesTest methodsFor: 'tests' stamp: 'MGD 5/23/2019 10:44:17'!
test08ScanNewTestClass
	| newClass newClassChange |
	[
		newClass := TestCase subclass: #NewClass instanceVariableNames: '' classVariableNames: '' poolDictionaries: '' category: 'Tests-Changes'.

		newClassChange := self scanChangesFromFile last.

		self assert: newClassChange changeType equals: #classDefinition.
		self assert: newClassChange changeClassName equals: #NewClass.
		self assert: newClassChange changeClass equals: newClass.
		self assert: newClassChange isTestClassChange.
		self deny: newClassChange stamp isNil.
	] ensure: [
		newClass removeFromSystem
	]
! !

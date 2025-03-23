'From Cuis 6.0 [latest update: #5462] on 20 August 2022 at 7:40:06 pm'!
'Description System organization refactoring'!
!provides: 'SystemCategoryAutoSaving' 1 1!
SystemOrganization addCategory: 'SystemCategoryAutoSaving'!


!classDefinition: #SystemCategoryAutoSaver category: 'SystemCategoryAutoSaving'!
Object subclass: #SystemCategoryAutoSaver
	instanceVariableNames: 'categoryName delay activated targetDirectory savingStrategy'
	classVariableNames: 'AutosavedCategories'
	poolDictionaries: ''
	category: 'SystemCategoryAutoSaving'!
!classDefinition: 'SystemCategoryAutoSaver class' category: 'SystemCategoryAutoSaving'!
SystemCategoryAutoSaver class
	instanceVariableNames: ''!

!classDefinition: #MultiFileSystemCategoryAutoSaver category: 'SystemCategoryAutoSaving'!
SystemCategoryAutoSaver subclass: #MultiFileSystemCategoryAutoSaver
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SystemCategoryAutoSaving'!
!classDefinition: 'MultiFileSystemCategoryAutoSaver class' category: 'SystemCategoryAutoSaving'!
MultiFileSystemCategoryAutoSaver class
	instanceVariableNames: ''!

!classDefinition: #SingleFileSystemCategoryAutoSaver category: 'SystemCategoryAutoSaving'!
SystemCategoryAutoSaver subclass: #SingleFileSystemCategoryAutoSaver
	instanceVariableNames: 'targetFileName'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SystemCategoryAutoSaving'!
!classDefinition: 'SingleFileSystemCategoryAutoSaver class' category: 'SystemCategoryAutoSaving'!
SingleFileSystemCategoryAutoSaver class
	instanceVariableNames: ''!


!SystemCategoryAutoSaver methodsFor: 'backup' stamp: 'HAW 8/20/2022 19:27:11'!
fileOut: fileStream
	
	| categories |
	
	categories := SystemOrganization withSubCategoriesOf: categoryName.
	categories size = 1 
		ifTrue: [ self fileOutSingleCategoryOn: fileStream]
		ifFalse: [ self fileOutRootCategoryWithAll: categories on: fileStream ]
		! !

!SystemCategoryAutoSaver methodsFor: 'backup' stamp: 'HAW 8/20/2022 18:41:34'!
fileOutExistingCategory: aCategory on: fileStream

	^ [ SystemOrganization fileOutCategory: aCategory on: fileStream initializing: true ] 
		on: FileWriteError 
		do: [ :writeError | self stopSavingAndInform: writeError ]! !

!SystemCategoryAutoSaver methodsFor: 'backup' stamp: 'HAW 8/20/2022 19:05:23'!
fileOutRootCategoryWithAll: categories on: fileStream

	"I assume that categories will not be removed while saving... - Hernan"
	
	categories do: [ :aCategory | self fileOutExistingCategory: aCategory on: fileStream ].! !

!SystemCategoryAutoSaver methodsFor: 'backup' stamp: 'HAW 8/20/2022 18:42:58'!
fileOutSingleCategoryOn: fileStream

	^ (SystemOrganization hasCategory: categoryName) 
		ifTrue: [ self fileOutExistingCategory: categoryName on: fileStream ]
		ifFalse: [ self class stopAndRemoveAutosaverFor: categoryName ]! !

!SystemCategoryAutoSaver methodsFor: 'backup' stamp: 'HAW 7/22/2022 15:55:46'!
informWriteError: error

	| userErrorDescription |
	
	userErrorDescription := String streamContents: [ :stream |
		stream
			nextPutAll: 'Could not save ';
			nextPutAll: categoryName;
			nextPutAll: ' due to: ';
			newLine;
			nextPutAll: error messageText;
			newLine;
			nextPutAll: 'Category is not being saved anymore'. ].

	self inform: userErrorDescription! !

!SystemCategoryAutoSaver methodsFor: 'backup' stamp: 'HAW 7/23/2022 18:54:51'!
notUsedFileEntryFrom: anInitialFileName extension: anInitialFileNameExtension  

	| version newBackupFileEntry newName |
	
	version := 0.
	
	[ version := version + 1.
	newName := anInitialFileName , '-', version printString, '.', anInitialFileNameExtension.
	newBackupFileEntry := targetDirectory // newName.
	newBackupFileEntry exists ] whileTrue.

	^ newBackupFileEntry ! !

!SystemCategoryAutoSaver methodsFor: 'backup' stamp: 'HAW 7/23/2022 18:55:27'!
saveBackup

	| backupFileEntry fileName |
	
	fileName := self fileName.
	backupFileEntry := targetDirectory // fileName.
	self shouldDeletePreviousBackup ifTrue: [ targetDirectory removeKey: fileName ifAbsent: [] ].
	
	[ backupFileEntry writeStreamDo: [ :fileStream | self fileOut: fileStream ]]
		on: FileExistsException 
		do: [ :exception | 
			"If current backup file exists, I do not remove it but try with a new file name with a version number,
			even if previous backup should be deleted. This is to avoid loosing files - Hernan"
			backupFileEntry := self notUsedFileEntryFrom: backupFileEntry nameWithoutExtension extension: backupFileEntry extension.
			exception retry ].
			! !

!SystemCategoryAutoSaver methodsFor: 'backup' stamp: 'HAW 7/22/2022 15:57:08'!
stopSavingAndInform: aWriteError

	"It is cuestionable to show the error because the user can be doing other things... but it is better than not
	giving any feedback and let the user beleive it is still saving - Hernan"
	
	self class stopAndRemoveAutosaverFor: categoryName.
	self informWriteError: aWriteError! !

!SystemCategoryAutoSaver methodsFor: 'initialization' stamp: 'HAW 7/23/2022 18:45:08'!
backupDirectoryName

	^ 'autosave-', categoryName asFileName ! !

!SystemCategoryAutoSaver methodsFor: 'initialization' stamp: 'AEC 7/15/2022 21:23:15'!
initializeFor: aCategoryName with: aNumberOfSeconds

	categoryName := aCategoryName.
	delay := Delay forSeconds: aNumberOfSeconds.
	activated := false.
	self initializeTargetDirectory.! !

!SystemCategoryAutoSaver methodsFor: 'initialization' stamp: 'HAW 7/22/2022 17:03:41'!
initializeTargetDirectory

	targetDirectory := DirectoryEntry smalltalkImageDirectory / self backupDirectoryName.! !

!SystemCategoryAutoSaver methodsFor: 'start/stop' stamp: 'HAW 7/22/2022 14:52:56'!
saveLoop

	[activated] whileTrue:[ 
		self saveBackup.
		delay wait ]! !

!SystemCategoryAutoSaver methodsFor: 'start/stop' stamp: 'HAW 7/22/2022 15:42:44'!
start
	
	activated := true.
	
	[self saveLoop] forkAt: Processor userBackgroundPriority named: categoryName, ' autosave'
! !

!SystemCategoryAutoSaver methodsFor: 'start/stop' stamp: 'AEC 7/16/2022 01:17:12'!
stop
	
	activated := false.
	delay unschedule ! !

!SystemCategoryAutoSaver methodsFor: 'file' stamp: 'HAW 7/23/2022 18:45:53'!
fileName
			
	self subclassResponsibility ! !

!SystemCategoryAutoSaver methodsFor: 'file' stamp: 'HAW 7/23/2022 18:34:26'!
shouldDeletePreviousBackup
	
	self subclassResponsibility ! !

!SystemCategoryAutoSaver class methodsFor: 'accesing' stamp: 'HAW 7/23/2022 18:46:58'!
hasAutosaverFor: aCategoryName

	^AutosavedCategories includesKey: aCategoryName ! !

!SystemCategoryAutoSaver class methodsFor: 'action' stamp: 'HAW 7/23/2022 18:48:27'!
stopAndRemoveAutosaverFor: aCategoryName

	(AutosavedCategories removeKey: aCategoryName) stop.
	! !

!SystemCategoryAutoSaver class methodsFor: 'initialization' stamp: 'HAW 7/23/2022 18:47:03'!
initialize

	AutosavedCategories := Dictionary new.! !

!SystemCategoryAutoSaver class methodsFor: 'instance creation' stamp: 'HAW 7/23/2022 18:42:42'!
for: aCategoryName withDelayOf: aNumberOfSeconds
	
	self assertIsValidDelay: aNumberOfSeconds.
	
	^self new initializeFor: aCategoryName with: aNumberOfSeconds.
	! !

!SystemCategoryAutoSaver class methodsFor: 'instance creation' stamp: 'HAW 7/23/2022 18:47:11'!
startFor: aCategoryName withDelayOf: aNumberOfSeconds

	| newInstance |
	
	newInstance := self for: aCategoryName withDelayOf: aNumberOfSeconds.
	AutosavedCategories at: aCategoryName put: newInstance.
	newInstance start.
	
	^newInstance! !

!SystemCategoryAutoSaver class methodsFor: 'browser menues' stamp: 'HAW 7/22/2022 15:33:51'!
menuDescription

	self subclassResponsibility! !

!SystemCategoryAutoSaver class methodsFor: 'browser menues' stamp: 'HAW 7/23/2022 17:53:46'!
systemCategoryMenuOptions

	^{ 
		{
				#itemGroup 		-> 		30.
				#itemOrder 		-> 		15.
				#label 			-> 	 #systemCategoryAutosaveMenuLabel.
				#object 			-> 		#model.
				#selector 		-> 		#toggleSystemCategoryAutosave.
				#icon 			-> 		#fileOutIcon
			} asDictionary.
		}! !

!SystemCategoryAutoSaver class methodsFor: 'assertions' stamp: 'HAW 7/23/2022 18:42:42'!
assertIsValidDelay: aNumberOfSeconds

	^ aNumberOfSeconds < 1 ifTrue: [ self error: 'Number of seconds must be greather or equal to 1' ]! !

!MultiFileSystemCategoryAutoSaver methodsFor: 'file' stamp: 'HAW 7/23/2022 18:56:13'!
fileName

	^String streamContents: [ :stream |
		stream 
			nextPutAll: categoryName asFileName;
			nextPutAll: '-autosave-';
			nextPutAll: DateAndTime now printStringWithoutOffset asFileName;
			nextPutAll: '.st' ]
! !

!MultiFileSystemCategoryAutoSaver methodsFor: 'file' stamp: 'HAW 7/23/2022 18:35:26'!
shouldDeletePreviousBackup
	
	^false! !

!MultiFileSystemCategoryAutoSaver class methodsFor: 'browser menues' stamp: 'HAW 7/22/2022 15:34:28'!
menuDescription

	^'Versioning'! !

!SingleFileSystemCategoryAutoSaver methodsFor: 'initialization' stamp: 'AEC 7/9/2022 19:52:15'!
initializeFor: aCategoryName with: aNumberOfSeconds

	super initializeFor: aCategoryName with: aNumberOfSeconds.
	
	targetFileName := categoryName asFileName,'-autosave','.st'.! !

!SingleFileSystemCategoryAutoSaver methodsFor: 'file' stamp: 'HAW 7/23/2022 18:45:53'!
fileName

	^ targetFileName! !

!SingleFileSystemCategoryAutoSaver methodsFor: 'file' stamp: 'HAW 7/23/2022 18:35:51'!
shouldDeletePreviousBackup
	
	^true! !

!SingleFileSystemCategoryAutoSaver class methodsFor: 'browser menues' stamp: 'HAW 7/22/2022 15:34:39'!
menuDescription

	^'Single file'! !

!Browser methodsFor: '*SystemCategoryAutoSaving' stamp: 'HAW 7/23/2022 17:51:42'!
askAutosaveTypeIfCancelled: aBlock

	| menuIndex options labels |

	options := {SingleFileSystemCategoryAutoSaver. MultiFileSystemCategoryAutoSaver}.
	labels := options collect: [ :autoSaverClass | autoSaverClass menuDescription].
	menuIndex := (PopUpMenu labelArray: labels) startUpWithCaption: 'Autosave Type'.
	
	^ menuIndex = 0
		ifTrue: [ aBlock value ]
		ifFalse: [ options at: menuIndex ]
	! !

!Browser methodsFor: '*SystemCategoryAutoSaving' stamp: 'HAW 7/22/2022 15:35:17'!
autosaveCategory

	| autosaveSubclass |
	
	autosaveSubclass := self askAutosaveTypeIfCancelled: [ ^self ].
		
	self
		request: 'Autosave interval (in seconds)'
		initialAnswer: '60'
		verifying: [:aString| aString size > 0 and: [aString allSatisfy: [:each| each isDigit]]]
		do: [	:interval | 
			autosaveSubclass startFor: selectedSystemCategory withDelayOf: interval asNumber.
			PopUpMenu inform: 'Autosaver started.' ]
! !

!Browser methodsFor: '*SystemCategoryAutoSaving' stamp: 'HAW 7/23/2022 17:51:16'!
stopAutosave

	SystemCategoryAutoSaver stopAndRemoveAutosaverFor: selectedSystemCategory.
	self inform: 'Autosaver stopped.'! !

!Browser methodsFor: '*SystemCategoryAutoSaving' stamp: 'HAW 7/23/2022 18:57:02'!
systemCategoryAutosaveMenuLabel
	
	^(SystemCategoryAutoSaver hasAutosaverFor: self selectedSystemCategory)
		ifTrue: [ 'stop autosave' ]
		ifFalse: [ 'start autosave' ]! !

!Browser methodsFor: '*SystemCategoryAutoSaving' stamp: 'HAW 7/23/2022 17:53:46'!
toggleSystemCategoryAutosave
	
	(SystemCategoryAutoSaver hasAutosaverFor: selectedSystemCategory) 
		ifTrue: [ self stopAutosave ]
		ifFalse: [ self autosaveCategory ]! !
SystemCategoryAutoSaver initialize!

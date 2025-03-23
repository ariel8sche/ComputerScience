'From Cuis6.3 [latest update: #6200] on 29 January 2024 at 4:16:00 pm'!
'Description An aid for solving anagrams with different behavior for short and long anagrams. With a long anagram, random re-arrangements are listed as clues. One may remove letters and study the remainder. Removed letters can be returned. Short anagrams produce a list of permutations.'!
!provides: 'AnagramAid' 1 34!
SystemOrganization addCategory: #AnagramAid!


!classDefinition: #Anagram category: #AnagramAid!
TextModel subclass: #Anagram
	instanceVariableNames: 'clues cluesFont count jmb omitted'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AnagramAid'!
!classDefinition: 'Anagram class' category: #AnagramAid!
Anagram class
	instanceVariableNames: ''!

!classDefinition: #AnagramMorph category: #AnagramAid!
SystemWindow subclass: #AnagramMorph
	instanceVariableNames: 'buttonPane statusString cluesString cluesMorph'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AnagramAid'!
!classDefinition: 'AnagramMorph class' category: #AnagramAid!
AnagramMorph class
	instanceVariableNames: ''!


!Anagram commentStamp: '<historical>' prior: 0!
Model for Anagram Aid!

!AnagramMorph commentStamp: '<historical>' prior: 0!
An aid for solving anagrams with different behavior for short and long anagrams. 

AnagramMorph open.

With a long anagram, random re-arrangements are listed as clues. One may remove letters and study the remainder. Removed letters can be returned. Short anagrams produce a list of permutations.

The setting which determines whether clues are random or permuted is in Anagram class>>permuteLimit.!

!Anagram methodsFor: 'operating' stamp: 'dhn 6/6/2020 19:42:02'!
atRandom
	"Answer randomly selected clues"
	| set str |
	
	set _ Set new.
	self class cluesToDisplay timesRepeat: [set add: jmb shuffled].  "set avoids duplicates"
	str _ String new writeStream.
	set do: [:ea |
		str
			nextPutAll: ea;
			nextPutAll: self separators].
	count _ count + set size.
	^ str contents! !

!Anagram methodsFor: 'operating' stamp: 'dhn 6/9/2020 13:15:47'!
configureButtons
	"Answer the buttons to show based on the sizes of #jmb and #omitted"

	^ self jmb size > self class permuteLimit
		ifTrue: [
			self omitted size isZero
				ifTrue: [ {self newButton. self moreButton. self withoutButton} ]
				ifFalse: [ {self newButton. self moreButton. self withoutButton. self revertButton} ]]
		ifFalse: [
			self omitted size isZero
				ifTrue: [ {self newButton} ]
				ifFalse: [ {self newButton. self withoutButton. self revertButton} ]].! !

!Anagram methodsFor: 'operating' stamp: 'dhn 6/7/2020 21:05:46'!
entry
	"Acquire a new anagram"
	| ans |
	
	ans _ StringRequestMorph
		request: 'Enter the Anagram'
		initialAnswer: ''.
	ans isEmpty ifFalse: [
		jmb _ (ans copyWithout: $ ) asUppercase.
		count _ 0.
		omitted _ String new.
		self more].
	self triggerEvent: #update! !

!Anagram methodsFor: 'operating' stamp: 'jmv 1/29/2024 16:15:41'!
letterCount: aString
	"Answer a print string showing the number of times letters appear in aString"
	| col dix sorted str |

	col := OrderedCollection new.
	aString asByteArray sort do: [:byte | col addLast: (Character codePoint: byte)].
	dix := Dictionary new.
	col do: [ :ea | | sym |
		sym := ea asSymbol.
		(dix includesKey: sym)
			ifTrue: [dix at: sym put: (dix at: sym) + 1]
			ifFalse: [dix at: sym	put: 1]].
	str := String new writeStream newLine.
	sorted := dix keys asSortedCollection.
	sorted do: [ :char |
		str nextPutAll: char printString;
			nextPutAll: '->';
			nextPutAll: (dix at: char) printString; space].
	^ str contents.! !

!Anagram methodsFor: 'operating' stamp: 'dhn 8/30/2015 13:25'!
lettersOmitted
	"Answer a print string showing the letters omitted from the anagram"
	| str |
	str _ String new writeStream.
	omitted isEmpty 
		ifTrue: [^ '']
		ifFalse: [
			str
				nextPutAll: 'Without: ';
				nextPutAll: omitted; newLine.
			^ str contents]! !

!Anagram methodsFor: 'operating' stamp: 'dhn 6/7/2020 20:58:38'!
more
	"Display the next set of clues, either at random or permuted"
	
	clues _ jmb size > self class permuteLimit
		ifTrue: [ self atRandom ]
		ifFalse: [ self permuted ].
	self triggerEvent: #update! !

!Anagram methodsFor: 'operating' stamp: 'dhn 6/7/2020 20:56:11'!
permuted
	"Display a set of permuted clues"
	| set clue str |
	
	clue _ String new writeStream.
	set _ Set new.
	(1 to: jmb size) permutationsDo: [ :letter |
		clue reset.
		(1 to: jmb size) do: [ :ix |
			clue nextPut: (jmb at: (letter at: ix))].
		set add: clue contents].  "set avoids duplicates"
	str _ String new writeStream.
	set do: [:ea |
		str
			nextPutAll: ea;
			nextPutAll: self separators].
	count _ count + set size.
	^ str contents! !

!Anagram methodsFor: 'operating' stamp: 'dhn 8/30/2015 13:25'!
revert
	"Return the omitted characters to the anagram"
	jmb _ jmb , omitted.
	omitted _ String new.
	self configureButtons.
	self more! !

!Anagram methodsFor: 'operating' stamp: 'dhn 8/26/2015 13:40'!
separators
	"Answer the string which separates the clues"
	^ '  '! !

!Anagram methodsFor: 'operating' stamp: 'dhn 6/6/2020 22:02:15'!
showStatistics
	"Answer text for  the status area"

	^ String streamContents: [:string |
		string
			nextPutAll: self lettersOmitted;
			nextPutAll: 'Number of clues so far = ';
			nextPutAll: count asString;
			newLine;
			nextPutAll: 'characters = ';
			nextPutAll: jmb size asString;
			nextPutAll: (self letterCount: jmb);
			newLine]! !

!Anagram methodsFor: 'operating' stamp: 'dhn 6/7/2020 20:56:46'!
without
	"Remove letters, if specified, from the anagram and produce more clues"
	| col what str |
	
	what _ StringRequestMorph
		request: 'Enter the letters to be omitted.'
		initialAnswer: ''.
	what isEmpty ifFalse: [
		col _ jmb asOrderedCollection.
		(what copyWithout: $ ) asUppercase asOrderedCollection do: [ :ea |
			(col includes: ea) ifTrue: [
				col remove: ea.
				omitted _ omitted, ea asString]].
		str _ String new writeStream.
		col do: [ :remainingLetter |
			str nextPut: remainingLetter].
		jmb _ str contents.
		self
			more;
			configureButtons].
		self triggerEvent: #update! !

!Anagram methodsFor: 'accessing' stamp: 'dhn 6/7/2020 21:23:12'!
clues
	"Answer the value of clues"
	
	^ clues ifNil: [clues _ '']! !

!Anagram methodsFor: 'accessing' stamp: 'dhn 6/7/2020 21:23:38'!
jmb
	"Answer the value of jmb"
	
	^ jmb ifNil: [jmb _ '']! !

!Anagram methodsFor: 'accessing' stamp: 'dhn 6/7/2020 21:24:07'!
omitted
	"Answer the value of omitted"
	
	^ omitted ifNil: [omitted _ '']! !

!Anagram methodsFor: 'initialization' stamp: 'dhn 6/7/2020 21:09:57'!
initialize
	super initialize! !

!Anagram methodsFor: 'initialization' stamp: 'dhn 1/26/2015 18:16'!
moreButton
	"Answer the More button"
	^ PluggableButtonMorph new
		model: self;
		label: 'More';
		action: #more;
		color: Color white;
		setBalloonText: 'Displays additional
letter combinations.'.! !

!Anagram methodsFor: 'initialization' stamp: 'dhn 1/30/2015 09:17'!
newButton
	"Answer the New button"
	^ PluggableButtonMorph new
		model: self;
		label: 'New';
		action: #entry;
		color: Color white;
		setBalloonText: 'Asks for letters of a new anagram,
then displays different combinations of those letters.'.! !

!Anagram methodsFor: 'initialization' stamp: 'dhn 1/26/2015 18:15'!
revertButton
	"Answer the Revert button"
	^ PluggableButtonMorph new
		model: self;
		label: 'Revert';
		action: #revert;
		color: Color white;
		setBalloonText: 'Re-inserts removed characters,
then displays the original set.'.! !

!Anagram methodsFor: 'initialization' stamp: 'dhn 1/26/2015 18:14'!
withoutButton
	"Answer the Without button"
	^ PluggableButtonMorph new
		model: self;
		label: 'Without';
		action: #without;
		color: Color white;
		setBalloonText: 'Removes characters,
then re-displays what is left.'.! !

!Anagram class methodsFor: 'initialization' stamp: 'dhn 3/3/2015 14:37'!
cluesToDisplay
	"Answer the number of clues to display at one time for large anagrams"
	^ 100! !

!Anagram class methodsFor: 'initialization' stamp: 'dhn 1/26/2015 16:24'!
permuteLimit
	"Answer the maximum size of the anagram which will be permuted"
	^ 5! !

!AnagramMorph methodsFor: 'operating' stamp: 'dhn 6/6/2020 21:27:32'!
cluesFont
	"Answer the font for clues"
	
	^ Preferences standardCodeFont
! !

!AnagramMorph methodsFor: 'operating' stamp: 'dhn 6/7/2020 20:49:01'!
update
	cluesString actualContents: model clues.
	buttonPane 
		removeAllMorphs;
		addAllMorphs: model configureButtons reverse.
	statusString actualContents: model showStatistics! !

!AnagramMorph methodsFor: 'resizing' stamp: 'dhn 8/31/2015 13:16'!
adjustExtentFor: aString
	"Set width of extent  such that clues of aString appear in columns"
	| innerMorph charPixels oldExtent newWidth scrollPixels nl pad clue cols |
	
	innerMorph _ self findDeepSubmorphThat: [:s | s is: #InnerTextMorph] ifAbsent: [^ nil].
	charPixels _ innerMorph textComposition editor lastFont widthOf: $M.		"width per character"
	oldExtent _ self morphExtent.
	
	(innerMorph owner verticalScrollBar valueOfProperty: #visible)
		ifTrue: [scrollPixels _ ScrollBar scrollbarThickness]
		ifFalse: [scrollPixels _ 0].
		
	nl _ charPixels.			"new line width"
	pad _ charPixels * self model separators size.	"padding width"
	clue _ charPixels * aString size.		"clue width"
	
	cols _ ((oldExtent x) + pad - nl - scrollPixels) / (clue + pad).
	cols _ 3 max: cols floor.		"at least 3 columns"
	
	newWidth _ (cols * (clue + pad)) + nl + scrollPixels.
	
	self morphExtent: newWidth @ (oldExtent y).! !

!AnagramMorph methodsFor: 'initialization' stamp: 'dhn 6/6/2020 19:46:39'!
buildMorphicWindow
	"Specify the layout for the Anagram Assistant window"
	| status statusMorph clues |
	
	status _ LayoutMorph newRow
		name: 'status area';
		addMorph: (statusMorph _ TextModelMorph 
			withModel: (statusString _ TextModel withText: 'Status Area')).
	statusMorph 
		name: #status;
		layoutSpec: LayoutSpec useAll.
			
	buttonPane _ LayoutMorph newRow
		name: #buttons;
		axisEdgeWeight: #center;
		doAdoptWidgetsColor.
	
	clues _ LayoutMorph newRow
		name: 'clue area';
		addMorph: (cluesMorph _ TextModelMorph 
			withModel: (cluesString _ TextModel withText: 'Clues Area')).
	cluesMorph 
		name: #clues;
		layoutSpec: LayoutSpec useAll.

			
	statusMorph askBeforeDiscardingEdits: false;
		wrapFlag: true.
			
	cluesMorph askBeforeDiscardingEdits: false;
		wrapFlag: true.
		
	self layoutMorph
			addMorph: status proportionalHeight: 0.15; 	
			addMorph: buttonPane fixedHeight: 26;		
			addMorph: clues proportionalHeight: 1.0.
			
	model when: #update send: #update to: self.
! !

!AnagramMorph methodsFor: 'initialization' stamp: 'dhn 8/25/2015 17:18'!
initialize
	super initialize! !

!AnagramMorph methodsFor: 'accessing' stamp: 'dhn 6/6/2020 18:20:21'!
buttonPane
	^ buttonPane! !

!AnagramMorph class methodsFor: 'initialization' stamp: 'dhn 1/26/2015 18:38'!
buttonWidth
	"Answer button width as a proportion of the width of the containing morph"
	^ 0.2! !

!AnagramMorph class methodsFor: 'initialization' stamp: 'dhn 11/6/2015 13:32'!
how
"
	New morph... or
	AnagramMorph open.
"! !

!AnagramMorph class methodsFor: 'initialization' stamp: 'dhn 11/6/2015 19:03'!
includeInNewMorphMenu
	"Return true for all classes that can be instantiated from the menu"
	^ true! !

!AnagramMorph class methodsFor: 'initialization' stamp: 'dhn 11/6/2015 13:36'!
initializedInstance
	"Enable instantiation from the new morph menu"

	^ self open! !

!AnagramMorph class methodsFor: 'initialization' stamp: 'dhn 6/7/2020 21:11:22'!
open
"
	AnagramMorph open.
"
	| win |

	win _ self open: Anagram new label: 'Anagram Aid'.	.
	win setWindowColor: Color lightGreen.
	win buttonPane addAllMorphs: win model configureButtons.
	^ win! !

!TextComposition methodsFor: '*AnagramAid' stamp: 'dhn 8/26/2015 18:32'!
editor

	^ editor! !

'From Cuis 5.0 of 7 November 2016 [latest update: #3204] on 2 November 2017 at 4:30:04 pm'!
'Description A program to draw names before Christmas. Names are listed in a text file:

name1				"Single"
name2 & name3	"Couples"

See class comment for rules.'!
!provides: 'SecretSanta' 1 8!
!classDefinition: #SecretSanta category: #'SecretSanta-Model'!
Object subclass: #SecretSanta
	instanceVariableNames: 'path pastYears singles spouses names counts runTime'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SecretSanta-Model'!
!classDefinition: 'SecretSanta class' category: #'SecretSanta-Model'!
SecretSanta class
	instanceVariableNames: ''!


!SecretSanta commentStamp: 'dhn 11/2/2017 15:08:59' prior: 0!
This class performs an annual drawing of names, ensuring that certain rules are followed.
A family may decide to draw names at Christmas so that each person can receive one especially nice gift instead of many lesser ones. The tedium of obtaining a good drawing by "pulling names from a hat" inspired this program.

Get started by making a file of names. The name of each single person appears on a separate line. Spouses are entered on a separate line as Spouse1 & Spouse2. You will be asked for the file name when the program runs.

Rules for the Secret Santa name drawing:

Can not draw yourself
Can not draw your spouse (you will give him or her a gift regardless)
Can not have reciprocals (A draws B and B draws A)
Can not be a repeat of the last 3 years

Names can be drawn even if there is no history for "the last 3 years".
The results are appended to the output file as long as you specify to save the drawing results. In this way, history is built up over time.!

!SecretSanta methodsFor: 'output' stamp: 'dhn 3/8/2015 20:13'!
display: anObject
	"Show the results of the name drawing in a window"
	| window |
	window _ Workspace new 
		contents: anObject;
		openLabel: 'Santa Drawing'! !

!SecretSanta methodsFor: 'operation' stamp: 'dhn 3/8/2015 20:31'!
drawNames
	"Match each name in a list with another while following rules"
	| currentDraw result iter out |
	result _ false.
	iter _ 0.
	runTime _ Time
				millisecondsToRun: [
					[result]	whileFalse: [
						1000000 < (iter _ iter + 1) ifTrue: [
							(PopUpMenu labelArray: #(
								'More names are needed in order to have a successful drawing.' 'OK')) 
								startUpWithCaption: iter printStringWithCommas, ' Attempts'.
								result _ true].
						currentDraw _ names shuffled.
							(self notYou: currentDraw)
								ifTrue: [(self notSpouse: currentDraw)
										ifTrue: [(self notReciprocal: currentDraw)
												ifTrue: [(self notPastYears: currentDraw)
														ifTrue: [result _ true]]
												ifFalse: [self tally: 3]]
										ifFalse: [self tally: 2]]
								ifFalse: [self tally: 1]]].
	self display: (out _ self report: names drew: currentDraw), self stats.
	self saveResults: out.
! !

!SecretSanta methodsFor: 'operation' stamp: 'dhn 10/31/2015 14:40'!
drawingFrom: aStream
	"Answer the drawing results from aStream"
	| line dx widgits |

	dx _ Dictionary new.
	[aStream atEnd not]
	whileTrue: [
		line _ aStream nextLine.
		line size >= 6
			ifTrue: [
				(line copyFrom: 1 to: 2) ~= '=='
					ifTrue: [
						widgits _ self parseLine: line.
						dx at: widgits key put: widgits value]
					ifFalse: [^ dx]].
		].
	^ dx
! !

!SecretSanta methodsFor: 'initialization' stamp: 'dhn 11/6/2016 13:29:24'!
initialize
	| str lines yr |
	super initialize.
	
	path _ (FillInTheBlankMorph
		request: 'Directory?'
		initialAnswer: 'c:\dir\etc\'
		centerAt: Display center
		onCancelReturn: ''
		acceptOnCR: true).
		
	str _ String with: Character lf with: Character cr.
	lines _ (path asDirectoryEntry at: self class in, '.txt') findTokens: str asString keep: ''.
	self parseNames: lines.
	
	counts _ {0. 0. 0. 0. 0. 0.}.
	(names _ self namesList)
		ifNotEmpty: [
			yr _ (FillInTheBlankMorph
				request: 'Up to 3 years beginning with...'
				initialAnswer: 'yyyy'
				centerAt: Display center
				onCancelReturn: ''
				acceptOnCR: true) asNumber.
			pastYears _ self yearsFrom: yr  to: yr +2.
			self drawNames]
		ifEmpty: [PopUpMenu inform: 'There can be no drawing
without a list of names.'].
! !

!SecretSanta methodsFor: 'initialization' stamp: 'dhn 3/8/2015 16:08'!
namesList
	"Answer the names of participants, ensuring no duplication"
	^ (Set new
		addAll: singles ;
		addAll: spouses asSet;
		yourself) asOrderedCollection
! !

!SecretSanta methodsFor: 'operation' stamp: 'dhn 10/29/2015 18:40'!
notPastYears: aCollection
	"Answer true if for each name, the corresponding name in aCollection is not the same as in as many as 3 prior years; otherwise, answer false"
	| dx |
	1 to: pastYears size do: [:iy | 
		(dx _ pastYears at: iy)
			ifNotNil: [
				1 to: names size do: [:ix | 
					(dx at: (names at: ix ifAbsent: []) ifAbsent: []) = (aCollection at: ix)
						ifTrue: [self tally: 3 + iy.
							^ false]]]].
	^ true! !

!SecretSanta methodsFor: 'operation' stamp: 'dhn 3/8/2015 16:09'!
notReciprocal: aCollection
	"Answer true if none of aCollection result in reciprocal matches; otherwise,
	answer false"
	| drawn1 drawn2 iy |
	1 to: names size do: [:ix | 
		drawn1 _ aCollection at: ix.
		iy _ names indexOf: drawn1.
		drawn2 _ aCollection at: iy.
		(names at: ix) = drawn2
			ifTrue: [^ false]].
	^ true! !

!SecretSanta methodsFor: 'operation' stamp: 'dhn 3/8/2015 16:09'!
notSpouse: aCollection 
	"Answer true if no names in aCollection match a spouse; otherwise,
	answer false"
	| drawn other |
	1 to: names size do: [:ix | 
		drawn _ aCollection at: ix.
		other _ spouses at: drawn ifAbsent: ['no one'].
		(names at: ix) = other ifTrue: [^ false]].
	^ true! !

!SecretSanta methodsFor: 'operation' stamp: 'dhn 3/8/2015 16:09'!
notYou: aCollection 
	"Answer true if for each name, the corresponding name in aCollection is not the same; otherwise, answer false"
	1 to: names size do: [:ix | 
		(names at: ix) ~= (aCollection at: ix)
			ifFalse: [^ false]].
	^ true! !

!SecretSanta methodsFor: 'initialization' stamp: 'dhn 10/29/2015 12:56'!
parseLine: aString
	"Answer an association of Santa -> recipient parsed from aString"
	| ix santa kid |
	
	ix _ aString indexOf: $>.
	santa _ (aString copyFrom: 1 to: ix - 1) withBlanksTrimmed asLowercase capitalized.
	kid _ (aString copyFrom: ix + 6 to: aString size) withBlanksTrimmed asLowercase capitalized.
	^ (santa -> kid)
	! !

!SecretSanta methodsFor: 'initialization' stamp: 'dhn 10/28/2015 18:24'!
parseNames: anArray
	"Set the singles and spouses from names in anArray"
	| ones |
	ones _ OrderedCollection new.
	spouses _ Dictionary new.
	anArray do: [:ea | | ix single spouse1 spouse2 |
		ix _ ea indexOf: $& ifAbsent: [0].
		ix = 0 
			ifTrue: [
				single _ ea withBlanksCondensed.
				single notEmpty ifTrue: [ones add: single]]
			ifFalse: [
				spouse1 _ (ea copyFrom: 1 to: ix - 1) withBlanksCondensed.
				spouse2 _ (ea copyFrom: ix + 1 to: ea size) withBlanksCondensed.
				spouses at: spouse1 put: spouse2.
				spouses at: spouse2 put: spouse1]].
	singles _ ones asArray
! !

!SecretSanta methodsFor: 'output' stamp: 'dhn 10/30/2015 21:34'!
report: who drew: aList
	"Answer the results of the name drawing"
	| str |
	str _ String new writeStream.
	str	
		newLine;
		nextPutAll: '==', self thisYear, '=='.
	1 to: who size do: [:ix | 
		str 
			newLine;
			nextPutAll: (who at: ix), '  >drew>  ', (aList at: ix)].
	^ str contents
! !

!SecretSanta methodsFor: 'output' stamp: 'dhn 1/24/2016 20:49'!
saveResults: aString
	"Optionally append the results to previous drawings"
	| b file dirEntry fullPath |
	
	file _ self class out, '.txt'.
	b _ PopUpMenu 
		confirm: 'Save results to ', file, '?'
		trueChoice: 'Yes, append to ', file, '.'
		falseChoice: 'No, leave ', file, ' unchanged.'.
	b ifTrue: [
		dirEntry _	path asDirectoryEntry / file.
		fullPath _ dirEntry asString.
		fullPath asFileEntry appendContents: aString]
! !

!SecretSanta methodsFor: 'output' stamp: 'dhn 10/30/2015 17:54'!
stats
	"Answer statistics"
	| str boilerPlate |
	str _ String new writeStream.
	boilerPlate _ ' times someone '.
	str newLine; newLine;
		nextPutAll: (counts at: 1) printString, boilerPlate, 'drew themselves.'; newLine;
		nextPutAll: (counts at: 2) printString, boilerPlate, 'drew their spouse.'; newLine;
		nextPutAll: (counts at: 3) printString, boilerPlate, 'had a reciprocal.'; newLine;
		nextPutAll: (counts at: 4) printString, boilerPlate, 'drew same as 3 years ago.'; newLine;
		nextPutAll: (counts at: 5) printString, boilerPlate, 'drew same as 2 years ago.'; newLine;
		nextPutAll: (counts at: 6) printString, boilerPlate, 'drew same as last year.'; newLine;
		nextPutAll: (counts inject: 0 into: [:a :c | a + c]) printString, ' total iterations.'; newLine;
		nextPutAll: (runTime) printString, ' milliseconds elapsed time.'.
	^ str contents
! !

!SecretSanta methodsFor: 'operation' stamp: 'dhn 3/8/2015 16:16'!
tally: anIndex
	"Add 1 to the counts at anIndex"
	counts at: anIndex
		put: (1 + counts at: anIndex)! !

!SecretSanta methodsFor: 'output' stamp: 'dhn 3/8/2015 19:54'!
thisYear
	"Answer the current year as a string"
	^ (Date today printFormat: #( 3 2 1$/ 1 1)) copyFrom: 1 to: 4
! !

!SecretSanta methodsFor: 'operation' stamp: 'dhn 1/24/2016 21:24'!
yearsFrom: begin to: end
	"Answer a collection of previous drawings"
	| old outFile dirEntry fullPath ios continue line yr yrs |
	
	outFile _ self class out, '.txt'.
	dirEntry _	path asDirectoryEntry / outFile.
	fullPath _ dirEntry asString.
	fullPath asFileEntry assureExistence.
	
	old _ OrderedCollection new.
	ios _ ReadStream on: fullPath fileContents.
	
	yr _ (begin to: end) asOrderedCollection.
	continue _ true.
	
	[continue and: ios atEnd not]
		whileTrue: [
			line _ ios nextLine.
			line size >= 6
				ifTrue: [
				(line copyFrom: 1 to: 2) = '=='
					ifTrue: [
						yrs _ (line copyFrom: 3 to: 6) asNumber.
						yrs > end 	ifTrue: [continue _ false].
						(yr includes: yrs)
							ifTrue: [old add: (self drawingFrom: ios copy)]]]].
	^ old
! !

!SecretSanta class methodsFor: 'documentation' stamp: 'dhn 10/28/2015 17:54'!
howTo
"
	SecretSanta new.
	
	First time: create an input file of participants, then cmd-d on the line above.
	Drawing results will be saved in an output file. This file and the input file will be used in subsequent drawings.
	
"! !

!SecretSanta class methodsFor: 'file names' stamp: 'dhn 10/28/2015 17:56'!
in
	"Answer the name portion (preceeding .txt) of the file of participants"
	
	^ 'SSANTAinput'! !

!SecretSanta class methodsFor: 'file names' stamp: 'dhn 10/28/2015 17:56'!
out
	"Answer the name portion (preceeding .txt) of the file containing prior results"
	
	^ 'SSANTAoutput'! !

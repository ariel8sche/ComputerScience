'From Cuis 6.0 [latest update: #6037] on 11 October 2023 at 7:49:50 am'!
'Description Solitaire Card Games'!
!provides: 'Morphic-Games-Solitaire' 1 134!
!requires: 'Goodies' 1 3 nil!
!requires: 'Cuis-Base' 60 5552 nil!
!requires: 'Graphics-Files-Additional' 1 nil nil!
SystemOrganization addCategory: #'Morphic-Games-Solitaire'!


!classDefinition: #CardTableMorph category: #'Morphic-Games-Solitaire'!
LayoutMorph subclass: #CardTableMorph
	instanceVariableNames: 'undoStack inCardMove goAgain inUndo undoButton saveGameButton winnerText labelLayout labelMorph mutex sizeUnit'
	classVariableNames: 'WinnerText'
	poolDictionaries: ''
	category: 'Morphic-Games-Solitaire'!
!classDefinition: 'CardTableMorph class' category: #'Morphic-Games-Solitaire'!
CardTableMorph class
	instanceVariableNames: ''!

!classDefinition: #FreeCell category: #'Morphic-Games-Solitaire'!
CardTableMorph subclass: #FreeCell
	instanceVariableNames: 'deck spares piles columns'
	classVariableNames: 'ContaineOffset NumColumns NumPiles NumSpares'
	poolDictionaries: ''
	category: 'Morphic-Games-Solitaire'!
!classDefinition: 'FreeCell class' category: #'Morphic-Games-Solitaire'!
FreeCell class
	instanceVariableNames: ''!

!classDefinition: #Klondike category: #'Morphic-Games-Solitaire'!
CardTableMorph subclass: #Klondike
	instanceVariableNames: 'cardDeck deck discards piles columns'
	classVariableNames: 'NumColumns NumPiles'
	poolDictionaries: ''
	category: 'Morphic-Games-Solitaire'!
!classDefinition: 'Klondike class' category: #'Morphic-Games-Solitaire'!
Klondike class
	instanceVariableNames: ''!

!classDefinition: #CardMorph category: #'Morphic-Games-Solitaire'!
ImageMorph subclass: #CardMorph
	instanceVariableNames: 'cardNumber grabPreowner isFaceDown'
	classVariableNames: 'ColorNames DropShadowMorph FaceNames FormsArray SuitNames'
	poolDictionaries: ''
	category: 'Morphic-Games-Solitaire'!
!classDefinition: 'CardMorph class' category: #'Morphic-Games-Solitaire'!
CardMorph class
	instanceVariableNames: ''!

!classDefinition: #CardContainerMorph category: #'Morphic-Games-Solitaire'!
BoxedMorph subclass: #CardContainerMorph
	instanceVariableNames: 'targetTable cardClass'
	classVariableNames: 'ContainerOffset'
	poolDictionaries: ''
	category: 'Morphic-Games-Solitaire'!
!classDefinition: 'CardContainerMorph class' category: #'Morphic-Games-Solitaire'!
CardContainerMorph class
	instanceVariableNames: ''!

!classDefinition: #CardColumnMorph category: #'Morphic-Games-Solitaire'!
CardContainerMorph subclass: #CardColumnMorph
	instanceVariableNames: 'cardsStack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Morphic-Games-Solitaire'!
!classDefinition: 'CardColumnMorph class' category: #'Morphic-Games-Solitaire'!
CardColumnMorph class
	instanceVariableNames: ''!

!classDefinition: #CardDeckMorph category: #'Morphic-Games-Solitaire'!
CardContainerMorph subclass: #CardDeckMorph
	instanceVariableNames: 'cardStack topIsFaceDown'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Morphic-Games-Solitaire'!
!classDefinition: 'CardDeckMorph class' category: #'Morphic-Games-Solitaire'!
CardDeckMorph class
	instanceVariableNames: ''!

!classDefinition: #CardDiscardMorph category: #'Morphic-Games-Solitaire'!
CardContainerMorph subclass: #CardDiscardMorph
	instanceVariableNames: 'cardStack numCardsToShow'
	classVariableNames: 'PixelOverlap'
	poolDictionaries: ''
	category: 'Morphic-Games-Solitaire'!
!classDefinition: 'CardDiscardMorph class' category: #'Morphic-Games-Solitaire'!
CardDiscardMorph class
	instanceVariableNames: ''!

!classDefinition: #CardPileMorph category: #'Morphic-Games-Solitaire'!
CardContainerMorph subclass: #CardPileMorph
	instanceVariableNames: 'cardStack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Morphic-Games-Solitaire'!
!classDefinition: 'CardPileMorph class' category: #'Morphic-Games-Solitaire'!
CardPileMorph class
	instanceVariableNames: ''!

!classDefinition: #CardSpareMorph category: #'Morphic-Games-Solitaire'!
CardContainerMorph subclass: #CardSpareMorph
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Morphic-Games-Solitaire'!
!classDefinition: 'CardSpareMorph class' category: #'Morphic-Games-Solitaire'!
CardSpareMorph class
	instanceVariableNames: ''!

!classDefinition: #CardTests category: #'Morphic-Games-Solitaire'!
TestCase subclass: #CardTests
	instanceVariableNames: 'jackOfClubs aceOfSpades twoOfDiamonds threeOfHearts fiveOfHearts'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Morphic-Games-Solitaire'!
!classDefinition: 'CardTests class' category: #'Morphic-Games-Solitaire'!
CardTests class
	instanceVariableNames: ''!

!classDefinition: #CardDeck category: #'Morphic-Games-Solitaire'!
Object subclass: #CardDeck
	instanceVariableNames: 'cards index seed'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Morphic-Games-Solitaire'!
!classDefinition: 'CardDeck class' category: #'Morphic-Games-Solitaire'!
CardDeck class
	instanceVariableNames: ''!

!classDefinition: #Stack category: #'Morphic-Games-Solitaire'!
Object subclass: #Stack
	instanceVariableNames: 'top valuesArray'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Morphic-Games-Solitaire'!
!classDefinition: 'Stack class' category: #'Morphic-Games-Solitaire'!
Stack class
	instanceVariableNames: ''!


!CardTableMorph commentStamp: '<historical>' prior: 0!
My subclasses implement various Card Games.

See child classes FreeCell and Klondike

Structure:
  undoStack		Stack of undoActions'
  inCardMove	Boolean -- true when animating card moves to Piles.
  moveStart		CardContainer -- Set to start container with hand grab [for undo].
  inUndo			Boolean -- true while undoing.
  winnerText	StringMorph -- random winner text
  lableMorph	StringMorph -- e.g. 'Klondike' or 'FreeCell'
  labelLayout	Container of current label: lableMorph or winnerText
  undoButton  	Button is sometimes disabled
  saveGameButton is sometimes disabled
  sizeUnit		PointSize of original windowTitleFont, used as baseline for fontPreferenceChanged

This class abstracts common actions of its subclasses.!

!FreeCell commentStamp: '<historical>' prior: 0!
I contain and implement a FreeCell Solitare Game.

FreeCell newGame openInWorld.

Structure:
  deck		CardDeck -- A Deck of 52 Cards.
  spares		Array -- 4 CardSpareMorphs
  piles		Array -- 4 CardPileMorphs
  columns	Array -- 8 CardColumnMorphs


The table is layed out into areas for spares, piles, columns, and buttons.

	------------------------------------
	|    spares        piles      |    ==>  piles area   
	------------------------------------
	|                                     |
	|                                     |
	|       columns area       |
	|                                     |
	|                                     |
	------------------------------------
	|      bottons area         |
	------------------------------------
	
	A Spare can hold 0 or 1 cards.
	a Pile builds up a suit in order from Aces.
	a Column shows overlapping dealt cards.
	
!

!Klondike commentStamp: '<historical>' prior: 0!
I contain and implement a Klondike Solitare Game.

Klondike newGame openInWorld.

Structure:
  cardDeck		CardDeck -- Cards for the game.
  deck			CardDeckMorph -- A Deck of 52 Cards
  discards		CardDiscardMorph -- Discards from the deck
  piles			Array -- 4 CardPileMorphs for building up cards in suit
  columns		Array -- 7 CardColumnMorphs

The table is layed out into areas for spares, piles, columns, and buttons.

	------------------------
	|  deck | discards  |  piles area |
	------------------------
	|                                                |
	|                                                |
	|            columns area             |
	|                                                |
	|                                                |
	-----------------------
	|            bottons area             |
	-----------------------
	
	The Discard shows the top 3 cards.
	A Pile builds up a suit in order from Aces.
	A Column shows overlapping dealt cards.
	

!

!CardMorph commentStamp: '<historical>' prior: 0!
CardMorph is an alternate implementation of a PlayingCardMorph.

CardMorph the: #Ace of: #Clubs.
CardMorph the: 3 of: #Hearts.

IVARS:
 cardNumber: 1..52
  grabPreowner: When grabbed from CardContainer, goes back here on drop rejection


Structure:
 SuitNames		Array of Symbol -- #(Clubs Diamonds Hearts Spades)
 ColorNames		Array of Symbol -- #(Red Black)
 FaceNames		Array of Symbol -- #(Ace Two Three ... Ten Jack Queen King)
 FormsArray	Array of Form -- 52 card images + back image

There is a total ordering on cards
	A A A  A 2 2 2 2 3 3   3  3   4   4
	C D H S C D H S C D  H  S   C   D ...
	0 1  2 3 4 5 6  7 8 9 10 11 12 13 ..

The Form for the Three of Hearts is in FormsArray: at 11 (its cardNumber + 1).
See faceNumber and suitNumber instance methods for the math.
This is a 52 card deck (no jokers).
!

!CardContainerMorph commentStamp: '<historical>' prior: 0!
I am the parent of CardContainer classes.


Structure:
 targetTable		CardTable -- My owning (ancestor) table which implements the card game.

Cards are CardMorphs or SVFCardMorphs and are contained in me as submorphs.  My subclasses describe any layout required.

See subclasses: CardDeckMorph, CardSpareMorph, CardColumnMorph and CardPileMorph.!

!CardColumnMorph commentStamp: '<historical>' prior: 0!
I display a Column of overlapping Cards.

aColumn add: aCard.

When a Card is dropped on me, I ask my CardTable if it is a legal move.!

!CardDeckMorph commentStamp: '<historical>' prior: 0!
I contain a Stack of CardMorphs, showing an image of the top one.

Structure:
 cardStack			Stack -- The CardMorphs I contain
 topIsFaceDown		Boolean -- If true, my image is the top card face down else face up.

 Give me cards when initialized or I am empty and display transparent with yellow border.
 I may contain Cards from more than 1 Deck.  Unlike my parent Cards are not my submorphs.
 My top Card canNOT be grabbed/picked up (subclass me if you desire this).
 I do NOT accept card drops.

!

!CardDiscardMorph commentStamp: 'KenD 11/21/2004 13:59' prior: 0!
I contain cards face up to build up piles of cards, showing only the top cardsToShow Cards.

aDiscard add: aCard

Structure:
  cardStack 			Stack -- Cards below the ones I show.
  numCardsToShow	Integer -- number of cards face up on top (1 or more)

You can pick up my topmost card.

Cards not shown are kept in cardStack.!

!CardPileMorph commentStamp: 'KenD 10/22/2004 11:36' prior: 0!
I contain cards face up to build up piles of cards, showing only the top card.

aPile add: aCard

When a Card is dropped on me, I ask my CardTable if it is a legal move.!

!CardSpareMorph commentStamp: 'KenD 10/22/2004 11:23' prior: 0!
I contain zero or one cards.

aSpare add: aCardMorph.

When a Card is dropped on me, I ask my CardTable if it is a legal move.!

!CardTests commentStamp: 'KenD 10/20/2004 09:45' prior: 0!
"Unit tests for CardMorph and related classes"!

!CardDeck commentStamp: 'KenD 10/22/2004 15:00' prior: 0!
I am a 52 Card Deck you can shuffle and deal from.

aDeck shuffle.
aDeck dealACard.

Structure:
 cards		Array -- Array of 52 CardMorphs.
 index		Integer -- Index incremented is next Card to deal.
 seed		Integer -- A random number seed.  Same seed => same shuffle.

Resetting the seed and shuffling will give the same deal.

A Card belongs to only 1 deck.  You can use multiple decks.!

!Stack commentStamp: '<historical>' prior: 0!
Main comment stating the purpose of this class and relevant relationship to other classes.

LIFO Stack.

Structure:
 top				number of elements == size == index of top value.
 valuesArray		array of values

valuesArray grows by doubling; no shrinkage at present.
Initial purpose in life is to support SmallScheme dynamic variables.!

!CardTableMorph methodsFor: 'accessing' stamp: 'KenD 3/9/2015 10:39'!
goAgain
	"When inCardMove, goAgain indicates another checking loop is required"
	
	^ goAgain! !

!CardTableMorph methodsFor: 'accessing' stamp: 'KenD 3/9/2015 10:39'!
goAgain: aBool
	"When inCardMove, goAgain indicates another checking loop is required"
	
	goAgain := aBool! !

!CardTableMorph methodsFor: 'accessing' stamp: 'KenD 11/18/2004 16:57'!
inCardMove

	^inCardMove! !

!CardTableMorph methodsFor: 'accessing' stamp: 'KenD 11/18/2004 16:57'!
inCardMove: aBoolean

	^inCardMove := aBoolean! !

!CardTableMorph methodsFor: 'accessing' stamp: 'KenD 11/18/2004 16:58'!
inUndo

	^inUndo! !

!CardTableMorph methodsFor: 'accessing' stamp: 'KenD 3/22/2015 13:54'!
inUndo: inUndoBool

	inUndoBool 
	ifTrue: [ self undoButton disable ]
	ifFalse:  [ 
		self undoStackIsEmpty
		ifFalse: [ self undoButton enable ]
	].
	^inUndo := inUndoBool! !

!CardTableMorph methodsFor: 'accessing' stamp: 'KenD 10/12/2011 20:40'!
mutex

	^mutex! !

!CardTableMorph methodsFor: 'accessing' stamp: 'KenD 11/18/2004 16:59'!
undoButton
	
	^undoButton! !

!CardTableMorph methodsFor: 'accessing' stamp: 'KenD 11/6/2004 18:41'!
undoStack
	"Private"
	
	^undoStack! !

!CardTableMorph methodsFor: 'accessing' stamp: 'KenD 11/2/2004 13:01'!
undoStackIsEmpty
	
	^undoStack isEmpty! !

!CardTableMorph methodsFor: 'actions' stamp: 'KenD 3/8/2015 19:13'!
dropComplete
	"Subclasses should overried if they want to do something when
	Cards have been dropped."

	^false! !

!CardTableMorph methodsFor: 'actions' stamp: 'KenD 1/21/2011 16:14'!
help

	"Give the user a clue.."

	PopUpMenu inform: self helpText! !

!CardTableMorph methodsFor: 'actions' stamp: 'KenD 10/28/2004 15:10'!
quit
	"Subclasses should override if they need to do housekeeping"

	self owner == self world
		ifTrue: [self delete]
		ifFalse: [self owner delete]! !

!CardTableMorph methodsFor: 'actions' stamp: 'KenD 1/24/2011 04:53'!
removeWinnerText

		saveGameButton enable.
		labelLayout removeAllMorphs;
			            addMorph: labelMorph.
		winnerText := nil! !

!CardTableMorph methodsFor: 'actions' stamp: 'KenD 10/16/2020 16:57:26'!
showWinnerText
	"Display Winner Message to user"
	| widthToFit  pointSizeToUse newText |
	saveGameButton disable. "No use saving a won game"
	newText := CardTableMorph randomWinnerText.
	"Find a point size which fits"
	widthToFit := (labelLayout morphExtent x) - 20.
	pointSizeToUse :=  (FontFamily pointSizesFor: FontFamily defaultFamilyName) reverse 
		detect: [ :ps |  | aFont |
			aFont := FontFamily defaultFamilyPointSize: ps.
			((aFont widthOfString: newText) <= widthToFit)
			and: [aFont lineSpacing <= (labelMorph morphExtent y)]]
		ifNone: [FontFamily defaultFamilyAndPointSize].
 	Semaphore new waitTimeoutMSecs: 500. "smoother appearance after last card move"
	winnerText := (LabelMorph contents: newText )
					emphasis: 1; "bold"
					font:  (FontFamily defaultFamilyPointSize: pointSizeToUse).
	winnerText color: Color blue; 
				layoutSpec: (LayoutSpec  proportionalWidth: 0.9 proportionalHeight: 1.0).

	labelLayout removeAllMorphs;
			      addMorph: winnerText.
	winnerText lock.! !

!CardTableMorph methodsFor: 'auto-move' stamp: 'KenD 12/26/2021 12:01:23'!
animateMoveFrom: aContainer to: otherContainer moving: someCard next: nextAction
	"Animate move of Card or Cards."

	| topDestCard worldPos destPos |
	"Skip if funky special case in undo action"
	someCard isNil 
	ifTrue: [ nextAction value ]
	ifFalse: [
		worldPos := someCard morphPositionInWorld. 
		someCard setProperty: #moveStart toValue: aContainer .

		"Gather and remove card run from aContainer"
		someCard collectCardsAboveMe.

		"Transfer card(s) to World"
		aContainer removeMorph: someCard.
		self world addMorph: someCard position: worldPos.
		someCard scale: self scale.

		topDestCard := otherContainer topCard.
		topDestCard isNil
			ifTrue: [ destPos := otherContainer morphPositionInWorld
								  + otherContainer containerOffset ]
			ifFalse: [ destPos := topDestCard morphPositionInWorld ].
		
		"Animate the image move -- in World coordinates"
		self slide: someCard
			  to: destPos
			  nSteps: self numberOfMoveSteps
			  delay: self moveDelay
			  next: [ "Give the someCard to otherContainer."
				someCard world removeMorph: someCard.
				otherContainer acceptDroppingMorph: someCard event: nil.
				nextAction value
		  ]
	]
! !

!CardTableMorph methodsFor: 'auto-move' stamp: 'KenD 12/26/2021 12:00:48'!
animateMoveFrom: aContainer to: aPile next: nextAction
	"Animate move of the top Card in aPile into aContainer."

	| topCard worldPos |
	topCard := aContainer topCard.
	topCard setProperty: #moveStart toValue: aContainer .
	worldPos := topCard morphPositionInWorld.
	
	"Transfer card to World"
	aContainer removeMorph: topCard.
	self world addMorph: topCard.
	topCard morphPosition: worldPos.
	topCard scale: self scale.
	
	"Animate the image move -- in World coordinates"
	self slide: topCard 
		  to: aPile morphPositionInWorld + aPile containerOffset
		  nSteps: self numberOfMoveSteps 
		  delay: self moveDelay
		  next: [
				"Give the card to otherContainer."
				topCard world removeMorph: topCard.
				aPile acceptDroppingMorph: topCard event: nil.
				nextAction value
		  ].

! !

!CardTableMorph methodsFor: 'auto-move' stamp: 'KenD 3/15/2015 15:52'!
isAutoMoveLegalFrom: aContainer to: aPile
	"Answer true when it is legal to move a Card from the top
	of the Card Container to a Pile"

	| topCard |
	topCard := aContainer topCard.
	topCard isNil ifTrue: [ ^false ].
	aPile isEmpty
	ifTrue: [ ^topCard face = #Ace ]
	ifFalse: [ | pileCard |
			pileCard := aPile topCard.
		^ (pileCard hasSameSuitAs: topCard)
			& (pileCard hasFaceOneLessThan: topCard) 
	]! !

!CardTableMorph methodsFor: 'auto-move' stamp: 'KenD 12/27/2021 15:46:46'!
moveDelay

	^ 1! !

!CardTableMorph methodsFor: 'auto-move' stamp: 'KenD 8/7/2016 12:39:21'!
numberOfMoveSteps

	^ 40! !

!CardTableMorph methodsFor: 'auto-move' stamp: 'KenD 3/22/2015 13:38'!
possiblyAnimateCardsFrom: aCardContainer ifFaceLessOrEqualTo: faceNum next: nextAction
	"See if we can move our top Card into a Pile. 
	Set  'table goAgain: true' if we were able to move a card."

	| table pilesLoop |
	table := self.  "for closure access"
	pilesLoop :=
	  CardTableMorph 
		cpsOverColl: table piles
		do: [ :pile :next |
			(table isAutoMoveLegalFrom: aCardContainer to: pile)
			ifFalse: [ next value ]
			ifTrue: [ | aCard |
				aCard := aCardContainer topCard.
				(aCard faceNumber <= faceNum)
				ifFalse: [ next value ]
				ifTrue: [ 
						table goAgain: true.
"Transcript show: 'Animate ', (aCard face asString), ' of ', (aCard suit asString); newLine."
						table animateMoveFrom: aCardContainer to: pile next: next.
					]
				]
			]
			next: nextAction.
			
		pilesLoop value! !

!CardTableMorph methodsFor: 'auto-move' stamp: 'KenD 3/10/2015 16:42'!
slide: aMorph to: endPoint nSteps: numSteps delay: milliSecondsDelay next: nextAction
	"Slide from current to new position -- in owner's coordinates"
	"Nota Bene: Asynchronous.  When complete,  nextAction value"

	| startPoint delta stepCount |
	startPoint _ aMorph morphPosition.
	delta _ (endPoint - startPoint) / numSteps.
	stepCount := 0.
	aMorph when: #morphicStep 
			  evaluate: [ :ignoredArgument |
			stepCount := stepCount + 1.
			(stepCount < numSteps)
			ifTrue: [ 
				aMorph morphPosition: (startPoint + (stepCount  * delta)) rounded; 
				redrawNeeded 
			]
			ifFalse: [ "done"
				aMorph stopStepping.
				aMorph morphPosition: endPoint.
				aMorph removeActionsForEvent: #morphicStep.
				nextAction value
			]
	].
	aMorph startSteppingStepTime: milliSecondsDelay! !

!CardTableMorph methodsFor: 'drawing' stamp: 'KenD 8/26/2013 17:36'!
drawOn: aCanvas

	super drawOn: aCanvas.
	aCanvas
		frameRectangle:   (0@0 extent: extent )
		color: Color gray
		borderWidth: 4
		borderStyleSymbol: #raised.! !

!CardTableMorph methodsFor: 'event handling' stamp: 'KenD 1/22/2013 19:28'!
aboutToBeGrabbedBy: aHand 
	"I'm about to be grabbed by the hand.
	If I let this happen I get picked up instead of cards and you can't play a game..
	So, don't let this happen!!"
"
	Transcript newLine; show: ( self name , ' bad attempt to be grabbed by ' , aHand name ).
"
	"^nil"
	^super aboutToBeGrabbedBy: aHand 
! !

!CardTableMorph methodsFor: 'fileIn/out' stamp: 'KenD 10/27/2015 19:19'!
restoreGame: dotSuffixString userMessage: aPromptString
	"Show a file dialog to the user to pick a game's file to restore.
	Subclasses restore specific data from compressed Deck and CardContainer objects
	via #restoreGameFromDataStream:."

	| dialogResult |
	
	dialogResult := (StandardFileMenu new) 
   					oldFileFrom: Smalltalk imagePath asDirectoryEntry 
					withPattern:  '*.' , dotSuffixString; 
					startUpWithCaption: 'Select Saved Game or click elsewhere'.
	
	(dialogResult isNil)
	ifTrue: [ ^nil ]
	ifFalse: [ |  filePath |
		filePath := (dialogResult directory // dialogResult name) pathName.
		filePath asFileEntry readStreamDo: [ :file | | aDataStream |
			file binary.
			aDataStream := DataStream on: file.
		     self restoreGameFromDataStream: aDataStream.
			aDataStream close.
		].
		self removeWinnerText. "just in case.."
	]
! !

!CardTableMorph methodsFor: 'fileIn/out' stamp: 'KenD 3/14/2020 15:33:02'!
restoreGameFromDataStream: aDataStream
	"Delegate to subclass -- the Table that implements the game."

	self subclassResponsibility! !

!CardTableMorph methodsFor: 'fileIn/out' stamp: 'KenD 10/27/2015 19:18'!
saveGame: dotSuffix userMessage: aPromptString
	"Show a file dialog to the user to save a game with dotSuffix (e.g. '*.foo').
	Subclasses save specific data as compressed Deck and CardContainer objects."

	| dialogResult |
	
	dialogResult := (StandardFileMenu new) 
   					newFileFrom: Smalltalk imagePath asDirectoryEntry
					withPattern:  '*.' , dotSuffix; 
					startUpWithCaption: aPromptString.
	
	(dialogResult isNil)
	ifTrue: [ ^nil ]
	ifFalse: [ | filePath |
		filePath := (dialogResult directory // dialogResult name) pathName.
		filePath := self ensureFileName: filePath hasSuffix:  '.', dotSuffix.
		filePath asFileEntry writeStreamDo: [ :file | | aDataStream |
			aDataStream := DataStream on: file. 
			self saveGameToDataStream: aDataStream.
			aDataStream close
		]
	]! !

!CardTableMorph methodsFor: 'fileIn/out' stamp: 'KenD 3/14/2020 15:32:44'!
saveGametoDataStream: aDataStream
	"Delegate to subclass -- the Table that implements the game."

	self subclassResponsibility! !

!CardTableMorph methodsFor: 'geometry' stamp: 'KenD 12/24/2021 15:13:33'!
cardSize

	^CardMorph extent! !

!CardTableMorph methodsFor: 'geometry' stamp: 'KenD 3/18/2020 09:02:36'!
currentScreenExtent

	"Answer extent for 'current' display screen.
	  In future, we may support multiple screens."
	^ DisplayScreen actualScreenSize
	! !

!CardTableMorph methodsFor: 'geometry' stamp: 'KenD 12/27/2021 13:12:40'!
fontPreferenceChanged
	"Note: May change from StrikeFont to TrueType font"
	labelMorph font: (FontFamily defaultFamilyPointSize: 22).
	self morphExtent: self minimumExtent
	! !

!CardTableMorph methodsFor: 'geometry' stamp: 'KenD 3/14/2020 15:14:19'!
textScale

	"Answer a point size based on current settings"
	^ Preferences windowTitleFont pointSize! !

!CardTableMorph methodsFor: 'initialization' stamp: 'KenD 12/27/2020 15:12:18'!
buildButton: aButton
	"wrap a button or switch in an alignmentMorph to provide some space around the button"

	| |
	aButton 
		morphHeight: (Preferences standardButtonFont pointSize) * 8 ;
		borderWidth: 2;
		color: Color gray.
	 	^aButton
! !

!CardTableMorph methodsFor: 'initialization' stamp: 'KenD 1/28/2016 13:43'!
defaultExtent

	self subclassResponsibility ! !

!CardTableMorph methodsFor: 'initialization' stamp: 'KenD 9/30/2021 09:38:59'!
initialize
	super initialize.
	undoStack := Stack new initialize.
	mutex      := Mutex new initialize.
	sizeUnit := self textScale.
	self beColumn; 
		 separation: 10;
		 inCardMove: false;
		 goAgain: false;
		 inUndo: false;
		 color: (Color r: 0.304 g: 0.833 b: 0.075);  "green felt"
		 morphPositionInWorld: (30 @ 26); 
		 yourself! !

!CardTableMorph methodsFor: 'initialization' stamp: 'KenD 12/24/2021 16:34:05'!
makeButtonArea
	"Make a new Button Area as a submorph"

	| buttonArea  buttonColor |
	
	buttonColor := Theme current buttonColorFrom: 
					(Theme current defaultWindowColor).

	buttonArea := LayoutMorph newRow separation: 8.
	buttonArea
			color: Color transparent;
			"borderColor: Color transparent;"
			morphHeight: self buttonAreaHeight;
			morphWidth: (self morphWidth);
			axisEdgeWeight: #center.
			
	"Add some buttons."
	buttonArea addMorph: (self makeNewGameButton) 
							proportionalWidth: 0.14;
				addMorph: (self makeSameGameButton) 
							proportionalWidth: 0.14;
				addMorph: (self makeUndoButton) 
							proportionalWidth: 0.14;
				addMorph: (self makeHelpButton) 
							proportionalWidth: 0.14;
				addMorph: (self makeSaveGameButton) 
							proportionalWidth: 0.14;
				addMorph: (self makeRestoreGameButton) 
							proportionalWidth: 0.14;
				addMorph: (self makeQuitButton) 
							proportionalWidth: 0.14.
							
	buttonArea submorphs do: [ :button | button color: buttonColor ].
	
	self undoButton disable.

	self addMorph: buttonArea 
		layoutSpec: (LayoutSpec proportionalWidth: 1.0  
							proportionalHeight: 0.1
							offAxisEdgeWeight: #center)! !

!CardTableMorph methodsFor: 'initialization' stamp: 'KenD 11/28/2021 13:25:06'!
makeHelpButton
	^ self
		buildButton:
		 (PluggableButtonMorph 
			model: self stateGetter: nil action: #help label: 'Help')! !

!CardTableMorph methodsFor: 'initialization' stamp: 'KenD 10/16/2020 16:47:05'!
makeLabelArea: lableString
	"Make a new Lable Area as a submorph"
	
	| labelHeight |
	labelLayout := LayoutMorph newRow.
	labelMorph
	 	:= (LabelMorph contents: lableString) 
			emphasis: 1;  "emphasis: bold=1"
			font: (FontFamily defaultFamilyPointSize: 22). 
	labelHeight := labelMorph font pointSize * 2.		
	labelMorph  layoutSpec: (LayoutSpec  proportionalWidth: 1.0 fixedHeight: 30 offAxisEdgeWeight: #rowTop).
	
	labelLayout
			color: Color transparent;
			"borderColor: Color transparent;"
			morphHeight: labelHeight;
			morphWidth: 700; " (self morphWidth) - 4;"
			axisEdgeWeight: #rowLeft;
			layoutSpec: (LayoutSpec  proportionalWidth: 0.96 fixedHeight: labelHeight);
			addMorph: labelMorph.

	self addMorph: labelLayout! !

!CardTableMorph methodsFor: 'initialization' stamp: 'KenD 11/28/2021 13:25:11'!
makeNewGameButton
	^ self
		buildButton:
		 (PluggableButtonMorph 
			model: self stateGetter: nil action: #newGame label: 'New game')! !

!CardTableMorph methodsFor: 'initialization' stamp: 'KenD 11/28/2021 13:25:16'!
makeQuitButton
	^ self buildButton:
		 (PluggableButtonMorph 
			model: self stateGetter: nil action: #quit label: 'Quit')! !

!CardTableMorph methodsFor: 'initialization' stamp: 'KenD 11/28/2021 13:25:20'!
makeRestoreGameButton
	^self buildButton:
		 (PluggableButtonMorph 
			model: self stateGetter: nil action: #restoreGame label: 'Restore game')! !

!CardTableMorph methodsFor: 'initialization' stamp: 'KenD 11/28/2021 13:25:24'!
makeSameGameButton
	^ self buildButton:
		 (PluggableButtonMorph 
			model: self stateGetter: nil action: #sameGame label: 'Start Over')! !

!CardTableMorph methodsFor: 'initialization' stamp: 'KenD 11/28/2021 13:25:27'!
makeSaveGameButton

	saveGameButton := (PluggableButtonMorph 
			model: self stateGetter: nil action: #saveGame label: 'Save game').
	^ self buildButton: saveGameButton! !

!CardTableMorph methodsFor: 'initialization' stamp: 'KenD 11/28/2021 13:25:31'!
makeUndoButton

	undoButton := (PluggableButtonMorph 
			model: self stateGetter: nil action: #undoMove label: 'Undo').
	^ self buildButton: undoButton! !

!CardTableMorph methodsFor: 'testing' stamp: 'KenD 11/9/2004 13:06'!
ensureFileName: fileNameString hasSuffix: suffixString
	"Answer a string which is the file name guarenteed to have suffix suffixString."

	| cleanSuffix |
	" '*.foo' -> '.foo' "
	(suffixString at: 1) = $*
	ifTrue: [ cleanSuffix := suffixString copyFrom: 2 to: (suffixString size)]
	ifFalse: [ cleanSuffix := suffixString ].
	(fileNameString endsWith: cleanSuffix)
	ifTrue: [ ^fileNameString ]
	ifFalse: [ ^fileNameString , cleanSuffix ]! !

!CardTableMorph methodsFor: 'testing' stamp: 'KenD 10/21/2004 18:14'!
isCardTable
	^true! !

!CardTableMorph methodsFor: 'testing' stamp: 'KenD 11/20/2004 08:33'!
runStartsFrom: aCard in: aColumn
	"A Card starts a run if all cards above it are in ascending face and
	alternating color."

	| cardIndex cards cardUnder |
	cards := aColumn submorphs.
	cardIndex := cards indexOf: aCard.
	(cardIndex isNil) ifTrue: [ ^false ].
	cardUnder := aCard.
	[cardIndex > 1] 
		whileTrue: [ 
			| cardAbove |
			cardIndex := cardIndex - 1.
			cardAbove := cards at: cardIndex.
			(cardUnder hasDifferentColorThan: cardAbove)
			& (cardAbove hasFaceOneLessThan: cardUnder)
				ifFalse: [ ^false ].
			cardUnder := cardAbove.
		].
	"cardIndex = 1"
	^true! !

!CardTableMorph methodsFor: 'undo' stamp: 'KenD 3/28/2015 18:47'!
addingCardOrCards: cardMorph toContainer: cardContainer
	"Container is about to add a Card or Cards.  Remember undo action."

	| startContainer |
	startContainer := cardMorph valueOfProperty: #moveStart.
	cardMorph removeProperty:  #moveStart.
	((self inUndo) or: [startContainer = cardContainer ])
	  ifFalse: [
"Transcript show: 'Pushing undo for ',  (cardMorph face asString), ' of ', (cardMorph suit asString); newLine."
		self pushUndoObject: 
				[ :table :nextAction | 
					 table animateMoveFrom: cardContainer 
							to: startContainer 
							moving: cardMorph
							next: nextAction ]
	]
 ! !

!CardTableMorph methodsFor: 'undo' stamp: 'KenD 11/18/2004 18:12'!
makeUndoStackEmpty

	self undoButton disable.
	undoStack := Stack new initialize.! !

!CardTableMorph methodsFor: 'undo' stamp: 'KenD 3/22/2015 13:55'!
popUndoObject
	
	^self undoStack pop! !

!CardTableMorph methodsFor: 'undo' stamp: 'KenD 3/22/2015 13:58'!
pushUndoObject: anUndoObject

	self undoButton enable.
	self undoStack push: anUndoObject! !

!CardTableMorph methodsFor: 'undo' stamp: 'KenD 3/22/2015 13:50'!
undoMove

	| table |
	table := self.
	table removeWinnerText.
	table inUndo: true.
	(self popUndoObject) value: table value: [ table inUndo: false ]
	

! !

!CardTableMorph methodsFor: 'private' stamp: 'KenD 12/27/2020 15:14:30'!
buttonAreaHeight

	^ (Preferences standardButtonFont pointSize) * 8! !

!CardTableMorph methodsFor: 'private' stamp: 'KenD 3/14/2020 14:25:54'!
labelAreaHeight

	^ (Preferences windowTitleFont pointSize) * 4! !

!CardTableMorph methodsFor: 'private' stamp: 'KenD 4/5/2015 18:50'!
undoAll
	"Test Method -- plays game backward to beginning"
	
	| table undoLoop |
	table := self.
	table removeWinnerText.
	table undoStack isEmptyOrNil 
	ifFalse: [
		undoLoop := [ 
			(self undoStack isEmpty)
			ifTrue: [ table inUndo: false ]
			ifFalse: [ (self popUndoObject) value: table value: undoLoop ]
		].
		table inUndo: true.
		undoLoop value
	]

	! !

!CardTableMorph class methodsFor: 'instance creation' stamp: 'jmv 6/27/2011 08:21'!
initializedInstance
	^self newColumn! !

!CardTableMorph class methodsFor: 'closurePassingStyle' stamp: 'KenD 3/11/2015 16:32'!
cpsOverColl: orderedColletion do: aBlock next: nextAction
	"Answers a closure which involes aBlock over one element of orderedCollection.
	nextAction is a thunk (closure of zero arguments).
	aBlock does not return but tales a nextAction argument and calls that"
	
	"See cpsOverCollExample"
	| index numElts actionProc |
	index := 0.
	numElts := orderedColletion size.
	actionProc := [ 
		index := index + 1.
	  	(index > numElts)
	 	 ifTrue: [ nextAction value ] "done"
	  	 ifFalse: [ aBlock value: (orderedColletion at: index) value: actionProc ].
	].
	^ actionProc
! !

!CardTableMorph class methodsFor: 'closurePassingStyle' stamp: 'KenD 3/11/2015 16:16'!
cpsOverCollExample
	"This method should answer true"
"
	CardTableMorph cpsOverCollExample. 
"
	| sum |
	sum := 0.
	"Iterate over values"
	^(CardTableMorph 
		cpsOverColl: { 1. 2. 3. 4. } 
		do: [ :elt :next | 
				sum := sum + elt.
				next value
		] 
											  
	next: [ sum ]) value = 10.! !

!CardTableMorph class methodsFor: 'closurePassingStyle' stamp: 'KenD 3/11/2015 16:16'!
cpsOverCollExample2
	"This method should answer true"
"
	CardTableMorph cpsOverCollExample2. 
"
	| sum |
	sum := 0.
	"Nested loop"
	^(CardTableMorph 
		cpsOverColl: { 1. 2. 3. 4. } 
		do: [ :elt1 :next1 | 
				(CardTableMorph 
					cpsOverColl: { 3. 2. 1. }
					do: [ :elt2 :next2 | 
						sum := sum + (elt1 * elt2).
						next2 value
					]
					next: next1) value
		] 
		 next: [ sum ]) value = 60! !

!CardTableMorph class methodsFor: 'closurePassingStyle' stamp: 'KenD 3/11/2015 16:22'!
cpsOverCollExample3
	"This method should answer true"
"
	CardTableMorph cpsOverCollExample3. 
"
	| sum |
	sum := 0.
	"Chained loop"
	^(CardTableMorph 
		cpsOverColl: { 1. 2. 3. 4. } 
		do: [ :elt1 :next1 | 
			sum := sum + elt1.
			next1 value
		]
		next: [ (CardTableMorph 
					cpsOverColl: { 3. 2. 1. }
					do: [ :elt2 :next2 | 
						sum := sum + elt2.
						next2 value
					]
					next: [sum]) value
		]) value = 16! !

!CardTableMorph class methodsFor: 'class initialization' stamp: 'KenD 10/25/2004 08:16'!
includeInNewMorphMenu
	^ false! !

!CardTableMorph class methodsFor: 'accessing' stamp: 'KenD 2/28/2016 07:15'!
randomWinnerText
	"Return some random winner text message"

	| textArray seed |
	
	textArray := #( 
'You Won!!'
 'You''re a Winner!!'
 'Cool Man!!'
 'Too Easy!!'
 'Wow!!'
 'Another Day, Another Winner!!'
 'Super Cool!!'
 'You''re the Best!!'
 'Another Winner!!'
 'Congrads!!'
 'Way to go!!'
 'Free Game, Play Again!!'
 'Glad you made it'
 'You finally won one!!'
 'Splendid!!'
 'Good on ya!!'
 'You''re a Tall Poppy'
 'Frabjous Day!!'
 'Yay!!'
 'Hubba, hubba!!'
 'Wonderful'
 'Simply Brilliant!!'
 'Wizard!!'
 'Over the Top'
 'Excellent!!'
 'Good Show!!'
 'OK, take a break now'
 'That was Fun!!'
 'Simply Superior!!'
 'Chortle chortle!!'
 'Marvelous!!'
 'Bully for You!!'
 'Great!!'
 'Looking Good!!'
 'Piece of Cake'
 'Sitting Pretty!!'
 'You are a Genius!!'
 'Your Lucky Day'
 'Happy Days are here again!!'
 'One good game deserves another'
 'Bullseye!!'
 'Score one for you'
 'Perfect, How about another one?'
 'You can''t get better than perfect'
 'Yo Ho!!'
 'Bingo!!'
 'Life Can Be Beautiful'
 'Wonderful, simply wonderful'
 'You did that too fast, do another'
 'Things are looking up!!'
 'You lucked out this time'
 'You Take the Prize'
 'This space reserved for winners only'
 'Send $25 for your name here'
 'Next stop Las Vegas!!'
 'That was really, really good!!'
 'Exemplary!!'
 'Take a Bow!!' 
 'Collect all 50 Winning Banners' 
 'Amazing, simply amazing'
 'Victory!!'
 'You''re the Tops!!' 
'Another Feather in your Cap!!' 
'You''re the Champ!!'
'Top Dog!!' 
'You Take the Prize' 
'You made Short Work of That One' 
'A Lead-Pipe Cinch'
'Another Triumph' 
'You are a Sensation!!' 
'TouchDown!!' 
'You Played That One Right!!'
'No flies on you!!' 
'Sweet Success!!' 
'You just scraped by on that one' 
'You pulled it off!!' 
'You muddled through another one'
'You are in the swing of things now!!' 
'Fortune smiles on Winners!!'
	)
.
	
	[seed := (Time millisecondClockValue bitAnd: 16r3FFFFFFF) bitXor: self hash.
	seed := seed bitXor: (Time localMillisecondClock bitAnd: 16r3FFFFFFF).
	seed = 0] whileTrue: ["Try again if ever get a seed = 0"].

	^textArray at: ((Random new seed: seed) nextInteger: (textArray size))! !

!CardTableMorph class methodsFor: 'testing' stamp: 'KenD 3/11/2015 08:36'!
slide: aMorph to: endPoint nSteps: numSteps delay: milliSecondsDelay next: nextAction
	"Slide from current to new position -- in owner's coordinates"
	"Nota Bene: Asynchronous.  When complete,  nextAction value"

	| startPoint delta stepCount |
	Transcript
				show: 'sliding to '; 
				show: endPoint; 
				newLine.

	startPoint _ aMorph morphPosition.
	delta _ (endPoint - startPoint) / numSteps.
	stepCount := 0.
	aMorph when: #morphicStep 
			  evaluate: [ :ignoredArgument |
			stepCount := stepCount + 1.
			
"			Transcript showOnDisplay: true; display.  
			Transcript
				show: 'sliding to '; 
				show: (startPoint + (stepCount  * delta)) rounded; 
				newLine.
"
			(stepCount < numSteps)
			ifTrue: [ aMorph morphPosition: (startPoint + (stepCount  * delta)) rounded; redrawNeeded ]
			ifFalse: [ "done"
				aMorph stopStepping.
				aMorph morphPosition: endPoint.
				aMorph removeActionsForEvent: #morphicStep.
				nextAction value
			]
	].
	aMorph startSteppingStepTime: milliSecondsDelay
! !

!CardTableMorph class methodsFor: 'testing' stamp: 'KenD 3/11/2015 13:09'!
testCardMove
"
	CardTableMorph testCardMove inspect.
	[ Use Inspector to 'self delete' aCard ]
	An open Transcript shoud show
	  Before Move <time1>
	  After Start Move <time2>
	  After Move Complete <time3>
"
	| aCard |
	aCard := CardMorph the: #Ace of: #Spades.
	aCard openInWorld.
	aCard morphPosition: 100 @ 230.
	Transcript show: 'Before Move'; show: (Time now); newLine.
	self slide: aCard 
		to: 230@400 
		nSteps: 30 
		delay: 20 
		next: [ Transcript show: 'After Move Complete'; show: (Time now); newLine ].
	Transcript show: 'After Start Move'; show: (Time now); newLine.
	^aCard! !

!CardTableMorph class methodsFor: 'testing' stamp: 'KenD 3/11/2015 16:02'!
testCardMove2
"
	CardTableMorph testCardMove2 inspect.

	An open Transcript shoud show
	  Before Move <time1>
	  After Start Move <time2>
	  After Move Complete <time3>
"
	| aCard  |
	aCard := CardMorph the: #Ace of: #Spades.
	aCard openInWorld.
	aCard morphPosition: 100 @ 230.
	
	Transcript show: 'Before Move '; show: (Time now); newLine.

	(CardTableMorph  "xLoop"
		cpsOverColl: { 200. 300. 400.  } 
		do: [ :x :next1 |
				(CardTableMorph "yLoop"
							cpsOverColl: { 200. 250. 300. 350.  }
							do: [ :y :next2 | 
									(CardTableMorph
										slide: aCard 
										to: x @ y
										nSteps: 10 
										delay: 20 
										next: next2).
							]
							next: next1) value
		] 
		next: [ Transcript 
					show: 'After Move Complete '; 
					show: (Time now); 
					newLine ]		
	) value.
	
	Transcript show: 'After Start Move'; show: (Time now); newLine.
	
	^aCard! !

!FreeCell methodsFor: 'dropping/grabbing' stamp: 'KenD 1/10/2013 13:46'!
column: columnMorph wantsDropOf: aCardOrColumnMorph 
	"Answer true if Column is empty or if (lowest)
	card is opposit color and one higher in face value."
	
	"Ignore other game card instances"
	(self isMyCard: aCardOrColumnMorph) ifFalse: [^false]. 
	
	(aCardOrColumnMorph isKindOf: CardMorph)
		ifTrue: [| topCard | 
			topCard := columnMorph topCard.
			topCard isNil
			ifTrue: [^true]
			ifFalse: [ ^ (aCardOrColumnMorph hasFaceOneLessThan: topCard)
					& (topCard hasDifferentColorThan: aCardOrColumnMorph)]]
		ifFalse: [
			Error signal: '@@FIXME: implement for column drops!!'.
			^ false]! !

!FreeCell methodsFor: 'dropping/grabbing' stamp: 'KenD 7/15/2011 16:50'!
container: aContainerMorph wantsDropOf: aCardOrColumnMorph 
	"Answer true if legal drop by FreeCell game rules"
	| dropObjectClass |
	
	"Ignore other game card instances"
	(self isMyCard: aCardOrColumnMorph) ifFalse: [^false]. 
	
	dropObjectClass := aCardOrColumnMorph class.
	(dropObjectClass = CardColumnMorph) | (aCardOrColumnMorph isKindOf: CardMorph)
	ifFalse: [ ^false ]
	ifTrue: [ aContainerMorph class = CardSpareMorph
		ifTrue: [^ self spare: aContainerMorph wantsDropOf: aCardOrColumnMorph]
		ifFalse: [aContainerMorph class = CardPileMorph
				ifTrue: [^ self pile: aContainerMorph wantsDropOf: aCardOrColumnMorph]
				ifFalse: [aContainerMorph class = CardColumnMorph
						ifTrue: [^ self column: aContainerMorph wantsDropOf: aCardOrColumnMorph]
						ifFalse: [^ false]]]]! !

!FreeCell methodsFor: 'dropping/grabbing' stamp: 'KenD 3/11/2015 17:10'!
dropComplete
	"Check to see if any cards can be auto-moved to piles.
	Keep moving cards up if legal unless the lowest face value
	of a Card in any Pile is significantly less than the others
	as noted by #maxFaceNumberToMoveToPiles."
	
	| table mainLoop |

	self inCardMove ifTrue: [ ^false ]. "already doing this"
	
	table := self. "For reference from closure"
	table inCardMove: true.
	table goAgain: true.
	
	mainLoop := [
		table goAgain 
		ifFalse: [
			table inCardMove: false.
			table gameIsWon ifTrue: [ table showWinnerText ]
		]
		ifTrue: [  | maxFaceToMove spareLoop |
			table goAgain: false.
			 maxFaceToMove := table maxFaceNumberToMoveToPiles.
			 (CardTableMorph 
				cpsOverColl: table spares
				do:  [ :spare :next1 |
						table possiblyAnimateCardsFrom: spare 
							    ifFaceLessOrEqualTo: maxFaceToMove
							    next: next1
				]
				next: [ (CardTableMorph
								cpsOverColl: table columns
								do: [ :column :next2 |
							  		  table possiblyAnimateCardsFrom: column 
								   		ifFaceLessOrEqualTo: maxFaceToMove
										next: next2
								]
								next: mainLoop) value
				])  value
			]
	].
	
	mainLoop value! !

!FreeCell methodsFor: 'dropping/grabbing' stamp: 'KenD 3/20/2015 19:10'!
pickLegalFor: aCard 
	"Answer true if picking up a card from its container is a legal move."
	| cardContainer |
	cardContainer := aCard owner.
	
cardContainer ifNil: [self error: 'Bad logic'].

	aCard setProperty: #moveStart toValue: cardContainer.  "for Undo"
	(cardContainer isKindOf: CardContainerMorph)
		ifFalse: [^ false].
	cardContainer class = CardSpareMorph
		ifTrue: [^ true].
	cardContainer class = CardPileMorph
		ifTrue: [^ false].
	"else is a Column"
	^ self pickLegalFor: aCard fromColumn: cardContainer! !

!FreeCell methodsFor: 'dropping/grabbing' stamp: 'KenD 1/10/2013 19:46'!
pickLegalFor: aCard fromColumn: aColumn
	"Answer true if card is on top or is part of a 'run' and the size of
	the run is less than the number of free cells."

	(self runStartsFrom: aCard in: aColumn) ifFalse: [ ^false ].
	^(self numberOfFreeCells + 1) >= (aColumn numberOfCardsAbove: aCard)! !

!FreeCell methodsFor: 'dropping/grabbing' stamp: 'KenD 7/15/2011 16:50'!
pile: pileMorph wantsDropOf: aCardOrColumnMorph 
	"Answer true if Pile is empty and Card is Ace or if  
	card is same suit and one higher in face value."
	
	| card |
	card := (aCardOrColumnMorph isKindOf: CardMorph)
				ifTrue: [aCardOrColumnMorph]
				ifFalse: [aCardOrColumnMorph singletonCard].
				
	"Ignore other game card instances"
	(self isMyCard: card) ifFalse: [^false]. 
	
	card isNil
		ifTrue: [ ^nil ]
		ifFalse: [ pileMorph isEmpty
			ifTrue: [ ^ card face == #Ace ]
			ifFalse: [ | topCard | 
			topCard := pileMorph topCard.
			^ (topCard hasFaceOneLessThan: card)  & (topCard hasSameSuitAs: card)]]! !

!FreeCell methodsFor: 'dropping/grabbing' stamp: 'KenD 8/12/2015 07:11'!
spare: spareMorph wantsDropOf: aCardOrColumnMorph 
	"Answer true if Spare is empty and Card is singleton."
	| card |
	aCardOrColumnMorph hideDropShadow.
	card := (aCardOrColumnMorph isKindOf: CardMorph)
				ifTrue: [aCardOrColumnMorph]
				ifFalse: [aCardOrColumnMorph singletonCard].
				
	"Ignore other game card instances"
	(self isMyCard: card) ifFalse: [^false]. 
	
	spareMorph isEmpty
		ifTrue: [^ (card isNil not) and: [card submorphs size = 0]] "only holds 1 card"
		ifFalse: [^ false]! !

!FreeCell methodsFor: 'private' stamp: 'KenD 12/27/2020 14:58:22'!
columnSeparation
	"Pixel space between columns"
	^4! !

!FreeCell methodsFor: 'accessing' stamp: 'KenD 10/22/2004 18:51'!
columns
	"Private -- Answer my columns"

	^columns! !

!FreeCell methodsFor: 'accessing' stamp: 'KenD 10/22/2004 15:03'!
deck
	"Private -- Answer my deck"

	^deck! !

!FreeCell methodsFor: 'accessing' stamp: 'KenD 1/18/2013 16:08'!
helpText
	^ '
	FreeCell Rules:
	
	All cards are dealt into 8 columns.
  
	Cards in columns build up by alternating color and increasing sequence.
 
	You can move such "runs" up to the number of free cells plus 1.
 
	Free Cells are the spares and columns which contain no cards.
 
	There are 4 spares. Each spare can hold a single card.
 
	The piles build up from the aces in the same suit.
	 '! !

!FreeCell methodsFor: 'accessing' stamp: 'KenD 1/18/2013 16:09'!
numberOfFreeCells
	"Answer the number of empty Spares and Columns."

	| numFree |
	numFree := 0.
	self spares   do: [ :spare | spare isEmpty ifTrue: [numFree := numFree + 1]].
	self columns do: [ :colm |  colm  isEmpty ifTrue: [numFree := numFree + 1]].
	^numFree! !

!FreeCell methodsFor: 'accessing' stamp: 'KenD 10/22/2004 18:51'!
piles
	"Private -- Answer my piles"

	^piles! !

!FreeCell methodsFor: 'accessing' stamp: 'KenD 10/22/2004 18:50'!
spares
	"Private -- Answer my spares"

	^spares! !

!FreeCell methodsFor: 'initialization' stamp: 'KenD 1/10/2013 19:58'!
dealCards
	"Deal all cards onto the table by adding them to Card Columns."

	self deck shuffle.
	0 to: 51
		do: [ :n |  
			(columns at: (n rem: NumColumns) + 1) 
				addCard: (deck dealACard makeFaceUp) ]
			! !

!FreeCell methodsFor: 'initialization' stamp: 'KenD 12/24/2021 15:32:11'!
defaultExtent
	"buttonArea height 50; labelArea height 40; pilesArea CardHeight+30" 
	^ (CardMorph morphWidth + self columnSeparation * 4)
		@ (CardMorph morphHeight * 6 + 120).
! !

!FreeCell methodsFor: 'initialization' stamp: 'KenD 12/24/2021 15:09:23'!
initialize
	"Setup my layout.  Across the top are 4 Spares and 4 Piles,
	then a block of 8 Columns, then a Button area."

	super initialize.
	deck := CardDeck new.
	self makeLabelArea: 'FreeCell';
		 makePilesArea;
		 makeColumnArea;
		 makeButtonArea;
		 dealCards;
		 morphExtent: self minimumExtent;
		 yourself! !

!FreeCell methodsFor: 'initialization' stamp: 'KenD 12/24/2021 16:35:21'!
makeColumnArea
	"I make new Column Area as a submorph"

	| columnArea columnHeight columnLayout  noColor|
	noColor := `Color transparent`.
	columnHeight := CardMorph morphHeight * 5. "pixels"
	columnArea := LayoutMorph newRow.  "a row of columns"
	columnArea
		axisEdgeWeight: #center;
		color: noColor;
		morphHeight: columnHeight;
		morphWidth: (self morphWidth).
	columnLayout := LayoutSpec  
						proportionalWidth: 0.8
						fixedHeight: columnHeight
						offAxisEdgeWeight: #center.

	1 to: NumColumns 
		do: [ :n |
				| colMorph |
				colMorph := CardColumnMorph new. 
				colMorph 
					morphHeight: columnHeight;
					borderColor: noColor;
					layoutSpec: columnLayout.
				columnArea addMorph: colMorph 
		].
	columns := (columnArea submorphs 
					select: [ :whatever | 
						whatever isKindOf: CardContainerMorph ]
			   ) reversed.

	self addMorph: columnArea layoutSpec: LayoutSpec useAll
! !

!FreeCell methodsFor: 'initialization' stamp: 'KenD 12/24/2021 16:36:44'!
makePilesArea
	"answer a new Piles Area as a submorph"

	| pilesArea  noColor |
	
	noColor := Color transparent.
	
	pilesArea :=  LayoutMorph newRow separation: 4.
	pilesArea axisEdgeWeight: #center;
			  color: noColor.

	"Card Spares"
	1 to: NumSpares 
		do: [ :n |  | spare |
			spare := CardSpareMorph new ::
						borderColor: Color brown;
						setBalloonText: 'A Spare can hold 1 card'.
			pilesArea addMorph: spare ].
		
	spares := (pilesArea submorphs select: [:thing | 
				thing isKindOf: CardSpareMorph]
			) reversed.

	"Collection Piles"
	1 to: NumPiles 
		do: [ :n |  | pile |
			pile := CardPileMorph new ::
					setBalloonText: 'Build up a suit in order from the Ace.' .
			pilesArea addMorph: pile ].
	
	piles := (pilesArea submorphs select: [:thing | 
			thing isKindOf: CardPileMorph]
		) reversed.
	
	self addMorph: pilesArea 
		layoutSpec: (LayoutSpec  
					proportionalWidth: 1.0
					fixedHeight: CardMorph morphHeight + 30 
					offAxisEdgeWeight: #center)
	! !

!FreeCell methodsFor: 'initialization' stamp: 'KenD 1/10/2013 14:34'!
reDealCards
	"Deal all cards onto the table withot shuffling (for game replay)."

	"Assumes cards have been removed first."
	0 to: 51
		do: [ :n |  
			(columns at: (n rem: NumColumns) + 1) 
				addCard: (deck dealACard makeFaceUp) ]
			! !

!FreeCell methodsFor: 'testing' stamp: 'KenD 11/6/2004 17:12'!
gameIsWon
	"Answer true if all cards are in the piles"

	^(self piles inject: 0
			    into: [ :count :pile | count + (pile submorphs size) ]) == 52! !

!FreeCell methodsFor: 'testing' stamp: 'KenD 7/2/2011 11:06'!
isMyCard: aCard
	"Answer true if card is asssociated with this instance of the game"

	^self deck contains: aCard! !

!FreeCell methodsFor: 'testing' stamp: 'KenD 10/31/2004 15:50'!
maxFaceNumberToMoveToPiles
	"Answer N plus the minimum Card faceNumber"

	| min |

	min := 13. "big"
	self piles 
		do: [ :pile |
			pile isEmpty 
			ifTrue: [ min := min min: 0 ] 
			ifFalse: [ min := min min: (pile submorphs at: 1) faceNumber ]
		    ].
	"N is 2"
	^min + 2! !

!FreeCell methodsFor: 'actions' stamp: 'KenD 3/9/2020 18:15:43'!
newGame
	"Empty out my Card Containers, shuffle and re-deal."
	
	self removeWinnerText;
		makeUndoStackEmpty;
		removeCards;
	    "Note: (self deck shuffle) is done in (self dealCards)."
		dealCards;
		redrawNeeded ! !

!FreeCell methodsFor: 'actions' stamp: 'KenD 10/28/2004 15:17'!
quit
	"@@ToDo: popup dialog Do you REALLY want to Quit?"
	
	super quit! !

!FreeCell methodsFor: 'actions' stamp: 'KenD 10/28/2004 15:15'!
removeCards
	"Empty out my Card Containers."
	
	self piles do: [ :container | container makeEmpty ].
	self spares do: [ :container | container makeEmpty ].
	self columns do: [ :container | container makeEmpty ]! !

!FreeCell methodsFor: 'actions' stamp: 'KenD 8/28/2013 13:04'!
sameGame
	"Empty out my Card Containers and deal the original deal."
	
	self deck startOver.
	self removeWinnerText;
		makeUndoStackEmpty;
		removeCards;
	    "Note: (self deck shuffle) is done in (self dealCards)."
		reDealCards;
		redrawNeeded ! !

!FreeCell methodsFor: 'fileIn/out' stamp: 'KenDickey 11/21/2010 13:51'!
restoreGame
	"Put up a dialog to reaf game state from a file.
	See #restoreGameFromDataStream:"

	self restoreGame: 'fre' userMessage: 'Select a FreeCell Game File...'! !

!FreeCell methodsFor: 'fileIn/out' stamp: 'KenD 12/25/2021 11:59:20'!
restoreGameFromDataStream: aDataStream
	"Given an open DataStream, read and restore game state."
	
	"Game state consists of information to reconsitiute the deck, spares, piles, and columns."
	"NYI: undo stack save/restore."
	| stateArray |
	stateArray := aDataStream next.
	(stateArray at: 1) == #FreeCell
	ifFalse: [ Error signal: 'Not a saved FreeCell Game!!' ]
	ifTrue: [
		| columnInfo pileInfo spareInfo undoInfo |
		deck := CardDeck new initializeFromArray: (stateArray at: 3).
		columnInfo := stateArray at: 5.
		pileInfo     := stateArray at: 7.
		spareInfo   := stateArray at: 9.
		undoInfo    := stateArray at: 11.
		
		1 to: NumColumns
			do: [ :idx |
				(self columns at: idx) restoreFromArray: (columnInfo at: idx) givenDeck: self deck ].
		
		1 to: NumSpares
			do: [ :idx |
				(self spares at: idx) restoreFromArray: (spareInfo at: idx) givenDeck: self deck ].
			
		1 to: NumPiles
			do: [ :idx |
				(self piles at: idx) restoreFromArray: (pileInfo at: idx) givenDeck: self deck ].
			
		undoInfo isNil
		ifTrue: [ self makeUndoStackEmpty ]
		ifFalse: [ Error signal: 'FIXME: Undo save/restore NYI' ].
	]! !

!FreeCell methodsFor: 'fileIn/out' stamp: 'KenDickey 11/19/2010 14:42'!
saveGame
	"Show a file dialog to the user to save a game.
	See #saveGameToDataStream: for actual data save."
	
	self saveGame: 'fre' userMessage: 'Enter File Name to save FreeCell Game...'! !

!FreeCell methodsFor: 'fileIn/out' stamp: 'KenDickey 11/21/2010 20:14'!
saveGameToDataStream: aDataStream
	"Given an open DataStream, save the current game state."
	
	"Game state consists of information to reconsitiute the deck, spares, piles, and columns."
	"NYI: undo stack save/restore."
	| someData |
	someData := 	 { #FreeCell. 
							#CardDeck.
							self deck saveStateToArray.
							#Columns.
							self columns 
								collect: [ :container | container saveStateToArray].
							#Piles.
							self piles 
								collect: [ :container | container saveStateToArray].
							#Spares.
							self spares 
								collect: [ :container | container saveStateToArray].
							#Undo.
							nil. "FIXME"
						}.
	aDataStream nextPut: someData.
! !

!FreeCell class methodsFor: 'instance creation' stamp: 'KenD 12/24/2021 15:30:51'!
initializedInstance
	"Answer a new instance"
	"
	FreeCell newGame.
	"
	^ self newColumn! !

!FreeCell class methodsFor: 'instance creation' stamp: 'KenD 12/24/2021 15:30:38'!
newGame
	"Answer a new instance"
	"
	FreeCell newGame.
	"
	
	^ self newColumn openInWorld! !

!FreeCell class methodsFor: 'file reader registration' stamp: 'KenD 2/3/2016 17:03'!
fileReaderServicesForFile: fullName suffix: suffix
	"FileList buttons that are serviced by us."

	^suffix = 'fre'
		ifTrue: [ {self serviceRestoreKlondike.} ]
		ifFalse: [ #() ]! !

!FreeCell class methodsFor: 'file reader registration' stamp: 'KenD 2/3/2016 17:02'!
restoreFromSaved: fullFileName

	| aGame |
	aGame := FreeCell newGame.
	fullFileName asFileEntry readStreamDo: [ :file | | aDataStream |
			file binary.
			aDataStream := DataStream on: file.
		     aGame restoreGameFromDataStream: aDataStream.
	].
	^ aGame! !

!FreeCell class methodsFor: 'file reader registration' stamp: 'KenD 2/3/2016 17:02'!
serviceRestoreKlondike

	^ (SimpleServiceEntry 
		provider: self 
		label: 'restore game'
		selector: #restoreFromSaved:
		description: 'restore FreeCell solitaire game') triggerFileListChanged! !

!FreeCell class methodsFor: 'file reader registration' stamp: 'KenD 2/3/2016 16:35'!
unload

	FileList unregisterFileReader: self ! !

!FreeCell class methodsFor: 'class initialization' stamp: 'KenD 10/25/2004 08:16'!
includeInNewMorphMenu
	^ true! !

!FreeCell class methodsFor: 'class initialization' stamp: 'KenD 2/3/2016 17:01'!
initialize
"
	FreeCell initialize
"
	FileList registerFileReader: self.
	NumColumns _ 8.
	NumSpares   _ 4.
	NumPiles       _ 4.
	^self! !

!FreeCell class methodsFor: 'environments' stamp: 'KenD 6/16/2020 16:16:32'!
environmentsExportMe
	"Register me (make me visible) from Smalltalk SystemDictionary"
	^true! !

!Klondike methodsFor: 'undo' stamp: 'KenD 12/26/2021 11:14:24'!
addingCardOrCards: cardMorph toContainer: cardContainer
	"Container is about to add a Card or Cards.  Remember undo action."

	| startContainer |
	startContainer := cardMorph valueOfProperty: #moveStart.
	cardMorph removeProperty:  #moveStart.
	((self inUndo) or: [startContainer = cardContainer ]) ifTrue: [ ^ nil ].
	
"Transcript show: 'Pushing undo for ',  (cardMorph face asString), ' of ', (cardMorph suit asString); newLine."

	"Needs Flip?"
	((startContainer isKindOf: CardColumnMorph)
		and: [ (startContainer submorphs size) > 0 
			and: [ startContainer topCard isFaceDown ] ])
		ifTrue: [ | cardToFlip | "Remember to flip card if required"
			cardToFlip  := startContainer topCard.
			cardToFlip makeFaceUp; redrawNeeded.
			self pushUndoObject: 
					[ :table :nextAction | 
						cardMorph scale: table scale.
					 	table animateMoveFrom: cardContainer 
							    to: startContainer 
							    moving: cardMorph
							    next: [ cardToFlip flip; 
									redrawNeeded. 
									cardMorph scale: 1.0.
									nextAction value ] 
					]
		]
		ifFalse: [ "Need to show Discards?"
			(startContainer isKindOf: CardDiscardMorph)
			ifTrue: [ 
				startContainer showTopCards.
				self pushUndoObject: 
						[ :table :nextAction | 
						 table animateMoveFrom: cardContainer 
								to: startContainer 
								moving: cardMorph
								next: [ startContainer showTopCards. nextAction value ]
					]
			]
			ifFalse: [ "no special action"
					self pushUndoObject: 
						[ :table :nextAction | 
						 table animateMoveFrom: cardContainer 
								to: startContainer 
								moving: cardMorph
								next: nextAction ]
				]
		]
		
		

 ! !

!Klondike methodsFor: 'accessing' stamp: 'KenD 11/19/2004 12:18'!
cardDeck

	^cardDeck! !

!Klondike methodsFor: 'accessing' stamp: 'KenD 11/18/2004 16:40'!
columns
	"Private -- Answer my columns"

	^columns! !

!Klondike methodsFor: 'accessing' stamp: 'KenD 11/18/2004 16:41'!
deck
	"Private -- Answer my deck"

	^deck! !

!Klondike methodsFor: 'accessing' stamp: 'KenD 11/18/2004 16:41'!
discard
	"Private -- Answer my discards"

	^discards! !

!Klondike methodsFor: 'accessing' stamp: 'KenD 6/26/2011 16:44'!
helpText
	^ '
	Klondike Rules:
	
	Cards are dealt into 7 columns, top face up. 
 
	Cards in columns build up by alternating color and increasing sequence. 
 
	You can move such "runs" from one column to another to "grow" the run. 
 
	Clicking on the deck deals 3 cards face up to the discards pile. 
 
	You may place a King on an empty column. 
 
	The piles build up from the Aces in the same suit.
	 ' ! !

!Klondike methodsFor: 'accessing' stamp: 'KenD 11/18/2004 16:41'!
piles
	"Private -- Answer my piles"

	^piles! !

!Klondike methodsFor: 'auto-move' stamp: 'KenD 3/13/2015 17:55'!
cardIndexFor: aCard within: aCardColumn

	^ aCardColumn submorphs indexOf: aCard ifAbsent: [ ^ 0 ].! !

!Klondike methodsFor: 'auto-move' stamp: 'KenD 3/14/2015 15:04'!
dropComplete
	"Show top Card in Columns & Discard; check for automove or a winner."
	
	| table mainLoop |
	self inCardMove ifTrue: [ ^false ]. "Already doing this"
	
	table := self.

	table inCardMove: true.
	table goAgain: true.

	mainLoop := [
		table goAgain 
		ifFalse: [	
			table inCardMove: false.
			table gameIsWon ifTrue: [ table showWinnerText ]
		]
		ifTrue: [ | maxFaceToMove |
			table goAgain: false.
			maxFaceToMove := table maxFaceNumberToMoveToPiles.
			(CardTableMorph 
				cpsOverColl: table columns
				do:  [ :column :next |
						table possiblyAnimateCardsFrom: column 
							    ifFaceLessOrEqualTo: maxFaceToMove
							    next: [
								table possiblyAnimateCardsFrom: table discard
									    ifFaceLessOrEqualTo: maxFaceToMove
									    next: next ]
				]			
				next: mainLoop) value
		]
	].

	mainLoop value.! !

!Klondike methodsFor: 'auto-move' stamp: 'KenD 11/22/2004 10:10'!
maxFaceNumberToMoveToPiles
	"Answer 1 plus the minimum Card faceNumber"

	| min |

	min := 13. "big"
	self piles 
		do: [ :pile |
			pile isEmpty 
			ifTrue: [ min := min min: 0 ] 
			ifFalse: [ min := min min: (pile submorphs at: 1) faceNumber ]
		    ].
	^min + 1! !

!Klondike methodsFor: 'event handling' stamp: 'KenD 3/17/2015 19:30'!
click: evt from: deckMorph
	"Handle click events from CardDeckMorph."
"
	Transcript newLine; show: (self name , ' got #click:from:'). 
"
	(deckMorph isKindOf: CardDeckMorph)
	ifFalse: [ ^false ].

	"ifEmpty, reclaim Cards from Discards, else deal 3 Cards to Discards."
	deckMorph isEmpty
	ifFalse: [ | bottomCard |
			bottomCard := deckMorph topCard. "bottom in undo"
			1 to: (3 min: deckMorph numCards) 
				do: [ :ignored | discards addCard: deckMorph takeTopCard ].
				
			self pushUndoObject: [ :table :nextAction |
										  table animateMoveFrom: discards
												to: deckMorph
												moving: bottomCard
												next: [ discards showTopCards. 
													     nextAction value 
												]
			]
	]
	ifTrue: [
		[ discards isEmpty ]
			whileFalse: [ deck addCard: discards takeTopCard ].
		"Put 'em back if asked"
		self pushUndoObject: [ :table :nextAction |
				[ deck isEmpty ]
					whileFalse: [ discards addCard: deck takeTopCard ].
				nextAction value
		] 
 	].

	evt wasHandled: true! !

!Klondike methodsFor: 'dropping/grabbing' stamp: 'KenD 1/10/2013 13:46'!
column: columnMorph wantsDropOf: aCardOrColumnMorph 
	"Answer true if Column is empty and Card is a King or if (lowest)
	card is opposit color and one higher in face value."
	
	"Ignore other game card instances"
	(self isMyCard: aCardOrColumnMorph) ifFalse: [^false]. 
	
	(aCardOrColumnMorph isKindOf: CardMorph)
		ifTrue: [| topCard | 
			topCard := columnMorph topCard.
			topCard isNil
			ifTrue: [^ aCardOrColumnMorph face = #King ]
			ifFalse: [ ^ (aCardOrColumnMorph hasFaceOneLessThan: topCard)
					& (topCard hasDifferentColorThan: aCardOrColumnMorph)]]
		ifFalse: [
			Error signal: '@@FIXME: implement for column drops!!'.
			^ false]! !

!Klondike methodsFor: 'dropping/grabbing' stamp: 'KenD 7/15/2011 17:17'!
container: aContainerMorph wantsDropOf: aCardOrColumnMorph 
	"Answer true if legal drop by FreeCell game rules"
	| dropObjectClass |
	dropObjectClass := aCardOrColumnMorph class.
	(dropObjectClass = CardColumnMorph) | (aCardOrColumnMorph isKindOf: CardMorph)
		ifFalse: [ ^false ].
	aContainerMorph class = CardDiscardMorph
		ifTrue: [^ false ].
	aContainerMorph class = CardPileMorph
		ifTrue: [^ self pile: aContainerMorph 
					   wantsDropOf: aCardOrColumnMorph ].
	aContainerMorph class = CardColumnMorph
		ifTrue: [^ self column: aContainerMorph 
					   wantsDropOf: aCardOrColumnMorph]
		ifFalse: [^ false]! !

!Klondike methodsFor: 'dropping/grabbing' stamp: 'KenD 3/20/2015 19:10'!
pickLegalFor: aCard 
	"Answer true if picking up a card from its container is a legal move."
	| cardContainer |
	cardContainer := aCard owner.
	
cardContainer ifNil: [self error: 'Bad logic'].

	aCard setProperty: #moveStart toValue: cardContainer.  "for Undo"
	(cardContainer isKindOf: CardContainerMorph)
		ifFalse: [^ false].
	cardContainer class = CardDiscardMorph
		"OK if top card"
		ifTrue: [ ^aCard == (cardContainer submorphs at: 1)].
	cardContainer class = CardPileMorph
		ifTrue: [^ false].
	cardContainer class = CardDeckMorph
		ifTrue: [^ false].
	cardContainer class = CardColumnMorph
		ifTrue: [^ self pickLegalFor: aCard fromColumn: cardContainer ].
	Error signal: 'Internal logic error'! !

!Klondike methodsFor: 'dropping/grabbing' stamp: 'KenD 1/10/2013 19:30'!
pickLegalFor: aCard fromColumn: aColumn
	"Answer true if card is on top or is part of a 'run'."

	^(self runStartsFrom: aCard in: aColumn) ! !

!Klondike methodsFor: 'dropping/grabbing' stamp: 'KenD 7/15/2011 17:18'!
pile: pileMorph wantsDropOf: aCardOrColumnMorph 
	"Answer true if Pile is empty and Card is Ace or if  
	card is same suit and one higher in face value."
	
	| card |
	card := (aCardOrColumnMorph isKindOf: CardMorph)
				ifTrue: [aCardOrColumnMorph]
				ifFalse: [aCardOrColumnMorph singletonCard].
				
	"Ignore other game card instances"
	(self isMyCard: card) ifFalse: [^false]. 
	
	card isNil
		ifTrue: [ ^nil ]
		ifFalse: [ pileMorph isEmpty
			ifTrue: [ ^ card face == #Ace ]
			ifFalse: [ | topCard | 
			topCard := pileMorph topCard.
			^ (topCard hasFaceOneLessThan: card)  & (topCard hasSameSuitAs: card)]]! !

!Klondike methodsFor: 'initialization' stamp: 'KenD 10/11/2023 07:11:38'!
dealCards
	"Shuffle cards and deal onto the table."
	
	self cardDeck shuffle.
	self reDealCards.
	[ self kenWantsReshuffle ] whileTrue: [ 
		self cardDeck shuffle.
		self reDealCards.
		].

! !

!Klondike methodsFor: 'initialization' stamp: 'KenD 12/24/2021 16:26:29'!
defaultExtent
	"Just a rough placeholder"
	^ (CardMorph morphWidth * 9)
		@ (CardMorph morphHeight * 10).
! !

!Klondike methodsFor: 'initialization' stamp: 'KenD 12/24/2021 16:29:17'!
initialize
	"Setup my layout.  Down the column are 
	Label, 
	Deck, Discards and 4 Piles,
	then a  row of 7 Columns, 
	then a Button area."

	super initialize.
	"deck created in makePilesArea"
	^self
		makeLabelArea: 'Klondike';
		makePilesArea;
		makeColumnArea;
		makeButtonArea;
		dealCards;
		morphExtent: self minimumExtent;
		yourself! !

!Klondike methodsFor: 'initialization' stamp: 'KenD 12/24/2021 15:33:47'!
makeColumnArea
	"I make new Column Area as a submorph"

	| columnArea columnHeight columnLayout |
	columnHeight := CardMorph morphHeight * 5. "pixels"

	columnArea := LayoutMorph newRow.  "a row of columns"
	columnArea 
		color: `Color transparent`;
		morphHeight: columnHeight;
		morphWidth: (self morphWidth);
		axisEdgeWeight: #center.

	columnLayout := LayoutSpec  
					proportionalWidth: 0.20
					fixedHeight: columnHeight
					offAxisEdgeWeight: #center.
	columnLayout 
		proportionalWidth: 0.20 
		minimum: CardMorph morphWidth + 4.
			
	1 to: NumColumns do: 
		[ :n |
			| colMorph |
			colMorph := CardColumnMorph new. 
			colMorph 
				morphHeight: columnHeight;
				borderColor: `Color transparent`;
				layoutSpec: columnLayout.
			columnArea addMorph: colMorph.
		].
	columns := (columnArea submorphs 
				select: [ :whatever | 
					whatever isKindOf: CardContainerMorph ]
			    ) reversed.

	self addMorph: columnArea layoutSpec: LayoutSpec useAll
	! !

!Klondike methodsFor: 'initialization' stamp: 'KenD 12/24/2021 16:33:10'!
makePilesArea
	"answer a new Piles Area as a submorph"

	| pilesArea noColor |
	
	noColor := Color transparent.
	pilesArea :=  LayoutMorph newRow separation: 10.
	pilesArea color: noColor.
	
	"spacer"
	pilesArea addMorph: (BoxedMorph  new ::
						color: noColor; 
						borderColor: noColor; 
						morphWidth: 40)
			  layoutSpec: (LayoutSpec  
						proportionalWidth: 0.2
						fixedHeight: (CardMorph morphHeight + 4)).

	"deck"
	deck := CardDeckMorph new :: 
				setBalloonText: 'Tap top card to discard 3 or redeal.'.
	cardDeck := CardDeck new.
	deck addCards: cardDeck.
	pilesArea addMorph: deck.
	
	"discards pile"
	discards := CardDiscardMorph new ::
					numCardsToShow: 3;
					setBalloonText: 'Play top Discard.'.
	pilesArea addMorph: discards.
	
	"spacer"
	pilesArea addMorph: (BoxedMorph new :: 
				color: noColor; 
				borderColor: noColor; 
				morphWidth: 20)
			  layoutSpec: (LayoutSpec  
						proportionalWidth: 0.2
						fixedHeight: (CardMorph morphHeight + 4)).
			
	"trarget piles"
	1 to: NumPiles do: [ :n | 
		| pile |
		pile := CardPileMorph new ::
				setBalloonText: 'Build up a suit in order from the Ace.'.
		pilesArea addMorph: pile ].
	piles := (pilesArea submorphs select: [:thing | 
			thing isKindOf: CardPileMorph]) reversed.
	
	self addMorph: pilesArea 
		layoutSpec: (LayoutSpec 
					proportionalWidth: 1.0
					fixedHeight: CardMorph morphHeight + 10 
					offAxisEdgeWeight: #center).
! !

!Klondike methodsFor: 'initialization' stamp: 'KenD 12/24/2021 15:28:47'!
reDealCards
	"Deal cards onto the table withot shuffling (for game restart)."

	self deck makeEmpty; addCards: cardDeck.
	self removeCards.
	1 to: NumColumns
		do: [ :colIndex |  | column |
			column := self columns at: colIndex.
			1 to: (colIndex - 1) 
				 do: [ :ignore | 
					column 
						addCard: deck 
						takeTopCard makeFaceDown 
				].
			column addCard: deck takeTopCard makeFaceUp.
		 ]! !

!Klondike methodsFor: 'testing' stamp: 'KenD 11/17/2004 12:42'!
gameIsWon
	"Answer true if all cards are in the piles"

	^(self piles inject: 0
			    into: [ :count :pile | count + (pile submorphs size) ]) == 52! !

!Klondike methodsFor: 'testing' stamp: 'KenD 7/2/2011 13:23'!
isMyCard: aCard
	"Answer true if card is asssociated with this instance of the game"

	^self cardDeck contains: aCard! !

!Klondike methodsFor: 'testing' stamp: 'KenD 10/11/2023 07:48:14'!
kenWantsReshuffle

	"This is a hard game, make less hard by redealing 
	  when multiple faceUp cards have same value and color"
	| topCards  |
	topCards := (self columns collect: [ :cardColum | 
				cardColum submorphs at: 1 ] ) asOrderedCollection.
	1 to: (topCards size - 1) do: [ :aCardIndex | | aCard | 
			aCard := topCards at: aCardIndex.
			(aCardIndex + 1) to: (topCards size) do: [ :otherIndex | | otherCard |
				otherCard := topCards at: otherIndex.
				((otherCard suitColor = aCard suitColor) 
					and: [otherCard faceNumber = aCard faceNumber])
				 ifTrue: [ ^true ].
			]
	].
	^ false! !

!Klondike methodsFor: 'testing' stamp: 'KenD 6/23/2015 21:25'!
runStartsFrom: aCard in: aColumn
	"A Card starts a run if all cards above it are in ascending face and
	alternating color."

	| cardIndex cards cardUnder |
	aCard isFaceDown ifTrue: [ ^ false ].
	cards := aColumn submorphs.
	cardIndex := cards indexOf: aCard.
	(cardIndex isNil) ifTrue: [ ^false ].
	cardUnder := aCard.
	[cardIndex > 1] 
		whileTrue: [ 
			| cardAbove |
			cardIndex := cardIndex - 1.
			cardAbove := cards at: cardIndex.
			(cardUnder hasDifferentColorThan: cardAbove)
			& (cardAbove hasFaceOneLessThan: cardUnder)
				ifFalse: [ ^false ].
			cardUnder := cardAbove.
		].
	"cardIndex = 1"
	^true! !

!Klondike methodsFor: 'actions' stamp: 'KenD 8/28/2013 13:03'!
newGame
	"Empty out my Card Containers, shuffle and re-deal."
	
	self removeWinnerText;
		makeUndoStackEmpty;
		removeCards;
	    "Note: (self deck shuffle) is done in (self dealCards)."
		dealCards;
		redrawNeeded ! !

!Klondike methodsFor: 'actions' stamp: 'KenD 11/18/2004 16:51'!
quit
	"@@ToDo: popup dialog Do you REALLY want to Quit?"
	
	super quit! !

!Klondike methodsFor: 'actions' stamp: 'KenD 11/19/2004 14:22'!
removeCards
	"Empty out my Card Containers."
	
	discards makeEmpty.
	self piles do: [ :container | container makeEmpty ].
	self columns do: [ :container | container makeEmpty ]! !

!Klondike methodsFor: 'actions' stamp: 'KenD 8/28/2013 13:02'!
sameGame
	"Empty out my Card Containers and deal the original deal."
	
	self cardDeck startOver.
	self removeWinnerText;
		makeUndoStackEmpty;
		removeCards;
	    "Note: (self deck shuffle) is done in (self dealCards)."
		reDealCards;
		redrawNeeded ! !

!Klondike methodsFor: 'fileIn/out' stamp: 'KenDickey 11/19/2010 15:34'!
restoreGame
	"Put up a dialog to reaf game state from a file.
	See #restoreGameFromDataStream:"

	self restoreGame: 'klo' userMessage: 'Select a Klondike Game File...'! !

!Klondike methodsFor: 'fileIn/out' stamp: 'KenD 12/25/2021 11:51:47'!
restoreGameFromDataStream: aDataStream
	"Given an open DataStream, read and restore game state."
	
	"Game state consists of information to reconsitiute the cards, deck, discards, piles, and columns."
	"NYI: undo stack save/restore."
	| stateArray |
	stateArray := aDataStream next.
	(stateArray at: 1) == #Klondike
	ifFalse: [ Error signal: 'Not a saved Klondike Game!!' ] "FIXME: popup"
	ifTrue: [
		| columnInfo pileInfo deckInfo discardInfo undoInfo |
		cardDeck := CardDeck new initializeFromArray: (stateArray at: 3).
		columnInfo := stateArray at: 5.
		pileInfo     := stateArray at: 7.
		deckInfo    := stateArray at: 9.
		discardInfo := stateArray at: 11.
		undoInfo    := stateArray at: 13.
		
		1 to: NumColumns 
			do: [ :idx |
				(self columns at: idx) restoreFromArray: (columnInfo at: idx) 
									givenDeck: self cardDeck ].
			
		1 to: NumPiles
			do: [ :idx |
				(self piles at: idx) restoreFromArray: (pileInfo at: idx) 
								  givenDeck: self cardDeck ].
		
		deck restoreFromArray: deckInfo givenDeck: self cardDeck.
		
		discards restoreFromArray: discardInfo givenDeck: self cardDeck.
			
		undoInfo isNil
		ifTrue: [ self makeUndoStackEmpty ]
		ifFalse: [ Error signal: 'FIXME: Undo save/restore NYI' ].
	]! !

!Klondike methodsFor: 'fileIn/out' stamp: 'KenDickey 11/19/2010 14:42'!
saveGame
	"Show a file dialog to the user to save a game.
	See #saveGameToDataStream: for actual data save."
	
	self saveGame: 'klo' userMessage: 'Enter File Name to save Klondike Game...'! !

!Klondike methodsFor: 'fileIn/out' stamp: 'KenD 11/23/2004 13:13'!
saveGameToDataStream: aDataStream
	"Given an open DataStream, save the current game state."
	
	"Game state consists of information to reconsitiute the cardDeck, deck, spares, discards, and columns."
	"NYI: undo stack save/restore."
	aDataStream nextPut: { #Klondike. 
							#CardDeck. "NB: CardDeck"
							self cardDeck saveStateToArray.
							#Columns.
							self columns 
								collect: [ :container | container saveStateToArray].
							#Piles.
							self piles 
								collect: [ :container | container saveStateToArray].
							#Deck. "NB: CardDeckMorph"
							self deck saveStateToArray.
							#Discards.
							self discard saveStateToArray.							
							#Undo.
							nil. "FIXME"
						}! !

!Klondike class methodsFor: 'instance creation' stamp: 'KenD 12/24/2021 16:27:39'!
initializedImage
	"Answer a new instance"
	"
	Klondike initializedImage.
	"
	
	^ self initializedInstance openInHand! !

!Klondike class methodsFor: 'instance creation' stamp: 'KenD 12/23/2021 14:39:02'!
initializedInstance
	"Answer a new instance"
	"
	Klondike initializedImage.
	"
	
	^ self newColumn ! !

!Klondike class methodsFor: 'instance creation' stamp: 'KenD 12/24/2021 16:27:52'!
newGame
	"Answer a new instance"
	"
	Klondike newGame.
	"
	
	^ self initializedInstance openInWorld! !

!Klondike class methodsFor: 'file reader registration' stamp: 'KenD 2/3/2016 16:48'!
fileReaderServicesForFile: fullName suffix: suffix
	"FileList buttons that are serviced by us."

	^suffix = 'klo'
		ifTrue: [ {self serviceRestoreKlondike.} ]
		ifFalse: [ #() ]! !

!Klondike class methodsFor: 'file reader registration' stamp: 'KenD 2/3/2016 17:00'!
restoreFromSaved: fullFileName

	| aGame |
	aGame := Klondike newGame.
	fullFileName asFileEntry readStreamDo: [ :file | | aDataStream |
			file binary.
			aDataStream := DataStream on: file.
		     aGame restoreGameFromDataStream: aDataStream.
	].
	^ aGame! !

!Klondike class methodsFor: 'file reader registration' stamp: 'KenD 2/3/2016 16:49'!
serviceRestoreKlondike

	^ (SimpleServiceEntry 
		provider: self 
		label: 'restore game'
		selector: #restoreFromSaved:
		description: 'restore Klondike solitaire game') triggerFileListChanged! !

!Klondike class methodsFor: 'file reader registration' stamp: 'KenD 2/3/2016 16:36'!
unload

	FileList unregisterFileReader: self ! !

!Klondike class methodsFor: 'class initialization' stamp: 'KenD 11/19/2004 11:58'!
includeInNewMorphMenu

	^true! !

!Klondike class methodsFor: 'class initialization' stamp: 'KenD 12/24/2021 15:29:39'!
initialize
"
	Klondike initialize.
"
	FileList registerFileReader: self.
	NumColumns := 7.
	NumPiles := 4.
	^self! !

!Klondike class methodsFor: 'environments' stamp: 'KenD 6/16/2020 16:16:10'!
environmentsExportMe
	"Register me (make me visible) from Smalltalk SystemDictionary"
	^true! !

!CardMorph methodsFor: 'access' stamp: 'KenD 6/2/2020 13:32:06'!
cardColor
	"Answer a symbol denoting the color of this card"
	"clubs diamonds hearts spades => black red red black"

	| suitNum |
	suitNum := self suitNumber.
	(suitNum = 1)
	ifTrue: [^ #Black]
	ifFalse: [(suitNum = 4)
			ifTrue: [ ^#Black ]
			ifFalse: [ ^#Red ]].! !

!CardMorph methodsFor: 'access' stamp: 'KenD 10/20/2004 08:37'!
face
	"Answer a symbol denoting the face value of this card"

	^FaceNames at: (self faceNumber).! !

!CardMorph methodsFor: 'access' stamp: 'KenD 10/20/2004 08:44'!
name
	"e.g. Jack of Hearts"
	^((self face) asString), ' of ', ((self suit) asString)! !

!CardMorph methodsFor: 'access' stamp: 'KenD 10/20/2004 08:37'!
suit
	"Answer a symbol denoting the suit of this card"

	^SuitNames at: (self suitNumber).! !

!CardMorph methodsFor: 'access' stamp: 'KenD 10/28/2004 11:07'!
suitColor
	"Answer a symbol denoting the color of this card"
	"clubs diamonds hearts spades => black red red black"

	| suitNum |
	suitNum := self suitNumber.
	(suitNum = 1)
	ifTrue: [^ #Black]
	ifFalse: [(suitNum = 4)
			ifTrue: [ ^#Black ]
			ifFalse: [ ^#Red ]].! !

!CardMorph methodsFor: 'comparing' stamp: 'KenD 1/10/2013 13:45'!
< aCard
	"Absolute ordering over all cards in a 52 card deck."

	(aCard isKindOf: CardMorph)
	ifTrue: [ ^ (self cardNumber) < (aCard cardNumber) ]
	ifFalse: [ ^false ].! !

!CardMorph methodsFor: 'comparing' stamp: 'KenD 1/10/2013 13:45'!
= aCard
	(aCard isKindOf: CardMorph)
	ifTrue: [ ^ (self cardNumber) = (aCard cardNumber) ]
	ifFalse: [ ^false ].! !

!CardMorph methodsFor: 'comparing' stamp: 'KenD 1/10/2013 13:45'!
> aCard
	(aCard isKindOf: CardMorph)
	ifTrue: [ ^ (self cardNumber) > (aCard cardNumber) ]
	ifFalse: [ ^false ].! !

!CardMorph methodsFor: 'comparing' stamp: 'KenD 10/20/2004 10:31'!
hasDifferentColorThan: anotherCard
	"Answer true if anotherCard has the same color"
	
	(self hasSameColorAs: anotherCard)
	ifTrue: [ ^false ]
	ifFalse: [ ^true ].! !

!CardMorph methodsFor: 'comparing' stamp: 'KenD 1/10/2013 13:45'!
hasFaceOneLessThan: anotherCard
	"Answer true if anotherCard has the same face value plus one"
	
	(anotherCard isKindOf: CardMorph)
	ifTrue: [ ^(self faceNumber + 1) == (anotherCard faceNumber) ]
	ifFalse: [ Error signal: 'Expected an CardMorph, got: ', (anotherCard asString) ].! !

!CardMorph methodsFor: 'comparing' stamp: 'KenD 1/10/2013 13:45'!
hasSameColorAs: anotherCard
	"Answer true if anotherCard has the same color"
	
	(anotherCard isKindOf: CardMorph)
	ifTrue: [ ^(self suitColor) == (anotherCard suitColor) ]
	ifFalse: [ Error signal: 'Expected an CardMorph, got: ', (anotherCard asString) ].! !

!CardMorph methodsFor: 'comparing' stamp: 'KenD 1/10/2013 13:45'!
hasSameFaceAs: anotherCard
	"Answer true if anotherCard has the same face value"
	
	(anotherCard isKindOf: CardMorph)
	ifTrue: [ ^(self face) == (anotherCard face) ]
	ifFalse: [ Error signal: 'Expected an CardMorph, got: ', (anotherCard asString) ].! !

!CardMorph methodsFor: 'comparing' stamp: 'KenD 1/10/2013 13:45'!
hasSameSuitAs: anotherCard
	"Answer true if anotherCard has the same suit"
	
	(anotherCard isKindOf: CardMorph)
	ifTrue: [ ^(self suit) == (anotherCard suit) ]
	ifFalse: [ Error signal: 'Expected an CardMorph, got: ', (anotherCard asString) ].! !

!CardMorph methodsFor: 'comparing' stamp: 'KenD 10/18/2004 05:11'!
hash
	"because = is implemented"
	^ (self cardNumber) hash.! !

!CardMorph methodsFor: 'display' stamp: 'KenD 4/6/2016 16:11'!
flip
	"Turn the card over"

	(isFaceDown := isFaceDown not)
	ifTrue:  [ self image: self backForm ]
	ifFalse: [ self image: self faceForm ]! !

!CardMorph methodsFor: 'display' stamp: 'KenD 11/19/2004 11:41'!
makeFaceDown

	self isFaceDown ifFalse: [ self flip ]! !

!CardMorph methodsFor: 'display' stamp: 'KenD 3/14/2015 20:59'!
makeFaceUp

	self isFaceUp ifFalse: [ self flip ]! !

!CardMorph methodsFor: 'dropShadow' stamp: 'KenD 8/12/2015 06:55'!
dropShadowForm
	"Answer the shadow only for the BlockMorph"

	|  srcForm destForm |
	srcForm := self shadowForm.
	destForm := srcForm copy.
	destForm 
		copy: (0@0 corner: srcForm extent) 
		from: srcForm 
		to: 0@0 - self dropShadowOffset 
		rule: 4. "erase"
	^ destForm
! !

!CardMorph methodsFor: 'dropShadow' stamp: 'KenD 8/12/2015 09:47'!
dropShadowOffset

	^ 8@10! !

!CardMorph methodsFor: 'dropShadow' stamp: 'KenD 8/12/2015 07:47'!
dropShadowShown

	| dsMorph |
	dsMorph := self valueOfProperty: #dropShadowMorph ifAbsent: [ ^false ].
	^ self submorphs includes: dsMorph! !

!CardMorph methodsFor: 'dropShadow' stamp: 'KenD 8/12/2015 07:51'!
hideDropShadow
	
	self valueOfProperty: #dropShadowMorph
		 ifPresentDo: [ :dsMorph |
			self removeMorph: dsMorph.
			self removeProperty: #dropShadowMorph
	]! !

!CardMorph methodsFor: 'dropShadow' stamp: 'KenD 8/12/2015 07:49'!
setDropShadowMorph

	| dsMorph |
	dsMorph := ImageMorph new image: self dropShadowForm.
	dsMorph morphPosition: self dropShadowOffset.
	self setProperty: #dropShadowMorph toValue: dsMorph 

		
! !

!CardMorph methodsFor: 'dropShadow' stamp: 'KenD 8/12/2015 09:43'!
shadowForm
"
	(ImageMorph new image: (CardMorph the: #ace of: #spades) shadowForm) openInWorld.
"
	| aCanvas stencilForm |
	aCanvas := BitBltCanvas depth: Display depth over: self fullExtentRect.
	aCanvas image: self form at: 0@0.
	self submorphs reverseDo: [ :m | aCanvas image: m form at: m morphPosition ].
	stencilForm := aCanvas form. 
	aCanvas := BitBltCanvas depth: Display depth over: self fullExtentRect. 
	aCanvas stencil: stencilForm at: 0@0  color: (Color black alpha: 0.3).	 
	^ aCanvas form! !

!CardMorph methodsFor: 'dropShadow' stamp: 'KenD 8/12/2015 07:57'!
showDropShadow
	
	self 
		valueOfProperty: #dropShadowMorph
		ifAbsent: [
			self setDropShadowMorph.
			self addMorphBack: (self valueOfProperty: #dropShadowMorph)
		]! !

!CardMorph methodsFor: 'dropping/grabbing' stamp: 'KenD 8/12/2015 07:00'!
aboutToBeGrabbedBy: aHand 
	"I'm about to be grabbed by the hand. If other cards are above me in a 
	Card Container, then move them from the Container to being submorphs of me"

	self rememberPreowner.
	(self owner isKindOf: CardDeckMorph) | (self owner isNil)
	ifFalse: [
"
		Transcript newLine; show: ( self name , ' about to be grabbed by ' , aHand name ).
"
		super aboutToBeGrabbedBy: aHand.
		self collectCardsAboveMe;
		showDropShadow;
		yourself
	]
	ifTrue: [^nil]
! !

!CardMorph methodsFor: 'dropping/grabbing' stamp: 'KenD 10/28/2004 14:07'!
acceptDroppingMorph: aMorph event: evt 
	"Delegate to my owning Card Container"
	
	(self owner isKindOf: CardContainerMorph)
	ifTrue: [ ^(self owner) acceptDroppingMorph: aMorph event: evt ]
	ifFalse: [ ^false ]! !

!CardMorph methodsFor: 'dropping/grabbing' stamp: 'KenD 1/22/2013 19:15'!
allowsMorphDrop
	"Answer whether we accept dropping morphs. By default answer false."

	^ true! !

!CardMorph methodsFor: 'dropping/grabbing' stamp: 'KenD 1/22/2013 19:16'!
allowsSubmorphDrag
	"Answer whether our morphs can just be grabbed with the hand, instead of requiring the use of the halo. By default answer false."

	^ true! !

!CardMorph methodsFor: 'dropping/grabbing' stamp: 'KenD 10/1/2021 13:30:47'!
collectCardsAboveMe 
	"I'm about to be grabbed by the hand or otherwise moved. 
	If other cards are above me in a Card Container, then move 
	them from the Container to being submorphs of me"
	| idx cards |
	cards _ owner isNil ifTrue: [ nil ] ifFalse: [ owner submorphs ].
	cards isNil ifTrue: [ ^self ].
	idx _ cards indexOf: self ifAbsent: [^ self].
	idx = 1 ifTrue: [^ self].
	(cards copyFrom: 1 to: idx - 1)
		do: [:m | m class = self class
				ifTrue: [self addMorphBack: m]].
	"set my extent to include submorphs"
	(self owner isKindOf: CardColumnMorph)
	ifTrue: [ 
		self morphExtent:
			(self width
			 @	
			 (self height + (self submorphCount * (
							self owner pixelsPerOverlap))))].
						
	(self owner isKindOf: CardDiscardMorph)
	ifTrue: [
		self morphExtent:
			(self width + (self submorphCount * (
							CardDiscardMorph  pixelsPerOverlap)))
			 @	
			 (self height)
	].
	self redrawNeeded.! !

!CardMorph methodsFor: 'dropping/grabbing' stamp: 'KenD 1/15/2013 15:02'!
forgetPreowner
	
	grabPreowner  := nil! !

!CardMorph methodsFor: 'dropping/grabbing' stamp: 'KenD 1/15/2013 14:58'!
grabPreowner
	^grabPreowner ! !

!CardMorph methodsFor: 'dropping/grabbing' stamp: 'KenD 12/26/2021 10:47:24'!
justDroppedInto: aMorph event: anEvent
	"Someone just dropped me.."
	
	self scale: 1.0.
	self hideDropShadow.
	"Tell my container"
	(self owner isKindOf: CardContainerMorph)
	ifTrue: [ ^ (self owner) dropComplete ]
	ifFalse: [^ false ]! !

!CardMorph methodsFor: 'dropping/grabbing' stamp: 'KenD 12/26/2021 10:47:55'!
rejectDropMorphEvent: evt
	"Drop rejected. If have submorphs, give them back to the container."
"	
	Transcript newLine; 
		show: ('>>rejectDropMorphEvent>> :' ,self name ,
		           ', grabPreowner ' , self grabPreowner name ).
"
	self hideDropShadow.
	self scale: 1.0.
	
	(self grabPreowner isKindOf: CardContainerMorph)
	ifTrue: [self grabPreowner addCard: self.
		 	self submorphs reverseDo: [ :m | self grabPreowner addCard: m].
			(evt isNil) ifFalse: [evt wasHandled: true].
			self redrawNeeded ]
	ifFalse: [ super rejectDropMorphEvent: evt.].! !

!CardMorph methodsFor: 'dropping/grabbing' stamp: 'KenD 1/15/2013 15:01'!
rememberPreowner
	
	(self owner isKindOf: CardContainerMorph )
	ifTrue: [grabPreowner := self owner]
	ifFalse: [grabPreowner  := nil] "no funny stuff.."! !

!CardMorph methodsFor: 'dropping/grabbing' stamp: 'KenD 10/25/2004 14:39'!
wantsDroppedMorph: aMorph event: evt 
	"Ask my container."
	
	(self owner isKindOf: CardContainerMorph)
	ifTrue: [ ^(self owner) wantsDroppedMorph: aMorph event: evt ]
	ifFalse: [^ false]! !

!CardMorph methodsFor: 'dropping/grabbing' stamp: 'KenD 10/29/2004 09:46'!
wantsToBeDroppedInto: aMorph 
	"I want to be dropped onto a Card or a Card Container"
	^ (aMorph isKindOf: CardContainerMorph)
		| (aMorph isKindOf: CardMorph)! !

!CardMorph methodsFor: 'event handling' stamp: 'KenD 1/21/2013 10:01'!
click: evt localPosition: localEventPosition
	"ignore this and wait until #firstClickTimedOut: arrives"
"
	Transcript newLine; show: (self name , ' got #click:localPosition:'). 
"
	(self owner isKindOf: CardDeckMorph)
	ifTrue: [ self owner click: evt localPosition: localEventPosition ]
	ifFalse: [ ^false ]! !

!CardMorph methodsFor: 'event handling' stamp: 'KenD 1/21/2013 10:01'!
handlesMouseDown: evt 
"
	Transcript newLine; show: (self name , ' got #handlesMouseDown:').  
"
	^ true! !

!CardMorph methodsFor: 'event handling' stamp: 'KenD 2/15/2013 14:37'!
processMouseDown: evt localPosition: localEventPosition
	"Do nothing upon mouse-down except inform the hand to watch for a 
	double-click; wait until an ensuing click:, doubleClick:, or drag: 
	message gets dispatched"
	| container containerOKsPickup |
"
     Transcript newLine; show: (self name , ' got #processMouseDown:localPosition:').  
"
	container := self owner.
	(container isKindOf: CardContainerMorph)
		ifFalse: [^ self].
	containerOKsPickup := (container okToPickUp: self).
	containerOKsPickup | (container isKindOf: CardDeckMorph)
	ifFalse: [
		evt wasHandled:  true. "@@ Don't let World open a menu"
		^ self]
	ifTrue: [
			evt hand waitForClicksOrDrag: self 
					 event: evt 
					 dragSel: #click:localPosition:
					 clkSel:  #click:localPosition: .
		containerOKsPickup
		ifTrue: [ |hand|
			hand := self runningWorld activeHand.
			(localEventPosition < self morphExtent )
			ifTrue: [hand grabMorph: self] "Close to cursor"
			ifFalse: [self aboutToBeGrabbedBy: hand. "Far from cursor"
					hand attachMorph: self].
			evt wasHandled:  true
		]
	]
! !

!CardMorph methodsFor: 'geometry' stamp: 'KenD 12/27/2020 14:55:35'!
displayFullBounds
	"Answer enough room for our shadow, even if not present."
	| r |
	r _ super displayFullBounds.
	r ifNil: [ r := 0@0 extent: self morphExtent ].
	^r quickMerge: (r translatedBy: self dropShadowOffset)! !

!CardMorph methodsFor: 'geometry' stamp: 'KenD 8/12/2015 09:07'!
fullExtentRect

	"Answer a Rectangle which covers my extent and those of my submorphs -- even when drawn outside my bounds"
	| rect |
	rect := 0@0 corner: self morphExtent.
	self submorphsDo: [ :s | 
		rect := rect merge: ( Rectangle origin: s morphPosition extent: s morphExtent ) 
	].
"Transcript newLine; show: rect printString."
	^ rect! !

!CardMorph methodsFor: 'geometry' stamp: 'KenD 10/18/2004 13:37'!
height

	^self faceForm height! !

!CardMorph methodsFor: 'geometry' stamp: 'KenD 1/14/2013 20:34'!
minimumExtent

	^self faceForm extent
! !

!CardMorph methodsFor: 'geometry' stamp: 'KenD 10/18/2004 13:38'!
width

	^self faceForm width! !

!CardMorph methodsFor: 'geometry testing' stamp: 'KenD 9/30/2021 12:38:49'!
submorphsMightProtrude
	"Because of dropshadows"
	^true! !

!CardMorph methodsFor: 'initialization' stamp: 'KenD 8/29/2021 12:03:55'!
withCardNumber: cardNum
	"Private"
	
	isFaceDown := false.
	"NB: Must set cardNumber before #initialize"
	cardNumber := cardNum. 
	super initialize.
	grabPreowner := nil.
	self image: (self faceForm);
		color: Color transparent;
		yourself! !

!CardMorph methodsFor: 'initialization' stamp: 'KenD 6/2/2020 13:28:39'!
withCardNumber: cardNum image: form
	"Private"
	
	super initialize.
	isFaceDown := false.
	cardNumber := cardNum.
	grabPreowner := nil.
	self image: form;
		color: Color transparent;
		yourself! !

!CardMorph methodsFor: 'testing' stamp: 'KenD 10/28/2004 11:08'!
isBlack
	^(self suitColor) == #Black! !

!CardMorph methodsFor: 'testing' stamp: 'KenD 10/19/2004 13:14'!
isCardMorph
	
	^true! !

!CardMorph methodsFor: 'testing' stamp: 'KenD 4/6/2016 16:09'!
isFaceDown

	^isFaceDown! !

!CardMorph methodsFor: 'testing' stamp: 'KenD 4/6/2016 16:12'!
isFaceUp

	^ self isFaceDown not! !

!CardMorph methodsFor: 'testing' stamp: 'KenD 10/28/2004 11:08'!
isRed
	^(self suitColor) == #Red! !

!CardMorph methodsFor: 'private' stamp: 'KenD 10/18/2004 12:20'!
backForm
	"form for this card's back side"

	^FormsArray at: 53.! !

!CardMorph methodsFor: 'private' stamp: 'KenD 10/18/2004 05:09'!
cardNumber
	"private"

	^cardNumber! !

!CardMorph methodsFor: 'private' stamp: 'KenD 8/30/2021 14:31:22'!
faceForm
	"Answer form for this card's face"
	
	"Zero based card numbers -> 1 based array => add 1".
	"Sometimes invoked _before_ initialize .. 8^(" 
	^FormsArray at: (cardNumber ifNil: [1] ifNotNil: [:cn | cn + 1])! !

!CardMorph methodsFor: 'private' stamp: 'KenD 12/28/2010 14:44'!
faceNumber
	"Private;  Answer 1..13"

	^((self cardNumber // 4) + 1)! !

!CardMorph methodsFor: 'private' stamp: 'KenD 4/17/2013 20:31'!
saveImageToFile: aFileName
	"NB: overrited file without question"

	(self form) writePNGfileNamed: aFileName! !

!CardMorph methodsFor: 'private' stamp: 'KenD 10/20/2004 08:36'!
suitNumber
	"Private: Answer 1..4"

	^((cardNumber rem: 4) + 1)! !

!CardMorph class methodsFor: 'accessing' stamp: 'KenD 9/30/2021 14:00:52'!
cardExtent

	"Answer the image extent"
	^(FormsArray at: 53) extent! !

!CardMorph class methodsFor: 'accessing' stamp: 'KenD 8/12/2015 06:46'!
dropShadowMorph

	^ DropShadowMorph ! !

!CardMorph class methodsFor: 'accessing' stamp: 'KenD 8/12/2015 06:46'!
dropShadowMorph: newShadowMorph

	DropShadowMorph := newShadowMorph! !

!CardMorph class methodsFor: 'accessing' stamp: 'KenD 10/21/2004 17:59'!
extent

	"Answer the image extent"
	^(FormsArray at: 53) extent! !

!CardMorph class methodsFor: 'accessing' stamp: 'KenD 10/21/2004 18:00'!
height

	"Answer the image height"
	^(FormsArray at: 53) height! !

!CardMorph class methodsFor: 'accessing' stamp: 'KenD 1/9/2013 20:01'!
morphHeight

	"Answer the image height"
	^(FormsArray at: 53) height! !

!CardMorph class methodsFor: 'accessing' stamp: 'KenD 1/9/2013 19:59'!
morphWidth

	"Answer the image width"
	^(FormsArray at: 53) width! !

!CardMorph class methodsFor: 'accessing' stamp: 'KenD 10/21/2004 17:59'!
width

	"Answer the image width"
	^(FormsArray at: 53) width! !

!CardMorph class methodsFor: 'private' stamp: 'KenD 8/30/2021 14:28:45'!
defaultImage
	^FormsArray at: 1! !

!CardMorph class methodsFor: 'private' stamp: 'KenD 11/9/2022 15:12:34'!
encodedStringFromFile: aFileName
	"Read binary file and return a Base64MimeConverter'ed ascii string"

	| aFileStream aMimeStream |
	aFileStream := UniFileStream new open: aFileName forWrite: false;  useBytes.
	aMimeStream := Base64MimeConverter mimeEncode: aFileStream.
	^(Clipboard storeObject: (aMimeStream contents)) retrieveStringOrText asString.! !

!CardMorph class methodsFor: 'private' stamp: 'KenD 10/5/2006 09:40'!
formFromEncodedString: aBase64MimeString
	"Return a Form based on a Base64MimeConverter'ed string"

	| decodedStream |
	decodedStream := (Base64MimeConverter mimeDecodeToBytes: aBase64MimeString readStream).
	^(Form fromBinaryStream: decodedStream)! !

!CardMorph class methodsFor: 'private' stamp: 'KenD 10/20/2004 08:56'!
includeInNewMorphMenu
	"Private"

	^false! !

!CardMorph class methodsFor: 'private' stamp: 'KenD 2/1/2011 03:03'!
savePNGimagesToDir: dirName

	"Save card images to files"

	| imageDirNamePrefix |
	($/ =( dirName at: (dirName size)))
	ifTrue: [imageDirNamePrefix := dirName]
	ifFalse: [imageDirNamePrefix := dirName , '/'].
	1 to: 13 do: [ :faceNum |
		#( $c $d $h $s) do: [ :char |	 | aForm |
			aForm := FormsArray  at: ((faceNum - 1) * 4) + (#($c $d $h $s) indexOf: char).
			aForm writePNGfileNamed: (imageDirNamePrefix, faceNum asString, char asString, '.png').
			]
		].
	(FormsArray at: 53) writePNGfileNamed: (imageDirNamePrefix , 'back.png')! !

!CardMorph class methodsFor: 'private' stamp: 'KenD 11/9/2022 15:00:46'!
showFormEncodingsFromPNGtoFile: outFileName

	"Show Base64MimeConverter strings"

	| imageDirNamePrefix outStream |
	
	imageDirNamePrefix := 'PNG-deck/'. 
	outStream := UniFileStream open: outFileName forWrite: true; useBytes.
	1 to: 13 do: [ :faceNum |
		#( $c $d $h $s) do: [ :char |	 |aFileName|
			aFileName := imageDirNamePrefix, faceNum asString, char asString, '.png'.
			outStream cr; nextPut: $"; nextPutAll: (faceNum asString, char asString, '.png'); nextPut: $".
			outStream cr; nextPut: $'; nextPutAll: (CardMorph encodedStringFromFile: aFileName); nextPut: $'
			]
		].
	outStream cr; nextPut: $"; nextPutAll:  'back.png'; nextPut: $".
	outStream cr; nextPut: $'; nextPutAll: (CardMorph encodedStringFromFile:   imageDirNamePrefix, 'back.png'); nextPut: $'.
	outStream cr; cr! !

!CardMorph class methodsFor: 'class initialization' stamp: 'KenD 2/1/2011 03:34'!
initialize

	ColorNames := #(Red Black).
	FaceNames  := #(Ace Two Three Four Five Six Seven Eight Nine Ten Jack Queen King).
	SuitNames   := #(Clubs Diamonds Hearts Spades).
	FormsArray := (
    #(
"1c.png"
'iVBORw0KGgoAAAANSUhEUgAAAEkAAABhCAYAAACajIyHAAACAklEQVR4XuXdUY6DIBAAUL25
R/NmbGzXLGUBh+2mkrxJ/Gjan76M44CCSyXSsqzwcfz/fqRt25Icx//vQaV935Mf6eFQg6oC
yVlVQjUxjnPUP/UeUGvnBytfo76L+dr5cuWzqYl0ZtH5Izmbmkg5TA7mI1WyqIbmIxW1qDx8
pCyLWoeYTb+QehmjZtMLUp5FZcb0vqOQevVHrk3dZtIPH8lH+gjSMU2QD3DleabLsZvcH4XG
bn637SP9DSmvQ8+pyx+g87NYn5odtz9+C3bc/myAn0nv16Sz9pz1SO6Zuh23f7ck0HGXVzcf
yQ8fyUfykXwkH8lH8pH88JF8JB/JR/KRAjHroHoapBJoJqhpkGaeKvaRfCS/JhlIJUzt+YMZ
wG5DamXO1XEH1G1I7yza85F8JB/p365mtadayJrUGqvVbrOzV7fIaejPAlRi1uc0/fkkH8lH
8pF8JB/JR/KR/PCRfCQfyUfykaaPyHSMn0npeuUDiTS6hoZEGl2NRSKN3nTwM8nPpOuaFFlr
zF/dIvf1fCQfabw+1Xolv+MOrC/2O25/7OYj+UifvKJdfcd33JFdENnTbWQ/TRZpZGdWunBH
HzmkkaK7Rftjt8C+4/7YLbCDvd9MpuvnNH2kFL5b4r8aqL/RVvaCF3kjqVqSDL0qSIwWkP9W
rsYp1oTy3+/2Gl+L15jCBKjM+gAAAABJRU5ErkJggg=='
"1d.png"
'iVBORw0KGgoAAAANSUhEUgAAAEkAAABhCAYAAACajIyHAAABvklEQVR4XuXdTY6EIBAGUL25
R/Nm9E9iojQFZWYhk1eJm3Yz/fJJF+jI0qiyLCt8fL5/v8q2bUWuz/fvQZV934tf5evQgmoC
yWg1VHyJvc/5l94Xag0li38JHoP5GqfoOHykNUzRgSWnKU7SCeYC5iOVGAVOUztJ57GoPnyk
U4qCQ0zTb5J6iUHTdEE6p6hOTO+claTe+AOPTf1m0i8fyUfykWZDwie3QyR/qSS7CgB32rkJ
rj8lGUxL/EmunyR/TPJ/3fw+ye+4fSQfyUfykXwkH8lH8pF8JB/JR/LLR/KRfCQf6eev8pGG
QJOtpU+FNOuS8TRIM998mAJp9kcQn0fK3Od7eIx6FukO0INQfpL8Mcn/dfP7JL9P8jtuf+7m
rwL45SP5SD6Sj+Qj+Ug+kl8+ko/kI/lIPpKP9P8lfKRejf6HhkfKLBnTSNmbDy7Sjft8fpL8
JPljkv/r5vdJfsftI/lIfvlIcSM5OEci3X0Loj8tSZxjke48gmgP3MmHWP0JbuJt0X4LkHjv
uL8KkHiDvZ+kemzym8k/LZX4WwNFKaq3DOJ3u2l9lt4qSEXrbjrl78q15bYv8/d3u9YLJiD2
Esw8m+AAAAAASUVORK5CYII='
"1h.png"
'iVBORw0KGgoAAAANSUhEUgAAAEkAAABhCAYAAACajIyHAAAB8klEQVR4XuXdUY6DMAxFUdg5
S2NnmWlHSJDGIUjV4PZYykebn3L1CC92iqdGlGma4fG4/n6UZVmKHI/r74Eq67oWP8qTQwtU
E5AMrQYV32K/c/6t9wQ1hySLfwtui/kcq2gbPqQ5VNEGS1ZTrKQdmAMwH1KJocBqaitpvxbV
w4e0U1EwRDW9KqmnGFRNB0h7FdWK6c1ZSuqtP/Da1DeTfviQfEg+pESOu96W+I47MJPNz76Z
nM6HD8mH5O/d/CzAP1sAf8Ee9El+IWDUTOJFAN9x+5B8SD4kH5IPyYfkQ/LDh+RD8iH5kHxI
PqR3xSecP7gVUitV/HK6LkHi7zZI3Vz63y9Lk2O/T0kjVZkkeXYfkg/pm9ekZHW/ey3AB6go
pQXIWD1OZSazltdTbEuynz9Is3eLQGWoHqfa4GY9f5AuC5Dx/EHOVEmy8wd+PsmH5EPyIfmQ
fEg+JB+SHz4kH5IPyYfkQ/IhfRkJH1IvznJYPKSRbKgNabC+x0K6UqFxlXShWuxD8iFdXLD9
2+380R9ZAd8n+Y7bh+RD8iFle/yfzJGQrv4LwTeTA3O+mfT3bn4W4H1qqsD5jruhprP3jvuZ
yYE32PtKqtcm30yOZQMCSH5roEhFdcsgvttN67vhVkEqtG7TKb8r1zLWvszv73aMH9dONnIV
J6kqAAAAAElFTkSuQmCC'
"1s.png"
'iVBORw0KGgoAAAANSUhEUgAAAEkAAABhCAYAAACajIyHAAACsUlEQVR4XuWd646DIBBG65v7
aH0zNu2uCaWAoHNjDwl/amPk+M0wg1welZIejw1cX+3vl7TveyKXV/t7oNLz+Uz8kt4caqCq
gMiqKkE1YbxslG96b1Bb5w8b3kf9OfOtc3HDq6kJ6VDR8SeympqQcjA5MD6kiopq0PiQCl9U
Vj6kTEWtSlTTF6SeYqhq+oCUq6hUTO8aClLP/5B9UzeY5Bc+JD4kU0geAKO9tC4kj1GA3zGc
LdTg32mCa93tRxye6eZu1tH2oaKjRlHTF6TyQcuq+eBe6l0qd4uaUIeB5GXit31S3tNoPrCn
iS8TAkQfnmlCsuppzgBFAOWalowC8gblBunMD0XyT26QZlXkqSYXSFcBeYEyh3QXkAcoU0hS
gKxBmUGSBmQJygSSFiArUOqQtAHZJd5KkK7GQlerVgylBskakCYoFUhegLRAiUPyBqQBShyS
laO2dOSikKKoSFpNopCiqEhaTWKQoqlIUk1ikKKpSFJNYpAirzoKASmqqUmZnAikqKYmZXIi
kFZY6MeHxIfEh/ThN2Z+Xw6S1NePVuO8v66ECAGOLroFSer+ywaT+VvumckdNS2fu+VvuddA
z8/irqMAuYpaEPJGek2wcBt0KxswAunO/cONcV+ZlDUzHdB60pfq15LabNqWj5h1vLP3X2Yu
wFWnH3rOpFVZds6k/UNsYRdIu0PiTyxVjKsQkPhzJv9Z4UPiQ5qP0WoxGV9J6XwNDRrS6Gos
LKSZKJ8PiQ9JJqnm+6SBgBXfu42sIOeHAPwQYC6q5kfc/LSED4kPya/R43vXISHN7oKINbeZ
/TT5uRs/d5vzTX0/Bc/dSiD83K2iprN9x/kJ7sAO9vxgMp2fhcCHND4KwD8aqL8bWXbAC/mI
oJpIpo4KIpYWIP6pXA0Ta4Lin+/2WX4A3ungSTLYqEsAAAAASUVORK5CYII='
"2c.png"
'iVBORw0KGgoAAAANSUhEUgAAAEkAAABhCAYAAACajIyHAAACG0lEQVR4XuXd8Q6CIBCAcXlz
H803o5lZSAd3VMSxj81/mlv6C4/zElmEFpclgLf9/OstrusayW0//xpU3LYt8lu8O0hQF6BD
89UFib0rh3pDkK5VIlRy6QURSPuM0h7BPBh35CMpXS5gRz0ViQ6kIvGBFCQ+kIJ05AdBTAv4
SFkvkpJLPlIlkeSnAHyk3yST/MDNR+IjdUPaR7Y0VyLXmdRkklwmUZFGjGxnEntuXnqvG6Qc
yBPUBSmNQ9Kv2jM+ec7NLkh5HCptPeLTNEgt/03xe9KAnjRlTDpjz3mgPXKmHEZKOzyADatM
lnqOto2AqmbcPQ/um//qMfdufCQ+Uv/RTEpmXcakEVCl0dX16DbugHyVil0heS3P8CuTfCQ+
Eh+Jj8RH4iPxkfiNj8RH4iPxkfhIfCQ+Er/xkfhIfCQ+Eh+Jj8RH4iPxkfhIfCQ+Eh+Jj/RZ
4z8L0HRA/KdKno3/fFIjEP9JN+Wy4j8zyUeaH8kS99zFpBEzArSZD65Gt3/NLWmdQ+MmT/rn
aNY6G8sNkpe5ddJ3I5H4PakxJlnmGiNjkvbjuL7BHXGvNh2S1/IMHskyv5hfmZyx6MZH4iPN
evJ6bsZH4iPpSOmQX3sJKRpJypnyNIAfuDMgfjL5ARAfKdpeWoNGsr7Vh58CmNdH4CMZPoMu
DVQq477vkyzwQnx1a62eZFoqiNxKQPxVuQqXWBGKv77btd0AprIrTe5suPAAAAAASUVORK5C
YII='
"2d.png"
'iVBORw0KGgoAAAANSUhEUgAAAEkAAABhCAYAAACajIyHAAAB4UlEQVR4XuXdgW6DIBAAUP1z
P80/Y2vTJbYFwdiOw3dJk8Usnb7AcTBapkykaZrh1+359yMty5LkuD3/HlRa1zX5ke4OOagn
oPvPv9f+XiLeK9R7F9sAyVCbrjfngWrXkHgk87nlN32kWt9McFKvIulAVSQfqILkA1WQikB+
4n5Hql2zu1umkPRLAB/pQ8Wkn7h9JB/JR4qAhCZrf1ry6WlJlwW3YK13v+LusTIZsCZ7R9or
JL9881HX1cO0pK6td4ScVAKKAtV/dGvp3p1zVN866QhQR6j+FfclWtI/xNA5KQJU6NEtAlTo
OqnzHQ1QcUeB8teTrrae5IeP5CP5SD6Sj+Qj+Ug+kh8+ko/kI/lIPpKP5CP54SP5SD6Sj+Qj
+Ug+ko/kI/lIPpKP5CP5SOfvykeqAvn7k8rh73Q7COTvmWwE8nff5nKQv4/7JNC3oXbe229J
qf4ZGj4ntYyo9OjW+jfdOulA96Yr7iFbUo+521A5KUI3Dz26RW+9PtKw60k+ko/kI10yWTfM
E30kH6mOlPvC0TEq7k61Uamo9BN3Q9XtI/nTkvNAPFLrVx/5ibthWcZHajhV44FkHg1U/AfE
Jl6PDGJPuSmtTDYdFaSXBbuHTvmnci1tx5f557s9xw+7nG+0Wjc9XAAAAABJRU5ErkJggg=='
"2h.png"
'iVBORw0KGgoAAAANSUhEUgAAAEkAAABhCAYAAACajIyHAAACFUlEQVR4XuXdja6DIAyGYb1z
L807636yJcqgrdmUj70kS07ciZuPgKVDmSrFpmkGvx7H7xdblsXI5XH8HpSt62r8Yk+HGtQO
6Pn3fdv7RcQroT6b2AaIDLVpenMdKNoGKa/OfM78Jx8papsG7tRDJDpQiMQHCpD4QAFSE4jf
cX8iRdvYza0SSPJDAD7Sj4JJfsfNR+Ij8ZFE4iT+2K1AqibbTswpbfdf7tt7r29N8i7/Pw4D
yhNQq70KSb9uSDWE3f4b7/WACpvbaV8yczJEAtp+EffwSHbBryX/gHT2pT9q1tJ9UvWMn/fp
8rWoe8R9tDbphACiUFrBpCBU7+GQzAC3BaUwXpTKAqhO0pBLlShmHDTzSWK5dH7SjY/ER+Ij
8ZH4SHwkPhK/8JH4SHwkPhIfiY/ER+IXPhIfiY/ER+Ij8ZH4SHwkPhIfiY/ER+Ij8ZG+/lZ8
JK/wZ5Ukgfjzk5JA/JluSSD+nMkkEH72LX8ed/ZSr3JHgLPvbkhK95ZEYUe/miRyl1Im7GAj
JT8Di3Qk7NDskxzES29vVQ0BLrubexSkEuPK5wIcef4BOp+UfZIGP+k2bNKNj8RH4iP94dGL
R9x8pHGQag8c5YcATg6JHyd9kVPiI5ly0m0QIP7YLflrMb/jTiTx+EiJVTVeSMylgZrZ0U0p
lwzCrnLTSrallgqihwXuolP8VbmW3PJl/PXd9uUGP10xn3DcVwcAAAAASUVORK5CYII='
"2s.png"
'iVBORw0KGgoAAAANSUhEUgAAAEkAAABhCAYAAACajIyHAAACGUlEQVR4XuXd7a7CIAyA4XHn
u7TdGcavOFmhnWG0+DYxJsYf23PKKAiHRYi8LAn8ut9/O/K6rpkc9/tvQeVt2zI/8sNBgvoC
emp+UpCYXSXUAUFqq0SoXdNLIpD2GSVeD/Nk/CIfSUm5hO31VCQ6kIrEB1KQ+EAK0rM+SGJZ
wEcqskgqLvlIjUKSXwLwkfoUk/wHNx+Jj3Q5Eh+QX3H3qbg95pKiZW+zmPSYdIuYvQek95Ck
9rpyDjzqlPEBqZZFV1947Y8T4YeJEEie2dtlgLt/9wCKAOVaAliBvKGqSOUNXHGBv/wEjRqW
nM0iz2xyQ9I6iNG9Kx/p35pb2aOim1uZTe8MKXtU6Tv4+aSIU8WhkKYZu/GDj8RH4iPxkfhI
fCQ+Ej/4SHwkPhIfiY/ER+Ij8ZH4EnwkPhIfiY/ER+Ij8ZH4wUfiI/GR+Eh8JFPw1wKcuiD+
qhIxc/jrk4Tgr3T74fnDXzPJR+rb3PjruBs9mdeOAMvOB1ekKHtLtD007nWS5y4l626sEMWk
x363M/v6wlTco+uiKZFGj93OZG+4sdvI3dzWXeshp0pGXo8le/nzSTOUADNkLx9pxkk3PhIf
adab1wfSfCQ+ko607/ZDD3CjdPvSPyHlP7iNBSUfiV9x9xlQo5GsMw78EsB8PgIfyfAZ9Gig
2qTb8Tu7A16IRwS1Jt1MRwWRowbEP5Wr0sSqUPzz3b7jBhV420mz33FRAAAAAElFTkSuQmCC'
"3c.png"
'iVBORw0KGgoAAAANSUhEUgAAAEkAAABhCAYAAACajIyHAAACMElEQVR4XuWdga7CIAxFx5/v
0/ZnvOypkSEFNoW2O03MYmIiO5QLlAJLweKyBPBnf/+6xXVdI9n296+Bitu2Rb7Ffw4lUAdA
kiuSQX00sRIgYjNMml74AJQCefwwYJveU8xDg2RA61MVEh9QA9ILEFmPmpA0hPvRm7z/z8pw
pKlJeeFnAbIEqgipVLDRkGrTBJOQ8lqc4UnuIOWiPUOT3EHS6N3cadLcudGxImrftYCpQZI8
p/XRAKUG6ZugmBlIe4293H1//roGbwFptHDfAtLowtV6s/RpWpNm1GBprpY3cXO9W1rIUgFH
6ZNUOSajANJIe9bI22p45gDJsnjyPckTJEk4R4+Z3EYmU8+ir+hWR9wWQ6m4KAAfEh8SHxLf
+JD4kPiQ+JD4kPiQ+JD4xofkD5Lr/CQNQPxcALEgzrJK+JD4kPiadCtI/Pyki57Dz0/q1CA3
WSV8SHxIvjXJVX6S1lzNfH6Sncmk4fwkbXORn8Q3PiQ+JD4kPiQ+JD4kPiS+8SHxIfEh8SHx
IVm0nnAM35Nie+cDEtLZPTRISGd3YyEhnV10QEYm3XvSjBj32b3G+NWSnnU9/LqbaUhWVnB7
dBAPqWd/MT8XwPLcjZ+fdBEUP9Pti95OewCLzr7tPQURDan3PE0+JOHgCL4mCZ5kXriluZxG
XIkfmfTcu1nQRH6M+yIgPqTYd7PGE9ICvpOkLtz5lUHQY8hkSF1XBZFNAsS/lUtoYiIo/v1u
R/sDcfKRA6f28EMAAAAASUVORK5CYII='
"3d.png"
'iVBORw0KGgoAAAANSUhEUgAAAEkAAABhCAYAAACajIyHAAAB3klEQVR4XuXdbY6DIBAAUL25
R/NmbNtsNn6g0O0GmH2TmLS/pK84IKBMmUjTNMPH8/ffR1qWJcnx/P13UGld1+RHejnkoPZA
j+/ZA4Y6X2IZILGWbS69+QS0BXl9xmrRnmPOIB2qnAxURPKBCkg/QHA+KtckP3HX56QTWptS
+UhV5xkIKo+UK2SDgo+aB7NIx8K2KHSPc4Zq3a6ARoGqz0ktclDpIJHeAeoI5dekEEj/Iic1
+gdDtm7bgrcqaKh+UtcCR+lxd6/6w9+7DdzK+DUp4lCJP+g2aOsWEmnEJMr2uH0kH8lH8sNH
8pF8JB/JR/KRfCQfyUfykXwkFins+qSWQCHWJ3WKcPNuvYHCzOD2BvLXJ+VykL+q5EMgf32S
X5P8nOS3bn4/ye9x+/du/iiAj+Qj+Ug+ko/kS/hIPpKP5CP5SD6Sj+SHj+QjfSDhI91F6Rka
HqlmyJhGqp18cJHemOejx7jj1qTGsyXhclKvebcwrdvIj9n7awFC9Lj9VSV/COSvT/Jr0tA5
KVQXYOQ3Etr9pMr3ado97srz2OuTQiP1bjB8pOA3uL0vcX/49pdAPlIGKLcvwjeSuTVQTeI+
bhnkvZascI9Yt1UQHFdA/q5cF5fYJZS/v9s+vgB+dc3VI21S/gAAAABJRU5ErkJggg=='
"3h.png"
'iVBORw0KGgoAAAANSUhEUgAAAEkAAABhCAYAAACajIyHAAACJUlEQVR4XuXdDW6DMAyGYbg5
R+NmWVttEwTnh5I4H7yRkDohDfpg0uAYmIwWpmkGL+/vn29hWZZAbu/vn4MK67oGfgsfBwtq
D/T621zAUMdTzAAiRtnm1JsPQFuQz2dYFO05ZgMpCjkyUBGJD1RA+gcC90flSHLquLcHI/7/
uXVSfdIBrRNQjJFbh0GyEHbbSKwbAWUjWSCtIykFVLMoIKWOctOjeHckl1+3JyB5XBd9A6TT
J/ltXT6KhiOdjSb9IcBgKLnB5N+OxwO7Xjtaghp9SXRAMn/VHHbYZdjRLJIGdp6qF9VSSB6n
dpfTbUj4i+Ww8tdu8IkAftKt1ThJsX/QHEzyc9zjR9x8JD4SH4nf+Eh8JD4SH4mPxEfiI/GR
+Eh8pEcgPas+qTPQM+qTHIDuVZ/ks2V+VQkfiY8k0Cfx65MuRhN/CMCvT7oEhR1M1kLJ1Sep
QWnWJwlB6dYniUBJ1yeJ7BU/VcLPJ/GR+Ej8xkfiI/GR+Eh8JD4SH4nf+Eh8JD7SgMwDHymU
c1h4pJpsKBupcn4Pm5k8M0PDzXGfmC3mzpbcEcl73u3M8w/QM7i1T9Lg1wKoj7j5VSWtOk9y
fRK/0q1XFDk861LrskQAqXbYwY6kyudpsu8IqERn31tyB6QYw/supWQ08/NJ/KTbpVOPn779
EoiPZABZ70X4RWK+Gqim445fGcR7LFlhsFr3qiBwSwHx38qVOMWSUPz3u+3bDz5sEVrQyAZX
AAAAAElFTkSuQmCC'
"3s.png"
'iVBORw0KGgoAAAANSUhEUgAAAEkAAABhCAYAAACajIyHAAACQUlEQVR4XuWdYY6EIAxG5eYe
zZuxmd0hwyBQNAttfU3M/DGjPttS4EO2isVtC+Dj9fx9i/u+R7K9nr8HKh7HEfkWfznUQH0B
arkiGdQpxGqAiGGYhV44AcqB/J0YsKH3TuZBIBnQ+akLiQ9IgJQAkfORCEkzcVvzXjEnfZrC
NSVA8mBLnluFVCsoV0CyGuJVSOkmE6wVnpRfIz8s9ACqkMo3OvvNtgBZAaXeukmALIAaStyr
Q8waKFVId8Z6UJCuepGmN4mQZgFsNQ7SoVEWDPXdZtzYIyDNbt16dVH+azbcVtVJ+XXSf5fe
WztHHZJ2YWdxqPgEScoVM9+mm76bJiRX40kJVJlEqQNvaiXAIyCVCZw8aanad+ND4kPiQ+Ib
HxIfEh8SHxIfEh8SHxLf+JD4kB4NyaU+aaW50SdpA3KhT9Iwd/okK4DM65OsAOLrk/j6pNGL
8/VJ/+ZFpvVJq5p7t/okPiSj4eZGn6ThTa70STaqW+P6JH7fjT+exIfEh8SHxIfEh8SHxDc+
JD4kPiQ+JD4kPiQ+pGfayMoHvidFWX+AhjS6GgsL6cq6PuzIpFtInxuaP8Z9RaSBni0ZXbWO
n3cbCXH+DK7lEsDaNLf0vRa+qsRyt4SvT5rgTUil2xVQswCZbt3uFnaoOulK3TQ7J0rf00Sr
SlqNQfli0GtLRr0VvUqplZP4g25eWzcr3ssfvr0JiA8pju2s8Ya0gfck6Sfucssg3Ne2pE70
0FZBZGsB4u/K1QixJij+/m7f9gN/B17ogo5Z1QAAAABJRU5ErkJggg=='
"4c.png"
'iVBORw0KGgoAAAANSUhEUgAAAEkAAABhCAYAAACajIyHAAACQUlEQVR4XuXdja6DIAxAYX1z
H803Y3E/GXYUihYIOyRmuYlL3Teo4C6wJEpYlhV8HJ8/X8K2bYFcjs+fgwr7vgd+CU+HFJQK
9HrDiodSm9gHiIgkmt5aBKIiHeWdzFcV6CXJR/pBioG+J/GRVCA+UgLJ0tnK3w2+5/XuTrSK
74YkL7A3VMv4auL+Pcl2Tk3N828SbeLzkTyQ4i5AbkyHRrqatHE5yXphca1L/e0N1iv+ZSTt
mysdXlA9419GuvNQq3UO8o6fHbt9quvxKr8BPpK4q6XubHwk5SKsd5P4tXdOahH/MpI2VpJN
tOfdrVX8E1IcJBVAy08a7rgRu2/8E5LMQ9qh9bxLeazPo1b/+Cek3sl3yudJd2sSAklLfKU+
E/IZt2zj9F90i7+WjHoUO01N4hc+Eh+Jj8RH4iPxkfhIfCQ+Eh+Jj8RH4iPxkfhIfCR+4SPx
kfhIfCQ+Eh+Jj8QvfCQ+Eh+Jj8RH4iPxkfhI/MJH4iPxkfhIfCQ+Eh+JX/hIfKSqYvl/dX5N
CuWZD0ik2jk0SKTa2VhIpNp5fa5Is8ycHF6TZpiDWzvX2HWtkhlnc1umzrqvVTLbugBNkf5l
hQlLHsMjWeYX81e9aTl246+fdPFC+Stx3bjbjBjNW+Jbm6Eb0oyrA9atfAhFit/Xpbnxkf4w
J9V0FVwHuDOtojwMaeZnSzKZx8B8pAgpBcRHipA0ID6SyE35JA/eGqgEJLcMQi4klQOq3iqI
VjSg05ZB5HXcSrty8fd3U/Z3ewAy7f4mRy5AlwAAAABJRU5ErkJggg=='
"4d.png"
'iVBORw0KGgoAAAANSUhEUgAAAEkAAABhCAYAAACajIyHAAAB30lEQVR4XuXdUY6DIBAAUL25
R/Nm7NrdbKyK4Fag9E3Sn7bJtC8wgAkwHEQYhhF+Lf//PMI0TUGO5f+fQYV5noMf4eFwBBUF
erz//bkOFe1if0Ag0qbrjWkgFGmJ32I+RoH0lhRFegL6+ZaPtEbaAflIBy1pXYNiLx/pBqTW
kDfnjxbuXdLcxK1bXIH8tyJtpwy1Z++l8ieR1onPku7mVJWhSuZPt6SMehT7gbWgSufP6265
NaDFqFgh/2tIV35gCahK+f2WVAXJr0n5EzN2dDtcx/nzpBsSKjPul5vux6/d/KcAlVqSgPQO
RbgLpP+MbiTSWxThLpD88JF8JB/JR/KRfCQfyUfyw0fykXwkH8lH8pF8JD98JB/JR/KRfCQf
yUfykXwkH8lH8pF8JB/JR/KR/PCRfCQfyUfykXwkH8kPH8lH8pF8pGYSPtJZpPbQ8Eg5u7Fo
pNx9fS7ShR2iZZA62YPbriV1tpu7ek3q9VyAaqNb9ydMlJ4n+WeV3DFK+Ocn+ecn+S2Jr0mZ
iPTolnvyoT9PyuiK/Iy7DVIva7fmC1z/KcCHYp2s43ykFVJsoesjrUdC//FtujYlHpXAVwMl
gLZXBpnHkiVu/rl0VZAWMSD/Vq5IF4tC+fe7PccXD+0lFQQovBYAAAAASUVORK5CYII='
"4h.png"
'iVBORw0KGgoAAAANSUhEUgAAAEkAAABhCAYAAACajIyHAAACOElEQVR4XuXdYY6EIAxAYb25
R/Nm7Do72ahDCwitdh6Jf9bJFj8BhYQ6ZUqaphl8bNevl7QsSyKX7fo1qLSua+KX9HLIQYlA
r7//nqdDiV3sHwiIdOp6cxkIirSV92A+i0D0liQiHYD+fsVH2iN9APGRMi1pPwZJhzBunZ+O
2rmRTyDr+F1IHwP7rjLaOQsgy/jiwH36ldqCsojCuVFQnvEvI1W1uIru2tEH3OIXkcR+zUdS
KsNHGjQmKIfLmDQ4/mWky3dz7AuMS/wupNa76fEKYBG/ryU1VNTjZdIqftXcLTtVaaio9UKe
dXxx7nYIUBFQqqjXSqdl/O65m1ZR76Vgq/hDkWq6phfUyPjF7nap+d69rDI4fv7p5vWe8y3L
t3eNLyGQnjC+hEB6xPgSAolf+Eh8JD4SH4mPxEfiI/GR+IWPxEfiI/GR+Eh8JD4Sv/CR+Eh8
JD4SH4mPxEfiI/GR+Eh8JD4SH4mPxEfiI/ELH4mPxEfiI/GR+Eh8JH7hI/GR+Eh8pNsk+Eha
Ke2hwSPV7MZiI1Xu67NBCrBzsmWH6HCkMHtwG/YaD0UKtZv7DqRoeQFa8h8MQYqaYaI2kwY/
V4n1Gzc/603vewY/fxI/E5fdXXxaTrfKeqGRajOaslvS/v+4j0nKRTwuY6klklTRMLlvPacl
YbMo3zXBDb2mpKwi8JF2SGZzt29B0tah+EgVD5Y3EvjTQAWg8yeDmGnJCutNTZ8KohUJiP9V
LqGLiVD877sdyw+iWeoWmS85dgAAAABJRU5ErkJggg=='
"4s.png"
'iVBORw0KGgoAAAANSUhEUgAAAEkAAABhCAYAAACajIyHAAACR0lEQVR4XuXdYY6DIBBAYbm5
R/NmNG5L6iIDgzIgfZOY/dMt+ik40jAuifDL4sDbfvz58Ou6enLsx5+D8tu2eX74P4cUlAj0
/geHhxK7WAAiIkVdzxWBqEh7fAZzJwK9JflIJ6Qj0PdDfCQRiI+UQNIkW5ovHX1Qj0YKY9io
hNSifXHgPn/IqXcwbL2hrNpvhhSnC2HrlcFbtl9EOp4dTcI5Asq6/SJSaTwq7aA1VI/2Vd3t
7g5aQfVq/xbSlbma9rdm+/YvI9WexdZXU8/2VWOS5nar3Vrdlnu2n0XKJWZ8JEVilstLjn97
dzeL9pNI0lmKoVI5VHz1afKsFleTZfviLMDVgW/0JJ1F+yekUl/PnQ3Ms9sdJNTMZICKB0Hq
73GXUwA+UmIAJ/9oeevZjY/EDz4SH4mPxEfiI/GR+Eh8JD4SH4mPxEfiI/GR+Eh8JH7wkfhI
fCQ+Eh+Jj8RH4gcfiY/ER+Ij8ZH4SHwkPhJfgo/ER+Ij8ZH4SHwkPhI/+Eh8JD6SQWhWPvCv
JF9eQ4NG0q7GwiLVrOtrijTTyslhSN8vfP4a3Jq1xreQZl/NrV213rwMx2x1ATRd9DLSL1WY
MEsBfq0MR7mGFL/qjd1jCb9+ksHZRFbiqtnRJ9Z0015lTZLJWasDanO4Zhn3rHUmNWMV9tlt
GJImMRs9N1RzZzSdKpmhivJwpPnmr11yIo6PlEBKAfGRDkgSEB8pGpukdOGDtMBLkZUSzsML
XojVtnJA1a8KooUExH8rl9DFRCj++93+xwvkqutivA1X/gAAAABJRU5ErkJggg=='
"5c.png"
'iVBORw0KGgoAAAANSUhEUgAAAEkAAABhCAYAAACajIyHAAACU0lEQVR4XuXdYY6EIAxAYb25
R/NmbNzNJOhSKEiBziMx82cSnE+p0AHcEiVs2w4+rt+fL+E4jkAu1+/PQYXzPAO/hF+HFNQN
SLoVyVD/mlgKiNgMo6a3J4H4JfbgI7Uj0ZtaFumvHfKhskjpKF9ugvH3rmN0d8KqfhWSJk49
T3A0lGX9YkySugQlxFl9K8v6s4H7cxU0zQ2H1BK4cUgpqNKTDReTWk8sBWsJNqr+ZiTpypWO
XlAj629GepPUso5BvesXkS7xz+16fT6vAB9JEbj5SMJJaJ8m8efomGRRfzOSNFZ6NtGRTzer
+m9IcSWpCqT4JOHOG7H3rf+GJPW0tT3v2g6oTaq1f/03pNHB12U+6e2dhECSAl+pz4TOTMYw
5JLtcc9MxbrLcdMLH4mPxEfiI/GR+Eh8JD4Sv/CR+Eh8JD7S+oPqZZBmzyVwgbRyqpiPxEfi
xyQG0uz5TcsjzZ7f5AJp9qwUPhIfaefHpFHzm9w+3UbPb3KbBVhx5spSSLPnN/HzSXwkPhIf
iY/ER+Ij8QsfiY/ER+Ij8ZH4SG6LJh3Dv5NCeeUDEql2DQ0SqXY1FhKp9k+HrkheVk5Ov5M8
rMGtXWvcda8Sj6u5Nf/rdd+rxNu+AKZI37LDhCaO4ZE064v5u95Yjt34+yc1nih/J64XT5sZ
o3lt/aaBuyZGzB5q1I7h0ntFQZG0+2nykYR+Ez8mZZDMk27edlGu+x40fTs8cH8bFB9J0QT5
SG1IG/idJJpUSvSCF+Y2ZDKS6lVB5CIB8d/KJTQxEYr/frd7+QFj42beDekLBQAAAABJRU5E
rkJggg=='
"5d.png"
'iVBORw0KGgoAAAANSUhEUgAAAEkAAABhCAYAAACajIyHAAAB7UlEQVR4XuXdW26DMBAAQLg5
R8vN3CTqR5IaWAp+ZVbiI1IlJ1N7vRgwUybSNM3w8fj925GWZUlyPH7/FlS63W7Jj/R0yEG9
A90/Zw8Y6u8QywCJvexl6M15ID9+OWYf6RwSPtQ2kZ4gPtROT8r/JTsEyyC1xry4/XjijiK1
rqkKtH8p0mcuq53DSrV/WeJunexLtr+ak478V9a+YC2o0u3HE3ckB+wdpXNQofbPIR35giWg
KrXv96QqSH5Oihdm5Oz22nC0IapOOtWgUnGf7rpff+7Wapby15O+dKmkdRIeZj3p6OzmLrr5
FwSuqbh9JD98JB/JR/KRfCQfyUfykfzwkXwkH8lH8pH+/a18pF2gztbSu0Lqdcm4G6SeLz50
gdT6XoL+kVrfldI9Uuv7m/ye5Ockf3bzZze/TvIrbv/czQ8fyUfykXwkH8lH8pH88JF8JB/J
R/KRfCQfiZHwkbZi7xkaHimyZEwjRS8+uEgHrvOVQRrkGdx2PWmwp7mr56RR9wWoNrsNv8NE
6TrJ36vkilnC3z/J3z/J70l+TqpcAow4uzUpJoerk4L7adoVdzOkgc7dopj2epKP5K8nlS8f
fKRjQ9BHiiOZrwaKDLXPVwZ525LtnOPFXhUExxqQ/1aulSG2CuW/3+09fgALr4cyB5gO2gAA
AABJRU5ErkJggg=='
"5h.png"
'iVBORw0KGgoAAAANSUhEUgAAAEkAAABhCAYAAACajIyHAAACXUlEQVR4XuWdUZKDMAhA9eYe
rTfLtp3dnVaTiAkk4GPGj107Q3wCEoxkyUhalhV8vK6/LmnbtkSW1/XXQKXH45H4kt4ccqC+
AT3/zh5gUEcXywAiWtmH6615QHz5xbHyIfVBgrtaFdIbCB/UiSXlf5l1wU+ge4i1c5pPIGv9
XZByFvc3mNo5C0CW+uWBe/e/kkv+/6ZwTgvUSP3NkIoDlBw6gWKY/vbATYeUA3UwUz6kzphQ
OYbEJGX9zZCa76ZuAjNEfxekq3dzRApgob/Pki4MdEQyaaW/+nTbJ2YlRWcDtZ7OWOs/QMo+
1QQKZ8/3LPUfLakj+EmBjgKlpV8VksQ1R4HS1H/qbk3mO7tgp6xfXHQjVyvbpyV8SD7iS5zK
JP+FQH/GzYfEFz4kPiQ+JD4kPiQ+JD4kPiQ+CT4kPiQ+JD6kNH99k3tIs9c3uYc0e31TDEua
vSqFD4kPiR+TZi288JsCBLAilymANytyl0x6BORmWjJ7fVOYuZvn71lcTXC9rj9wVwXwuP7A
Z6nE2foDfj2JD4kPiQ+JD4kPiQ+JD4kvfEh8SHxIfEh8SHxINyPBh1STsxoWHpKkGsqGJHy/
ZwMpwJeTV97QqEMK8w3uhbfFqpBCfc09A1K0vgBX+h+oQIraYULaSYPfq8Q64+Z3venNM/j9
k/iduOzuosOebrbTkhtAkqYNbEuS9NM0i0mVi3DVsdQaUmmgoXrfCi1bNZkM10V5FKQ7Fdz0
A/fNQfEhSZ6afEhNkJhbA0lcbb9lEK8tmSAjP98qCCwlQPxduQouVgTF39/tW34A2lHNzY+c
OHQAAAAASUVORK5CYII='
"5s.png"
'iVBORw0KGgoAAAANSUhEUgAAAEkAAABhCAYAAACajIyHAAACb0lEQVR4XuWdbW7DIAxA05v3
aLkZUzdFowkfJmBs8ixF+9Gopi/YMZ4xW0LCtr3A1+f3lyW83+9Als/vL4EK+74HvoRfDilQ
X4ByU5EM6mJiKUBEM4xM75UExJeYBx/SfUh0UytC+rNDPqgipLSXl5ugtamO1i+C1OKnjllo
Nes09Gd9Ui4kkAzQyjy19Bcd9xFcSswtvie+ZkXwmvqHOO7cAGeB0taf9UnSqVsboDaoGfrF
jrtngFqgZunvgnQnVzP+1ayv/zak1qc4ejbN1F+FlPss59xr16jX8kz9RUilwIwPSfB2K8Ul
8d/Z5qahvytOiu87PjvPvtQ9GhG2pv4LpN7AzDrVq6H/Aqlm66WngVm79UBCJt3OTpCfdHOY
G3IP6ezAyf+07Fq78SHxhQ+JD4kPiQ+JD4kPiQ+JD4kPiQ+JD4kPiQ+pMig+pIJ4zGG5gmSd
I3cPybq+yT0k6/om95Cs65vcQ7Kub1oCknV9k3tI1vVNS0CyLt3hQ3q6uc2qb1rGcVvXNy27
dvO4lZW/duPnk/iQ+JD4kPiQ+JD4kPjCh8SHxIfEh8SHxIfEhwQRyc4H/kwK9foDNCTpbiws
pJZ9fUMhrbRz0gzS/xf634PbUqTRBWn13dzSXevD23Cs1hdAYqK3IT2pw4RaCPC0Nhy1fi38
rjeayxJ+/ySFp4nsxNUyUK893VTfbncDMwtQUkDD46SWuMUi5SHRL+2niV27xZBS36GaBVip
9630jaeSKlmli3Jb4yx40m2a434aKD6kRj/FhySHtIHPJCmb2vnIIFy3rdoiWHRUEFlygPin
cmVMLAuKf77bt/wAbG1wd+u0VNkAAAAASUVORK5CYII='
"6c.png"
'iVBORw0KGgoAAAANSUhEUgAAAEkAAABhCAYAAACajIyHAAACXUlEQVR4XuWdgY6DIAxA9c/9
NP+Mi3dnDhktBSmcviZmy5Kt7NkWKAWXjIRlWcHX8f91Cdu2BbIc/18DFfZ9D3wJ3xxyoD4A
/RD9M0M6qA8XSwERISWut2YIrvjYdMpvMF+zVsQXBdLpXrHLka1KhZReVFAqpLi3swTvM5bl
vj+uN+qvX4VU+kxr4GhQnvq7QdKG+eNcwke/qXeL7xIfUsF0tcCNg5QbcZd6NlxMam1YDqwn
sFH6myFJd6509QI1Un8zpDtJLe8Y1Fu/COkgfprr8ZreAT4kQ+DmQxIaYe1N4tfRMclDfzMk
aa6UuujI3s1L/wVSrCSnQIpPEtx5M/a++i+QcinbmpF37QDUJ9XaX/8F0ujg+8h80l1LQkCS
Al9pzITMTKY+Tl81UUfcM1Oxj7EkvvAh8SHxIfEh8SHxIfEh8SHxIfEh8SHxIb0PEqo+qUcD
+bUA4g/Bqkr4kPiQ+DGJX580QT+/PskTEr+qhA+JD2l6TELVJ7XOlV5fn9TbDebN2B3rk+4K
oj6JL3xIfEh8SHxIfEh8SHxIfOFD4kPiQ+JD4kP6j2JJp/AtKZR3PiAh1e6hQUKq3Y2FhFS7
aIDMTE63pCfkuGv3GuNXSyzrcvh1N1dIb1nBtcQxPCTL/mJ+LYDn3I1fn9TYUH6l243eZsZs
3qrfNXDXxIjZU43aOVx+mACFJB1fmz9QCw7J9hk0Jg2HZE2Fzk7FakCk42vR6VstZcKHJICK
3/MhFVzQrXd7k1UJ46QFfv6/POJOHxmEPEhKA2R+VBBVJED8p3IJLiaC4j/f7SpfI5Xf/sX5
ywQAAAAASUVORK5CYII='
"6d.png"
'iVBORw0KGgoAAAANSUhEUgAAAEkAAABhCAYAAACajIyHAAAB90lEQVR4XuXdbXKDIBCAYb25
R/Nmtsm0nVQJIgpInp3hRzKTLL7ZLxciQ0CWYRjh8bj+uCzTNC2yPK4/BmqZ53nxZXlyCIHa
AHq+/n7/b+Cgti72CgeFtHK9MWhBvuv92su4hSRbznFIL0O2qmRIMqh0d4NdsAyk1jAv1n89
pNYlQwH9l0JaF5+1Y1gp/UFIm0o7QWnOZ0oCulJ/2JIO/irvJlgLVGn9byFlxYC9UToGFdJ/
DtKRCZYAVUm/b0lVIPkxKb0wI7NbTsuEqpNOKVQq7tOm+/H3bq2yVG9dgNZBuI9WyQ2CcBeQ
crIbCekWQbgLSL74kHxIPiQfkg/Jh+RD8iH54kPyIfmQfEg+JB9S7FtbX9XNITH7kzKFW3c7
O0FmBffsBP39SaEY4O8qOTlBf3+Sb0l+TPKzm18n+RV3lxW3f+/mdwF8SD4kH5IPyYfkQ/Ih
+ZB88SH5kHxIPiQfkg/pU0j4kGKy9x8aHlJKy5eGlLp44EI6sE5H97jbWVJnqyXVY1Kv627V
slv3K7il6yR/L8AVWcLfn+TvT/ItyY9JlUuAHrNbk2Kyuzop8XmadsXdDFJH925tIfXWCfAh
ZWZFH1ICKB/SMRf0ISW0TH4gwUcD7bja+sgg87FkkeIz+agg2fWih075p3JNaceX+ee7/Zcv
T2rnYzkhgawAAAAASUVORK5CYII='
"6h.png"
'iVBORw0KGgoAAAANSUhEUgAAAEkAAABhCAYAAACajIyHAAACSUlEQVR4XuWdW7KDIAxAdecu
zZ1x285tRwUxQBKRwwwffU3SQwIxRJkSLUzTDO7v/59vYVmWQG7v/58DFdZ1DfwWPhxSoCJA
n9ev938dDip2sS0cKKSD681JC+K73tde5hgS2XLKIW062arEkMig5O524oLbFTC3OloB9pDf
BCkKETbK5D6zAGQpvxpSSondd4xd1lN+vSWdKSjpOhOFm/wkpLNR2o0CHVIKVGSmfEiNc0Km
u8xJyvKrIVWPpm4A4yK/CVLpaHqEABby2yypQFGPYNJKfnZ1OwZmZ4KuFLW+nLGWH0FKrmoC
gaKw4QZQGvJjS2qY/KRAvUBpyVeF1EPCzkL+pbtVme/dCTtl+UX5JGq2sv6yhA+pj/nlEZC6
mF8eAYnf+JD4kPiQ+JD4kPiQ+JD4kPiND4kPiQ+JD4kAiVufVKEgrz6pUkFWfZLsl/yqEj4k
PqQO5iR+fVLjaOoGMPz6pF7k8+uTvC5LcPVJ2oqOWZ+kqOi49UlKig5dn6S2NN+b2+Dnk/hJ
Nz4kPiQ+JD4kPiQ+JD4kPiQ+JD4kPiQ+JH7jQ6rIHPAhhescFB6SJJvJhiTcn8NmJkt2WLg5
7oLdXu5uyR2QnrbvVvL8A/QOrvRJGvxaAOuIm19V0hpn8OuT+JVudqPYYc2k7WXJAJCkYQPb
koRPZmXfEWAN6UzRR91b4gHpqMzj7lLygjRSws03nzQCKD4kwarJh1SWsPuHBD4a6MLVjkcG
MR9LlgkRxEcFkV0ve+gU/1SuRXZ8Gf98t337A1pRr5hwT1NXAAAAAElFTkSuQmCC'
"6s.png"
'iVBORw0KGgoAAAANSUhEUgAAAEkAAABhCAYAAACajIyHAAACaUlEQVR4XuWdgW6EIAyG9c19
NN+M5XZnjiEtRSg4vyZmyc2t3AeVUn9xyVhYlhV8vL6/bmHbtkC21/fXQIV93wPfwi+HHKgT
oDfR7zCkgzqFWAqICCkJvTVDcMVfmw77XMzX7CjimwLpCK845MijSoWUHlRQKqR4tqu5eM8O
1d7+VUilz+TZYN6o8/DfFVKaNowG5eXfNLsdKYEGKT4nPkZl8J7+s5Akh1LPSOePAuXtPwup
ZuiWGugNaoR/EVLPBnqBGuW/CdKVWk3/qdnf/2VItb3YezSN9F+EJP0uVyWwHL2m5ZH+VUha
YsaHZJjdtLwk/jk63Dz8q8lkqRdyVYJ09HlWEkb5P0FqTcxmVzI9/J8glWJd6w3M2q0FErJ8
m14E+UW3G9aGbg8pvYCTb1o2rd34kPjGh8SHxIfEh8SHxIfEh8SHxIfEh8SHxIf0aEgIfVKL
YfRJrQ1E6JOuGE6f1KuBj9cn9WogX5/E1ydZ/5ivT+rWi4/WJ1mnW6w+iQ/JKdww+qQrvYnS
J/Wcceat2J31Sfy1G7+exIfEh8SHxIfEh8SHxDc+JD4kPiQ+JD4kPiQ+pGea5ckH/kgKZf0A
GpL1aSwspJrn+rCVyWmQvv/w/jXuGpEF+m6J9al1/H03S4jy7+B6pgBPu81d2q+FryrxXJbw
9UkOvYlUutU09K6aSdfZ7WpiNgOUFZB0PlrHLWXXrgvc/6Yqse7Min62ZBqkUmI2apFbk0Lk
QpZfTzJk7XxISiWBD8kYgvzyrWFUCXnSAt+KrLRNZPSCF+JuW+UNRw2vCqKaBIj/Vi4hxERQ
/Pe7/bUfym4HgB2ZwYoAAAAASUVORK5CYII='
"7c.png"
'iVBORw0KGgoAAAANSUhEUgAAAEkAAABhCAYAAACajIyHAAACeUlEQVR4XuWdAY6EIAxF9eYe
bW7Gxt01UYdCUduCj8RMZpNNnWf5yLfIlGlpmmbwsf7+ckvLsiRyW39/CVT6fD6J39Ivhxyo
AyApFUkQz6C+upgECdz15i9A54xZ/0bVqn8xnxU0Z6w+qSCRs0gFiZ5FKkgtWfQ3GsSNhFbx
i5C2oBpI5xP0BmUZvwhp62qaQKXbfL8uYRNfhLS/MtEnyYc0MqStq2mDYDWp9cT2YHPfnwbm
Ff8yJOnK1Y6nQHnGvwzpjqllrUFPxy8K95au62duwouHlOvffEiKk9COJvtPb02yiH8ZkjRX
OndRz9HNKv4B0j5ILoCkTxLcuBn7s/EPkM46JB3ShLemYz5W6/PxD5C8xXdIP+luJvXqBz0K
SRK+2j1T73MvFz/JQ1t67toqq8Tjig4JKXLo5kN6myZ5g/H2o7qHFO1HDQEp2kXgQ+JDmvma
5OVHDTu6eftRw90n9eJHdQ8p2o8aJpO695NG94NC6pNGmnt1WwvQ0yw+pKqED4kPia9J/Pqk
gPj8+iRLSPyqEj4kPqRwTULVJ43gB4XUJ73BDzKvTxrdD3KpT+I3PiQ+JD4kPiQ+JD4kPiR+
40PiQ+JD4kPiQ+qxaewUfial+soHJKTWNTRISK2rsZCQWh8aIJ3J8EwaweNuXWuMf1qieS6H
f+5mCuktT3A1OoaHpFlfzK8FsJy78euTLp4ov9LtxmgTMZtvjW8i3C0aET3VaPl/U6uED+nl
kGqvr+VrUqq/vpa/SinVX6fNt29T/XXaeEial7LjIWnMQTSkXBZtupaBxNwaSG+l7DZ44e1u
U4ak2iqI3CRA/F25hC4mguLv73ZsPxBLuiUCt8QwAAAAAElFTkSuQmCC'
"7d.png"
'iVBORw0KGgoAAAANSUhEUgAAAEkAAABhCAYAAACajIyHAAACEElEQVR4XuWdW46DMAwA4eYc
jZt52xVabSEkDsV2zFjio5Uqw8ivOC6ZCiLTNIOv9/PXRZZlEbK8n78GStZ1Fb7IL4cSqE9A
r8/FCwzq6GJ8SHvXmw+ADm4HdsUtmM9NsyNaURckgQf0JiS6FeksCRqwuyF1u1o01Jv1VyFd
crXocsFAf92SOpX9Qd0u72Bvpf82SPsb9AZlqf8WSGc36AXKWr+uTtLGgNZlHYOM9H8HqecG
LUA56edbkgskfkwSfnbTFpNaRbg66bJCSsX9tek+fu0WlaWydQGig3CaVkl0EE7TT+rNbqPG
FJemW/bsZA/pAXXOYyCNnCyGgBS99hsfUnQXYXhI0f0oviXxYxI/u/GzG79O4lfc/LUbX/iQ
+JByQiLNJ6XMTu7zScnqnJj5pEQVc9x8UpK1F38+aQD9/PkkviXx55MSxSR+duPXSfyKm792
43cB+K0SPiQ+JD4kPiS+8CHxIfEh8SHxIfEh8SHxhQ+JD+k6CT6kmrT+Q4OHpGn5oiFpNw+4
kDr26dA97jhLSrZb4h6Tsu67uWW39Du41nUSfxbgjizBn0/izyfxLYkfkwqw+dktGFLmOskV
UsaK+//vfFslyeaTWq+v5TfdGq7Gh6RwNT4k0b0pmm9JiizIb9/urKj03QYJejSQYvmyPzKI
9962BiTdUUFgOQPEP5XrxMVOQfHPd/uUH+mTm8FY3hHfAAAAAElFTkSuQmCC'
"7h.png"
'iVBORw0KGgoAAAANSUhEUgAAAEkAAABhCAYAAACajIyHAAACcUlEQVR4XuWdUXKDMAxE4eYc
jZu5TSftNGBsGexF4nmGj4QPOQ9JEWuBp8xI0zSDj9fvL4+0LEsij9fvL4FK67om/kg/HHKg
PgF9f84eYFD7EOND2obevAO0CztwKL6T+Vx1O6IXNUFK8IRehUT3IpsnVRL2H8SMt5XO9fwH
Gm3fBOnIwP9JbCdTOjcC0Ej7RUilUMtN4sPrDs71AqW0X/akUqgdTdBy9EkUMvt8SHxICkhn
c0LhkOSkzvZPQzp9NfsWMBL7lyC1Xk1FCTDC/jVPapioopgcZT8L6dfwtjBrKSoVgFT2d5C2
BrOfGyaqujEeaX/vSReSnxWoClQv+10hWUJTBaqn/Wq4nXLfu6WVzvbz/26qOie6nqTKL3fr
Ud2kEmWNo9Sj+iqT6tpGoEdJK+4Id/F8SHxIcEh361ExPMmDHhUB0t16VAxPcqBHhYDkQY8K
AcmDHhUCkgc9KgQkD3pUCEgu9KgQkKLoSVH0IB/9SY71IBf9SZ71ID/9SZ7v4iN0lfAh8SEJ
chK/P8mRHsTvT/Jjn9+fpLotwfUnRdWDtP1JgfUgXX9ScD1I0p/0CD1I0p/EH3xIfEh8SHxI
fEh8SHxI/MGHxIfEh8SHxIfEhxSWBB9SadQ0KDwki5rJhmRcn8Mqky0rLFyNu2G1l7tacgek
aOtuLe8/QK/gWt+kwe8FGF1x87tKrtYZ/P4kfqfbuKvouWeycI4PiQ/pZkiPeyJglFTylGdL
am+K5j+lVAk1vp5kCDU+pGR7KTvfkwypAA0p50W5796QoFsDGeqo7ZZBvB0lKpBsWwWBxxEg
/q5cByF2CIq/v9vn+AL9K+WBkqeXHwAAAABJRU5ErkJggg=='
"7s.png"
'iVBORw0KGgoAAAANSUhEUgAAAEkAAABhCAYAAACajIyHAAACkUlEQVR4XuWdDY6EIAxG9eYe
zZsxcXfJOipQf9pSH4mZZMZM9VmgfBYYDkoahhF8LPdfL2mapkQuy/3XQKV5nhO/pB8OR6C+
AJVckQRxC2pXxUqQwFVv3AHaeszyHbWt+mvMRwHNEds+iSCRvUgEie5FIkhXvMgb6tP2q5B+
u8BzkLLneVVPDftVSNmgNDbK5+fDGpSW/SKk7EVS112f7xF8atp/BFLpAq1AadsvQlq77p0L
1AZlYV8UJ929QC1QVvZvQbqi1TzfNevbvwzp7FN82pss7YuCSUl3Kz2e6pYt7YvipKM/5kMS
BGa1uGT9aV3dNOwfQio9pS2o9Xn5t633HZ2jEWFr2t9BuhuYeauYGvZ3kFp1vfY0MGO3O5BQ
etJ69L/+tALUm8h3OQSIpAeZqABWkod3m6YydouiB70Ckrce1T0kbz2qe0jeelQISN56VPeQ
vPWoEJC8pRY+pLdXNys9KkzD7a1HhYu4e9GjuofEH7u9TU+KrgeZ5idF1IPM85OitSnm+UnR
9CCX/KRIepBbflIUPYifn9SJfX5+kiYkfn5SAKmjm/wkPiSl6obJT4qiB7nlJ0XXg0zyk/hj
N76exIfEh8SHxIfEh8SHxC98SHxIfEh8SHxIfEh8SO8skpkPfE9K7fwBNCTpbCwspDPz+rDK
pBuk/z/sX+M+k2SBflsinbWOf+8mqaL8N7iaIcDbXnO31mvhZ5VoDkv4+UkKTxOZ6XbmQnvP
mVTp3a4GZh6gJPZNVIDoedxmUknUrJLWWiz8uSWpvXwtf5ZSai+nzVcmU3s5bTwkyaLseEiS
9ouvcW/uPfd0B5AG8Fpt9fHddssg4O42dUiirYLIpQSIvytXoYoVQfH3d/suHx2v/3L1yJ+C
AAAAAElFTkSuQmCC'
"8c.png"
'iVBORw0KGgoAAAANSUhEUgAAAEkAAABhCAYAAACajIyHAAAClklEQVR4XuWdUY6DMAxE6c17
tN4sK7ZbbaAxGIgdmxcJVeKjpq/OJBkMmRqtTNMDfMy/f7uV5/NZyG3+/Vugyuv1KvxWfjm0
QC0AvWn+pyAxu9agviC0+ioRVNX1Hk1An8x6E32fI7Y/MW9D2juHhvTRo3UmUUe9JiS+cB/I
pPnzc2hA1dpVZ6LvaNQ//hckqWutu+DeBXqDsowvQlp/uXR+a8rgKfaW8btlEgpSS7Q14o2D
dGZ0Q2nSlQtrgbUE5hX/NCTpn9s7eoHyjH8a0hVTy1qDescXIc3E60nk+h/gQ1IINx+ScBHa
0aT+9NYki/inIUlrpXUX9RzdrOIvINVBWgEkfZLgjlux942/gCTNtLUz79H2ilX8BSRv8U3p
J13NpKh+UFdIkvDtzZmir71M125aRzL6Kt4Mknfqp4Q0cujmQ7qbJnmD8fajwkMa7UelgDTa
ReBD4kN68DXJy49KO7p5+1Hp5klR/KjwkKKW+4TLpPB+UnY/yK0+KevaK2wtQKRV/JCqEj4k
PiS+JvHrkwbE59cnWULiV5XwIfEhDdckVH1SBj9oSH3SHfwg8/qk7H6QS30Sv/GdyftkEt/j
DjY6hofEv++WYMbOh8SHxK8F4NcnRXM2082T+DWTFzWKD2kwJM2ElZ9JZf/JB6QmHX2GJtQC
12utdvRpLKSfdHTiinQmh2dSBo/76LPG+LslmtEUf9/NFNJd7uBqdAwPSfN8Mb8WwHLtxq9P
SuIHha90i+YHnY1vKtzR/KAz8bVvQcRCOvI+TTwkzZtZsZo0JJM8/aBe8bVvi8bXJ7mObpkB
7b3BHg1JuxcCH5JiV40/SBN4TxKNlVJt8ELcImhLuFVbBZGbBIi/K5fQxURQ/P3dlu0HEWPA
h4r5hZ4AAAAASUVORK5CYII='
"8d.png"
'iVBORw0KGgoAAAANSUhEUgAAAEkAAABhCAYAAACajIyHAAACF0lEQVR4XuWdW46DMAxF6c5Z
GjtLS9VWlMYQSvziWEIa9cf0jGNfO5nJULEyDDfwM3//bSvjOBayzd9/C1SZpqnwrTw51EB9
AXr+/Pjs/RDhrUH9LrEFIDKoxdK71QHtfQaxVzLnQzoM6ZOPVpCoSb0eSUJOotp2JPETt2JO
8o66zv77Q/Jengr+u0LyFqBa/rvlJO88pulfrG5HfivSC1qB0vYvS4B/csDeo52DlPyfg3Tk
BTVAGfnnR5IJJH5OahdmyOq2dNzqCKWTTjmkKO7ToXv53s2rSvFHJRcduvF3S5SqW9ScogrJ
5YUD5r4uiju6zrkMpMjFIgQk794vPiTvKUJ4SN7zKH4k8XMSv7rxqxtfJ/EVN7934xsfEh9S
TkiI80mZq5PZ+aSkOsd83y2bYnbbwc3Se/HPJwXwzz+fxI8k/vmkRDmJX934OomvuPm9G38K
wB+V8CHxIV0kp4WHxN8tia2zwkPi7+AG7/3iQ+KfKgk+j+JHEj8n8asbv7rxdVJixb3hj9+7
lf2/ocFPAVqWOBpSa7HgQjqgy9Azbr9ISrZbYp6Tsu67mVW39Du42jqJfxYgehfPP58Uwz8/
kqwa3Mw5yVQCZKxuLmIynU5q/H+abMXtBilR7+YLiT8qAYxM+EO3SiStoPEjiZ+TVCExrwYS
lfrC1lcGYW+5kSpb01VBZJMA8W/lEpaYCIp/v9u33QHW4KfUMirxcwAAAABJRU5ErkJggg=='
"8h.png"
'iVBORw0KGgoAAAANSUhEUgAAAEkAAABhCAYAAACajIyHAAACkUlEQVR4XuWdja6CMAyF8c15
NN5sV83VIGxjP/07nCUkRkyKn13XHipbMiMty4P4eH3/+kjruibm8fr+NVBp27bEP9KbQw7U
D6D36+d7n4MR3hHUeYrtADGD2k29Rx7Q1Xsk4z+Y80PqhvSNRwdIrEE970mFmMQ66p7UELj3
nz2er52TXIG07U/FpBzMz8XUzmkA0rQ/DKnkbd/PFM5JgbK0P+5JpQtsOWQChZn98ZjEDqmp
LOGHNBkTKodJTBK2Pwxp+NeUTWBM7E9B6v01LVIADftzntRxoRbJpJb96up2TMxKhq4uVLvm
07Z/gpRd1RoM9pQylqAk7J89aSL4eauZWvZFIbVMTStQkvYvp9uQ+3rLKsL267Ubv6Y0WZYA
6UF6yqRBfPHWo+SSSaUp5q1HmWbcCFU8PyR+SOSQvPUoDE+KoEchQPLWozA8KYAeBQEpgh4F
ASmCHgUBKYIeBQEpgh4FASmEHgUBCUVPQtGD/PqTQPQg3/4kAD3Ivz8JoYpH6Crhh8QPySAm
8fcnBdKD+PuT4tjn70+yKkvo+pNQ9SDb/iRgPciuPwlcDzLpT7qFHmTSn8Q/+JVJeEj8Gnfw
1TE8JP77bsEz9vCQ+HsBgqsIGJ7E358k60X83bf8PZP8kPghucWkCkS1mFSBHy4F8PhvyVW9
GCqZ9O5KKdnh1pMa4x6tMtlTL/Jq3B2rKO/dEg9IaPfdep5/QH0Ht/VJGvy9ANoZN39XCYIe
FL0/ib/TDaGKF7KvW5bcAFJr2sDtSY1PZuX+R4A2pAh60LR9C0jR9KBe+/ox6c6aEr/olvGk
AzR+T/KISUSQOLcGKqYRu3HcMoh2l5vSyta0VRDzKAHi35WrMMWKoPj3d/sdf/CBcy5i8P1Y
AAAAAElFTkSuQmCC'
"8s.png"
'iVBORw0KGgoAAAANSUhEUgAAAEkAAABhCAYAAACajIyHAAACsUlEQVR4XuWdCY6DMAxF6c05
GjdLxVA0aZrFWbzxIyEkWsn0NU7sj0O2TAvb9gI+zt9fb2Hf94Dczt9fAxWO4wj4LfxxyIH6
AnTR/O+CiL0rBfUDIeeriKAi13tlAd096yJ6XUNsn8E8D6l1DRrSPR6lPQl11stCwh+4O3rS
eb6PHlDabrna/g+kkmulLlifDfR6Hof9IqQURum6JRflsr+sJ8VhQnxIRfCc9qtjEjWYLN2g
FChu+9OzW+sGuUFJ2C9CWnmDXKCk7E9BGtFq1k/N/PaHIfX+i6t7k6T9JqTSZ6XBvXWsmpYl
7Vch1QIzfEiE2a0Wl8RnaXfjsD8VJ8Xfuz9Le1/uOxwRNqf9YsQ9OvBxzWQjMx5b7tby9dq/
AZO7zUCCVSbjsxQgazLxcAjgSQ9ig5QO4BKSh1XJeCp386IHPQKSth5lHpK2HmUekrYe5QKS
th5lHpK2HuUCkrbUgg/p6e4mpUe5Gbi19Sh3EbcVPco8JPzc7Wl6knc9iL0+ybseJFKf5HlM
EdO4vepB4vVJ3vQgtfokL3oQfn2SEfv49UmckPDrkxxIHWbqk/AhMbkbTH2SFz1IrT7Jux4k
Up+En7vh60n4yiSMMomvcRubHc1Dwn/u5iBix4f0dHfDryoxpke5gIRf6bYYFGzNJBUUfPUt
JW7CT0uUczfKygdzuZvF9SwmpRKp+6GuxoLVk3rW9cEqk2qQLOhBVPs9YQf00xLqqnX4524U
F8V/gssZAjztMXfrfS34VSWcaQl+fZIDPchFpZsFPWjWPuvsZkkPGrXPHidZ04N67fe8TxM2
d+t5Myvs2hK1niStB83ap74tGr4+SWx28w6o9QZ7aEjUvRDwIRF21fhA2oD3JKnnd+mWQZBb
BNUGbtJWQcitBAh/V66CixVB4e/v9t3es7EjvSa2e1QAAAAASUVORK5CYII='
"9c.png"
'iVBORw0KGgoAAAANSUhEUgAAAEkAAABhCAYAAACajIyHAAACp0lEQVR4XuWdAW7DIAxF05v3
aL0ZU7ZVIwyDk2Bs+pCqTtUkJy9g7O8AW6WlbXuAP/v9t1t6Pp+J3Pb7b4FKr9cr8Vv65lAD
dQD0Q/OvCxJ7VwnqH4TaWCX2smzoPaqAjkQfWF/168zbkKTf+JD4kHSQch/Eh1TcfDmz5Z/+
bODn6K3sVyGVoPK/tRc4G5SlfRFS7R9bs1srzJ83JGzsqyC9e1LrqSAhlYZ6MRIekiaI5Psk
5YXV8j1LYLPsX4YkPbneZxSomfYvQ7ojaln7oNH2RUg78Xd33b/LJ8CHpNCT+JCEi9DOJvn3
bJ9kYf8yJClXKofozNnNyv4BUm6kZkDyTxJcv4x9rP0DpFb2rwkuvXVxK/sHSLOd75J60t2e
hIAkOb5ezIRUJssxTq/oNiNues1tiArAhzQouJvZphcCIoleS4tuePmWD4kPie+T+IUAB/v8
QoAlJL58y4fEh+Tuk+4I8WfSihCFgKu50lUhfhRU80LA6GHgEQyaFwLutjtC/AhIUwoB/ppN
zKJDGEjeaU1YSN5pTXhI3mnNEpC8g1E+JD6kxSGdiVMs0opl4qQzT9wirQgXcXvfZPjczXu4
LKEC8PUkPiQ+JHefxK+WBEtQw9fdokkd/LdKnO3zIfEh8d8qWc8nSbmUp9oZ7p3JT254SJre
x+9Jqb/yAQnp7BoaJKSzq7GQkM4qBmFemJhp370nrbAG9+xa43CFgNn2NWlMqEKAh31TSJ8i
32r8GB6SZn0xvxBgmbvxCwEXL5RfCPhg0a2EyZdvFdE3H1Kl9+m2h4RCevcivk9S7PVU7vNr
KrqtVgjQ7uqDlm+lbf7r+5PzISl+40PiQ+rNbr1t/n8hbeDDWzRSSnbAC/fwlvrMpjoqiNwk
QPxTuYQhJoLin+92bF9bw0Dws4DrWwAAAABJRU5ErkJggg=='
"9d.png"
'iVBORw0KGgoAAAANSUhEUgAAAEkAAABhCAYAAACajIyHAAACFklEQVR4XuWdAW6DMAxF6c05
GjfL1mqVgJHiQG3/5FlCmqoyl6fE/rbVZjqwMk0P8PV8/s9W5nkuZHs+/ydQZVmWwrfy4nAE
agPo9ffva++LCG8P6v8WWwEig1ptvccxoLPXIPYXzPmQ+JD4kJIg7TPb5uJDMoCy/dfsp4qB
dOjY4jx71Tn4N0F6r6oznZQtQL381yE1Csna9owC5enfBOkqoChQ3v7tMckSA84u7xjk5P8e
pJYP6AEqyD9/JYVA4sckuzBjZrcGfYTVSZcdUhT37aU7fO2WlaVGaZVQJynfj0kkSFeyGxKS
RBDuAhLf+JD4kKQhYQcBiWWBZFmiVmDKFrhKrQrpVsndD8gfBLQUxPxBAH8QwF9J/JjEz25a
2Y2vkzIU7917lRW3zEPK124db1d5SMrDBwlI2RJCH1K2GJWHlF3W8FcSPybxsxs/u/F1El9x
82s3fheA30/Kh8TvTKqLQf60RMM/fyXxYxJ/WtJXduPrJAHFO5Ti9qqdxqvdBjQ+JD4kPqSw
OMaHVM6/Q4OHZNFWaEhWlc6F1FAQo8Vk3krqrCwJj0m9Frhh2a37Vom3TuI33b6RJfiDAP4g
gL+S+DGpcj8/uxnu4+skuz7iK+71e1Oabr0MAozbk91PMgZ6PiTD747zIfEh8SFFQ2IeDWT5
9fr9kUHYU25qmc10VBDZaoD4p3JVtlgVFP98t639APMCHHJGm9HDAAAAAElFTkSuQmCC'
"9h.png"
'iVBORw0KGgoAAAANSUhEUgAAAEkAAABhCAYAAACajIyHAAAClklEQVR4XuWdi6rDIAyGuzff
o+3NPNs4g7X1kmpM4j6hMNpB9PPSJH/RLVPStt3A16v99ZLu93sil1f7a6DS4/FI/JLeHHKg
doDev5/3PhcR3hHUeYp9ASKD+pp6tzyg1j1I+V/M+ZD4kPiQnCAd32y7K/MGKC3stWeab6DZ
9vMjqQaq8Z9PZWrPZgCaab8IKfPPHaTmaCs80wJlaV8E6VOhnYFSBSWXzkJhZr8MqdUDfEip
PUT5kAbXhMplsiYp2++G1N2bug6Mif0hSFd708IFmGF/bCRdqKiFMznLftXjPjpmJUOtis5O
scy2f4KUTbYJDJYqapWDmmn/PJIGFj/vbOYs+6qQJFPTCpSm/eZ06xq+3ikVZfv1fNJsP2fp
pFviqyViP8l7fVkCUoj1ZQlI/MKHZB674YSA3lCALQRcCSorvtbPCgHe6VNv+3xIfEh8IYAv
BESyzxcCrJ1JlBCgXdGfEwK0K9qqoFZYYSsEKILqadhIWGEnBCiB6u350bDCRAhQezV7OoMm
QoBNksbXY+dD+hFI3mHNOunbBUaROyTvsGaNkRQgrFkCUoSwJq6fNDOsiO4njXi8GmFFeI/b
u5HhYzfv6RI+C8DPJ/Ezk/wc9/yRxFdLYgeoa+hufAWXD4kPKcSaVGkE6/ukxP/Sraui/G8m
wYUPiQ9JJ/PAhyTIYeEhSRJ1bEhChzOMEGBt/0qiLpQQYGr/QvgSTggws+8BabV9Aa7sf4AW
AqQ7afCFAI8sAF8I0Eh8Wfk5fCGALwSY2z8B50NqbyjKh5TZULQ1BdlCgLDT2EKAsBPZQoBw
tPPzSYJ9x/mQ+JD4kKwhMY8GkuxefzwyCHvKTenNJjoqiFxKgPinchWmWBEU/3y3ffkD3ydp
V9TbzfIAAAAASUVORK5CYII='
"9s.png"
'iVBORw0KGgoAAAANSUhEUgAAAEkAAABhCAYAAACajIyHAAACyUlEQVR4XuWdi26DMAxF6Z/3
0/pnTN1ajaZO4pA4djiRUKcO1XAgfl0emzD2bbuBl+f+l8d+v9938njufwnU/ng8dv7YfzlI
oD4A/dH8PwWJZ1cK6guCNFeJZ9lh6t1EQJ9Eb1hf9XLmZUi57/iQ+JB0kI4+iA8p2fk0sh0X
7Y9675Q5pBTU8W9dNPBz8hb2s5CkFWuGvXMrK/sqSG/jpTzpnSZ45VaW9rOQUmOlo5LbwFmg
rO2rIPUAsgY1w77aJ/VsoBWoWfa7IJ3p1YwPzfb2T0NqPYqjz6aZ9quQcv8rJZylZVRYnmm/
CKmUmPEhKRKzUl5y/Jw93SzsN9VuKai0dJHOPmkdiwzb0v4XpN7EzCqSnYl4ZrVbba6Xjgam
duuBhOwnpU6Q3+MO2BsKDyl14GTRsqt240PiD1tIGCGgN1dBCgGeyVy4ZNKi4JwxXISAkQ2w
ywoBozuEfCGALwTo2hJ8IWDAUby0EKANt1ghgA/JaLqNaMRrtsddCDhzNEc14lvKCjchYGTE
8SgrpggBXrXTiOkRvnZbuawJD8m7rAkPybusWQKSd1kTHpJ3WbMEJO+MnQ8pMqSWPMWirFgm
T2pxshZlRbiM23snw9du3tNliS4Av5/Eh8TvcU913Hy1ZIECdQndLUKrI7yCG6VpFv5agJHt
16j2+dcnedRu/CvdGn7Uc4S/ZvKKgw+JD6k9KkrRkH8mKZw9GpL2biwspJb7+rDJpBuktH3h
F4nq9lvqvXBCwEz72rvWQ14OONO+Zorye9yWKcDVhIDa81r4QoBlWcIXAgyOJl8IWFgISP2b
Se22shAgBQCzAndFIUD7eBG0EPBef3rTbSUhQHq279CMu2bcu93ak0Lw+0kCJMmv8SFlIJW/
40PiQ6o5+dpj/l+QNvDLW8r1XfrKIPDLW+TIpnpVEHnkAPHfypWZYllQ/Pe7fY4fWzfB8Rn1
OWoAAAAASUVORK5CYII='
"10c.png"
'iVBORw0KGgoAAAANSUhEUgAAAEkAAABhCAYAAACajIyHAAACjUlEQVR4XuWdCY6DMAwA4ec8
jZ+xYtmuIIqBEF90LCHaqpJhSBwfCRkqsgzDCD7W+z+XZZqmhSzr/Z+BWuZ5Xviy/HKogaoC
2qhuzZDWwkpQVQDbn479ldbSdl1v/P/xA6P8XPtOkT9jzofEh8SH9DJIpaH3NvJW+tUg1UZC
T1CW+tUgnbn5fl3CRj8fUi+kFmcSC6klLEHZpJ4L2wOtfdcG5qX/MSTpyV0dWqA89T+G1JPU
srZB2vpFSCvxT3Ndz+UT4EMqDHbNaPMhCRdxdzTZn1tsQktYYaFfHZJ0U2UX1bjpFqhP9d+G
tFdSUyDZJwluhDNo4cQeIJV2SDokp/LKjllD6tF/G5K38c0U1ri1pKxhhSokyfBd+UzZwwrT
2G0PxqvleIU1ah635cVFO6NuWQA+JONEvAUkt0KA1+ikHVakTbr1+jmaYYVr+jbaGYwOa9JD
ig5r0tkkfiGAXwjgFwL4hQA+JD6kfJA8E/FpCwFPYzWLRHyqQoB2N4hLkBkWAnrFKhGfqhDA
Fz4kPiQ+JD4kPiQ+JD4kvp/E97j5sVuW2I2fBeDnk/iQ+JDekJnkV0suLpRfd+sYbTzka2eV
aHrM/FklZEi4+Un8mW4dsZSnn5N+zuTbnFE+JOXWHwYp04qAq5UPoenbKI+9dQ1Nmhy3p8fe
uhorDaQsa+tqutMUAjzDmvCW9IY1uK1rjdMUAqJWc995KKkKARHvBTCF9C3p2zt2DA/pzvpi
fiGAXwjgFwL4hQAP/dL76upvRUyU4/bSf/bmQz6k09Yy8iGFQ3qbTQqBZJmItyxEuEN6k/Ah
8SHxIWWGNEA3brkeCcstg6Abt8h5pKatgogiAeLvyiV0MREUf3+3o/wAryhEGn/6ihYAAAAA
SUVORK5CYII='
"10d.png"
'iVBORw0KGgoAAAANSUhEUgAAAEkAAABhCAYAAACajIyHAAACO0lEQVR4XuWdi27DIAxF0z/P
p+XP2Fp1WpYBJQKbaw5Spa0PmRwZ+2JI2DItbdsD/Hpef72lfd8TuT2vvwYqHceR+C29OORA
ZQG93vv+LAEBXkFlh9gZEBXUaeg9ft/9AXL9O/c/pL2DOR8SHxIfEh/SwpBmgxxsfzyks2SY
BWiw/aGQrrrKW1NZ2a9CuiMmc9/1BGVpv+5JjdOSUge9QFnb/w+pJwZ8elnHICP7fZDudNAC
lJN9vie5QOLHpHZhxspuGcOthjg6qdfgiBjU+1tzxT3CdWdfpNvczTtLCQxXX08SC7x6MSmg
hHDNbiHFqKdOCjmt8VTcfE+aqJZDxCQFUNLZrXsIzdRJ5mJyZIyJ+HtrSLM9wX2CGy2mTCuV
8ItuoyDxy7fiipm/ELCKJ/FjEj+7aeskMft6ilvQvtTcTdW+TBVAufEh8SHxIfEh8SHxIfEh
8SHxG19x8+duYeZu/CrAzQ7y60mNHeRXJnMxgF/j7uwgf7WE70n8mMTPblF10qq7SoYp3tX3
J8l4wqqrJbw9k8Gyoz4k/j5uccXeGMf4npQ+30ODj0ktGRWd3VptSi0EuFY2bwxvvYUAx3tw
53lSsLu53WNS1IUAt+wWvlRirZP4RTd1MchfCNCwz/ckrwlu1JhUfF6dlZiMlt2qTz60VNyh
dFLtGZrm05IoW2+mQuqdVnjZnw4pQuND4kPiQ+JDig2JdzRQ62O0r0cGIU+4qQG6dVQQsZUA
8U/lKgyxIij++W5/2xcupjffrJ8NFAAAAABJRU5ErkJggg=='
"10h.png"
'iVBORw0KGgoAAAANSUhEUgAAAEkAAABhCAYAAACajIyHAAACi0lEQVR4XuWdC27DIBBEnZv7
aL4ZbaJGSR0MC+wH8pAiNanaJc98ZhlstkxJ23YDv+7fv1zSvu+JXO7fvwQqHceR+CU9OORA
ZQE9Pvv9XQICPIPKdrF3QFRQb13v9vr0CeT8c+49pPwN5nxIfEh8SAtAKs1+HjOjR/whSKXZ
z2Nm9IrfDSlXiezfGoHyjN/fkq4qKHnpDBRu8YuQik2WD2mrD35oSBpjQuHlMiYpx++G1H01
dQWMS/whSK1X00MCWMQfa0kNFfUQk1bxs5Cegc/C7CpQraLWyyvW8T8gnQNm3zdUtFZBrbSi
N/6YBOgY/KRArdKK1vghkCRd0zqtkMZX7W5dzVcy1VqKQWWpkZ/dPHROtGLXkABW/furIFn1
71nSGl0xaXnlFmhFKop7hbRiaUgzpDXuuVuvYh6RHTFGQNBCfE9aEWcEBC7Et8iOWCMgWOeI
ZccKy7fhaQUeEt8I4BsBfCOAbwTwjQDbtARnBGhX1Cvn8jUCFCvqnZT6GQFKFY3K2l2MALWp
ObK4GAH8wofEh8SHxIfEh8SHxIfE10l8xc3P3SbL3firAMHrOdHx+SuT1pD4a9zSqZbvluhd
RabvxndwgyvJ3wsA2lXC3580AIq/061SUf6eyaCU4it2366gmNdemZzpjoDC/w6DNNO9JTXZ
EdeSJrlLSSI72JCEMeKMgOC0pkV2hBkB4ffgNlyMUCMg9G7uCEirPReg5fkHaCNA+iQNvhHA
NwL4RgDfCOAbAZMo9urz6uiQRE8+xLckyTM0ZzQCXON7QPJciDeJ7wXJayHeJL4npGULHxIf
Eh/SxJB4RwNJZ9/zkUHIE25KgJqOCiKWK0D8U7kuutglKP75bv/LD+1ABl5GlS1ZAAAAAElF
TkSuQmCC'
"10s.png"
'iVBORw0KGgoAAAANSUhEUgAAAEkAAABhCAYAAACajIyHAAACwUlEQVR4XuWdC47DIAxE05vn
aLkZq262q5TyMcRjmw5StV/V5AXK2BOSrdDStj2IX8/jb7e073tibs/jb4FKx3Ek/pZ+OZRA
FQGdVM9hyDbCclBFAOc/vc9XtpF2mXqP/1++YOTfl35maX8f5vyQ+CHxQ1oUkjdI7fjqkF6S
wUsuIOKrQrpqKg9QqPhqkEqaylJXIeM3IUnFZK2DVqDQ8ZuQJGlJr4NoUBbxPyAhOogCZRX/
FqSZWo3+0oyPPw1p9CxqjybL+F1Itb/ly630pbUsW8ZvQmoJM35IAmHW0iXXrzPDXTL9kfFF
kGpnKQdVkgf56ButbI6kFYj4Ikh3hdmdlUQjrUCspB+QenO91fE7B6kxPcxytzuQoqYV6pCu
oPIPQQ9AEUBNS4CV0goYpPwAEB30TmtMcrdV0oplIXkrdndIkvdDQoIbAVaFeFRaYWIEWBbi
tdMKMzHpXYifXclMjQBPxTw7EsyNgNUUM78RwG8E8BsBXEZAVMUcxgjghwSabohCfEgjYOZs
Igvx4YwAzRXHr/YDNgIsczd0+SVc7vbNjR8SPyR+SPyQ+CHxQ+KHxK+T+BU3f+5mn7vxVwH4
60n8kNynG3+Nu7GS8LslSmeT0ncb6SitgyvtKP21ABLdYqGYw19VMjsS6K5PyjvKf6Wb4E09
xWD4ayZXUexLQOK/jnsRxV46WaWT4Aopyt6S3oe9e43bU7FLd2OFMAI89ruN7OsLYwRY75x0
g3S3EG+5B3dk9IYzAix3c0t3rYc0AizvCyAZvfw1bqQE+DYjoHe/Fn4jgN8I4DcC+I0AdPya
PCjfFTGIEWAZv3XnQwgkdCEeEb91D00YJGQhHhHfDRKqEI+I7woJUYhHxHeHtELjh8QPiR9S
ZEgb6YNbpKr88oAXzge39G6jLXxUEGOrAeJ/KldlilVB8T/f7b39AAvC4vXwnSqIAAAAAElF
TkSuQmCC'
"11c.png"
'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
QGdf3wAAAABJRU5ErkJggg=='
"11d.png"
'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'
"11h.png"
'iVBORw0KGgoAAAANSUhEUgAAAEkAAABhCAYAAACajIyHAAAdpklEQVR4XtXde6xlZ1nH8aIS
Y/AWpAHxDxOJhAJVIEirBo0X2kolQS4tJRINoO0U8N4bEAOVoRUVGtuhBRSlV0oLVqcXWqrB
Ii3DqKAilE5JTFucKdPxwtm0XphZrs+z12+dd++zz5lzzkyxnOTN2nuttfde67t+z/M+7/Ne
zhEL/rpv+dbvrPJdRzy6e8wR39A96tGPHov3j33sY8f3RxzxqJnjGy0+f7hKrnX+mg/2++5n
+XuO6I44yF/3pje9qTsw2d/t3/uV7sCePd3/Tu6scmD/vr5Mlo8d2D99b6tM9m/+9cNRNnAN
e/fuHfe5/7VAdR/96Ec7fyCk/Neefy5IX911x/RLJ8tffv+D99d2cuCrMxc4/361/TPvAQ/0
9nX7MLK/PXYIDyC/X5CGz/jDYRGoEVAL6e1PfUZ37VOP7ssTune88Piu23XvmhewGpyDlkU3
vQjSwT632nlrgVr6ysz7/M2DKom1f8yszOryqwrQ9d/xbd1D77pyGVC/3bdvsqmL+lqVVR/Y
KvCdD1j7N5oeJ+ekB4ab3z9ZqlJAelif+o7HVGklued/H5pV1NwPjxc47K/3cxe0plIOppy5
43WDBzPdRWU4f2nu+wgAMN9Zzl0N5obtuOuh/+j+58Hd5aR9cP/S3u7vf/DbCxLz8+EH2qc0
+TpQziJf1mxLEKuYnlI1Xilp0jyNHhBQ1MJhR0lU5fgDc6rblM/5Wpjpev3YcC+rQS5IUVKe
BkBKSXAwN2qipHlID6uSJptXUl7XQ2xU1CqlXq/jN1YoCRjqAalio8YnqdlikqNPOViVvejY
Gk9z9Ifrqd4ni+O0Eczcb5ePGcAsMqt1Q7ITHLGRH7Ololu++YhRSakFpsHlvrUd4zrKCGUB
9BXHhmB24XeM7/fNbSeLg97JRiE1Nc7FR/1QFSra//k7C9Du7316va9qvz/XZz5yw7bu7DN/
udvyipO6La/82TXL6a9+UZW8bo+d/ZsvG4/Pn+f7633/G/PnZP8Zr3lxd9JLTpj57nb7O+f8
Vnf1Zdu689765vHGq8UwWV9cNwNJFc/MABJE+iIm9qkjv68CyvGp9l/+iVtu6y5/z1u6nR+/
vLt/zx1VHrhvx8y23T+/b/789py83nvvbd39d99Wr7+y+/Zx+29f+szMe2p3rsIK7PvinTfU
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'
"11s.png"
'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'
"12c.png"
'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
AABJRU5ErkJggg=='
"12d.png"
'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
QmCC'
"12h.png"
'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'
"12s.png"
'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
HzIXoP8Dci6004VXYCwAAAAASUVORK5CYII='
"13c.png"
'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
QmCC'
"13d.png"
'iVBORw0KGgoAAAANSUhEUgAAAEkAAABhCAYAAACajIyHAAAdVUlEQVR4XtXdecxldX3HcWi0
SW1MRaTGmDTpplattlbUUv9obBBU1FYFRP2nRofNtrgxoE1qrchStKU4zETaJlVAwJVlKG6p
IgiCaWhAQFET9mUe0uW5VCA8c3pe33s+5zn3PveZuc/zDFYm+c05995z7znnfb77b3n2mvGv
2XevvZu999qn2hOe+MS+7bX33vXZrz5x39rPe49VW+3313re3R3/1Kfuu/y6vf+9dvOv+dCH
PtTsXFhodo6Wqj38k3uanUsLtX30/gebnTuX+u39jz5S251Li+NtWvd6cenRmZ/376+jrfju
8LenryNttMrvdcfv2HF//5773xWo5hvf+Ebj38477ywQBcP+vXfXtrnljgK42k3u9ubXCGuu
z9vfzHbu7zt2cPwQkn84zALVA/Jv+7Oe07zvhfsXpE+88IXNPz7912t7xh8c2P/YaGm0bmn4
WWqLi5Nw828aVInY8N91z92vWTrnnGbp+zc3j2zd1nz9RQc2H3zms5uHL7qoRLcnv5p4b6TN
+s1ZKvUYnBuw4b9l1WuNVZ2wVSNqdfUTntB88SlPaR6+76Zq393vt5qzfnnfMfHOTmlLo8X1
2ZDVAEQFRjNADN9fw7l3d/58Nv177lWjLWX0f/5pT+5Vh+Tc86RfaB588pOah269rDnzxfuU
qpVNai/w3od2TECq938akrQnpGQAy35eT7y/uPLc5fGQKi/l4lrjTJJAIk1sU0lU69n8WB03
GniLx+iGfprw4v1Ws7GTkLj2Tt1A+o999inJAumhxVvqR4r6UN12Zx+WFleq05QaDS+uP8ce
AjN940NJKZWaIxQpSNQtkEABh8pd//wXlKoBJE7qT9JBcoK6iNz8etu8hnn6O50t6e3J9MPo
Wq9WnZ0pVVucH/44yGyjarYmKgcOSM21/967f/DqYkbLgeQkpIWNw1rqbNxoYT6o63kYu3D9
u4RE3RI9x5sVpDZw1L7w/N+tBlpskS9+5artzeGb3tAc9c43Nke9/TWrtzk+3/SGP26OP+qw
5sT3HtFsPvqdte/9I9968Pj73THZ71v3fcfVsdPna/dPOWlz88nzzqhtnwksLs4d+RckuVjE
kpSApAHkyYJz4dOeUxJVEXf7pL9z5XnN+z98XPOj265p/uf+7+6y/e89V028Xrjr2mp57cHs
+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
TkSuQmCC'
"13h.png"
'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'
"13s.png"
'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'
"back.png"
'iVBORw0KGgoAAAANSUhEUgAAAEkAAABhCAYAAACajIyHAAAr1klEQVR4XuWd3Y+b13HGg1zk
7+tV0YuiQHthNAFSNG3z1TquP+TUlqVtdlfaSKtd2uJqKeuV9KqiKypmEsbetETFCwbYoLpQ
AF0IqAu4QC/6D7Dze2aeQ1J20va6AgiuuOTL98yZj2eemTn7lddff/0rm4/4t/ra1772//bB
+r8gk5cFFM+r49HOajh8e/Vwdns1e3S0+s3Tx6vx5PrqR3uvrg4OX1+N+x/ptfPzfrVc3Nl6
LBaj1WJ+qsfs7MPVZHa6OoprDQdvrWazwertv/+bVTcdrkbdldXrb397NRhcWJ2d3azPDfJ5
0a3m87urs9lwNZ0erH4xva6H/j+7tZrH+8/8iGvy0O8nR3qeTq7G545Ww9G+vm/cXYp7+UDv
m00OdE3Wd+niX6767nK8/2j1/R98fXUweF3rf1lQWwL65JNPVk+XD1dPlh9pQQ+nt0I4J3qe
xv8n02MterHoJSAJadnlYzFc/Wp+a7VgwfGYh5DGk8FqNHp31fV7usHF2e24qf3VqD+Q4Hgg
fAQyn+XnzjYeuo4fcT0JJH6exKLG42urx+MbesymAwmFB78/OPhOPP5Wj4t7r63ujd6T8BAQ
z32/KyGdIqDxntZ4OLikz/F75LApqC0B8QaE9PzFP0lTnj79yerZ81+szpe9BIPgunF8yWSo
n60xPOYbD26UG9g7eCu07pp+fza/E5870g3Ppid6H+8ZDi9pwfxewpghoE4CmZemjMfvxyIu
rE5jcePx7qoLQXOd4eiSHmzCODaQ9x+X9uwevKrXj7sfr16/8M3UJgkzBDK8HFrzjizCwr1x
+IY2zVq7KahmYgiHB29Ynv+j1PpHe2/FTY60o8vQrvMQGs+YERqAZt2Z3FyNxoerYdw4X3IQ
N8lO7w3eiJs8kDBmYSYsjAVx/UVoDg8JLhbexWcwAUztrDTHQvr4bKjvePPg7dV7O9+ViU5C
I2xy3MPtYWhrCByTQlPRCgTB90kg4SIwKcwQwR1c/7vVYJj3wrV47B5e0BqsKDzb9L7y1a9+
VQv5/MWnq88/+2cJCOmjAfPFR9pFdg1tQLukYecPw9QepeAW/xCm9iAWcn016HYlXP4/6m60
XUJYXX9D3/Or+b2meTYvvS8WIU0s0/Lv8F1oBc8smh3HN6J98zBfPsd3Nb8Tn2ETB8M9+RwE
i69Be9F+tJfNxBelkI6knbzXwkaQbN7exb9YIZ8UUlzYQnr27Kdy2GgKu/3p/IG0iYUjnBRQ
L2kjKISCyXDzPI9CK25cf0cO/+xsJL/Ux4JQ9UUtHt9kgaBl2s3xlfaaHLg0KnzYeLC6+OML
q9fCt2BKLFrmKYc91OfxKQoMISRfk0WmU76a70NI8eA1hIGpWUhoH5/XZ0I5ZBGhfT+88K1N
Id2WgP7ts7n8EBcbxpsRFh8aDnG2oRmzTgJ6thylwEJQ7CQ7jL/gCzGrg7034/ePdV20yLt+
VgvPSDPc9mclnLMyMcxIJsLCSlBoKpuRkS6jGlrI70+uvyF/Npulv+T6+n1cw1rEvRBN0RTu
FaePYA7DwTsYoGmvvve91bf+6o9Xf/LKH7wkpNKkz+L5eTjrxflkNeg/CKH8VCaG6U0iys1C
cPJfiw8lUFSdUIs5EbWwdW6Yz7BAzASHjVbZFDBfdpTXZDJyztcydEe0YTH3wwT4WQ4aLUEz
w2cJGsTnuA80HGHiS27HRtr/od1orgWJkBDs7vX3QkiXtPFcH81HaI/vX5M2jwL6XLj4HTl+
NuUPX/m9DSHFFyMga9Ovn87itfHqs+fT1fNnUwmDRWN+7Ax+COHx+DR+RngIgy9BMKgymjaZ
3ZVGIry+QjbfNZVTvq3FIkCcJjemXQ6Bs4i5TDKgwc+vh7+5IhOQ1s1uNocONMEEiXw4fgQH
RFG0CyGsNW6oa/IdmBHfw2f4Ga2XkMLcwYcEBjATwuK5CYkdQTD4oxcvfqmwz+KJZrxmh42j
Zpd44I8QJK898eshIODCMh7nApa9IhNfjlqzcHzbfHFPwBMhoXlyzLFYFowfQIMSCowkDPya
hBSfx0fKrMPErg53tOOYO2bH5mD20hb8UbyGaaNthHwiLu8Vdovf815+xoTtsMFVCAfYgMk1
IaHqmAELkLkFTvr4rJP6WkgWijRFjvhE2oEWcdMCnviRuLFJgU+EIqdaN4ZmADjnFf5ZMDcm
RxpRlKh6aed1CWlRmiYtDYiBr5sWTjuWQHdkZvgQw4u9ve/I9BGKfVK+f0ebwefQWsyZ97AG
4aYQ6u2bb5Tj3tWGILgtx81CuGG0Yi2kdJ5oCWbGwn5x1uu9sv9YBO/hc2gRao6geBxG+OXm
BRa7Q/ktnCuOH5+htCO0SXgrBI0WcU20gp8FBwQF7kpIFsZ9AcnLhbJPZAGzilx8Bm1BKGhP
Rr3rTVO5tk2ICCm0j9+LTeV+McFJv5MIfLyr++J9TUiYBItj4WjOv/7mZ9o9dhf0iwnhY8BQ
CIovxnknZkpkjqbxWCzvy8/gA9AwFsn1ERYL5Xe8jv9AwNoAnHcsFOePv5MvCi1mE2Q+8X2C
Cey+otdtLWJSuRoC5Vr4P8K5opac+bvaHDIEIhZR7GCwI9/0473vSih8XsAzggMCwjcJ1YeG
bwkJSaIxLBhtwtTYdWGjcto4cPzWNMAgKo3PabhpOW6gMhPdBxIKYdfXA0Lw5QgA38EGoJUp
yGO9Ln9VGsvmdJXjseB5wQe0FiFgYixIZlVRkw1gIzAVBMTvESqbhJCAMmA4NIq8jt8bhXNP
FhA/o7H4pSakxyFpNAghLSLU83jx7Cd6IBweCAoNQ5jcPL7l2flH0h4+J01ajuW0DQ3Ybd6H
wHG0hOWl8sCPZCoK/WES+DYWaLPV/zHD7kpirHLiwkEBBYh2JKtOhG1aCEiOPDRPkRS/Fr4P
vIc/wt+B1hVFu0yfiIraqLieAajNeiu68QEuxiJfPP+5Ihy+CSEp4sVrDSvNkgJBQDZBFuCo
1wsND+VH+JmwjclhSgKRgXXk58IvJSVymhEorotp4WSVgvQpKFEjs5sFCU71jEYAFdjx+5Xw
4tN4/+7gPTln4Aj/l18KvIdzNrCdbdAraJKBJJENJsCBhlSlCQnVxO+gMQhIgiotAg4gKEwA
k+HmcXZKLyLE44C5STtnkkf7BUwmnfP7befwVb7RRNt3dR02yQ5aQg0HzP/TFK5VBLzWfBQm
RX6GsNh1voN7VCQLTcFMj2OhvBdMhJYkAC3hNA060j3zHrQQTcMciZT4rQ2cNBSIBDwiIBC3
gGQ8L5/+TF+usD49WUezuDg/I7hOWjOQybAwLk4Ixx8lBNhPSkTUREIIhIX5zStyIkyCBwtP
CHErFxL+Cj/B7iIIvmOs166tUTp4qBw677MG8j6EjUNWIg36ng0a/+TUBEeOcIS7QpvSZ4Wg
dr69FhI3jkDQGswKzeEBLsIM+EKyd3yNHuGDnjQQmf4GTcLuiR44R+GhME+EwW5zMybj0ByE
J0HF4tBGCwtBinPCJOCY5qf6DiiYgRLonUpwh0WpDBt1Q9qBTyEycx9QPWgcyJr3pgZloMAH
TUuz//zVP5Vj5/n7gY2IamjWliaBLzANoVnysxBamlJGJm4Cc2xEHP6ouCX8GLuLgNgJiDa0
iNCOb5G/i98nRZKmJecf0Q/hnVlITkNqMRm1Om0Q2oqf4cZxvkLUaFIsVgk4mhzCwdSmQuMZ
1vkM94N2YD5OdvN+d7QZbB7mBp2CoNCio2vf0/W2hMQXEt5JQ85LUxDCc7GSY6kxi7MW4bB/
HZStwn/hGlEqCDQ0AAyFBh4XMFxn+3dbisBicbYsGD80r7xMJJ8S2WQH+gKJaATmhumyGAAi
Jox5oWGY3azMyQISyg4Uz+bxfswMTUVwQAAEwfvNKeHb0CJMDwS+5bjZRXyRQnhgFedq+Kkk
5Ef6HRAghfRYOEmUCbwS+RoYaZk8EwwCC2OXEVyS+5nBg1m4QUUjdjQW0XWJ4OVziu5N9vJU
C4MiQTBEJ3Y9/dNuo1oTfZvuHSmSohlKYOP9mBCfAZzi0OXIEVBx3ml2u8JJ5pIQ6lbupt1e
JC2bCHssE0BwMimwUIFKa5MRtoREMrzMygk+Bv/BbhF2MQWikxYR3wFmwWeh6vgO0aaDNFE0
Fv8zkhkOGgfFTpsL5+bxK0nfjvKByc5uNj4JF0EUxsx4PwIg0+d1Ih7fjUCIlAgMGME9SfjB
cDoX3NIknCELx7wEAWACwnEbROKDxAKEtnCjw+KRWRQ4CcqEG3WqAC5RDkZOFT5F/ic+4wWg
SdwUgpRJAilcRorfo+5C0xtgEe3gNfALJmd2UnnatJ6rmpKMaEZVBGI6GLPmvjE5BIe2yYzx
bfi1SnDl/F/GSWiS8y9VS8BLBST5WWYWvycvI0wT7kX+jy61RFPhNJD7k0pDiB6LSjUy+iSx
hsYCKaaVlCq6YVoFFqFogAFG2jh8zES5JIuJ70bobKww1eSosZl2+GhZOud3tXg2itdx6Fx7
KBbh3TUPpUh3VZuAVgnx97vbQkItkbx25NGRVN54yXkbGoOAcIIIA3gwLNDITfPMgjBVCTJ+
h5AwxYxq3boIEKas5Fav3Sqf1et3CJnvYEFmIDEdnCr1PfseFQBCUIBNF0JNj5iNhOwT0uZe
MGdo6bhXtNcFU/mkwFF+WMtUCNjESUgXLTJWYgFcEEBpzIQ24ZDlM5SXvS/hcnOmUtFCfBja
wBeqohva56quI1b+PG44CEGZjMvdviTMQ5Rix+VID39QFZW7jSXAkYOFMF+cO5rhuh3mhwC4
FhoheqVgBcJTEhwRTMCyaGPnjAQFCSlgwxcKAaZvQdlQr6ZvnexickLZsRNpUkd6RgvZRbMI
YC2+BM0xUEQIyRbcSdayFprFzJFujgWRGiAMl7STg7oth6/6GaR+bIzwU2yWwnlQsDvxjDBY
bAagTKANB1SgiM/zrJSGCBffaYoXMKrSeJfEHJuCb1wLKaSPgFB1TIWFo/IkuWYmncuBp9Aq
BINwn1TqIe572bdr4C9QcQSlguYsE1MR9YqmCQsyIt6uNOVknfxWMou26VHlqYECRpaREAwp
Bf4KwPnma68IoJo1RRDym9L0YWnJtarVXRGdq4JEYSWRcgEXgBtw3VuFABYDGwlXBEElbYkv
JjIIVBZdIjol/p90SRJkRD40B/PjOpgtWogvkABiV42YMQ38CxQEN2aeWymKnHqnHR3XDrce
gBIUAp9Ke4etAIEmcT1Situ1CQrtoUFoM1FNwcWlJcxrlsEHRUCQBpRoj2EDoPLr3/yjtZAw
BXzRQ2Xfg9z9eA2HDPgTjz3LHAotQ5DgjixYPm7JaaYvY30uiwJj+QZuWKg4Pg/Bh7DI6hcF
VIk2pjh4nWc4IwsqfdfdlrYk/91llIxr4m8kIMpOs0GWsfprrQlDBcsCjnbqYkIxwfBnonHp
LAktgmgjHaGhYotPYrH4oo/FBt7QBxAMaLUxhhG6sxx0q0i3e42+RfOyAyV5bHYjc7KPFBUn
Vfrh2mgAAkGlE5tckwlhimiVnP/iTqNQ+G40DO2dbzRoqChZFLHeP9sAlzLPm9IQIfLYKAkr
ylM8FMmmmYrIJIdZbcH0eODbQNtbmsTNsysIifDOrph2ffF00tIUs5cIRf0BaqToW1qCCrN4
QnNGrCTywDdEKVIQdudfxpclTCJSUijJBnCdpjVnVT0eJXClciFhVIFAnSeVfKONmfcNWsOF
wGUBTCImSDqLFxkIjIswTcwLbeT/PLoqe2/hJKRNJPvspSouyHsTdSsdIb+L6IeWICh1g6Bt
aEz4IkI3dk+F93yxNpOlHHK/Bo9gqOU4/RcAL4Tl96M1bAR0Bz6HaAqJj1Nu5jPLXifx31XV
XRSD4BQlu05uKWKi3TwLLtB1MsgqCtaCebu7JCsluwKVW4WAxUYvAA+cuIQUgHKzOOm8DYER
4TAdtEN8NM55kCVpVJidElAsgYjJDDPB2SMEhKZeglmX/LbYgrvqB+D3YDeEBPgbFj+Nc866
XTrzh8Vgoi2mdhURBSpHCuf4GRN5tO+AfbqqzSWtfKAoB3Ds+7WA+HmbmYxdQBjcHF+OCmeV
9YEWgSlKIxa5w0Kv8R7MVDREaM+w4D8UCrssHgnyvnCSfEkAS/7vEL80XOgzo1e0q0iGiRLi
89qHrXUQDXWJHOeb+diFvOdqvEjUPZLrEH0bQmITCRguJbmZQpgunnHYsJGnVckFOmw5btGy
hNRZkvYIxXUxzIEvU6oxGTaOGu3h94Rv9SKR/52n04WTEq+tQuGHibzFSI4kGCIoto/muIwt
HkoCcDQb62ZZJL4us/3Buj2wSDrMN/sQEh9lU0e+n54pzIwGjsFkJEfMz2uK5GqaWawboWCK
AEjMjAe460tbb3jgi54Ucha/rQjyQNl+Or0j/aw6HA64yC/5G1jJ0BTMisUpW3fRoHI4NBAI
waIUEYuqyfzt7lqoJNSUg8KkJ9Xk5SzfqNvlIPwMD3gs9QYItY8yiQ5ooA2epBm6UcPlbFjK
hxXNcdb4P5RhG3FXV4nTEBwzb2KH+DDYhQXZD6lrrUgydXUMs8UOJ4uGQMY9qbbBSYG4RfUB
oCXpR263Gr/rcYYa9mPcF+9lMdku2GnjTHm4jobA0xdl74AYy6q9GRMJO3VJy/B9qtyon+qy
zBoNw2Vg0uabvlAtce6Gs0YQfAm7i6YIRyhhfSATA2ASmYZFv4rrqcYG/EMWATJvc0Zt2gNU
z02hYewgQlBjl31ENV8IvFbpm4VYQ/kOTGinuGvMAsghqmWjMADkQIjrDrwd5XjelGz+ulaN
Ytmy7OsRfPBbW9GNNxL2bWo4cUm/v9F2Q6xfZfzs8lP7HRYRC1XFJCIFu2wh4YP6oka5BkIS
mKzQa4CpnsruchNoNoPtZV9TRRwnw6Q1CAgThAFlYZiHtHSDdOO6Li8JElCJiWDgJi73eGfT
aWImwYGD5LfFhW9SJe50U9U2hIRZqSFKqrufNMhGY4Rbcaalyg6Z7JCavRZdS14fVoMXN83P
w0LYvYqcJ9lUOksz/FT9BC4j3WpdvQhQEamYB4SCEN0NwoLciDovNK7uO2jg1rx6Uhq2IxNF
ADhqBA5MMIg8FALPjpMtTUJIDSOFT1pUCtI4bldJqo1ZeCmewUtrkNkr/K+nA4Z6j4gu1ePe
keZAiyr8857yQ4tC0GrtYeer1oZ2kvByDRbMdVSzCwFD/xL91lWWQSPess/zUpp5Ncm7VM6G
IaSdoo7RHMJ/VnHSPHtVhF8WUlzgeZWzuYlJATtTuGqpIY9SUeCnrfaW1ZVMPfwz7KE1iWfg
wxBQOEhNIOqta3BJl2AG4C0WAF2hHqdBpiuNc6rGUJy4Kr9VfjIcEAIfZzk8W433Gy1itjIb
XRMvgb75Tr4PB809YH4ICa1FwFtdJdgwgkiAdiRfw5dK+jjvqnqyuyzO6BsTeVxh1fkWn+mL
73Y3blecjVt03O3mMM/78S0K41Ury7mP/cZ9L6olB2fMAqZVRhI/VdELH4R28N1ooKYFcPqz
LHF7TsU9CwjIFRIEttai5Li/gJOUr1WehnnhH9SFFn5ByJnCYkQcXmOxakEuuhX1dg+0olYs
Upk9vdHdfrUjJ/Djhk3VJuruM+eLlMadH5imkHHRte5YcakIM1NDepFoXZkN359sxPVs4gj/
o2uUOYKnMum9nYLs1wQcm6LQXz3lboD/rfStHDjFyjAtwF42iSa45GEhqY+yeo3ceI5A1XU2
yk4zz32oK3acKHdewHFZzae8H6CnXoKINiN1iuzXRMFJi3DSDhUF9pNurZaZtklVHOAa7iRx
Zq8ix8agTlpMUsYwF05X3O3G5qJpX9rHLRhQlZJE1LeSlw6BiOCfJcnOQjCD89YK2IsJwA8J
KI6y1U6dHYV1NK0UJormcN0sECRvtFDfQdbuhPJDqKQVCFbTAs78x0nhar6kSuctZ4uHO0nQ
irHIt12ZUg7rpHaxefi2bDbd0e/ll/pra02KiLmFuNEEhCNtKryENqlvSP4qe5fIpxShuivV
QfKOQKCi2jJ7lewf8GEK5zWfglBZgFGzh11MpaQ53k68IhR/OTVPfUzrgZ3s2E1cNWuCSgYA
X6caHa2Hk+vrIZ14n9qRBUX2GiYzI4npYa4SbGksz7zWhMQXPym+R4M1oRGbNAkC4nUT8Q8L
XRNGUdtlCUnlmi77FJ3x43/c6IlJSpghbBUrteuD1oEmXxbYB35HTajjahjbGhlL3wjQzPm2
kRb1yewwu9qCyCNyScjVC7moJtVZ9VeeuU+pjV6cSCCq5tI7Wa2BW5qE+ifTN8qkM3Ye4aju
FmYnIVV3iVuNWRAXBZuIWi0t0nybzGc9AclOCfnCZEq7EgLwWTTquBysQKUpZE037UkDSFAX
xW9zPeVYlWqYcuV36fwvKCXhZxUe6DMwVmoCGtbgT0ZfJbfhx5yzWUjQM01IQpzTW1qcSLDx
NS3mczOUz7JZYpN97FXbvy3NcFmJAoAnmvg8YJKIxO6iGcZInghQzS42ZE243dXv8RHqcCtH
jUMVjVLcVM6y5CiGp40waz73w+og4WePYihlqYFDBNXVDAyCQRC4DQ3hbPRxI+itrhLNqeIv
wkRMkcyqRbD1ThYpp3a8WJjo2WU6a5JW194amISerfLSqDrw7dxNmWSDRfoVRbqiVDBllXlU
qkqTc3GAoJGR72Q9hkoPQXFboGbWgytAM+5XT/aswr9ZCNhISki8D7OCYEv8lf4OAW6RbgAr
zaVNkncRvREXdL3ND1c+EJIqulXWdndclqLuVMTKQsKwKiKeHtKcSZisaJXCQe7EZbFqYAWb
iQs/bdWPefUJ8FlRN4+OGkOZiHtYfdu32/SAe7w9BUVKNNHEQtIjinhdlrMg5NS8OrkuLbLg
1j4ppOzC43n1RaK+7DzJrn/n0VJuAGHwulr2pkmIZarSy38hIG4Gc1DHPiRcbADCURhH3SNV
4Yb4fvsqHCzmxGcQujntReVzLCiHpbvWXyDKuarA1gYXNufVmqgxELQpsJK648IMecCbj6o1
0J0oaCNatmVuqpaAk4oJQGtQX3YZISE4bmKm6JROWs62opPrX6qM1jAy2nA82m+NFHyG1wBo
7kYDYQMNEgqctnJSV6+1ie7FvcZxoQ252zvyLaaFs+bWZQ92d2VrUtPaKMLt0VHrwEVowyL0
3GtJlKNYAN+9VXejYKfyEZGsEl0iElrD/9GiaU0palRCmpbjE0jci4Xrxnmj2nLY8TqsYS4k
Nc4MoZNZFpWswIPWqtNXcsr3owH3a5SB9yF4nK0aTIfZb5mNWomjcBvuXltslMjRPhFwo2zF
Say138ZN8Vv2U8OaaNoyNwZyXVL26AJ+R6Vo0pHSkmUN4mBOCBLQxmJV3V3kOAWfUXdJUMCa
9I6d1wQ35lENFviDHKo5yjmS+Z1KVLMqyw1iCkQd1eu7TC/4fiJr0iQ3WgcI6Nkpjvxg/H+k
Bq7LLS3iGuaQYCS4PkJDoJpauvY9aRAbx/+5xy1z42ICjaVF7gzBxwi3VA/jZv3NxJa57sMi
4bMTP5ur2BV2+awqvXBM2STRJSWjfG6gmyaaeIZNWlkPTw/MK1qSZ/FeBIVGsajGQVWzvZmH
UaUlbAIoHsxl9tLKoELBJLvdlDR3OSrPvW+ZGx8Svx0m55tnURQp8UlqFa4s39m0j8/AX4Fl
clzicsvid1R5fVdf7u42RzGNxFc+l8AttSf7x5OLMiuq5tRRNpUizIs11Y1wskMvwaErHyoy
qPCwHoI29tLcS/ULJPn2lqyoLzZgXA1cbuLanuaGdIORrEqr+pGK60ZIFhblHSWLcUNmJOl+
4zUeqrtPhwKn2vnFnarinjYE7hyMBXFjT6ozzu02LicpnQm/aA0FyYODWk5WFdyhWMi31+Us
ny2wEd3QGn1fUbhoCVpImEdQaIzH4931Bse0RbrJJGZJvLWqSQjJJe9swhq2AZjTOnggcVL6
FDceYApEOIQN4PT8W9bVOglOWhLaYW7J7OXUHSKVo6m5neYFBFEPpzT4GISHg57XgTCNFZht
nJdSzfWmaDD10z4/y8OO34VKnZxRacn3NzWJBieT+25W4AucpfvkBtB0Ev29HCA358HAs+p4
xVehZc20NgaXEYjzvHmFdtfje83G3WscOVGN1917iQagrfZHRE5FW5rrK4qh1bkhfetaUa8l
M72LBJ24EiIjkcv9lmhSavbVlpZgjluOm6gj0n6WNf5FNR2IstUsRs7Nbh7DwSI8t8quQZfo
JBwi3zIrJWqMCJSeg4CjxoHze3fl4lMm1R6YTOcgO3qV5J4000EQaCYad6hy9FuKTKY7puqs
zWSZiKdS0/ByUi3VlmhkLr4r4ApRDB4JJVDOVyOmmiiIzdimb0M9/+s/z/N0iVmOYPF/Yacw
NwmuELVnS+hbUh1skDkSWCsbRgetT7KrOpxKOBFelaMtuw0/9VFr0kJj8XkgYMI8PkOTAWej
Vs21Web8/12RchoeLDCrgxA4LmiSQ4nSutCQx9rkUZvZdWVFSlFlsYQdl4Tz0FS0bavupn5s
ON8CejkSfiurJbQJznJ8wfw3u6+qAlOUszxXhIW7s5YHjp7FZufrZd0Au4XmIWxXeFO7slKM
D+jqXo6r8JgNYfeyMRUBQZuERqTmPmplKR1ftNkvvkh+S1GxACsRsCsgK0JvuuakwHeuCsNt
s7EIamNsYl9CkS+K3QUEgj6dg3FBkWjzu9nyW8dZsChzOcZA4qxBzTXbIVRbo15EKrTWgz7n
Prlrkby4ohmkG4CRcF5TkTrsoE6eEM4Kk3k8WdfXnKosNs4d2H6ctuFnTOugzgfIaYFMwnnA
HrisxGMLJ2lwr8g0USWzu408U35Ed26dOsFi1Vgaak1TlGc3fCoX2iGUPMyUBP+BcEgcEZp8
U/gpFtPMrmABGuuioUe3VKQMH6GTdGo2LgeP3y128kTaJVRfJa0cgr6lviYW7f6lWTEL3D+J
MpqCu1Cki/vER4kWZioifNOWublM5PKMZz48g6vZErrS6jQGddP2H8gfuMTs6q2H+BzJuKYO
ZynWcbrRKpylqnErBtj07KPQXgKE6v4cjMCGVQVXfQTVnaJh5g3g6EOpPFOH1uDrfCyHaWiE
QjeJegfGgzqOY7+1SbPBTUhIzmcnnVfftsk2/BCLVcJbU0mYBqHVfuG8mksXapUZaBdyfD6j
nce9VEHV4gYbtMZJE5KTVHfbtXNJ+jy3LU+fuJp+ZphzvfgSNu20361jPu6JisFkxXDWDBu8
twV6XOeTiMapRhCuwftcLPhCOyCqaieN1rT+yJpxe1hEGzegacp6vY1BLLMErkpGVUH4v3jz
+Z2Wkli7EkP1MgulOz7TTdHuTvYAVMTyzwjAh0y5QcvdIgQQzJTv5R418NzlwS6u7ICe5zXy
mrNzu+3wKfwxnye1wiXgtBHQFuKeifSqxoVF2jNCMQup6cZq3EJDjJd8qgQa1YaWizBTE9go
d9LIOgV1p424qzpbJSj8SxYtRzmZIAZyvw0DLgoIinVo6Uc2vSdXvltTBg+aRvabbTrMGc+G
G+PvWS3xAQ4Qba4MZ8/kS1SJ+x01UVQ1/aynnwjF5hRAnTFSp+P4qCClJhQl433qgovF5ZE7
iXGclmQb8U2F3Rww3m2ZOgBQLGYlq0nbdq0XksUpnYHCYaalrqWJSqY0IxLriMYaB9uMbLpO
HTvUj7MvSadPzDzdfZLHlQ2zhdBnBrAx28XJyWt5JkCdLGFmEoF5lCvTkY8UGXCgCCirIg/q
rIBufaZRqGzCggdtKBBN8cyGsFNl6zkSmr1QADlCMTU0NYCNs6TtXgL3AXg40YdT6UAWWm1q
KNqnUeT5JZkkY56Az/t10o1pZ51ZMMqKsOdx3QuwJaTl7OLqP15MWnkbnwOWUD6EoGq8VDx3
Ha+onsPxoB1hIRghIuxQ4dWj7K6+HJjmqAJktvCtBak0JRY/LOxzVnWxvvgkNb+PLMA8IIYI
5hYal4+En6ofks8qEjMHFxs8rPMpFV0jyt2Rmb2jQNPODPDnQrBExC8ISaNbISR8AjcAJ00U
0JFBTknKoYOl1DpcbTeLdmpNjknY2WYZKnEJQNH9Qdz8vKCDewFEs1bL3riO+cEnAgNUIEB4
8zutWIDQPcvvud3sbHm/MZc4cLT24zpFB02Uz62qSOLAmxK+TwtkA/BlW2By/MFfK+nErAwY
R9Xnw64jDBayOcql85YW1cilYeVHa+ccvyeB1BhqUbtZE9uRAKiYsJOb/sptgzhrFkgIF9UK
OxmfFauIKcxOWwlcbceayb1cHPjdVqLiuh42HFYqIt9THXNqZ957s07yulxjE0fteVgnT6zT
ksNXWvvwKEgzgCL+RTWw7koN/I3bVJJTF58w4eccfR+3eV0Wq4aLeG2xWBc9c7qganSLj1rn
voeOVUavNOa4Cgw+UTDPTMmaW0KLvjXRs8E+ptECM+7CzMFUvi55oK7Z77YjXSUszlSapjZt
CQnHrbJMNXeeVWmam53UpLedNz/TkiNnHOboSq0HbIyL1N0x2mkHL7hHWw5/mSmMz9SFzRTw
Cy2R+YVvyu6RG43nRiMI04sSjk280bSLRNqqzohaubslqL5OzkFz1Ie5dZhnFi/zZJ71ZPdW
V8mHgz+TTeJ3iHA2KTdqtTGuctzWEszHR/7kISlH7QwRHzanES2ccp19krzSg9aqo/7v/obe
jxm6g9ZtggQCnhEAkcmCnVeV2AyBcBmbVgLy6Txq7KrykbuEM89bd5egOaw/629rCncLcSMk
+CAEYMrWE0mu4FpQ4CEWpaGW8WE55MvtOB53bPhUviT3R63PQGhbE95dFhyVh72bjfLDHKbx
3IkFqNA/vl4pxAcbRwdlNMIc2TATeIq4oS136pFTAMlv49vkvHXca3W/tQOnjorASxiw3Q44
fTMpBnYhhAAEEFFVFVwfnuCxd5WByKPmWZUFzLFbDudy4GhCNUTkbEnXeGjDBrW81Gk5JvX3
NtILhKFEuk71ck+mx0fzXLhBCpJ5kopansx2KcpVEzblTlV/71cDPUJqZ57MBs15o0lbLcq/
+uXFwEh9tvJVLkNEWdO1j9ucG+aXs6+32gntx3W8tFMOZfRqrjjOrrKWm92rI8QGbWdFg1SR
kGsR0TwXJ7qjNA1IkEl2HduqQ4xTQPhPHYtdDbA2Rw/sZH9S+r0cmH5VkU0gMvwgpubDrDZ9
0hYLYJykkvb5uiDwcqJr6jZN8WFT+XmVgDYRuI+zGNXBmafV+NkXT2WBshj3QXoCal5CYndd
JMDM0AR37aq3oGpnAMKc5b/QetDFSk6y31IzeJBtmpL8gTYEjcUxu0TlkVKgxKz6JukH2NIk
hPR5nQMwd/9iHVGmfM1Cq+oIWqWcLczKc7jSxEpBfNDltJy5z6jly9M3jTa47r6ZhVt3kiHI
YqHDuissPgjYpD/+6qDalCdVDE3eKHkh+bcAv3ks2Vsi8Hgvx1f7XAAdyklpPQQjpvPlFmUG
h//9WeZiTjDzAKkEez66tb1Oi85y3V+ZOKmvY8iyrcatNGkCp61Zgp1K3GSkXQXLOuLH5jGp
/moteuPE964S56x4XGmNWGsa5WorMel4xkL+ztMwOcxNBJuOnK6cbZZDj1zL/QBbJaWL3/h9
4QvVm2qyW4lt9Qa4OOl8TJXULhNKMQWlDe7VJp/KxXUtIKD+D2sWbV4dbWApJbHVuK4TAauL
P7tjs8vNqYhfN4+k/m8INs4RMPZx5baObvQYmkGl8k6d9X21pSKeFAC6cO+eXtrqmRz88BvS
Jp2xP8m8SO1+hZGy9eZWO9xOgzDVqT+qQw4Io1L/UGMcrXsBkku600I6O5ljV6O6Vh41dlaj
6HLmCCsW58qqRkhx0GEOOi/O5lfn52ZWcDU1c0NI1ibK4OpMqWNh3UZ0VhvvYxXRyjzPJP8K
Bc69CUlzqXU8PDcIKiXa9XaiTUhXJMRWDlp2bRyUmzFeOi6yLevvB63fEU1DSGCybL07aebo
ggD+ba/bawfd4Uw1CanDOQet+XS5yGT4tCaK2t8W2Pg7A/ZjOti8z8zeh7mwkQhPs21x7wDH
gY95rCouzn2d4HaX2ilaPgdSVYmpj27Npi4dvVHj6h7+U6NodbHpsLkuo5gzeZ/B7WEd9Sn2
2b+I5vpMJQKAmz7dg21gh58j9xKXvXHsqtG+/ziMy+dndfyiH9nWfJhJ+ziHqjV/UlPbOjIt
BObwnzz6S3wSpuYQv5mC6JCVAI/CTYTGWBRaxWvcNDfmpggfagd1wXs1Qlr9kjZNCXBcuGez
0YEe8Nmg/a2BpI+v5ckT00E1edU5uToqcT8bQ9XKd9ToZn3fxt9O8bkmj4uqMXDUH6qp42l1
inKVk9zo7vabdn6S/27J5t/rcONDX10k3Bw36tkRj2phbkpIN5JMl8R9kz76RxOTzPVWxQRf
YNyjw8j7PAnLsCCBZpbJM00ZyHnP6wwS7gltdIOo4cV846/meOobTUTz3PTunE0RdLRftbc8
Fv9L/27Jl/0FHFc6TKnySObxQLvL+3yEov9+0max0aBSfojmzTpwV7MgZ3k6oGdU0AYVOGfe
+Y3nDf9ChXh9ktegvqvMyucFtAHCOrO7TjElSvnwmM0/5aG/T8Bpg5zCVT9bQFt/AefL/paS
a25mIk2IuV1P9TL6fSrCfFpZvqkSRck6f1/Dwn0CQqNsTFVC0hT4cTVFnDbhsPhNjfCf02hs
Yp0ab/7H53G30Qj4o6oYq8MkwjqCwjn77w8QBFxr8ympRLff+reUXv6rXO3QzaJM8i9LPKrh
mdM2mt71Nxq/7RP3dJJNCEZTBkbL1bTOYrPbdb/KOO8o5A7rL9KAW842zaVKPpiqeyWphenv
Kvl4/VEemjBWt+0aJ+nQT9p0mMZUn9KFPL6Vwzy7/TZ/m7Nv+Ze6cNS/869y/V/+vhvO7He9
zrMf/5v3/a5r/rb3/28//z995uXffdnfd/tvlh9cKxI85J0AAAAASUVORK5CYII='
      )
	collect: [ :each | CardMorph formFromEncodedString: each ]
	).
	self
! !

!CardMorph class methodsFor: 'class initialization' stamp: 'KenD 1/27/2011 00:51'!
initializeFromPNG

	| imageDirNamePrefix |
	ColorNames := #(Red Black).
	FaceNames  := #(Ace Two Three Four Five Six Seven Eight Nine Ten Jack Queen King).
	SuitNames   := #(Clubs Diamonds Hearts Spades).
	FormsArray := Array new: 53.
	imageDirNamePrefix := 'PNG-deck/'. 
	1 to: 13 do: [ :faceNum |
		#( $c $d $h $s) do: [ :char |	
			FormsArray 	
				at: ((faceNum - 1) * 4) + (#($c $d $h $s) indexOf: char)
				put: ((Form fromFileNamed: 
				 (imageDirNamePrefix, faceNum asString, char asString, '.png')) asFormOfDepth: 32)]].
	FormsArray 
		at: 53 
		put: ((Form fromFileNamed: (imageDirNamePrefix , 'back.png')) asFormOfDepth: 32)! !

!CardMorph class methodsFor: 'class initialization' stamp: 'KenD 2/1/2011 02:35'!
initializeFromPNGfixCorners

	| imageDirNamePrefix ul ur ll lr cornerRect sq copyRule cardForm|
	ColorNames := #(Red Black).
	FaceNames  := #(Ace Two Three Four Five Six Seven Eight Nine Ten Jack Queen King).
	SuitNames   := #(Clubs Diamonds Hearts Spades).
	FormsArray := Array new: 53.
	imageDirNamePrefix := 'PNG-deck/'. 
	ul := Form fromFileNamed:  (imageDirNamePrefix,  'ul-corner.png').
	ur := Form fromFileNamed:  (imageDirNamePrefix,  'ur-corner.png').
	ll := Form fromFileNamed:  (imageDirNamePrefix,  'll-corner.png').
	lr := Form fromFileNamed:  (imageDirNamePrefix,  'lr-corner.png').
	cornerRect := Rectangle origin: 0@0 extent: ul extent .
	copyRule := Form over. "replace/copy-over"
	sq := 5. "= ul width = ul height"
	
	1 to: 13 do: [ :faceNum |
		#( $c $d $h $s) do: [ :char |	
			cardForm := (Form fromFileNamed: 
				 (imageDirNamePrefix, faceNum asString, char asString, '.png')) asFormOfDepth: 32.
			cardForm := cardForm copy: cornerRect from: ul to: (0 @ 0) rule: copyRule.
			cardForm := cardForm copy: cornerRect from: ur to: ((cardForm width - sq) @ 0) rule: copyRule.
			cardForm := cardForm copy: cornerRect from: ll to: (0 @ (cardForm height - sq)) rule: copyRule.
			cardForm := cardForm copy: cornerRect 
						from: lr 
						to: ( (cardForm width - sq) @ (cardForm height - sq)) 
						rule: copyRule.
			FormsArray 	
				at: ((faceNum - 1) * 4) + (#($c $d $h $s) indexOf: char)
				put: cardForm
				]
	].
	cardForm := (Form fromFileNamed: (imageDirNamePrefix , 'back.png')) asFormOfDepth: 32.
	cardForm := cardForm copy: cornerRect from: ul to: (0 @ 0) rule: copyRule.
	cardForm := cardForm copy: cornerRect from: ur to: ((cardForm width - sq) @ 0) rule: copyRule.
	cardForm := cardForm copy: cornerRect from: ll to: (0 @ (cardForm height - sq)) rule: copyRule.
	cardForm := cardForm copy: cornerRect 
				from: lr 
				to: ( (cardForm width - sq) @ (cardForm height - sq)) 
				rule: copyRule.
	FormsArray at: 53 put: cardForm! !

!CardMorph class methodsFor: 'class initialization' stamp: 'KenD 2/1/2011 02:22'!
initializeFromPNGfixShadow

	| imageDirNamePrefix noColor |
	ColorNames := #(Red Black).
	FaceNames  := #(Ace Two Three Four Five Six Seven Eight Nine Ten Jack Queen King).
	SuitNames   := #(Clubs Diamonds Hearts Spades).
	FormsArray := Array new: 53.
	imageDirNamePrefix := 'PNG-deck/'. 
	noColor := Color transparent.
	1 to: 13 do: [ :faceNum |
		#( $c $d $h $s) do: [ :char |	 |image anExtent|
			image := (Form fromFileNamed: 
				 (imageDirNamePrefix, faceNum asString, char asString, '.png')) asFormOfDepth: 32.
			anExtent := image extent.
    			0 to: anExtent y -1 do: [ :y |
        			0 to: anExtent x - 1 do: [ :x |
            		((image pixelValueAt: x@y) bitAnd: 16rFF000000)= 0 ifTrue: [
              			  image colorAt: x@y put: noColor ]]].
			FormsArray 	
				at: ((faceNum - 1) * 4) + (#($c $d $h $s) indexOf: char)
				put: image]].
	FormsArray 
		at: 53 
		put: ((Form fromFileNamed: (imageDirNamePrefix , 'back.png')) asFormOfDepth: 32)! !

!CardMorph class methodsFor: 'instance creation' stamp: 'KenD 8/29/2021 12:05:24'!
the: face of: suit
	"Return an Card instance"
	
	"CardMorph the: #Jack of: #Hearts."
	"CardMorph the: 11 of: #spades"
	"CardMorph the: 11 of: 3."

	| faceNum suitNum newInst |
	
	(suit isSymbol)
	ifTrue: [ suitNum := SuitNames indexOf: (suit capitalized) ]
	ifFalse: [ (suit isInteger) & (1 <= suit) & (suit <= 4)
		ifTrue: [suitNum := suit]
		ifFalse: [suitNum := 0]].
	(suitNum = 0) 
		ifTrue: [Error signal: ('bad suit: ', suit asString)].
	
	(face isSymbol)
	ifTrue: [ faceNum := FaceNames indexOf: (face capitalized) ]
	ifFalse: [ (face isInteger) & (1 <= face) & (face <= 13)
		ifTrue: [faceNum := face]
		ifFalse: [faceNum := 0]].
	(faceNum = 0) 
		ifTrue: [Error signal: ('bad face: ', face asString)].
	
	"Translate between zero based cardNumber and 1 based arrays"
	newInst := (super basicNew) withCardNumber: (suitNum - 1 + (4 * (faceNum - 1))).
	newInst color: Color transparent.
	^newInst! !

!CardContainerMorph methodsFor: 'dropping/grabbing' stamp: 'KenD 12/26/2021 12:04:13'!
acceptDroppingMorph: aMorph event: evt 
	"aMorph is a Card which may contain submorphs which 
	are also Cards.  Add to me."

	| table |
	table := self targetTable.
	
"Transcript show: table asString; show: ' Drop of ',  (aMorph face asString), ' of ', (aMorph suit asString); newLine."
	aMorph hideDropShadow.
	self addCard: aMorph.
	aMorph submorphs reverseDo: [ :aCard | 
		(aCard isKindOf:  self cardClass)
			ifTrue: [self addCard: aCard]
	].
	table isNil ifFalse: [ table addingCardOrCards: aMorph toContainer: self ]
! !

!CardContainerMorph methodsFor: 'dropping/grabbing' stamp: 'KenD 1/22/2013 19:14'!
allowsMorphDrop
	"Answer whether we accept dropping morphs. By default answer false."

	^ true! !

!CardContainerMorph methodsFor: 'dropping/grabbing' stamp: 'KenD 1/22/2013 19:15'!
allowsSubmorphDrag
	"Answer whether our morphs can just be grabbed with the hand, instead of requiring the use of the halo. By default answer false."

	^ true! !

!CardContainerMorph methodsFor: 'dropping/grabbing' stamp: 'KenD 10/29/2004 10:25'!
dropComplete
	"Someone dropped one or more cards into me.  Tell the Card Table about it."

	| table |
	table := self targetTable.
	table isNil
		ifTrue: [^ false]
		ifFalse: [^ table dropComplete]! !

!CardContainerMorph methodsFor: 'dropping/grabbing' stamp: 'KenD 3/30/2015 20:17'!
okToPickUp: aCard
	"Answer false unless I have a table, else ask the table."

	| table result feedback |
	table := self targetTable.
	table isNil
		ifTrue: [ result :=  false ]
		ifFalse: [ result := (table pickLegalFor: aCard) ].
"
	Transcript newLine; show: (self name , ' got #okToPickUp:  answered ' , result printString ).  
"
	result ifFalse: [
		feedback := HoverHelpMorph contents: 'illegal move'.
		feedback popUpForHand: (feedback world activeHand) 
	].
	^ result! !

!CardContainerMorph methodsFor: 'dropping/grabbing' stamp: 'KenD 10/25/2004 16:14'!
wantsDroppedMorph: aMorph event: evt 
	"Answer false unless I have a table, else ask the table."
	| table |
	table := self targetTable.
	table isNil
		ifTrue: [^ false]
		ifFalse: [^ table container: self wantsDropOf: aMorph]! !

!CardContainerMorph methodsFor: 'accessing' stamp: 'KenD 12/26/2021 12:20:12'!
addCard: aCard
	"Add a Card to me"

	"I assume checking for legality of drop has already been done"
	aCard scale: 1.0.
	self addMorphFront: aCard position: ContainerOffset;
		yourself


! !

!CardContainerMorph methodsFor: 'accessing' stamp: 'KenD 9/12/2021 08:32:38'!
cardClass

	^ cardClass! !

!CardContainerMorph methodsFor: 'accessing' stamp: 'KenD 9/12/2021 08:32:57'!
cardClass: aCardClass

	cardClass := aCardClass! !

!CardContainerMorph methodsFor: 'accessing' stamp: 'KenD 3/1/2015 17:08'!
containerOffset
	"Offset from my morphPosition to that of contained card"

	^ContainerOffset! !

!CardContainerMorph methodsFor: 'accessing' stamp: 'KenD 10/23/2004 18:54'!
dropEnabled
	"I assume cards are to be dropped on me -- subclasses my override"

	^true! !

!CardContainerMorph methodsFor: 'accessing' stamp: 'KenD 1/21/2011 22:11'!
makeEmpty

	(self hasSubmorphs)
		ifTrue: [ self removeAllMorphs ].! !

!CardContainerMorph methodsFor: 'accessing' stamp: 'KenD 10/24/2004 15:03'!
numCards
	"Answer the number of AltCardMorphs I contain."
	^ self submorphCount! !

!CardContainerMorph methodsFor: 'accessing' stamp: 'KenD 10/23/2004 19:23'!
targetTable
	"Answer my containing table or nil.
	 Cache my containing Table as required."
	targetTable isNil
		ifTrue: [self setTargetTable].
	^ targetTable! !

!CardContainerMorph methodsFor: 'accessing' stamp: 'KenD 10/21/2004 17:50'!
targetTable: anCardTable

	targetTable := anCardTable! !

!CardContainerMorph methodsFor: 'accessing' stamp: 'KenD 10/1/2021 13:41:36'!
topCard
	"Answer my top Card or nil."

	^ self submorphs detect: [ :sm | sm isKindOf: self cardClass ] ifNone: [ ^nil ]! !

!CardContainerMorph methodsFor: 'initialization' stamp: 'KenD 9/30/2021 08:25:13'!
defaultBorderWidth

	^ 2 "pixels"! !

!CardContainerMorph methodsFor: 'initialization' stamp: 'KenD 9/12/2021 08:30:53'!
defaultCardClass
	^ CardMorph ! !

!CardContainerMorph methodsFor: 'initialization' stamp: 'KenD 9/12/2021 08:36:44'!
defaultLayout
	^LayoutSpec  fixedWidth: (cardClass morphWidth + 4)
					 fixedHeight: (cardClass morphHeight + 4) 
					 offAxisEdgeWeight: #center! !

!CardContainerMorph methodsFor: 'initialization' stamp: 'KenD 9/30/2021 08:26:10'!
initialize
	"Set my typical properties; Assume displayed on a Green table."

	super initialize.
	self color: Color transparent;
		borderColor: Color yellow;
		borderWidth: self defaultBorderWidth; 
		cardClass: self defaultCardClass;
		morphWidth:  cardClass morphWidth + (2 * self defaultBorderWidth);
		morphHeight: cardClass morphHeight + (2 * self defaultBorderWidth);
		layoutSpec: self defaultLayout; "subclasses may mutate or replace"
		yourself! !

!CardContainerMorph methodsFor: 'testing' stamp: 'KenD 10/21/2004 14:24'!
isCardContainer
	
	^true! !

!CardContainerMorph methodsFor: 'testing' stamp: 'KenD 1/21/2011 22:11'!
isEmpty
	"I am empty if I contain 0 Cards"
	^ (self hasSubmorphs not)! !

!CardContainerMorph methodsFor: 'fileIn/out' stamp: 'KenD 1/24/2011 02:14'!
restoreFromArray: stateArray givenDeck: aDeck
	"Reconstiture a Card Container given a aDeck and a stateArray which contains card numbers."

	self makeEmpty.
	stateArray reverseDo: [ :cardNumber | self addCard: (aDeck cardFromNumber: cardNumber) ].
	^self
	! !

!CardContainerMorph methodsFor: 'fileIn/out' stamp: 'KenD 12/3/2004 10:45'!
saveStateToArray
	"Answer an array containing Card Numbers of Cards I contain"

	^self submorphs collect: [ :aCard | aCard cardNumber ]! !

!CardContainerMorph methodsFor: 'private' stamp: 'KenD 1/10/2013 13:51'!
setTargetTable
	"Follow the owner chain to an CardTable and set the targetTable to it."
	| myOwner stillLooking |
	myOwner := self owner.
	stillLooking := myOwner isNil not & (myOwner isKindOf: CardTableMorph) not.
	[stillLooking]
		whileTrue: [myOwner := myOwner owner.
			stillLooking := myOwner isNil not 
						& (myOwner isKindOf: CardTableMorph) not].
	(myOwner isKindOf: CardTableMorph)
		ifTrue: [self targetTable: myOwner]! !

!CardContainerMorph methodsFor: 'geometry' stamp: 'KenD 9/12/2021 08:38:46'!
minimumExtent

	| myTable |
	myTable := self targetTable.
	^ (myTable ifNil: [cardClass cardExtent] ifNotNil: [myTable cardSize]) + (2 * self borderWidth)! !

!CardContainerMorph class methodsFor: 'new-morph participation' stamp: 'KenD 10/25/2004 08:08'!
includeInNewMorphMenu
	^ false! !

!CardContainerMorph class methodsFor: 'class initialization' stamp: 'KenD 1/19/2022 13:16:39'!
initialize
	"self initialize"
	
	ContainerOffset _ `3 @ 2`.
! !

!CardColumnMorph methodsFor: 'accessing' stamp: 'KenD 1/19/2022 13:15:53'!
addCard: aCard

	| newPos |
	(self isEmpty)
		ifTrue:  [newPos := ContainerOffset ]
		ifFalse: [newPos := (self defaultBorderWidth + 1
				@ (self pixelsPerOverlap * self numberOfCards))
		].
	aCard scale: 1.0.
	self addMorphFront: aCard position: newPos;
		yourself! !

!CardColumnMorph methodsFor: 'accessing' stamp: 'KenD 3/2/2015 14:56'!
addCards: aCardCollectionOrContainer
	"Add a collection of CardMorphs to the top of my Column"

	| aCollection |
	(aCardCollectionOrContainer isKindOf: CardContainerMorph)
	ifTrue: [ aCollection := aCardCollectionOrContainer submorphs ]
	ifFalse: [ aCollection := aCardCollectionOrContainer ].
	
	"I assume checking for legality has alreade been done"
	aCollection do: [:aCard| self addCard: aCard].
	self showTopCard.
	^aCardCollectionOrContainer
! !

!CardColumnMorph methodsFor: 'accessing' stamp: 'KenD 1/10/2013 19:52'!
makeEmpty
	" remove all cards"
	self removeAllMorphs! !

!CardColumnMorph methodsFor: 'accessing' stamp: 'KenD 1/9/2013 21:06'!
numberOfCards
	"Answer the number of Cards above aCard in my submorphs"

	^(submorphs size)! !

!CardColumnMorph methodsFor: 'accessing' stamp: 'KenD 10/28/2004 10:45'!
numberOfCardsAbove: aCard
	"Answer the number of Cards above aCard in my submorphs"

	^submorphs indexOf: aCard! !

!CardColumnMorph methodsFor: 'accessing' stamp: 'KenD 11/20/2004 09:21'!
showAllCardsFaceDown

	(self submorphs isNil not) & (self submorphs size > 0)
		ifTrue: [ self submorphs do: [ :card | card makeFaceDown ] ]! !

!CardColumnMorph methodsFor: 'accessing' stamp: 'KenD 11/20/2004 09:21'!
showOnlyTopFace
	"Show top card face up and others face down."

	self showAllCardsFaceDown; showTopCard! !

!CardColumnMorph methodsFor: 'accessing' stamp: 'KenD 11/19/2004 14:36'!
showTopCard
	"If not empty, show face of top card."

	(self submorphs isNil not) & (self submorphs size > 0)
		ifTrue: [ (self submorphs at: 1) makeFaceUp ].! !

!CardColumnMorph methodsFor: 'accessing' stamp: 'KenD 10/23/2004 19:59'!
singletonCard
	"Answer singleton submorph (an CardMorph) or nil"
	self submorphs size = 1
		ifTrue: [^ self submorphs at: 1]
		ifFalse: [^ nil]! !

!CardColumnMorph methodsFor: 'testing' stamp: 'KenD 1/9/2013 21:05'!
isEmpty

	^(self submorphs size = 0)! !

!CardColumnMorph methodsFor: 'layout' stamp: 'KenD 11/28/2021 14:10:49'!
layoutSubmorphsVerticallyIn: layoutBounds
	"Compute a new layout of submorphs based on the given layout bounds." 
		"The Cards are overlapped by PixelsPerOverlap"
		
	| cardOffset |
	
	cardOffset := 0.
	(self submorphs reversed) do:
		[ :m | m morphPosition: (self borderWidth @ cardOffset ).
			  cardOffset := cardOffset + self pixelsPerOverlap ].
! !

!CardColumnMorph methodsFor: 'fileIn/out' stamp: 'KenD 1/24/2011 02:08'!
restoreFromArray: stateArray givenDeck: aDeck
	"Reconstiture a Card Container given a aDeck and a stateArray which
	contains number of face up cards and an array of card numbers."

	| numFaceUp cardNumArray position |
	numFaceUp := stateArray at: 1.
	cardNumArray := stateArray at: 2.
	self makeEmpty.
	position := cardNumArray size.
	cardNumArray reverseDo: [ :cardNumber | 
		| aCard |
		aCard := aDeck cardFromNumber: cardNumber.
		position > numFaceUp
			ifTrue: [ aCard makeFaceDown ]
			ifFalse: [ aCard makeFaceUp ].
		position := position - 1.
		self addCard: aCard ].
	^self
	! !

!CardColumnMorph methodsFor: 'fileIn/out' stamp: 'KenD 12/3/2004 10:49'!
saveStateToArray
	"Answer an array of the number of cards face up and
	an array containing Card Numbers of Cards I contain."

	| cardNumArray numFaceUp |
	numFaceUp := 0.	
	cardNumArray := self submorphs 
		collect: [ :aCard | 
			aCard isFaceUp ifTrue: [ numFaceUp := numFaceUp + 1 ].
			aCard cardNumber ].
	^ { numFaceUp. cardNumArray. }! !

!CardColumnMorph methodsFor: 'geometry' stamp: 'KenD 9/12/2021 08:41:03'!
pixelsPerOverlap

	^ cardClass morphHeight // 4! !

!CardDeckMorph methodsFor: 'dropping/grabbing' stamp: 'KenD 1/24/2011 02:08'!
acceptDroppingMorph: aCardMorph event: evt 
	"I do NOT accept dropped cards unless inUndo"
	
	| table |
	table := self targetTable.
	table isNil ifTrue: [^ false].
	table inUndo ifTrue: [ self addCard: aCardMorph ]! !

!CardDeckMorph methodsFor: 'dropping/grabbing' stamp: 'KenD 11/21/2004 13:47'!
dropEnabled
	"I do NOT accept drops"

	^false! !

!CardDeckMorph methodsFor: 'dropping/grabbing' stamp: 'KenD 11/21/2004 13:49'!
wantsDroppedMorph: aMorph event: evt 
	"I do NOT accept dropped cards"
	
	^false! !

!CardDeckMorph methodsFor: 'accessing' stamp: 'KenD 12/26/2021 12:06:24'!
addCard: aCard
	"Add a Card or Cards to me"

	aCard morphPosition: ContainerOffset; scale: 1.0.
	aCard hasSubmorphs 
		ifTrue: [ "Add all the cards"
			aCard makeFaceDown.
			aCard submorphs 
				do: [ :card | 
					aCard removeMorph: card.
					card makeFaceDown. "By convention decks are face down"
					card morphPosition: ContainerOffset.
					cardStack push: card ].
	].
	cardStack push: aCard.
	self showTopCard;
	yourself! !

!CardDeckMorph methodsFor: 'accessing' stamp: 'KenD 1/11/2013 17:07'!
addCards: aCollectionOrDeck
	"Add Cards from aCollectionOrDeck into me."

	(aCollectionOrDeck isKindOf: CardDeck)
	ifTrue: [ (aCollectionOrDeck cards) 
			 reverseDo: [ :card | 
							card makeFaceDown.
							cardStack push: card.	
							card morphPosition: ContainerOffset.
						] 
	]
	ifFalse: [ aCollectionOrDeck 
			 reverseDo: [ :card | 
							card makeFaceDown.
							cardStack push: card.
							card morphPosition: ContainerOffset. ] 
						].
	self showTopCard;
	yourself! !

!CardDeckMorph methodsFor: 'accessing' stamp: 'KenD 1/21/2011 22:10'!
makeEmpty
	
	(self hasSubmorphs)
		ifTrue: [ self removeAllMorphs ].
	cardStack := Stack new initialize.
	^self! !

!CardDeckMorph methodsFor: 'accessing' stamp: 'KenD 11/17/2004 11:17'!
numCards

	^cardStack size! !

!CardDeckMorph methodsFor: 'accessing' stamp: 'KenD 1/11/2013 17:12'!
takeTopCard
	"Answer my top card (removed from me)"

	| topCard |
	topCard := cardStack pop.
	"By convention, return topCard face up."
	topCard makeFaceUp.
	"Show NEW top card"
	self showTopCard.
	^topCard! !

!CardDeckMorph methodsFor: 'accessing' stamp: 'KenD 11/17/2004 11:26'!
topIsFaceDown

	^topIsFaceDown! !

!CardDeckMorph methodsFor: 'accessing' stamp: 'KenD 11/17/2004 11:27'!
topIsFaceDown: aBoolean

	topIsFaceDown := aBoolean! !

!CardDeckMorph methodsFor: 'event handling' stamp: 'KenD 1/21/2013 09:59'!
click: evt localPosition: ignoredPosition
	"Delegate to table, if available."
	
	| table |
"
	Transcript newLine; show: (self name , ' got #click:localPosition:'). 
"
	table := self targetTable.
	table isNil
		ifTrue: [^ false]
		ifFalse: [^ table click: evt from: self ]! !

!CardDeckMorph methodsFor: 'event handling' stamp: 'KenD 1/21/2013 10:00'!
handlesMouseDown: evt 
"
	Transcript newLine; show: (self name , ' got #handlesMouseDown:').  
"
	^ true! !

!CardDeckMorph methodsFor: 'event handling' stamp: 'KenD 1/22/2013 19:18'!
processMouseDown: evt localPosition: localEventPosition
	"Do nothing upon mouse-down except inform the hand to watch for a 
	click; wait until an ensuing #click: message gets dispatched"
"
	Transcript newLine; show: (self name , ' got #processMouseDown:localPosition:').  
"
" Never gets clicked. Click goes to World PasteUpMorph.  "
"
	evt hand waitForClicksOrDrag: self
				event: evt clkSel: #click:localPosition: dblClkSel:nil.
"
	"Handle click ourselves"
	evt wasHandled: true.
	self click: evt localPosition: localEventPosition
	! !

!CardDeckMorph methodsFor: 'initialization' stamp: 'KenD 11/17/2004 11:32'!
initialize
	"Answer a new instance of me containing zero cards."

	super initialize.
	cardStack := Stack new initialize.
	topIsFaceDown := true. "default"
	self showTopCard.
	^self! !

!CardDeckMorph methodsFor: 'initialization' stamp: 'KenD 11/17/2004 11:36'!
initializeFromCardCollection: aCollection
	"Answer a new instance of me containing Cards from aCollection."

	self initialize;
	addCards: aCollection;
	yourself! !

!CardDeckMorph methodsFor: 'testing' stamp: 'KenD 11/17/2004 11:50'!
isEmpty
	"I am empty if I contain zero Cards."

	^cardStack isEmpty! !

!CardDeckMorph methodsFor: 'testing' stamp: 'KenD 11/21/2004 13:50'!
okToPickUp: aCard
	"Never pick up a card from me"
	
	^false! !

!CardDeckMorph methodsFor: 'fileIn/out' stamp: 'KenD 1/24/2011 02:08'!
restoreFromArray: stateArray givenDeck: aDeck
	"Reconstiture a CardDeckMorph given a aDeck and a stateArray which contains card numbers."

	self makeEmpty.
	stateArray do: [ :cardNumber |
		 self addCard: ((aDeck cardFromNumber: cardNumber) makeFaceDown)
	].
	^self
	! !

!CardDeckMorph methodsFor: 'fileIn/out' stamp: 'KenD 11/24/2004 12:06'!
saveStateToArray
	"Answer an array containint Card Numbers of Cards I contain"

	| anArray |
	anArray := cardStack asArray.
	1 to: anArray size do: [ :index | 
		anArray at: index put: ((anArray at: index) cardNumber) ].
	^anArray! !

!CardDeckMorph methodsFor: 'private' stamp: 'KenD 1/14/2013 09:21'!
showTopCard
	"PRIVATE -- I am invoked whenever Cards are added to or removed from me."

	(self hasSubmorphs)
		ifTrue: [ self removeAllMorphs ].
	self isEmpty
	ifFalse: [ | topCard |
		topCard := cardStack topValue.
		self topIsFaceDown 
		ifFalse: [topCard makeFaceUp]
		ifTrue: [topCard makeFaceDown].
		topCard morphPosition: ContainerOffset.
		self addMorph: topCard  
	].
	^self! !

!CardDiscardMorph methodsFor: 'dropping/grabbing' stamp: 'KenD 3/20/2015 19:20'!
acceptDroppingMorph: aCardMorph event: evt 
	"aMorph is a Card which may contain submorphs which 
	are also Cards.  Add to me."

	| table |
	table := self targetTable.
	table isNil 
		ifFalse: [ 
			table inUndo
			ifFalse: [ 
				self addCard: aCardMorph.
				table addingCardOrCards: aCardMorph toContainer: self
			]
			ifTrue: [ "take all cards from deck into self if Card is nil"
				aCardMorph isNil
				ifFalse: [ self addCard: aCardMorph ]
				ifTrue: [ | deck |
					deck := table deck.
					[ deck isEmpty ]
						whileFalse:
							[ self addCard: deck takeTopCard ]
				]
			]
	]! !

!CardDiscardMorph methodsFor: 'dropping/grabbing' stamp: 'KenD 11/22/2004 08:07'!
dropComplete

	super dropComplete.
	self showTopCards! !

!CardDiscardMorph methodsFor: 'dropping/grabbing' stamp: 'KenD 11/21/2004 13:47'!
dropEnabled
	"I do NOT accept drops"

	^false! !

!CardDiscardMorph methodsFor: 'dropping/grabbing' stamp: 'KenD 11/21/2004 13:49'!
wantsDroppedMorph: aMorph event: evt 
	"I do NOT accept dropped cards"
	
	^false! !

!CardDiscardMorph methodsFor: 'accessing' stamp: 'KenD 12/26/2021 12:21:19'!
addCard: aCard
	"Add a Card to me"

	"All my Cards are face up"
	aCard makeFaceUp; scale: 1.0.
	"newPos := (((PixelOverlap * (self numCards  rem: 3)) + 2) @ 2)."
	self addMorphFront: aCard;
		showTopCards;
		yourself
 ! !

!CardDiscardMorph methodsFor: 'accessing' stamp: 'KenD 11/20/2004 17:50'!
cardStack

	^cardStack! !

!CardDiscardMorph methodsFor: 'accessing' stamp: 'KenD 1/21/2011 22:13'!
makeEmpty
	
	(self hasSubmorphs)
		ifTrue: [ self removeAllMorphs ].
	cardStack := Stack new initialize.
	^self! !

!CardDiscardMorph methodsFor: 'accessing' stamp: 'KenD 11/17/2004 12:21'!
numCards

	^cardStack size! !

!CardDiscardMorph methodsFor: 'accessing' stamp: 'KenD 11/17/2004 12:12'!
numCardsToShow

	^numCardsToShow! !

!CardDiscardMorph methodsFor: 'accessing' stamp: 'KenD 6/5/2020 08:06:32'!
numCardsToShow: anInteger

	| newWidth |
	numCardsToShow := anInteger.
	newWidth := CardMorph width + ((anInteger - 1) * PixelOverlap) + 8.
	self morphWidth: newWidth;
		 layoutSpec: (LayoutSpec fixedWidth: newWidth
									 fixedHeight: (CardMorph height + 4) 
									 offAxisEdgeWeight: #leftOrTop).
	self redrawNeeded.
	self showTopCards;
		yourself! !

!CardDiscardMorph methodsFor: 'accessing' stamp: 'KenD 11/21/2004 14:00'!
takeTopCard
	"Answer my top card (removed from me)"

	| topCard |
	topCard := self submorphs at: 1.
	self removeMorph: topCard.
	self showTopCards.
	^topCard! !

!CardDiscardMorph methodsFor: 'initialization' stamp: 'KenD 4/6/2016 20:30'!
initialize

	super initialize.
	cardStack := Stack new initialize.
	self numCardsToShow: 1; "Show top card by default."
		yourself
! !

!CardDiscardMorph methodsFor: 'testing' stamp: 'KenD 11/21/2004 14:09'!
isEmpty
	"I am empty if I contain zero Cards."

	^cardStack isEmpty & 
	(self submorphs isNil | self submorphs size = 0)! !

!CardDiscardMorph methodsFor: 'layout' stamp: 'KenD 3/17/2020 17:09:09'!
layoutSubmorphsHorizontallyIn: layoutBounds
	"Compute a new layout of submorphs based on the given layout bounds." 
		"The Cards are overlapped by PixelsPerOverlap"
		
	|cardOffset|
	
	cardOffset := 2.

	(self submorphs reversed) do:
		[ :m | m morphPosition: (cardOffset @ 2).
			   cardOffset := cardOffset + PixelOverlap + 2 ].
! !

!CardDiscardMorph methodsFor: 'fileIn/out' stamp: 'KenD 1/24/2011 02:08'!
restoreFromArray: stateArray givenDeck: aDeck
	"Reconstiture a CardDeckMorph given a aDeck and a stateArray which contains card numbers."

	self makeEmpty.
	stateArray do: [ :cardNumber |
		 self addCard: (aDeck cardFromNumber: cardNumber) 
	].
	^self
	! !

!CardDiscardMorph methodsFor: 'fileIn/out' stamp: 'KenD 12/3/2004 11:25'!
saveStateToArray
	"Answer an array containint Card Numbers of Cards I contain"

	| anArray answerArray numTopCards numBottomCards |
	numTopCards := self hasSubmorphs 
					ifTrue: [ self submorphs size ] 
					ifFalse: [ 0 ].
	anArray := cardStack asArray.
	numBottomCards := anArray size.
	answerArray := Array new: numTopCards + numBottomCards.

	1 to: numBottomCards
	  do: [ :index |
		answerArray at: index
				 	 put: ((anArray at: index) cardNumber) ].
				
	1 to: numTopCards 
	  do: [ :index | 
		answerArray at: index + numBottomCards
					put: ((self submorphs at: (numTopCards - index + 1)) 
						 cardNumber)
		].
	^answerArray! !

!CardDiscardMorph methodsFor: 'drawing' stamp: 'KenD 3/17/2020 17:05:51'!
showTopCards
	"Show numCardsToShow cards (if I contain that many)"

	"Too few?"
	[ (self submorphs size < numCardsToShow) and: [cardStack isEmpty not]]
	whileTrue: [ self addMorphBack: (cardStack pop) ].
	
	"Too many?"
	[ (self submorphs size > numCardsToShow) ]
	whileTrue: [ | cardToMove |
		cardToMove := (self submorphs at: (self submorphs size)).
		cardStack push: cardToMove.
		self removeMorph: cardToMove.
	].
	self layoutSubmorphsHorizontallyIn: (2@2 extent: self morphExtent).
! !

!CardDiscardMorph class methodsFor: 'class initialization' stamp: 'KenD 1/22/2011 16:34'!
initialize

	PixelOverlap := 10! !

!CardDiscardMorph class methodsFor: 'instance creation' stamp: 'KenD 11/17/2004 12:13'!
newShowing: numCards
	
	| newDiscard |
	newDiscard := self new.
	newDiscard numCardsToShow: numCards.
	^newDiscard! !

!CardDiscardMorph class methodsFor: 'accessing' stamp: 'KenD 1/15/2013 20:18'!
pixelOverlap

	^PixelOverlap! !

!CardDiscardMorph class methodsFor: 'accessing' stamp: 'KenD 1/15/2013 20:19'!
pixelsPerOverlap

	^PixelOverlap! !

!CardPileMorph methodsFor: 'accessing' stamp: 'KenD 12/26/2021 12:05:23'!
addCard: aCard
	"Add a Card to me"

	"my cards are all face up"
	aCard makeFaceUp; scale: 1.0.
	self 
		addMorphFront: aCard
		position: ContainerOffset
	
! !

!CardPileMorph methodsFor: 'accessing' stamp: 'KenD 12/24/2021 17:00:44'!
addCards: aCardCollectionOrContainer
	"Add a collection of CardMorphs to the top of my Pile"

	| aCollection |
	(aCardCollectionOrContainer isKindOf: CardContainerMorph)
	ifTrue: [ aCollection := aCardCollectionOrContainer submorphs ]
	ifFalse: [ aCollection := aCardCollectionOrContainer ].
	
	"I assume checking for legality has alreade been done"
	aCollection do: [ :aCard |
		aCard makeFaceUp. 
		self addMorphFront: aCard position: ContainerOffset.  
	].
	^aCardCollectionOrContainer
! !

!CardPileMorph methodsFor: 'initialization' stamp: 'KenD 1/20/2011 18:45'!
initialize
	"Set layout so that only the top card is shown"

	super initialize! !

!CardSpareMorph methodsFor: 'accessing' stamp: 'KenD 12/26/2021 12:21:58'!
addCard: aCard
	"Add a Card to me if I am empty."

	"I assume checking for legality of drop has already been done"
	(self submorphs size = 0)
	ifTrue: [ aCard makeFaceUp; scale: 1.0.
		      ^self addMorphFront: aCard 
				position: ContainerOffset;
			yourself
	]
	ifFalse: [Error signal: 'A Spare can hold only 1 card' ]
! !

!CardTests methodsFor: 'Running' stamp: 'KenD 10/20/2004 09:49'!
setUp
	jackOfClubs      := CardMorph the: #Jack of: #Clubs.
	aceOfSpades      := CardMorph the: #Ace of: #spades.
	twoOfDiamonds  := CardMorph the: 2 of: #diamonds.
	threeOfHearts    := CardMorph the: 3 of: #hearts.
	fiveOfHearts     := CardMorph the: #five of: #hearts! !

!CardTests methodsFor: 'Testing' stamp: 'KenD 6/2/2020 13:32:06'!
testColor
	self assert: (jackOfClubs cardColor == #Black).
	self assert: (twoOfDiamonds cardColor == #Red).
	self assert: (threeOfHearts cardColor == #Red).
	self assert: (aceOfSpades cardColor == #Black).
	self assert: (fiveOfHearts cardColor == #Red).
	
	self assert: (jackOfClubs hasSameColorAs: aceOfSpades).
	self assert: (fiveOfHearts hasSameColorAs: twoOfDiamonds).
	self deny:  (fiveOfHearts hasSameColorAs: aceOfSpades).
	self deny:  (jackOfClubs hasSameColorAs: threeOfHearts).
	
	self assert: (jackOfClubs     isBlack).
	self assert: (twoOfDiamonds isRed).
	self deny:  (jackOfClubs     isRed).
	self deny:  (twoOfDiamonds isBlack)! !

!CardTests methodsFor: 'Testing' stamp: 'KenD 1/10/2013 13:45'!
testComparisons
	self deny: (jackOfClubs < aceOfSpades).
	self deny: (jackOfClubs = aceOfSpades).
	self assert: (aceOfSpades <  jackOfClubs).
	self assert: (threeOfHearts = (CardMorph the: 3 of: #hearts)).
	
	self assert: (aceOfSpades hasDifferentColorThan: threeOfHearts).
	self deny: (fiveOfHearts hasDifferentColorThan: twoOfDiamonds).
	
	self deny: (aceOfSpades hasSameColorAs: threeOfHearts).
	self assert: (fiveOfHearts hasSameColorAs: twoOfDiamonds).
	
	self deny: (aceOfSpades hasSameFaceAs: threeOfHearts).
	self assert: (fiveOfHearts hasSameFaceAs: (CardMorph the: 5 of: #Hearts)).
	
	self deny: (aceOfSpades hasSameSuitAs: threeOfHearts).
	self assert: (fiveOfHearts hasSameSuitAs: threeOfHearts).
	
	self deny: (#randomSymbol isKindOf: CardMorph).
	self assert: (aceOfSpades isKindOf: CardMorph)! !

!CardTests methodsFor: 'Testing' stamp: 'KenD 10/20/2004 09:55'!
testFace
	self assert: (jackOfClubs face == #Jack).
	self assert: (twoOfDiamonds face == #Two).
	self assert: (threeOfHearts face == #Three).
	self assert: (aceOfSpades face == #Ace).
	self assert: (fiveOfHearts face == #Five)! !

!CardTests methodsFor: 'Testing' stamp: 'KenD 10/20/2004 10:21'!
testFlip

	self assert: (jackOfClubs isFaceUp).
	self deny:  (jackOfClubs isFaceDown).
	jackOfClubs flip.
	self deny:  (jackOfClubs isFaceUp).
	self assert: (jackOfClubs isFaceDown).
	jackOfClubs flip.! !

!CardTests methodsFor: 'Testing' stamp: 'KenD 10/20/2004 10:38'!
testIllegal

	self 
		should: [jackOfClubs hasDifferentColorThan: 3] 
		raise: TestResult error.
	self 
		should: [jackOfClubs hasSameColorAs: #randomSymbol] 
		raise: TestResult error.
	self 
		should: [jackOfClubs hasSameFaceAs: 'some string'] 
		raise: TestResult error.
	self 
		should: [jackOfClubs hasSameSuitAs: 3/4] 
		raise: TestResult error.
	self 
		should: [CardMorph the: 23 of: #Jacks] 
		raise: TestResult error.
	self 
		should: [CardMorph the: 13 of: #Jacks] 
		raise: TestResult error
! !

!CardTests methodsFor: 'Testing' stamp: 'KenD 10/20/2004 09:59'!
testName
	self assert: (jackOfClubs name =  'Jack of Clubs').
	self assert: (twoOfDiamonds name = 'Two of Diamonds').
	self assert: (threeOfHearts name = 'Three of Hearts').
	self assert: (aceOfSpades name = 'Ace of Spades').
	self assert: (fiveOfHearts name = 'Five of Hearts')! !

!CardTests methodsFor: 'Testing' stamp: 'KenD 10/20/2004 10:10'!
testPrivate
	self assert: (jackOfClubs suitNumber = 1).
	self assert: (twoOfDiamonds suitNumber = 2).
	self assert: (threeOfHearts suitNumber = 3).
	self assert: (aceOfSpades suitNumber = 4).
	self assert: (fiveOfHearts suitNumber = 3).
	
	self assert: (jackOfClubs faceNumber = 11).
	self assert: (twoOfDiamonds faceNumber = 2).
	self assert: (threeOfHearts faceNumber = 3).
	self assert: (aceOfSpades faceNumber = 1).
	self assert: (fiveOfHearts faceNumber = 5).
	
	self assert: (jackOfClubs cardNumber = 40).
	self assert: (aceOfSpades  cardNumber = 3).
	self assert: (twoOfDiamonds  cardNumber = 5).
	self assert: (threeOfHearts cardNumber = 10).
	self assert: (fiveOfHearts cardNumber = 18)! !

!CardTests methodsFor: 'Testing' stamp: 'KenD 10/20/2004 09:54'!
testSuit
	self assert: (jackOfClubs suit == #Clubs).
	self assert: (twoOfDiamonds suit == #Diamonds).
	self assert: (threeOfHearts suit == #Hearts).
	self assert: (aceOfSpades suit == #Spades).
	self assert: (fiveOfHearts suit == #Hearts)! !

!CardDeck methodsFor: 'access' stamp: 'KenD 11/4/2004 09:15'!
cardFromNumber: anInteger
	"Given card number 1..52 answer the corresponding CardMorph from this deck."

	"(anInteger < 0) | (anInteger > 52)
	ifTrue: [ Error signal: 'Card Number out of Range 1..52' ]
	ifFalse: [^ self cards detect: [ :card | card cardNumber = anInteger ]]"
	
	^ self cards detect: [ :card | card cardNumber = anInteger ]! !

!CardDeck methodsFor: 'access' stamp: 'KenD 11/8/2004 11:16'!
cards
	"Private"

	^cards! !

!CardDeck methodsFor: 'access' stamp: 'KenD 10/22/2004 14:46'!
cardsLeft
	"Answer the number of undealt Cards"

	^(52 - index)! !

!CardDeck methodsFor: 'access' stamp: 'KenD 10/22/2004 14:45'!
dealACard
	"Answer the next Card or nil"

	(self isEmpty)
	ifTrue: [ ^nil ]
	ifFalse: [ index := index + 1. ^cards at: index ]! !

!CardDeck methodsFor: 'access' stamp: 'KenD 10/22/2004 14:52'!
seed
	"Answer my random number seed"

	^seed! !

!CardDeck methodsFor: 'access' stamp: 'KenD 10/22/2004 14:57'!
seed: anInteger
	"Set my random number seed"

	(anInteger isInteger)
	ifFalse: [Error signal: 'seed must be an Integer' ]
	ifTrue: [ seed := anInteger ].
	^anInteger! !

!CardDeck methodsFor: 'access' stamp: 'KenD 10/28/2004 15:25'!
startOver
	"Re-deal the same cards."

	index := 0! !

!CardDeck methodsFor: 'testing' stamp: 'KenD 7/2/2011 11:04'!
contains: aCard
	"Answer true if this deck instance owns this card instance"

	^self cards anySatisfy: [:each | each == aCard] ! !

!CardDeck methodsFor: 'testing' stamp: 'KenD 10/22/2004 14:43'!
isEmpty
	"I am 'empty' when I have dealt all my cards"

	^(index = 52)! !

!CardDeck methodsFor: 'dropping/grabbing' stamp: 'KenD 11/21/2004 13:47'!
dropEnabled
	"I do NOT accept drops"

	^false! !

!CardDeck methodsFor: 'save/restore' stamp: 'KenD 4/6/2016 15:52'!
initializeFromArray: stateArray
	"Reconstiture a Card Deck."
	"stateArray contains 52 card numbers, an index, a seed, and #CardDeck, which abstracts a deck's state"

	super initialize.
	(stateArray at: 55) == #CardDeck
	ifFalse: [ Error signal: 'Improper state array for CardDeck' ].
	seed  := stateArray at: 54.
	index := stateArray at: 53.  "Index incremented gives next Card"
	cards := Array new: 52.
	1 to: 52 
		do: [ :idx | 
			| cardNum |
			cardNum := stateArray at: idx.
			cards at: idx 
					put: (CardMorph new withCardNumber: cardNum) ]. 
	^self
! !

!CardDeck methodsFor: 'save/restore' stamp: 'KenD 11/8/2004 11:03'!
saveStateToArray
	"Answer a n Array of size 55 which contains card numbers for this deck,
	the index, the seed and symbol #CardDeck."

	| stateArray |
	stateArray := Array new: 55.
	stateArray at: 53 put: index.
	stateArray at: 54 put: seed.
	stateArray at: 55 put: #CardDeck.
	1 to: 52 
		do: [ :idx |  stateArray at: idx put: (cards at: idx) cardNumber ].

	^stateArray! !

!CardDeck methodsFor: 'initialization' stamp: 'KenD 11/17/2004 10:58'!
initialize
	"Create an unshuffled deck of Cards."

	super initialize.
	seed := Random new initialize next.
	index := 0.  "Index incremented gives next Card"
	cards := Array new: 52.
	1 to: 52 
		do: [ :idx | 
			cards at: idx 
					put: (CardMorph the: (((idx - 1) // 4) + 1)    "1..13"
										of: (idx - 1 rem: 4) + 1) ].  "1..4"
	^self
	! !

!CardDeck methodsFor: 'shuffle' stamp: 'KenD 1/24/2011 18:03'!
shuffle
	"Shuffle the cards & deal from 0"
	| newRand numCards |
	
	[seed := (Time millisecondClockValue bitAnd: 16r3FFFFFFF). "bitXor: self hash."
	 seed = 0] whileTrue: ["Try again if ever get a seed = 0"].

	index := 0.
	newRand := Random new seed: seed.
	numCards := cards size.
	1 to: 23 do:
		[ :ignoredIndex | 
			"minor Shuffle"
			numCards to: 1 by: -1 do: 
				[:idx | cards swap: idx with: ((1 to: idx) atRandom: newRand)]
		]
! !

!Stack methodsFor: 'printing' stamp: 'KenD 5/14/2002 11:10'!
printOn: aStream
	aStream nextPut: $(.
	1 to: top do: [ :index | 
				 aStream print: (valuesArray at: index); space].
	self isEmpty ifFalse: [aStream skip: -1].
	aStream nextPut: $)! !

!Stack methodsFor: 'converting' stamp: 'KenD 11/24/2004 08:33'!
asArray
	"Answer my elements as an Array, top element at 1."

	| anArray |
	anArray := Array new: top.
	1 to: top 
		do: [ :idx | anArray at: idx
					put: (valuesArray at: (top - idx + 1))].
	^anArray
	! !

!Stack methodsFor: 'private' stamp: 'dc 7/25/2005 10:05'!
errorEmptyStack
	self error: 'this stack is empty'! !

!Stack methodsFor: 'private' stamp: 'KenD 12/16/2014 19:16'!
grow
	"PRIVATE -- Expand self"
	
	| originalValues index |
	originalValues := self valuesArray: (Array new: (2 * (valuesArray size))).
	index := 1.
	originalValues do: [ :elt | valuesArray at: index put: elt. index := index + 1.].
	^self
! !

!Stack methodsFor: 'private' stamp: 'KenD 12/16/2014 19:15'!
initialize
	self top: 0.
	self valuesArray: (Array new:6).
	^self! !

!Stack methodsFor: 'private' stamp: 'dc 7/25/2005 10:05'!
notEmptyCheck
	"Ensure the stack is not empty."
	self isEmpty
		ifTrue: [self errorEmptyStack]! !

!Stack methodsFor: 'private' stamp: 'KenD 11/19/2004 12:10'!
top
	"PRIVATE" 
	
	^top! !

!Stack methodsFor: 'private' stamp: 'KenD 11/19/2004 12:10'!
top: newVal
	"PRIVATE"

	| oldVal |
	oldVal := top.
	top := newVal.
	^oldVal! !

!Stack methodsFor: 'private' stamp: 'KenD 11/19/2004 12:10'!
valuesArray
	"PRIVATE"
	^valuesArray! !

!Stack methodsFor: 'private' stamp: 'KenD 11/19/2004 12:10'!
valuesArray: newArray
	"PRIVATE"
	
	| oldArray |
	oldArray := valuesArray.
	valuesArray := newArray.
	^oldArray! !

!Stack methodsFor: 'testing' stamp: 'stephane.ducasse 12/5/2008 18:14'!
ifEmpty: emptyBlock ifNotEmpty: notEmptyBlock
	"Evaluate emptyBlock if I'm empty, notEmptyBlock otherwise"
	" If the notEmptyBlock has an argument, eval with the receiver as its argument"
	"copied from Collection of course"

	^ self isEmpty ifTrue: emptyBlock ifFalse: [notEmptyBlock valueWithPossibleArgument: self]! !

!Stack methodsFor: 'testing' stamp: 'stephane.ducasse 12/5/2008 18:21'!
ifEmpty: emptyBlock ifNotEmptyDo: notEmptyBlock
	"Evaluate emptyBlock if I'm empty, notEmptyBlock otherwise"
	"Evaluate the notEmptyBlock with the receiver as its argument"
	"copied from Collection"
	
	^ self isEmpty ifTrue: emptyBlock ifFalse: [notEmptyBlock value: self]! !

!Stack methodsFor: 'testing' stamp: 'stephane.ducasse 12/5/2008 18:15'!
ifNotEmpty: aBlock
	"Evaluate the given block unless the receiver is empty.

      If the block has an argument, eval with the receiver as its argument,
      but it might be better to use ifNotEmptyDo: to make the code easier to
      understand"
	"copied from Collection"
	^self isEmpty ifFalse: [aBlock valueWithPossibleArgument: self].
! !

!Stack methodsFor: 'testing' stamp: 'stephane.ducasse 12/5/2008 18:16'!
ifNotEmptyDo: aBlock
	"Evaluate the given block with the receiver as its argument."
	"copied from Collection"
	^self isEmpty ifFalse: [aBlock value: self].
! !

!Stack methodsFor: 'testing' stamp: 'KenD 4/2/2015 20:36'!
ifNotEmptyDo: notEmptyBlock ifEmpty: emptyBlock
	"Evaluate emptyBlock if I'm empty, notEmptyBlock otherwise
	Evaluate the notEmptyBlock with the receiver as its argument"
	"copied from Collection"

	^ self isEmpty ifFalse: [notEmptyBlock value: self] ifTrue: emptyBlock value! !

!Stack methodsFor: 'testing' stamp: 'KenD 5/14/2002 10:52'!
isEmpty
	^(top = 0)! !

!Stack methodsFor: 'testing' stamp: 'stephane.ducasse 12/5/2008 18:16'!
isEmptyOrNil
	"Answer whether the receiver contains any elements, or is nil.  Useful in numerous situations where one wishes the same reaction to an empty collection or to nil"
	"copied from Collection"
	
	^ self isEmpty! !

!Stack methodsFor: 'access' stamp: 'KenD 5/15/2002 12:31'!
pop
	| value |
	top > 0
		ifTrue: [value := valuesArray at: top.
			valuesArray at: top put: nil.  "allow GC"
			top := top - 1.
			^ value]
		ifFalse: [Exception signal: 'Attempt to pop from empty Stack']! !

!Stack methodsFor: 'access' stamp: 'KenD 5/14/2002 11:23'!
push: aVal
	(top = valuesArray size)
		ifTrue: [self grow].
	top := top + 1.
	valuesArray at: top put: aVal.
	^self! !

!Stack methodsFor: 'access' stamp: 'KenD 5/14/2002 10:49'!
size
	^top! !

!Stack methodsFor: 'access' stamp: 'KenD 5/14/2002 11:23'!
topValue
	"return value at top of stack (NB: does NOT pop!!)"

	(top < 1)
	ifTrue: [Exception signal: 'Attempt to pop from empty Stack'.]
	ifFalse: [^valuesArray at: top].! !

!Stack methodsFor: 'access' stamp: 'KenD 5/14/2002 11:23'!
topValue: newVal
	"set top value to newVal"

	(self isEmpty)
	ifFalse: [valuesArray at: top put: newVal] "set!!"
	ifTrue: [Exception signal: 'Attempt to assign to empty Stack'].! !

!Stack class methodsFor: 'private' stamp: 'KenD 5/14/2002 11:10'!
with: anObject 
	"Returns a new Stack with anObject."

	^ self new initialize;
		push: anObject;
		yourself! !
FreeCell initialize!
Klondike initialize!
CardMorph initialize!
CardContainerMorph initialize!
CardDiscardMorph initialize!

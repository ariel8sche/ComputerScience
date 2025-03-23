'From Cuis 5.0 [latest update: #4208] on 14 June 2020 at 5:47:25 pm'!
'Description Classes which support board games.'!
!provides: 'Game' 1 71!
!requires: 'Morphic-Widgets-Extras' 1 12 nil!
!requires: 'Morphic-Deprecated' 1 0 nil!
SystemOrganization addCategory: #'Game-Model'!
SystemOrganization addCategory: #'Game-Graphics'!


!classDefinition: #Game category: #'Game-Model'!
ActiveModel subclass: #Game
	instanceVariableNames: 'world cells spaces goal response players currentPlayer token tokenPos playerIndex buttons outs cellCount hardRoll won spaceFreq chantBeat'
	classVariableNames: 'TestGoal TestMode'
	poolDictionaries: ''
	category: 'Game-Model'!
!classDefinition: 'Game class' category: #'Game-Model'!
Game class
	instanceVariableNames: ''!

!classDefinition: #GamePasteUp category: #'Game-Graphics'!
PasteUpMorph subclass: #GamePasteUp
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Game-Graphics'!
!classDefinition: 'GamePasteUp class' category: #'Game-Graphics'!
GamePasteUp class
	instanceVariableNames: ''!

!classDefinition: #Token category: #'Game-Graphics'!
EllipseMorph subclass: #Token
	instanceVariableNames: 'labelArea model count die arrow hop tokenId'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Game-Graphics'!
!classDefinition: 'Token class' category: #'Game-Graphics'!
Token class
	instanceVariableNames: ''!

!classDefinition: #GameButtonMorph category: #'Game-Graphics'!
PluggableButtonMorph subclass: #GameButtonMorph
	instanceVariableNames: 'oldTarget enabled'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Game-Graphics'!
!classDefinition: 'GameButtonMorph class' category: #'Game-Graphics'!
GameButtonMorph class
	instanceVariableNames: ''!

!classDefinition: #BidderButton category: #'Game-Graphics'!
GameButtonMorph subclass: #BidderButton
	instanceVariableNames: 'oldColor'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Game-Graphics'!
!classDefinition: 'BidderButton class' category: #'Game-Graphics'!
BidderButton class
	instanceVariableNames: ''!

!classDefinition: #GameCell category: #'Game-Graphics'!
TextModelMorph subclass: #GameCell
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Game-Graphics'!
!classDefinition: 'GameCell class' category: #'Game-Graphics'!
GameCell class
	instanceVariableNames: ''!

!classDefinition: #GameBoard category: #'Game-Graphics'!
SystemWindow subclass: #GameBoard
	instanceVariableNames: 'pasteup board buttonArea gameTitle'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Game-Graphics'!
!classDefinition: 'GameBoard class' category: #'Game-Graphics'!
GameBoard class
	instanceVariableNames: ''!

!classDefinition: #GameView category: #'Game-Graphics'!
SystemWindow subclass: #GameView
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Game-Graphics'!
!classDefinition: 'GameView class' category: #'Game-Graphics'!
GameView class
	instanceVariableNames: ''!

!classDefinition: #AuctionView category: #'Game-Graphics'!
GameView subclass: #AuctionView
	instanceVariableNames: 'textPane heading chant buyers cancelButton endButton beginButton buttonsArea currentBid currentBidder begun going seller list'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Game-Graphics'!
!classDefinition: 'AuctionView class' category: #'Game-Graphics'!
AuctionView class
	instanceVariableNames: ''!

!classDefinition: #AuctionAsset category: #'Game-Graphics'!
AuctionView subclass: #AuctionAsset
	instanceVariableNames: 'asset currentBump'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Game-Graphics'!
!classDefinition: 'AuctionAsset class' category: #'Game-Graphics'!
AuctionAsset class
	instanceVariableNames: ''!

!classDefinition: #HistoryView category: #'Game-Graphics'!
GameView subclass: #HistoryView
	instanceVariableNames: 'plotter legend'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Game-Graphics'!
!classDefinition: 'HistoryView class' category: #'Game-Graphics'!
HistoryView class
	instanceVariableNames: ''!

!classDefinition: #LoanView category: #'Game-Graphics'!
GameView subclass: #LoanView
	instanceVariableNames: 'textPane cancelButton payButton buttonArea player loanItem loanReport'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Game-Graphics'!
!classDefinition: 'LoanView class' category: #'Game-Graphics'!
LoanView class
	instanceVariableNames: ''!

!classDefinition: #OptionsView category: #'Game-Graphics'!
GameView subclass: #OptionsView
	instanceVariableNames: 'textPane cancelButton buyButton buttonArea player list'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Game-Graphics'!
!classDefinition: 'OptionsView class' category: #'Game-Graphics'!
OptionsView class
	instanceVariableNames: ''!

!classDefinition: #ListView category: #'Game-Graphics'!
SystemWindow subclass: #ListView
	instanceVariableNames: 'collection selectedItem text1'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Game-Graphics'!
!classDefinition: 'ListView class' category: #'Game-Graphics'!
ListView class
	instanceVariableNames: ''!

!classDefinition: #DieMorph category: #'Game-Graphics'!
PluggableMorph subclass: #DieMorph
	instanceVariableNames: 'dot value results'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Game-Graphics'!
!classDefinition: 'DieMorph class' category: #'Game-Graphics'!
DieMorph class
	instanceVariableNames: ''!

!classDefinition: #ArrowMorph category: #'Game-Graphics'!
BorderedRectMorph subclass: #ArrowMorph
	instanceVariableNames: 'form'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Game-Graphics'!
!classDefinition: 'ArrowMorph class' category: #'Game-Graphics'!
ArrowMorph class
	instanceVariableNames: ''!

!classDefinition: #CellView category: #'Game-Graphics'!
LayoutMorph subclass: #CellView
	instanceVariableNames: 'textPane marksPane'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Game-Graphics'!
!classDefinition: 'CellView class' category: #'Game-Graphics'!
CellView class
	instanceVariableNames: ''!

!classDefinition: #PlotGraphMorph category: #'Game-Graphics'!
FunctionGraphMorph subclass: #PlotGraphMorph
	instanceVariableNames: 'data points yScaleFactor startTime deltaT yFactor xFactor resumed players sorted'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Game-Graphics'!
!classDefinition: 'PlotGraphMorph class' category: #'Game-Graphics'!
PlotGraphMorph class
	instanceVariableNames: ''!

!classDefinition: #GamePopUp category: #'Game-Graphics'!
PopUpMenu subclass: #GamePopUp
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Game-Graphics'!
!classDefinition: 'GamePopUp class' category: #'Game-Graphics'!
GamePopUp class
	instanceVariableNames: ''!

!classDefinition: #Asset category: #'Game-Model'!
Object subclass: #Asset
	instanceVariableNames: 'description quantity cost gross factor quality count missed owner singleOwner'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Game-Model'!
!classDefinition: 'Asset class' category: #'Game-Model'!
Asset class
	instanceVariableNames: ''!

!classDefinition: #BoardSpace category: #'Game-Model'!
Object subclass: #BoardSpace
	instanceVariableNames: 'label routine marks'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Game-Model'!
!classDefinition: 'BoardSpace class' category: #'Game-Model'!
BoardSpace class
	instanceVariableNames: ''!

!classDefinition: #Direction category: #'Game-Model'!
Object subclass: #Direction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Game-Model'!
!classDefinition: 'Direction class' category: #'Game-Model'!
Direction class
	instanceVariableNames: ''!

!classDefinition: #GameHistogram category: #'Game-Model'!
Object subclass: #GameHistogram
	instanceVariableNames: 'distribution'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Game-Model'!
!classDefinition: 'GameHistogram class' category: #'Game-Model'!
GameHistogram class
	instanceVariableNames: ''!

!classDefinition: #Gamer category: #'Game-Model'!
Object subclass: #Gamer
	instanceVariableNames: 'color identity cash debt inFlow outFlow interestPd paidInterest avoidedDebt assets history passedGo years mgr position oldPosition die marker roll totalRoll turns expenseCount'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Game-Model'!
!classDefinition: 'Gamer class' category: #'Game-Model'!
Gamer class
	instanceVariableNames: ''!

!classDefinition: #Season category: #'Game-Model'!
Object subclass: #Season
	instanceVariableNames: 'desc color textColor range assetName'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Game-Model'!
!classDefinition: 'Season class' category: #'Game-Model'!
Season class
	instanceVariableNames: ''!


!Game commentStamp: 'dhn 7/10/2016 12:01' prior: 0!
Abstract class for a board game model.!

!GamePasteUp commentStamp: '<historical>' prior: 0!
Provide a way to make the pasteup immobile.!

!Token commentStamp: 'dhn 7/10/2016 11:44' prior: 0!
A player's piece on the game board.!

!GameButtonMorph commentStamp: '<historical>' prior: 0!
A button morph which can be disabled and enabled.!

!BidderButton commentStamp: 'dhn 8/14/2017 11:27:04' prior: 0!
A button to enable players to offer bids. This class provides polymorphism which differs from super in that the action is performed with a passed parameter.!

!GameCell commentStamp: 'dhn 8/2/2016 16:49:15' prior: 0!
A description of the board space represented by a cell.!

!GameBoard commentStamp: 'dhn 8/21/2016 21:38:39' prior: 0!
Abstract class for views of a board game.!

!GameView commentStamp: 'dhn 8/25/2018 13:55:09' prior: 0!
Abstract class for certain game views.!

!AuctionView commentStamp: '<historical>' prior: 0!
An abstract class for auctions.!

!AuctionAsset commentStamp: '<historical>' prior: 0!
A window which makes it possible for players to raise cash by selling assets.!

!HistoryView commentStamp: 'dhn 8/27/2018 10:14:45' prior: 0!
A plot of players' progress toward the goal of the game.!

!LoanView commentStamp: '<historical>' prior: 0!
A view which makes it possible for players to reduce debt.!

!OptionsView commentStamp: '<historical>' prior: 0!
A window which makes it possible for players to make purchases.!

!ListView commentStamp: 'dhn 7/10/2016 17:20' prior: 0!
An abstract class for game windows.!

!DieMorph commentStamp: '<historical>' prior: 0!
A die (one half of a pair of dice). Multiple instances can cache values in #results.!

!ArrowMorph commentStamp: '<historical>' prior: 0!
Enable a form to be opened on a world.!

!CellView commentStamp: 'dhn 8/14/2017 11:23:23' prior: 0!
Define the layout for a cell on the game board. A cell is the lower portion of a space on the board.!

!PlotGraphMorph commentStamp: 'dhn 9/28/2016 20:24:06' prior: 0!
Plot players' progress.!

!GamePopUp commentStamp: '<historical>' prior: 0!
Modal dialog, providing syntax identical to a Squeak class:

UserDialogBoxMorph inform: 'An informative string.' title: 'Title'.
!

!Asset commentStamp: 'dhn 7/10/2016 11:58' prior: 0!
Abstract class for an asset model.!

!BoardSpace commentStamp: 'dhn 1/11/2017 19:04:14' prior: 0!
A model for a space on a board game. Instance variables include:

label - describes the space
routine - a symbol for the method to run when landing on the space
marks - morphs indicating player's presence!

!Direction commentStamp: 'dhn 7/10/2016 12:00' prior: 0!
A model for finding the shortest distance around a game board.!

!GameHistogram commentStamp: 'dhn 10/7/2014 17:28' prior: 0!
A Histogram shows the frequency distribution of how often some value occurs.
!

!Gamer commentStamp: 'dhn 7/10/2016 12:02' prior: 0!
A model for a player in a board game.
!

!Season commentStamp: 'dhn 7/10/2016 12:02' prior: 0!
A Season is the collection of attributes associated with, for example:
	a season (Farming Game, Construction Game)
	a property set (Monopoly)
!

!Game methodsFor: 'operating' stamp: 'dhn 8/23/2016 21:33:37'!
addMarkerIDInMarks
	"(self marks at: self currentPlayer position) at: self playerIndex
		put: self currentPlayer identity" ! !

!Game methodsFor: 'operating' stamp: 'dhn 1/14/2017 14:43:58'!
cellsAt: anIndex 
	"Show the board starting with spaces at: anIndex."
	| str |
	
	1 to: cellCount do: [:k | 
		(cells at: k) marksPane removeAllMorphs].
	
	1 to: cellCount do: [:m | | sp |
		sp _ spaces atWrap: anIndex + m - 1.
		str _ String new writeStream.
		str nextPutAll: sp label; newLine.
		self testMode
			ifTrue: [str nextPutAll: sp routine asString; newLine].
		(cells at: m) textPane
			model actualContents: str contents.
		sp marks ifNotEmpty: [
			(cells at: m) marksPane
				addAllMorphs: sp marks]]
! !

!Game methodsFor: 'operating' stamp: 'dhn 9/15/2017 18:36:32'!
declareBroke: aString
	"Inform that the player named aString is out of cash"
	
	GamePopUp 
		inform: aString , ' is out of cash and must auction 
assets until cash is no longer negative.'
		title: 'Out of Cash'! !

!Game methodsFor: 'operating' stamp: 'dhn 9/15/2017 18:32:11'!
declareOver: aString
	"Inform that the player named aString is over the debt limit"
	
	GamePopUp 
		inform: (String streamContents: [:str |
			str
				nextPutAll: currentPlayer identity;
				nextPutAll: ' must use cash to bring debt to $';
				nextPutAll: currentPlayer playerDebtLimit value negated printStringWithCommas;
				nextPutAll: ' or less.']) 
		title: 'Debt Too High'! !

!Game methodsFor: 'operating' stamp: 'dhn 9/15/2017 18:42:37'!
declareWinner
	"Inform that there is a winner"

	GamePopUp 
		inform: (String streamContents: [:str |
			str
				nextPutAll: self currentPlayer identity;
				nextPutAll: ' has amassed net assets of more than $';
				nextPutAll: self goal printStringWithCommas; nextLine;
				nextPutAll: ' and is the winner of the game.']) 
		title: 'THE WINNAH!!!!!!!!'.
	token delete.
	self won: true! !

!Game methodsFor: 'operating' stamp: 'dhn 8/4/2016 18:47:37'!
disableAll: aCollection
	"Disable each button named in aCollection"
	| btn |
	
	aCollection do: [:x |
		btn _ self buttons submorphs detect: [:b | b label = x] ifNone: [nil].
		btn ifNotNil: [btn disableButton]]! !

!Game methodsFor: 'operating' stamp: 'dhn 4/15/2019 12:31:28'!
doSpace
	"Perform the method associated with the space where the player is"

	^ self perform: ((spaces atWrap: self currentPlayer position) routine)! !

!Game methodsFor: 'operating' stamp: 'dhn 10/9/2011 11:04'!
drawCard: aDeck discard: aDiscard
	|card|
	aDeck isEmpty ifFalse: [.
		card := aDeck removeFirst.
		aDiscard addFirst: card.
		^card
		]
	ifTrue: [
		aDeck addAll: (self scramble: aDiscard).
		aDiscard removeAll: aDeck.
		^self drawCard: aDeck discard: aDiscard.
		].
! !

!Game methodsFor: 'operating' stamp: 'dhn 8/4/2016 18:47:09'!
enableAll: aCollection
	"Enable each button named in aCollection"
	| btn |
	
	aCollection do: [:x |
		btn _ self buttons submorphs detect: [:b | b label = x] ifNone: [nil].
		btn ifNotNil: [btn enableButton]]! !

!Game methodsFor: 'operating' stamp: 'dhn 10/16/2016 14:38:10'!
goal
	"Answer the goal of the game"
	
	goal ifNil: [goal _ self class defaultGoal].
	^ self testMode
		ifTrue: [TestGoal]
		ifFalse: [goal]! !

!Game methodsFor: 'operating' stamp: 'dhn 9/22/2016 11:26:34'!
hardRoll
	"Answer the value of hardRoll"
	
	^ hardRoll! !

!Game methodsFor: 'operating' stamp: 'dhn 9/22/2016 11:27:21'!
hardRoll: anObject
	"Set the value of hardRoll"
	
	hardRoll _ anObject! !

!Game methodsFor: 'operating' stamp: 'dhn 4/10/2019 18:07:56'!
hopFor: anObject
	"Hop token for anObject number of spaces"
	| value |
	
	currentPlayer oldPosition: currentPlayer position.
	value _ self testMode ifTrue: [self hardRoll] ifFalse: [anObject].
	token jump: value.
	currentPlayer 
		roll: value;
		position: (currentPlayer forwardTo: (value + currentPlayer position) 
			around: spaces size).
	currentPlayer rollStats: value! !

!Game methodsFor: 'operating' stamp: 'dhn 8/21/2017 13:20:32'!
move
	"Roll the die"
	| bone |
	
	self disableAll: {'Move'}.
	bone _ DieMorph new openInWorld: world.
	bone model: self.
	currentPlayer die: bone.
	bone adjustTo: token.
	bone show: bone class faces shuffled! !

!Game methodsFor: 'operating' stamp: 'dhn 6/14/2020 17:37:30'!
nextPlayer
	"Begin the next player's turn"
	| x |
	
	currentPlayer _ (players atWrap: (playerIndex _ playerIndex + 1)).
	self 
		triggerEvent: #deleteOpenWindows; 	"close any open views of the current player"
		triggerEvent: #itemChange; 	"update board view"
		triggerEvent: #titleChange with: currentPlayer;
		positionBoardTo: currentPlayer position; 	"position board,"
		removeMarkers.
	token openInWorld: world.
	token morphPosition: tokenPos.
	token tokenId contents: currentPlayer identity.
	token doubled contents: currentPlayer doubledString.
	token color: currentPlayer color.
	token setBalloonText: 'token for ', currentPlayer identity.
	self testMode ifTrue: [
	x _ (StringRequestMorph request: 'How many spaces' initialAnswer: '6' orCancel: ['0']) asNumber.
	self hardRoll: ((1 to: 6) asArray atWrap: x)]! !

!Game methodsFor: 'operating' stamp: 'dhn 1/11/2017 15:52:14'!
parseSeasonsAt: anIndex 
	"Answer associations of point->season, where point defines the range of cells for the season"
	| col max start sea |
	
	col := OrderedCollection new.
	max _ spaces size.
	sea _ self seasonAt: anIndex.
	start _ 0.
	0 to: cellCount - 1 do: [:n | 	| next |
		next _ self seasonAt: (self wrapIndex: anIndex + n around: max).
		sea desc = next desc
			ifFalse: [
				col addLast: start + 1 @ n -> sea.
				start _ n.
				sea _ next]].
	col addLast: start + 1 @ cellCount -> sea.
	^ col! !

!Game methodsFor: 'operating' stamp: 'dhn 10/2/2016 16:48:07'!
positionBoardTo: anIndex 
	"Change the location on the board"
	| assoc |
	
	self cellsAt: anIndex.
	assoc _ self parseSeasonsAt: anIndex.
	self triggerEvent: #showSeasons: with: assoc! !

!Game methodsFor: 'operating' stamp: 'dhn 8/9/2017 21:27:12'!
removeMarkers
	"Remove a player's marker from space and cell"
	
	(spaces atWrap: currentPlayer position) markRemFor: currentPlayer.
	cells first marksPane removeMorph: currentPlayer marker
! !

!Game methodsFor: 'operating' stamp: 'dhn 10/10/2013 22:10'!
won
	won ifNil: [won := false].
	^ won! !

!Game methodsFor: 'operating' stamp: 'dhn 10/10/2013 22:11'!
won: aBool
	won := aBool.! !

!Game methodsFor: 'operating' stamp: 'dhn 11/1/2013 18:52'!
wrapIndex: anIndex around: aLimit 
	"Answer an index value in the interval [1, aLimit]."
	anIndex > aLimit
		ifTrue: ["Use recursion to limit gross excesses."
			^ self wrapIndex: anIndex - aLimit around: aLimit]
		ifFalse: [anIndex <= 0
				ifTrue: [^ aLimit].
			^ anIndex]! !

!Game methodsFor: 'accessing' stamp: 'dhn 9/16/2011 17:54'!
buttons
	"Answer the value of buttons"

	^ buttons! !

!Game methodsFor: 'accessing' stamp: 'dhn 9/16/2011 17:54'!
buttons: anObject
	"Set the value of buttons"

	buttons := anObject! !

!Game methodsFor: 'accessing' stamp: 'dhn 9/22/2016 21:02:27'!
cells
	"Answer the value of cells"

	^ cells! !

!Game methodsFor: 'accessing' stamp: 'dhn 9/22/2016 21:02:59'!
cells: anObject
	"Set the value of cells"

	cells _ anObject! !

!Game methodsFor: 'accessing' stamp: 'dhn 10/28/2016 14:54:47'!
chantBeat
	"Answer the value of chantBeat"

	chantBeat ifNil: [chantBeat _ 2000].
	^ chantBeat! !

!Game methodsFor: 'accessing' stamp: 'dhn 9/11/2011 17:00'!
currentPlayer
	"Answer the value of currentPlayer"

	^ currentPlayer! !

!Game methodsFor: 'accessing' stamp: 'dhn 7/29/2013 14:44'!
currentPlayer: anObject
	currentPlayer := anObject! !

!Game methodsFor: 'accessing' stamp: 'dhn 10/2/2016 17:01:38'!
oldGoal
	^ self class oldGoal asNumber! !

!Game methodsFor: 'accessing' stamp: 'dhn 11/4/2011 08:31'!
outs
	"Answer the players who are out of the game."

	^ outs ifNil: [OrderedCollection new].! !

!Game methodsFor: 'accessing' stamp: 'dhn 11/4/2011 08:29'!
outs: anObject
	"Set the value of outs"

	outs := anObject! !

!Game methodsFor: 'accessing' stamp: 'dhn 10/10/2011 18:14'!
playerIndex
	"Answer the value of playerIndex"

	playerIndex ifNil: [playerIndex := 0].
	^ playerIndex! !

!Game methodsFor: 'accessing' stamp: 'dhn 10/10/2011 18:12'!
playerIndex: anObject
	"Set the value of playerIndex"

	playerIndex := anObject! !

!Game methodsFor: 'accessing' stamp: 'dhn 9/14/2011 22:55'!
players
	"Answer the value of players"

	^ players! !

!Game methodsFor: 'accessing' stamp: 'dhn 10/27/2016 12:27:51'!
players: anObject
	"Set value of players to anObject"
	
	players _ anObject! !

!Game methodsFor: 'accessing' stamp: 'dhn 10/7/2014 12:23'!
spaceFreq
	"Answer the value of spaceFreq"

	^ spaceFreq! !

!Game methodsFor: 'accessing' stamp: 'dhn 3/18/2017 18:39:37'!
token
	"Answer the value of token"

	^ token! !

!Game methodsFor: 'accessing' stamp: 'dhn 3/18/2017 18:39:03'!
token: anObject
	"Set the value of token"

	token _ anObject! !

!Game methodsFor: 'initialize' stamp: 'dhn 8/31/2017 16:10:39'!
describeSpaces
	"Descriptions for the spaces on the board."

	self subclassResponsibility ! !

!Game methodsFor: 'initialize' stamp: 'dhn 8/2/2014 21:49'!
initialButtonState
	"Establish the button state at the start of the game"
	self subclassResponsibility! !

!Game methodsFor: 'initialize' stamp: 'dhn 4/12/2019 11:40:07'!
initialize

	players _ OrderedCollection new.
	cells _ OrderedCollection new.
	spaceFreq _ GameHistogram ofSize: self class describeSpaces size! !

!Game methodsFor: 'initialize' stamp: 'dhn 7/11/2013 14:53'!
markerSize
	"Answer the size for markers"
	^ 28! !

!Game methodsFor: 'initialize' stamp: 'dhn 10/2/2016 14:53:22'!
quitGame
	"Signal that we are quitting"

	self triggerEvent: #deleteOpenWindows.
	self triggerEvent: #quitGame! !

!Game methodsFor: 'initialize' stamp: 'dhn 9/17/2011 13:19'!
scramble: aCollection
	"Try to achieve a better mix."
	|temp|
	temp := aCollection shuffled.
	temp := temp shuffled.
	^temp shuffled.
! !

!Game methodsFor: 'initialize' stamp: 'dhn 6/14/2020 17:26:55'!
setBeat
	"Set the time between '...going', '...going' "
	| value x |
	
	value _ self chantBeat / 1000.0.
	x _ (StringRequestMorph request: 'Auctioneer pause time (sec)' initialAnswer: value asString).
	x ~= '' ifTrue:  [chantBeat _ (x asNumber * 1000.0) asInteger]! !

!Game methodsFor: 'initialize' stamp: 'dhn 6/14/2020 17:27:30'!
setGoal
	"Set the goal of the game"
	| x |
	
	goal ifNil: [goal _ self class defaultGoal].
	x _ (StringRequestMorph request: 'Net assets to win the game?' initialAnswer: goal asString).
	x ~= '' ifTrue:  [goal _ x asNumber]! !

!Game methodsFor: 'initialize' stamp: 'dhn 8/6/2017 21:32:46'!
world
	"Answer the value of world"

	^ world! !

!Game methodsFor: 'initialize' stamp: 'dhn 4/3/2017 19:38:36'!
world: anObject
	"Set the value of world"

	world _ anObject! !

!Game class methodsFor: 'auction' stamp: 'dhn 9/3/2018 11:22:46'!
bidBump
	"Answer the bid increments"
	
	^ 1000 * #(1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20)! !

!Game class methodsFor: 'auction' stamp: 'dhn 9/3/2018 11:22:59'!
bidIncrement
	"Answer the list for an auction"
	| col |
	
	col _ OrderedCollection new.
	self bidBump do: [:each | col add: '$', each printStringWithCommas].
	^ col

	! !

!GamePasteUp methodsFor: 'dropping/grabbing' stamp: 'dhn 1/4/2018 18:32:52'!
aboutToGrab: submorph
	"submorph is being grabbed by a hand.
	Perform necessary adjustments (if any) and return the actual morph
	that should be added to the hand.
	Answer nil to reject the drag."

	submorph name == #board ifTrue: [^ nil].
	^ submorph! !

!GamePasteUp methodsFor: 'dropping/grabbing' stamp: 'dhn 1/3/2018 20:39:57'!
wantsDroppedMorph: aMorph event: evt
	"Return true if the receiver wishes to accept the given morph, which is being dropped by a hand in response to the given event. Note that for a successful drop operation both parties need to agree. The symmetric check is done automatically via aMorph wantsToBeDroppedInto: self."

	^true! !

!GamePasteUp methodsFor: 'accessing' stamp: 'dhn 1/4/2018 18:35:37'!
isSticky
	"Don't move me!!"

	^ true! !

!Token methodsFor: 'accessing' stamp: 'dhn 9/24/2016 15:44:32'!
arrow
	"Answer the value of arrow"

	^ arrow! !

!Token methodsFor: 'accessing' stamp: 'dhn 2/18/2017 18:16:13'!
arrowPosition
	"Answer the position for the arrow"

	^ (self morphWidth / 3) @ -60! !

!Token methodsFor: 'accessing' stamp: 'dhn 10/9/2011 20:04'!
count
	"Answer the value of count"

	count ifNil: [count := 0].
	^ count! !

!Token methodsFor: 'accessing' stamp: 'dhn 10/9/2011 19:54'!
count: anObject
	"Set the value of count"

	count := anObject! !

!Token methodsFor: 'accessing' stamp: 'dhn 9/24/2016 15:44:32'!
die
	"Answer the value of die"

	^ die! !

!Token methodsFor: 'accessing' stamp: 'dhn 9/24/2016 15:44:32'!
die: anObject
	"Set the value of die"

	die _ anObject! !

!Token methodsFor: 'accessing' stamp: 'dhn 8/25/2016 17:23:29'!
labelArea
	"Answer the value of labelArea"

	^ labelArea! !

!Token methodsFor: 'accessing' stamp: 'dhn 8/25/2016 17:24:01'!
labelArea: anObject
	"Set the value of labelArea"

	labelArea _ anObject! !

!Token methodsFor: 'accessing' stamp: 'dhn 5/7/2020 15:22:58'!
tokenId
	"Answer the value of tokenId"

	^ tokenId! !

!Token methodsFor: 'accessing' stamp: 'dhn 5/7/2020 20:08:29'!
tokenId: anObject
	"Set the value of tokenId"

	tokenId _ anObject! !

!Token methodsFor: 'initialization' stamp: 'dhn 8/8/2017 11:31:47'!
arrowLeft
	"Associate an arrow with the sender, pointing to the left"

	arrow _ ArrowMorph new
		form: (BitBltCanvas arrowOfDirection: #left size: 40) as8BitColorForm.
	self addMorph: arrow.
	arrow openInWorld: self.
	arrow morphPosition: self arrowPosition

! !

!Token methodsFor: 'initialization' stamp: 'dhn 8/8/2017 11:31:24'!
arrowRight
	"Associate an arrow with the sender, pointing to the right"

	arrow _ ArrowMorph new
		form: (BitBltCanvas arrowOfDirection: #right size: 40) as8BitColorForm.
	self addMorph: arrow.
	arrow openInWorld: self.
	arrow morphPosition: self arrowPosition
! !

!Token methodsFor: 'initialization' stamp: 'dhn 4/26/2019 10:47:39'!
identity: aString
	"Set the layout for the player's name"

	^ (StringMorph 
		contents: aString 
		font: GameBoard gameFont
		emphasis: AbstractFont boldCode)
			morphPosition: 50@18! !

!Token methodsFor: 'initialization' stamp: 'dhn 3/22/2017 11:27:16'!
initialize

	super initialize.
	
	hop _ OrderedCollection new.
	180 to: 360 by: 18 do: [:a | hop add: 6 * (a degreesToRadians cos * 2)].
	
	self setBalloonText: 'A token representing the player. When the Move button is clicked, 
a die is "rolled" and the token moves that number of spaces.'! !

!Token methodsFor: 'initialization' stamp: 'dhn 6/5/2020 21:21:49'!
makeIdArea
	"Lay out the area for the player's name"
	| area |
	
	area _ LayoutMorph newRow
		color: Color transparent;
		name: #tokenId;
		axisEdgeWeight: #center.
	
	tokenId _ (StringMorph contents: 'Player') 
		emphasis: 1;
		font: GameBoard gameFont.
		
	area addMorph: tokenId.
	^ area layoutSpec: (LayoutSpec  
		proportionalWidth: 1.0)! !

!Token methodsFor: 'initialization' stamp: 'dhn 3/21/2017 18:47:12'!
model
	"Answer the value of model"

	^ model! !

!Token methodsFor: 'initialization' stamp: 'dhn 3/21/2017 18:46:25'!
model: anObject
	"Set the value of model"

	model _ anObject! !

!Token methodsFor: 'initialization' stamp: 'dhn 8/17/2017 13:22:03'!
posAdjust
	"Answer the position"
	| ver hor |
	
	ver _ model world morphExtent y * 8 / 10.
	hor _ model world morphExtent x * 0.025.
	^ hor@ver! !

!Token methodsFor: 'initialization' stamp: 'dhn 3/21/2017 14:17:20'!
setSize
	"Set the extent of the receiver"
	| w h |
	
	w _ owner morphExtent x * 0.13.
	h _ w * 0.5.
	self morphExtent: w@h! !

!Token methodsFor: 'stepping' stamp: 'dhn 4/2/2020 16:34:53'!
jump: aCount
	"Move the receiver in aCount hops"
	| step limit i horiz |
	
	step _ 30.	"time of each increment of the hop"
	limit _ hop size * aCount.
	horiz _ (model cells first morphWidth +2)/ (hop size).
	i _ 0.
	self when: #morphicStep evaluate: [ :delta |
		i _ i + 1.
		i < limit 
			ifTrue: [self morphPosition: (self morphPosition translatedBy: horiz@(hop atWrap: i))]
			ifFalse: [
				self stopStepping.
				self removeActionsForEvent: #morphicStep.
				self moved]].
	self startSteppingStepTime: step. 	
! !

!Token methodsFor: 'stepping' stamp: 'dhn 4/15/2019 11:49:16'!
moveFrom: positionA to: positionB
	"Slide self in the shorter direction"
	
	(Direction shortest: positionA to: positionB in: model spaces size) > 0
		ifTrue: [self slideLeft: positionA to: positionB]
		ifFalse: [self slideRight: positionA to: positionB]! !

!Token methodsFor: 'stepping' stamp: 'dhn 4/15/2019 11:29:23'!
slideLeft: from to: to
	"Slide self when player must go BACK to 'to' from 'from' "
	| oldPos newPos index n posns limit i final |
	
	final _ to.
	index _ (Interval from: 1 to: model spaces size by: 1) asArray.
	oldPos _ index atWrap: from - 6.
	model positionBoardTo: oldPos.
	self position: 7.
	newPos _ index atWrap: final - 7.
	posns _ OrderedCollection new.
	n _ oldPos.
	[(index atWrap: n) ~= newPos] whileTrue: [posns add: (index atWrap: n). n _ n - 1].
	posns _ posns asArray.
	model positionBoardTo: posns first.
	
	self arrowLeft.
	limit _ posns size.
	i _ 0.
	self when: #morphicStep evaluate: [ :unused |
		i _ i + 1.
		model positionBoardTo: (posns at: i).
		i < limit 
			ifFalse: [
				self stopStepping.
				self removeActionsForEvent: #morphicStep.
				arrow delete.
				model currentPlayer position: final.
				model triggerEvent: #endOfMove.
				self doubled contents: model currentPlayer doubledString]].
	self startSteppingStepTime: 500! !

!Token methodsFor: 'stepping' stamp: 'dhn 4/15/2019 11:36:11'!
slideRight: from to: to
	"Slide self when player moves ahead from 'from' to 'to' other than by the Move button"
	| oldPos newPos index n posns limit i final |
	
	final _ to.
	index _ (Interval from: 1 to: model spaces size by: 1) asArray.
	oldPos _ index atWrap: from.
	model positionBoardTo: oldPos.
	self position: 1.
	newPos _ final + 1.
	posns _ OrderedCollection new.
	n _ oldPos.
	[(index atWrap: n) ~= newPos] whileTrue: [posns add: (index atWrap: n). n _ n + 1].
	posns _ posns asArray.
	model positionBoardTo: posns first.
	
	self arrowRight.
	limit _ posns size.
	i _ 0.
	self when: #morphicStep evaluate: [ :unused |
		i _ i + 1.
		model positionBoardTo: (posns at: i).
		i < limit 
			ifFalse: [
				self stopStepping.
				self removeActionsForEvent: #morphicStep.
				arrow delete.
				model currentPlayer position: final.
				model triggerEvent: #endOfMove.
				self doubled contents: model currentPlayer doubledString]].
	self startSteppingStepTime: 500! !

!Token class methodsFor: 'instance creation' stamp: 'dhn 7/11/2013 14:42'!
colors
	"Answer the colors that players can have."
	^ {Color r: 0.0 g: 0.634 b: 1. 
		Color r: 0.729 g: 0.455 b: 0.819. 
		Color r: 0.544 g: 0.729 b: 0.544. 
		Color r: 0.909 g: 0.27 b: 0.729. 
		Color r: 0.634 g: 0.729 b: 1. 
		Color cyan. Color green. Color red. Color orange. Color magenta}! !

!Token class methodsFor: 'instance creation' stamp: 'dhn 1/20/2017 11:58:56'!
includeInNewMorphMenu
	"Not to be instantiated from the menu"
	^ false! !

!Token class methodsFor: 'instance creation' stamp: 'dhn 4/8/2017 20:24:59'!
newFor: aModel
	"Establish an instance with model aModel"
	
	^ self initializedInstance model: aModel! !

!Token class methodsFor: 'operation' stamp: 'dhn 12/2/2011 22:32'!
rollCount
	"Answer the number of iterations for a roll"
	^ 1! !

!GameButtonMorph methodsFor: 'state' stamp: 'dhn 7/23/2016 15:33'!
disableButton
	"Change to the disabled state, caching the actionSelector"
	
	self enabled ifTrue: [
		self oldTarget: self actionSelector.
		self action: nil.
		self enabled: false.
		self color: GameButtonMorph disabledColor]! !

!GameButtonMorph methodsFor: 'state' stamp: 'dhn 7/23/2016 15:34'!
enableButton
	"Change to the enabled state"
	
	self enabled ifFalse: [
		oldTarget ifNotNil: [self action: oldTarget].
		self enabled: true.
		self color: GameButtonMorph enabledColor]! !

!GameButtonMorph methodsFor: 'accessing' stamp: 'dhn 10/12/2011 16:05'!
enabled
	"Answer the value of enabled"

	enabled ifNil: [enabled := true].
	^ enabled! !

!GameButtonMorph methodsFor: 'accessing' stamp: 'dhn 10/12/2011 16:04'!
enabled: aBoolean
	"Set the value of enabled"

	enabled := aBoolean! !

!GameButtonMorph methodsFor: 'accessing' stamp: 'dhn 7/23/2016 15:05'!
label
	"Answer the button label"
	
	^ label! !

!GameButtonMorph methodsFor: 'accessing' stamp: 'dhn 10/12/2011 16:03'!
oldTarget: anObject
	"Set the value of oldTarget"

	oldTarget := anObject! !

!GameButtonMorph methodsFor: 'initialization' stamp: 'dhn 9/3/2013 19:44'!
initialize
	super initialize! !

!GameButtonMorph class methodsFor: 'as yet unclassified' stamp: 'dhn 7/23/2016 09:36'!
defaultExtent
	"Answer the default extent for a button: width@height"
	
	^ 90@40! !

!GameButtonMorph class methodsFor: 'as yet unclassified' stamp: 'dhn 10/12/2011 16:26'!
disabledColor
	^Color veryLightGray! !

!GameButtonMorph class methodsFor: 'as yet unclassified' stamp: 'dhn 10/12/2011 16:29'!
enabledColor
	^Color r: 0.4 g: 0.8 b: 0.6! !

!GameButtonMorph class methodsFor: 'as yet unclassified' stamp: 'dhn 7/23/2016 15:41'!
label: label action: actionSymbol state: stateSymbol model: aModel
	"Create an instance of this class"
	| btn |
	
	btn _ self new
		label: label;
		morphExtent: self defaultExtent;
		model: aModel.
	stateSymbol 
		ifNil: [
			btn 
				enabled: true;
				action: actionSymbol;
				color: self enabledColor]
		ifNotNil: [
			stateSymbol 
				ifTrue: [
					btn 
						enabled: true;
						action: actionSymbol;
						color: self enabledColor]
				ifFalse: [
					btn 
						enabled: false;
						action: nil;
						oldTarget: actionSymbol;
						color: self disabledColor]].

	^ btn! !

!BidderButton methodsFor: 'updating' stamp: 'dhn 9/17/2016 21:49:30'!
performAction
	"Inform the model that this button has been pressed and pass the label. "

	actionSelector ifNotNil: [
		model perform: actionSelector with: label]! !

!BidderButton methodsFor: 'accessing' stamp: 'dhn 4/5/2020 13:15:55'!
oldColor: anObject
	"Set the value of oldColor"

	oldColor _ anObject! !

!BidderButton methodsFor: 'operation' stamp: 'dhn 4/5/2020 13:21:34'!
disableButton
	"Change to the disabled state, caching the actionSelector and color"
	
	self enabled ifTrue: [
		self oldTarget: self actionSelector.
		self oldColor: color.
		self action: nil.
		self enabled: false.
		self color: GameButtonMorph disabledColor]! !

!BidderButton methodsFor: 'operation' stamp: 'dhn 4/5/2020 13:24:47'!
enableButton
	"Change to the enabled state"
	
	self enabled ifFalse: [
		oldTarget ifNotNil: [self action: oldTarget].
		self enabled: true.
		self color: oldColor]! !

!BidderButton methodsFor: 'event handling' stamp: 'dhn 5/10/2020 13:03:18'!
mouseButton2Down: event localPosition: point 
	"Bring up the bid increment menu"
	| x |

	enabled
		ifTrue: [
			x _ (PopUpMenu labelArray: model bidIncrementList) 
				startUpWithCaption: 'Bid Increment'.
			x _ x max: 1.
			model currentBump: (model bidBump at: x).
			model offer: label]! !

!GameCell methodsFor: 'accessing' stamp: 'dhn 8/14/2017 10:59:26'!
describe
	"Answer the default cell content which is needed during initialization"

	model actualContents ifNil: [model actualContents: ''].
	^ model actualContents! !

!GameBoard methodsFor: 'accessing' stamp: 'dhn 3/5/2017 18:00:18'!
board
	"Answer the value of board"

	^ board! !

!GameBoard methodsFor: 'accessing' stamp: 'dhn 7/25/2016 11:17'!
gameTitle
	"Answer the value of gameTitle"

	^ gameTitle! !

!GameBoard methodsFor: 'accessing' stamp: 'dhn 9/10/2016 20:15:07'!
layoutMorph
	"Answer the value of layoutMorph"
	
	^ layoutMorph! !

!GameBoard methodsFor: 'accessing' stamp: 'dhn 3/23/2017 20:54:14'!
pasteup
	"Answer the value of pasteup"

	^ pasteup! !

!GameBoard methodsFor: 'operation' stamp: 'dhn 4/11/2019 12:13:52'!
showHistory
	"Open a graph of players' history"
	| graphs |
	
	graphs _ HistoryView openOn: model title: 'History'.
 	graphs legend 
		morphExtent: 100@80;
		morphPosition: owner morphExtent * (0.025@0.015).
	graphs plotter 
		players: model players;
		plotData.
	graphs 
		openInWorld: pasteup;
 		morphExtent: 300 @ 300;
		morphPosition: (self morphExtent x - 350)@18;
		borderColor: Color lightBrown.
	graphs layoutMorph color: Color white.
	graphs legend color: Color white.
 	graphs legend submorphs do: [:ea | ea color: Color white]
 ! !

!GameBoard methodsFor: 'initialization' stamp: 'dhn 7/12/2016 19:58'!
buttonAreaHeight

	^ 30! !

!GameBoard methodsFor: 'initialization' stamp: 'dhn 9/10/2016 20:19:36'!
defaultExtent

	^ (Display width) @ (Display height * 0.6)! !

!GameBoard methodsFor: 'initialization' stamp: 'dhn 6/14/2020 17:27:55'!
getPlayers
	"Get the names of two to six players"
	| x y cnt clrs |

	model disableAll: {'Players'. 'Tour'}.
	clrs _ Token colors shuffled.
	cnt _ 0.
	x _ StringRequestMorph request: 'First player''s name?' initialAnswer: ''.
	x 
		ifEmpty: [
			model enableAll: {'Players'. 'Tour'}.
			^ nil]
		ifNotEmpty: [
			cnt _ cnt + 1.
			model setupPlayer: x color: (clrs at: cnt)].
	
	[cnt < 6] whileTrue: [
		y _ StringRequestMorph request: 'Next player''s name?' initialAnswer: ''.
		y
			ifEmpty: [
				cnt > 1 
					ifTrue: [self startGame]
					ifFalse: [
						model players: OrderedCollection new.
						model enableAll: {'Players'. 'Tour'}].
				^ nil]
			ifNotEmpty: [
				cnt _ cnt + 1.
				model setupPlayer: y color: (clrs at: cnt)]].
		
	self startGame
! !

!GameBoard methodsFor: 'initialization' stamp: 'dhn 10/19/2016 16:40:06'!
initialize

	super initialize! !

!GameBoard methodsFor: 'initialization' stamp: 'dhn 8/3/2016 15:53:27'!
labelAreaHeight

	^ 50! !

!GameBoard methodsFor: 'initialization' stamp: 'jmv 6/11/2020 16:52:32'!
makeTitleArea
	"Lay out the area for title"
	| area |
	
	area _ LayoutMorph newRow.
	area
		color: Color transparent;
		name: #title;
		axisEdgeWeight: #center.
	
	gameTitle _ (StringMorph contents: '') 
		emphasis: 1;
		font: (FontFamily defaultFamilyPointSize: 24).
		
	area addMorph: gameTitle.
	^ area layoutSpec: (LayoutSpec  
		proportionalWidth: 1.0
		proportionalHeight: self class titleHeight)	! !

!GameBoard methodsFor: 'initialization' stamp: 'dhn 7/12/2016 19:43'!
morphWidth
	"Specify the width of the board"
	
	^ Display width! !

!GameBoard class methodsFor: 'instance creation' stamp: 'jmv 6/11/2020 16:58:31'!
gameFont
	"Answer the font for the game"
	^ FontFamily defaultFamilyPointSize: 12
! !

!GameBoard class methodsFor: 'instance creation' stamp: 'dhn 7/18/2016 10:37'!
submorphProportion
	"Answer the proportional width which extends almost to the game board border"
	
	^ 0.99! !

!GameBoard class methodsFor: 'instance creation' stamp: 'dhn 4/8/2019 21:17:03'!
titleHeight
	"Answer the proportional height for morphs such as title"
	
	^ 0.21! !

!GameBoard class methodsFor: 'instance creation' stamp: 'dhn 4/11/2019 11:42:29'!
viewPositionLeft
	"Answer the upper left location for views"
	
	^ 50@0! !

!GameView methodsFor: 'initialization' stamp: 'dhn 3/23/2020 11:40:04'!
cleanTitleBar
	"Remove buttons from the title bar"
	
	self submorphs do: [:ea | 
		ea class = PluggableButtonMorph ifTrue: [ea delete]]! !

!GameView methodsFor: 'initialization' stamp: 'dhn 8/25/2018 13:54:32'!
removeWindowMenu
	"Remove the button in the title bar which brings up the window menu"
	
	(self findDeepSubmorphThat: [:s | s balloonText = 'window menu'] ifAbsent: [^ nil]) delete! !

!GameView methodsFor: 'dropping/grabbing' stamp: 'dhn 8/25/2018 13:54:32'!
wantsToBeDroppedInto: aMorph
	"Return true if it's okay to drop the receiver into aMorph. This check is symmetric to #wantsDroppedMorph:event: to give both parties a chance of figuring out whether they like each other."
	"This message is sent to the dragged morph, not to the owner."

	^true! !

!GameView methodsFor: 'testing' stamp: 'dhn 5/6/2020 21:16:32'!
is: aSymbol
	^ aSymbol == #GameView or: [ super is: aSymbol ]! !

!GameView class methodsFor: 'class initialization' stamp: 'dhn 8/25/2018 13:54:32'!
open: aModel label: aString
	"Answer a view on aModel"
	|  window |
	
	window _ self new.
	window
		model: aModel;
		buildMorphicWindow.
	aString ifNotNil: [ window setLabel: aString ].
	^ window! !

!GameView class methodsFor: 'class initialization' stamp: 'dhn 8/25/2018 13:54:32'!
openOn: aModel
	"Answer an instance of this class on aModel"
	| win |

	win _ self open: aModel label: 'Statistics'.
	win removeWindowMenu.
			
	aModel when: #itemChange send: #details to: win.
	aModel when: #deleteOpenWindows send: #endIt to: win.
	
	^ win
! !

!GameView class methodsFor: 'class initialization' stamp: 'dhn 8/25/2018 13:54:32'!
viewPosition
	"Answer the basic position for instances of this class"
	
	^ 200 @ -50! !

!AuctionView methodsFor: 'operation' stamp: 'dhn 10/29/2016 19:56:18'!
beat: aSymbol
	"Produce the auctioneer's chant; perform aSymbol when limit is exceeded"
	| limit |
	
	limit _ 4.
	self when: #morphicStep evaluate: [ :delta |
		self going: self going + 1.
		self going <= limit 
			ifTrue: [
				self going > 1 ifTrue: [
					chant addFirst: (String streamContents: [:str |
					str
						nextPutAll: '...going ';
						nextPutAll: (self class degree: self going); newLine]).
				self showChant]]
			ifFalse: [
				self stopStepping.
				self perform: aSymbol.
				self removeActionsForEvent: #morphicStep]].
	self startSteppingStepTime: model chantBeat. 	"time between chants"! !

!AuctionView methodsFor: 'operation' stamp: 'dhn 5/11/2020 10:40:49'!
beginAuction
	"Show buttons for buyers and let the bidding begin"
	
	begun _ true.
	self 
		soldEndButtons;
		beat: #assetSold;
		buyerButtons! !

!AuctionView methodsFor: 'operation' stamp: 'dhn 6/3/2020 16:48:11'!
bidIncrementList
	"Answer the list of bid increments"
	
	^ self bidBump collect: [:each | '$', each printStringWithCommas]! !

!AuctionView methodsFor: 'operation' stamp: 'dhn 10/27/2016 16:31:27'!
going
	"Answer the value of going"
	
	going ifNil: [going _ 0].
	^ going! !

!AuctionView methodsFor: 'operation' stamp: 'dhn 10/27/2016 16:33:12'!
going: anObject
	"Set the value of going"
	
	going _ anObject
! !

!AuctionView methodsFor: 'operation' stamp: 'dhn 8/28/2018 17:47:25'!
list
	"Answer the value of list"
	
	^ list! !

!AuctionView methodsFor: 'operation' stamp: 'dhn 8/28/2018 17:47:47'!
list: anObject
	"Set the value of list"
	
	list _ anObject
! !

!AuctionView methodsFor: 'operation' stamp: 'dhn 5/11/2020 11:05:13'!
offer: anObject by: aName
	"State that an offer referred to by anObject was made by aName"

	currentBid _ currentBid + (self bidBump at: anObject).
	currentBidder _ aName.
	self chant addFirst: (String streamContents: [:str |
		str
			nextPut: $$;
			nextPutAll: self currentBid printStringWithCommas;
			nextPutAll: ' was bid by '; 
			nextPutAll: currentBidder; newLine]).
	self showChant.
	going _ 0.
	buyers submorphsDo: [:ea | ea enableButton].
	(buyers findDeepSubmorphThat: [:mm | mm label = aName] ifAbsent: []) disableButton
! !

!AuctionView methodsFor: 'operation' stamp: 'dhn 8/28/2018 17:47:03'!
seller
	"Answer the value of seller"
	
	^ seller! !

!AuctionView methodsFor: 'operation' stamp: 'dhn 8/28/2018 17:46:15'!
seller: anObject
	"Set the value of seller"
	
	seller _ anObject
! !

!AuctionView methodsFor: 'operation' stamp: 'dhn 8/20/2018 14:37:01'!
showChant
	"Write the auction 'transcript' to the text pane"
	| record |

	record _ String new writeStream.
	self chant do: [:ea | record nextPutAll: ea].
	textPane model actualContents: record contents! !

!AuctionView methodsFor: 'access' stamp: 'dhn 8/29/2018 14:05:07'!
beginButton
	"Answer the value of beginButton"
	
	^ beginButton! !

!AuctionView methodsFor: 'access' stamp: 'dhn 9/17/2016 12:12:29'!
buyers
	"Answer the value of buyers"
	
	^ buyers! !

!AuctionView methodsFor: 'access' stamp: 'dhn 8/20/2018 14:40:22'!
chant
	"Answer the value of chant"
	
	^ chant ifNil: [chant _ OrderedCollection new]! !

!AuctionView methodsFor: 'access' stamp: 'dhn 9/17/2016 15:38:10'!
currentBid
	"Answer the value of currentBid"
	
	currentBid ifNil: [currentBid _ 0].
	^ currentBid! !

!AuctionView methodsFor: 'access' stamp: 'dhn 9/17/2016 20:53:45'!
currentBid: anObject
	"Set the value of currentBid"
	
	currentBid _ anObject! !

!AuctionView methodsFor: 'initialization' stamp: 'dhn 10/27/2016 19:53:59'!
initialize

	super initialize.
	begun _ false! !

!AuctionView methodsFor: 'initialization' stamp: 'dhn 6/6/2020 11:21:45'!
setUpBuyers
	"Answer the layout for the buyers buttons"
	
	^ (LayoutMorph newRow)
		name: #buyers;
		axisEdgeWeight: #center;
		layoutSpec: (LayoutSpec 
			proportionalWidth: 1.0
			proportionalHeight: 0.15
			offAxisEdgeWeight: #center)! !

!AuctionView methodsFor: 'buttons' stamp: 'dhn 9/16/2016 11:36:50'!
makeBeginButton
	"Answer the 'Begin Auction' button"
	
	beginButton _ GameButtonMorph label: 'Begin' action: #beginAuction state: false model: self.
	beginButton 
		morphExtent: 70@20;
		setBalloonText: 'Assemble the bidders and begin the auction'.
	^ beginButton! !

!AuctionView methodsFor: 'buttons' stamp: 'dhn 9/17/2016 12:38:21'!
makeCancelButton
	"Answer the 'Cancel' button"

	^ (cancelButton _ GameButtonMorph label: 'Cancel' action: #endIt state: true model: self)
		morphExtent: 70@20;
		setBalloonText: 'Forget about continuing the auction.'! !

!AuctionView methodsFor: 'buttons' stamp: 'dhn 9/19/2016 14:32:20'!
makeEndButton
	"Answer the 'End' button"
	
	endButton _ GameButtonMorph label: 'End' action: #endIt state: false model: self.
	endButton 
		morphExtent: 70@20;
		setBalloonText: 'End the auction.'.
	^ endButton! !

!AuctionView methodsFor: 'buttons' stamp: 'dhn 6/5/2020 21:28:10'!
soldEndButtons
	"Replace buttons with the End button"
	
	buttonsArea
		removeAllMorphs;
		addMorph: self makeEndButton;
		axisEdgeWeight: #center! !

!AuctionView class methodsFor: 'data base' stamp: 'dhn 10/29/2016 19:47:56'!
degree: anIndex
	"Translate anIndex to auctioneer's chant verbage "
	
	^ #(nil 'once' 'twice' 'three times') at: anIndex! !

!AuctionAsset methodsFor: 'operation' stamp: 'dhn 8/31/2018 11:28:03'!
assetSold
	"Record the sale; enable End button"
	| purchase recipient |
	
	cancelButton disableButton.
	endButton enableButton.
	buyers removeAllMorphs.
	chant addFirst: (String streamContents: [:str |
		str
			nextPutAll: 'SOLD!! to ';
			nextPutAll: currentBidder;
			nextPutAll: ' for $';
			nextPutAll: self currentBid printStringWithCommas; newLine]).
	self showChant.
	model currentPlayer sellAsset: asset listName for: currentBid.
	currentBidder = model class bankName
		ifTrue: [recipient _ currentBidder]
		ifFalse: [
			recipient _ model players detect: [:pl | pl identity = currentBidder] ifNone: [].
			recipient tally: currentBid negated.
			purchase _ recipient assets at: asset listName.
			purchase cost: purchase cost + currentBid.
			purchase quantity: purchase quantity + 1.
			(model availableOptions at: purchase listName) holder: recipient].
	model currentPlayer cash < 0 ifFalse: [
		model updateHistory.
		model enableAll: {'End Turn'}].
	model updatePlayer! !

!AuctionAsset methodsFor: 'operation' stamp: 'dhn 5/11/2020 10:52:49'!
bidBump
	"Answer the bid increments"
	
	^ (1000 to: 20000 by: 1000) asOrderedCollection ! !

!AuctionAsset methodsFor: 'operation' stamp: 'dhn 5/11/2020 10:54:19'!
currentBump: anObject
	"Set the value of currentBump"

	currentBump _ anObject! !

!AuctionAsset methodsFor: 'operation' stamp: 'dhn 9/26/2016 20:07:10'!
details
	"Set the contents of the chant pane"
	
	model assetAuctionItem > 0
		ifTrue: [
			self openingFor: model assetAuctionItem.
			beginButton enableButton]
		ifFalse: [
			begun ifFalse: [
				chant _ OrderedCollection new.
				self showChant.
				beginButton disableButton]]! !

!AuctionAsset methodsFor: 'operation' stamp: 'dhn 8/20/2018 14:27:48'!
offer: aName
	"Record a bid by aName"
	
	model assetAuctionItem > 0 
		ifTrue: [self offer: model assetAuctionItem by: aName]
		ifFalse: [
			buyers submorphsDo: [:ea | ea enableButton].
			(buyers findDeepSubmorphThat: [:mm | mm label = currentBidder] ifAbsent: [^ self]) disableButton]! !

!AuctionAsset methodsFor: 'operation' stamp: 'dhn 9/19/2016 18:03:11'!
openingFor: anItem
	"Form the opening bid for anItem"
	| listItem item opening |
	
	listItem _ model assetAuctionList at: anItem.
	item _ (listItem findTokens: '()' keep: ($A to:$Z), ($a to: $z)) first.
	asset _ model currentPlayer assets at: item asSymbol ifAbsent: [^ 'No such asset named ', item].
	opening _ asset class price // 2.
	self currentBid: opening.
	currentBidder _ model class bankName.
	chant _ OrderedCollection new.
	chant addFirst: (String streamContents: [:string |
		string
			nextPutAll: 'The opening bid for ';
			nextPutAll: item;
			nextPutAll: ' by ';
			nextPutAll: model class bankName;
			nextPutAll: ' will be for ';
			nextPut: $$;
			nextPutAll: opening printStringWithCommas;
			nextPutAll: ' (half the list price).'; newLine]).
	self showChant! !

!AuctionAsset methodsFor: 'initialization' stamp: 'dhn 6/6/2020 11:22:42'!
buildMorphicWindow
	"Lay out the window for auctioning an asset"
	
	buttonsArea _ (LayoutMorph newRow)
		name: #buttons;
		layoutSpec: (LayoutSpec 
			proportionalWidth: 1.0
			proportionalHeight: 0.15
			offAxisEdgeWeight: #center).
			
	self layoutMorph
		addMorph: buttonsArea;
		addMorph: self setUpMidRow;
		addMorph: (buyers _ self setUpBuyers)! !

!AuctionAsset methodsFor: 'initialization' stamp: 'jmv 6/11/2020 16:29:55'!
setUpMidRow
	"Answer the layout for the middle row of the Asset Auction window"
	| listMorph row leftPane headingArea |
	
	listMorph _ (PluggableListMorph
		model: model
		listGetter: #assetAuctionList
		indexGetter: #assetAuctionItem
		indexSetter: #assetAuctionItem:
		mainView: self
		menuGetter: nil
		keystrokeAction: nil)
			name: #catalog;
			layoutSpec: (LayoutSpec 
				proportionalWidth: 1.0
				proportionalHeight: 0.9
				offAxisEdgeWeight: #center).

	heading _ ((StringMorph contents: 'Assets') 
		emphasis: 1;
		font: (FontFamily defaultFamilyPointSize: 10)).
	headingArea _ (LayoutMorph newRow)
		layoutSpec: (LayoutSpec 
			proportionalWidth: 1.0
			proportionalHeight: 0.1
			offAxisEdgeWeight: #center);
		name: 'heading area';
		axisEdgeWeight: #rowLeft.
	headingArea addMorph: heading.

	
	leftPane _ (LayoutMorph newColumn)
		name: 'left pane';
		addMorph: headingArea;
		addMorph: listMorph.

	textPane _ (TextModelMorph
		withModel: (TextModel withText: '')) 	"note the different model specification"
			askBeforeDiscardingEdits: false;	"discard changes to the text"
			name: 'chant'. 	"give the TextModelMorph a name which will appear in the halos"
	textPane 
		layoutSpec: (LayoutSpec 
			proportionalWidth: 0.6
			proportionalHeight: 1.0
			offAxisEdgeWeight: #center).

	row _ (LayoutMorph newRow)
		layoutSpec: (LayoutSpec 
			proportionalWidth: 1.0
			proportionalHeight: 0.7
			offAxisEdgeWeight: #center).
	row
		name: 'mid row';
		addMorph: leftPane proportionalWidth: 0.4;
		addAdjusterAndMorph: textPane layoutSpec: (LayoutSpec useAll).
		
	^ row
	

! !

!AuctionAsset methodsFor: 'buttons' stamp: 'dhn 3/18/2017 20:18:17'!
buyerButtons
	"Set bidding buttons for the players"
	| col |
	
	col _ OrderedCollection new.
	model players do: [:ea |
		col add: ((BidderButton label: ea identity action: #offer: state: true model: self)
			morphExtent: 70@30;
			color: ea color;
			setBalloonText: 'bidder')].
	buyers addAllMorphs: col reversed! !

!AuctionAsset methodsFor: 'buttons' stamp: 'dhn 6/5/2020 21:29:33'!
startButtons
	"Set the initial buttons for asset auction"
	
	buttonsArea
		removeAllMorphs;
		addMorph: self makeBeginButton;
		addMorph: self makeCancelButton;
		axisEdgeWeight: #center
! !

!AuctionAsset methodsFor: 'termination' stamp: 'dhn 11/11/2016 14:25:19'!
closeBoxHit

	model 
		assetAuctionItem: nil;
		enableAll: {'Auction'}.
	model moveButton enabled
		ifFalse: [begun ifFalse: [model enableAll: {'End Turn'}]].
	super closeBoxHit! !

!AuctionAsset methodsFor: 'termination' stamp: 'dhn 11/11/2016 14:36:12'!
endIt
	
	model 
		assetAuctionItem: nil;
		enableAll: {'Auction'}.
	model moveButton enabled
		ifFalse: [begun ifFalse: [model enableAll: {'End Turn'}]].
	self delete! !

!HistoryView methodsFor: 'initialization' stamp: 'jmv 6/11/2020 16:32:00'!
buildMorphicWindow
	"Lay out the window for the plots"
	| goal ix |
	
	goal _ (LayoutMorph newRow name: #goal)
		axisEdgeWeight: #center;
		color: Color white;
 		addMorph: (MinimalStringMorph contents: '$', model goal printStringWithCommas).
	self layoutMorph
		addMorph: goal layoutSpec: (LayoutSpec proportionalWidth: 1.0 proportionalHeight: 0.15 offAxisEdgeWeight: #rightOrBottom);
		addMorph: (plotter _ PlotGraphMorph new
			layoutSpec: (LayoutSpec proportionalWidth: 1.0 proportionalHeight: 0.9);
			yScaleFactor: model goal;
			domain: (0 to: 11);
			yRange: (0 to: 10);
			setXYFactors).
	legend _ LayoutMorph newColumn name: #legend.
	ix _ 0.
	6 timesRepeat: [
		ix _ ix + 1.
		legend addMorph: ((LayoutMorph newRow name: ix asString)
			addMorph: ((StringMorph contents: '') 
				emphasis: 1;
				font: (FontFamily defaultFamilyPointSize: 10)))].
	plotter addMorph: legend! !

!HistoryView methodsFor: 'termination' stamp: 'dhn 9/28/2016 18:37:58'!
closeBoxHit

	model enableAll: {'History'}.
	super closeBoxHit! !

!HistoryView methodsFor: 'termination' stamp: 'dhn 9/28/2016 18:37:40'!
endIt
	
	model enableAll: {'History'}.
	self delete! !

!HistoryView methodsFor: 'accessing' stamp: 'dhn 10/1/2016 15:14:22'!
legend
	"Answer the value of legend"
	
	^ legend! !

!HistoryView methodsFor: 'accessing' stamp: 'dhn 9/28/2016 20:43:31'!
plotter
	"Answer the value of plotter"
	
	^ plotter! !

!HistoryView methodsFor: 'accessing' stamp: 'dhn 3/18/2017 20:15:20'!
rank: aCollection
	"Display players ranked in the legend"
	| n field |
	
	n _ 0.
	aCollection do: [:ea |
		n _ n + 1.
		field _ (legend submorphs  detect: [:a | a name = n asString] ifNone: [] ) submorphs first.
		field contents: (String streamContents: [:string |
			string 
				nextPutAll: n asString, '. ';
				nextPutAll: ea identity]).
		field color: ea color]
! !

!HistoryView methodsFor: 'accessing' stamp: 'dhn 9/30/2016 18:41:21'!
revisePlot
	"Revise the plot"

	plotter details! !

!HistoryView class methodsFor: 'class initialization' stamp: 'dhn 10/1/2016 18:13:37'!
openOn: aModel title: atitle
	"Answer an instance of this class on aModel with a label of atitle"
	| win |

	win _ self open: aModel label: atitle.
	win removeWindowMenu.
			
	aModel when: #itemChange send: #revisePlot to: win.
	aModel when: #quitGame send: #endIt to: win.
	aModel disableAll: {'History'}.
	
	^ win
! !

!LoanView methodsFor: 'initialization' stamp: 'dhn 6/6/2020 11:24:19'!
buildMorphicWindow
	"Lay out the window for paying down debt"
	| list1 rightPane |
	
	self layoutMorph beRow.
	list1 _ (PluggableListMorph
		model: self
		listGetter: #loanList
		indexGetter: #loanItem
		indexSetter: #loanItem:
		mainView: self
		menuGetter: nil
		keystrokeAction: nil)
			name: #'payment size'.
			
	buttonArea _ (LayoutMorph newRow)
		layoutSpec: (LayoutSpec 
			proportionalWidth: 1.0
			proportionalHeight: 0.15
			offAxisEdgeWeight: #center).
	buttonArea
		name: #buttons;
		axisEdgeWeight: #center.
	model when: #payButton: send: #payButton: to: self with: #state.

	textPane _ (TextModelMorph
		withModel: (TextModel withText: '')) 	"note the different model specification"
			askBeforeDiscardingEdits: false;	"discard changes to the text"
			name: 'item description'. 	"give the TextModelMorph a name which will appear in the halos"
	textPane 
		layoutSpec: (LayoutSpec 
			proportionalWidth: 1.0
			proportionalHeight: 0.85
			offAxisEdgeWeight: #center).

	rightPane _ LayoutMorph newColumn.
	rightPane
		name: 'right pane';
		addMorph: buttonArea;
		addMorph: textPane.
	
	self layoutMorph
		addMorph: list1 proportionalWidth: 0.45;
		addAdjusterAndMorph: rightPane layoutSpec: (LayoutSpec useAll)	
! !

!LoanView methodsFor: 'initialization' stamp: 'dhn 6/5/2020 21:31:23'!
startButtons
	"Set the Loan Payment buttons"
	
	payButton _ GameButtonMorph label: 'Pay' action: #pay state: false model: self.
	payButton 
		morphExtent: 70@20;
		setBalloonText: 'Make the selected payment.'.
		
	cancelButton _ GameButtonMorph label: 'Cancel' action: #endIt state: true model: self.
	cancelButton 
		morphExtent: 70@20;
		setBalloonText: 'Forget about reducing debt.'.

	buttonArea
		removeAllMorphs;
		addMorph: payButton;
		addMorph: cancelButton;
		axisEdgeWeight: #center.
! !

!LoanView methodsFor: 'termination' stamp: 'dhn 9/12/2016 17:01:31'!
closeBoxHit

	model 
		loanItem: nil;
		enableAll: {'Pay Loan'}.
	super closeBoxHit! !

!LoanView methodsFor: 'termination' stamp: 'dhn 9/14/2017 11:48:54'!
endIt
	"Close the receiver"
	
	model enableAll: {'Pay Loan'}.
	self delete! !

!LoanView methodsFor: 'accessing' stamp: 'dhn 9/14/2017 11:48:00'!
details
	"Set the loan report in the textPane"
	
	textPane model actualContents: (self loanReportFor: self loanItem)	"note that the textPane model differs from the model for this view"! !

!LoanView methodsFor: 'accessing' stamp: 'dhn 9/16/2016 14:57:28'!
payButton: aBool
	"Change Pay button state according to aBool"
	
	aBool
		ifTrue: [payButton enableButton]
		ifFalse: [payButton disableButton]! !

!LoanView methodsFor: 'accessing' stamp: 'dhn 9/13/2017 17:14:36'!
player: anObject
	"Set the value of player to anObject"
	
	player _ anObject! !

!LoanView methodsFor: 'operating' stamp: 'dhn 9/14/2017 11:00:58'!
loanItem
	"Answer the value of loanItem"

	loanItem ifNil: [loanItem _ 0]. 	"nil is unacceptable during model initialization"
	^ loanItem! !

!LoanView methodsFor: 'operating' stamp: 'dhn 9/14/2017 11:21:30'!
loanItem: anObject
	"Set the value of loanItem and loanReport"
	| enab |
	
	(loanItem _ anObject) ifNotNil: [
	anObject ~= 0
		ifTrue: [
			loanReport _ self loanReportFor: anObject.
			enab _ true]
		ifFalse: [
			loanReport _ ''.
			enab _ false].
		textPane model actualContents: loanReport.
		self payButton: enab.
		model triggerEvent: #itemChange.
		self changed: #loanItem]! !

!LoanView methodsFor: 'operating' stamp: 'dhn 9/14/2017 11:04:20'!
loanList
	"Answer possible loan payment amounts"
	| list |
	
	list _ OrderedCollection new.
	1 to: 50 do: [:n | 
		list add: (String streamContents: [:str |
			str 
				nextPut: $$;
				nextPutAll: (n * self class paymentIncrement) printStringWithCommas;
				newLine])].
	^ list! !

!LoanView methodsFor: 'operating' stamp: 'dhn 5/3/2019 13:21:35'!
loanReportFor: anInteger
	"Answer the effect on cash and debt of a payment selected by anInteger"
	| pmt enab |

	anInteger > 0
		ifTrue: [
			enab _ true.
			pmt _ anInteger * self class paymentIncrement min: player debt negated.
			^ (String streamContents: [:string |
				string 
					nextPutAll: 'By making this payment, ', player identity, ' would have:';
					newLine; newLine;
					nextPut: $$;
					nextPutAll: (player cash - pmt) asInteger printStringWithCommas , ' in cash and';
					newLine;
					nextPut: $$;
					nextPutAll: (player debt + pmt) negated asInteger printStringWithCommas, ' in debt and';
					newLine;
					nextPutAll: '$' , player playerDebtLimit value negated  printStringWithCommas , ' debt limit.'])]
		ifFalse: [
			enab _ false.
			^ ''].
	self payButton: enab.
	self triggerEvent: #itemChange.
	self changed: #loanItem! !

!LoanView methodsFor: 'operating' stamp: 'dhn 9/14/2017 13:38:30'!
pay
	"Make payment on the loan"
	| index payment |
	
	index _ loanItem.
	self loanItem: 0. 	"avoid multiples via contact bounce"
	payment _ index * self class paymentIncrement min: player debt negated.
	player debt: player debt + payment.
	player cash: player cash - payment.
	model updatePlayer.
	(player playerDebtLimit value <= player debt and: [model moveButton enabled not])
		ifTrue: [model updateHistory].
	self details! !

!LoanView class methodsFor: 'class initialization' stamp: 'dhn 9/14/2017 12:00:59'!
openOn: aModel
	"Answer an instance of this class on aModel"
	| win |

	win _ self open: aModel label: 'Purchases'.
	win removeWindowMenu.
			
	aModel when: #deleteOpenWindows send: #endIt to: win.
	
	^ win
! !

!LoanView class methodsFor: 'database' stamp: 'dhn 9/14/2017 11:12:09'!
paymentIncrement
	"Answer the payment increment for displaying loan payment choices"
	
	^ 1000! !

!OptionsView methodsFor: 'initialization' stamp: 'dhn 6/6/2020 11:24:43'!
buildMorphicWindow
	"Lay out the window for purchases"
	| rightPane |
	
	self layoutMorph beRow.
	list _ (PluggableListMorph
		model: model
		listGetter: #optionsList
		indexGetter: #optionsItem
		indexSetter: #optionsItem:
		mainView: self
		menuGetter: nil
		keystrokeAction: nil)
			name: #catalog.
			
	buttonArea _ (LayoutMorph newRow)
		layoutSpec: (LayoutSpec 
			proportionalWidth: 1.0
			proportionalHeight: 0.15
			offAxisEdgeWeight: #center).
	buttonArea
		name: #buttons;
		axisEdgeWeight: #center.
	model when: #buyButton: send: #buyButton: to: self with: #state.

	textPane _ (TextModelMorph
		withModel: (TextModel withText: '')) 	"note the different model specification"
			askBeforeDiscardingEdits: false;	"discard changes to the text"
			name: 'item description'. 	"give the TextModelMorph a name which will appear in the halos"
	textPane 
		layoutSpec: (LayoutSpec 
			proportionalWidth: 1.0
			proportionalHeight: 0.85
			offAxisEdgeWeight: #center).

	rightPane _ LayoutMorph newColumn.
	rightPane
		name: 'right pane';
		addMorph: buttonArea;
		addMorph: textPane.
	
	self layoutMorph
		addMorph: list proportionalWidth: 0.55;
		addAdjusterAndMorph: rightPane layoutSpec: (LayoutSpec useAll)	
! !

!OptionsView methodsFor: 'initialization' stamp: 'dhn 6/5/2020 21:32:02'!
startButtons
	"Set the buttons for buying assets"
	
	buyButton _ GameButtonMorph label: 'Buy' action: #buy state: false model: self.
	buyButton 
		morphExtent: 70@20;
		setBalloonText: 'Make the purchase.'.
		
	cancelButton _ GameButtonMorph label: 'Cancel' action: #endIt state: true model: self.
	cancelButton 
		morphExtent: 70@20;
		setBalloonText: 'Forget about shopping for now.'.

	buttonArea
		removeAllMorphs;
		addMorph: buyButton;
		addMorph: cancelButton;
		axisEdgeWeight: #center.
! !

!OptionsView methodsFor: 'accessing' stamp: 'dhn 5/6/2019 10:39:05'!
buyButton: aBool
	"Change buy button state according to aBool"
	| chg |
	
	aBool ifNil: [chg _ false] ifNotNil: [chg _ aBool].
	chg
		ifTrue: [buyButton enableButton]
		ifFalse: [buyButton disableButton]! !

!OptionsView methodsFor: 'accessing' stamp: 'dhn 8/26/2016 15:51:55'!
details

	textPane model actualContents: model optionsReport 	"note that the textPane model differs from the model for this view"! !

!OptionsView methodsFor: 'termination' stamp: 'dhn 9/12/2016 17:18:16'!
closeBoxHit

	model 
		optionsItem: nil;
		enableAll: {'Purchase'}.
	super closeBoxHit! !

!OptionsView methodsFor: 'termination' stamp: 'dhn 8/28/2016 14:19:18'!
endIt
	"Close the receiver"
	
	model 
		optionsItem: nil;
		enableAll: {'Purchase'}.
	self delete! !

!OptionsView class methodsFor: 'class initialization' stamp: 'dhn 11/2/2016 20:33:52'!
openOn: aModel
	"Answer an instance of this class on aModel"
	| win |

	win _ self open: aModel.
	win removeWindowMenu.
			
	aModel when: #itemChange send: #details to: win.
	aModel when: #deleteOpenWindows send: #endIt to: win.
	
	^ win
! !

!ListView methodsFor: 'text view 1' stamp: 'dhn 12/10/2013 21:07'!
accept1: string from: aPluggableTextMorph 
	"Sent by a PluggableTextMorph to tell that its string has changed and
	can now be taken by the receiver. 
	This method is sent from method accept of the PluggableTextMorph,
	a method that is frequently used as a menu activity.
	This method copies the changed string into the receiver and it
	answers 'true' to tell the =PluggableTextMorph that the string was
	accepted. "
	text1 := string.
	selectedItem ~= 0
		ifTrue: [(collection at: selectedItem)
				at: 1
				put: string].
	^ true! !

!ListView methodsFor: 'text view 1' stamp: 'dhn 12/10/2013 21:07'!
text1
	"Sent by a PluggableTextMorph to get a string to display."
	^ text1! !

!ListView methodsFor: 'text view 1' stamp: 'dhn 12/22/2013 11:58'!
text1: aString 
	text1 := aString.
! !

!ListView methodsFor: 'initialize-release' stamp: 'dhn 12/10/2013 21:07'!
buttonFor: aMorph target: anObject action: aSelector label: aString 
	^ aMorph target: anObject;
		 label: aString;
		 useRoundedCorners;
		 actionSelector: aSelector! !

!ListView methodsFor: 'initialize-release' stamp: 'dhn 12/10/2013 21:12'!
initialize
	super initialize.
	text1 := ''.
	selectedItem := 0! !

!ListView methodsFor: 'accessing' stamp: 'dhn 12/22/2013 12:21'!
collection
	^ collection! !

!ListView methodsFor: 'accessing' stamp: 'dhn 12/10/2013 21:07'!
collection: anObject
	"Set the value of collection"

	collection := anObject! !

!ListView methodsFor: 'accessing' stamp: 'dhn 12/10/2013 21:07'!
selectedItem
	"Answer the value of selectedItem"

	^ selectedItem! !

!ListView methodsFor: 'accessing' stamp: 'dhn 12/10/2013 21:07'!
selectedItem: anObject
	"Set the value of selectedItem"

	selectedItem := anObject! !

!ListView methodsFor: 'list view' stamp: 'dhn 12/10/2013 21:07'!
currentSelection
  "  Sent by a PluggableListMorph to get the current selection.
    Answer the index of the currently selected item.
    A value of 0 means that no item is currently selected. "
  ^selectedItem   
! !

!ListView methodsFor: 'list view' stamp: 'dhn 12/10/2013 21:07'!
list
   " Sent by a PluggableListMorph to get a list to display.
     Answer a collection of strings, the items that are displayed by the morph."
 ^collection .   
! !

!ListView methodsFor: 'common text menu' stamp: 'dhn 12/10/2013 21:07'!
menu: aMenuMorph 
	"Sent by a PluggableTextMorph to get a menu.
	In this example, all text morphs use the same menu. This is not
	always a feasible solution, but here it is."
	aMenuMorph add: 'accept' action: #accept.
	"#accept is a method of PluggableTextMorph"
	^ aMenuMorph! !

!DieMorph methodsFor: 'drawing' stamp: 'dhn 5/12/2020 15:25:25'!
adjustTo: aMorph
	"Set position based on aMorph"
	| s |
	
	s _ aMorph morphExtent x * 50 / 132.
	self 
		shape: s@s
		at: aMorph referencePosition - (0@2 * aMorph morphHeight)! !

!DieMorph methodsFor: 'drawing' stamp: 'dhn 8/21/2017 09:40:34'!
bottom
	"Answer the displacement which will locate an ellipse near the bottom"
	
	^ self morphExtent y * 0.65
! !

!DieMorph methodsFor: 'drawing' stamp: 'dhn 8/21/2017 09:10:28'!
center
	"Answer the horizontal displacement which will center an ellipse"
	
	^ self morphExtent x * 0.38
! !

!DieMorph methodsFor: 'drawing' stamp: 'dhn 8/21/2017 09:12:02'!
face1
	"Set the die to 1"
	
	self removeAllMorphs.
	self addMorph: (dot copy morphPosition: self center@self center).
	^ 1
! !

!DieMorph methodsFor: 'drawing' stamp: 'dhn 8/21/2017 09:50:31'!
face2
	"Set the die to 2, left"
	
	self removeAllMorphs.
	self addMorph: (dot copy morphPosition: self right@self top).
	self addMorph: (dot copy morphPosition: self left@self bottom).
	^ 2
! !

!DieMorph methodsFor: 'drawing' stamp: 'dhn 8/21/2017 09:50:22'!
face2b
	"Set the die to 2, right"
	
	self removeAllMorphs.
	self addMorph: (dot copy morphPosition: self left@self top).
	self addMorph: (dot copy morphPosition: self right@self bottom).
	^ 2! !

!DieMorph methodsFor: 'drawing' stamp: 'dhn 8/21/2017 09:50:06'!
face3
	"Set the die to 3, left"
	
	self removeAllMorphs.
	self addMorph: (dot copy morphPosition: self right@self top).
	self addMorph: (dot copy morphPosition: self center@self center).
	self addMorph: (dot copy morphPosition: self left@self bottom).
	^ 3! !

!DieMorph methodsFor: 'drawing' stamp: 'dhn 8/21/2017 09:49:48'!
face3b
	"Set the die to 3, right"
	
	self removeAllMorphs.
	self addMorph: (dot copy morphPosition: self left@self top).
	self addMorph: (dot copy morphPosition: self center@self center).
	self addMorph: (dot copy morphPosition: self right@self bottom).
	^ 3
! !

!DieMorph methodsFor: 'drawing' stamp: 'dhn 8/21/2017 09:54:25'!
face4
	"Set the die to 4"
	
	self removeAllMorphs.
	self addMorph: (dot copy morphPosition: self left@self top).
	self addMorph: (dot copy morphPosition: self right@self top).
	self addMorph: (dot copy morphPosition: self left@self bottom).
	self addMorph: (dot copy morphPosition: self right@self bottom).
	^ 4
! !

!DieMorph methodsFor: 'drawing' stamp: 'dhn 8/21/2017 09:53:16'!
face5
	"Set the die to 5"
	
	self removeAllMorphs.
	self addMorph: (dot copy morphPosition: self left@self top).
	self addMorph: (dot copy morphPosition: self right@self top).
	self addMorph: (dot copy morphPosition: self center@self center).
	self addMorph: (dot copy morphPosition: self left@self bottom).
	self addMorph: (dot copy morphPosition: self right@self bottom).
	^ 5
! !

!DieMorph methodsFor: 'drawing' stamp: 'dhn 8/21/2017 10:29:08'!
face6
	"Set the die to 6, horizontal"
	
	self removeAllMorphs.
	self addMorph: (dot copy morphPosition: self left@self top).
	self addMorph: (dot copy morphPosition: self center@self top).
	self addMorph: (dot copy morphPosition: self right@self top).
	self addMorph: (dot copy morphPosition: self left@self bottom).
	self addMorph: (dot copy morphPosition: self center@self bottom).
	self addMorph: (dot copy morphPosition: self right@self bottom).
	^ 6
! !

!DieMorph methodsFor: 'drawing' stamp: 'dhn 8/21/2017 10:31:36'!
face6b
	"Set the die to 6, vertical"
	
	self removeAllMorphs.
	self addMorph: (dot copy morphPosition: self left@self top).
	self addMorph: (dot copy morphPosition: self left@self center).
	self addMorph: (dot copy morphPosition: self left@self bottom).
	self addMorph: (dot copy morphPosition: self right@self top).
	self addMorph: (dot copy morphPosition: self right@self center).
	self addMorph: (dot copy morphPosition: self right@self bottom).
	^ 6
! !

!DieMorph methodsFor: 'drawing' stamp: 'dhn 8/21/2017 09:35:08'!
left
	"Answer the displacement which will locate an ellipse near the left edge"
	
	^ self morphExtent x * 0.10
! !

!DieMorph methodsFor: 'drawing' stamp: 'dhn 8/21/2017 09:42:26'!
right
	"Answer the displacement which will locate an ellipse near the right edge"
	
	^ self morphExtent x * 0.65
! !

!DieMorph methodsFor: 'drawing' stamp: 'dhn 8/21/2017 09:36:06'!
top
	"Answer the displacement which will locate an ellipse near the top"
	
	^ self morphExtent y * 0.10
! !

!DieMorph methodsFor: 'initialization' stamp: 'dhn 5/12/2020 16:13:37'!
initialize

	super initialize.
	results _ OrderedCollection new.
	self 
		borderWidth: 2;
		color: Color lightGreen! !

!DieMorph methodsFor: 'initialization' stamp: 'dhn 5/12/2020 15:28:36'!
shape: aPoint at: aLocation
	"Set the size and position of self"
	
	self morphExtent: aPoint.
	dot _ EllipseMorph new
		color: Color black;
		borderWidth: 0;
		morphExtent: self morphExtent * 0.24.
	self referencePosition: aLocation
! !

!DieMorph methodsFor: 'operation' stamp: 'dhn 5/13/2020 16:11:23'!
roll1: aCollection then: aSymbol
	"Display the succession of faces in aCollection; perform aSymbol with the value of the final face"
	| limit linger t i |
	
	limit _ 1600 + (500 atRandom).
	linger _ limit + 700. 	"to pause before vanishing"
	t _ 0.
	i _ 0.
	self when: #morphicStep evaluate: [ :delta |
		i _ i + 1.
		t _ t + delta.
		t < limit 	"limit on the total time of activity"
			ifTrue: [value _ self perform: (aCollection atWrap: i)]
			ifFalse: [
				t > linger ifTrue: [
					self stopStepping.
					self removeActionsForEvent: #morphicStep.
					owner removeMorph: self.
					model perform: aSymbol with: value.
					]]].
	self startSteppingStepTime: 85. 	"time of each step in the activity"
! !

!DieMorph methodsFor: 'operation' stamp: 'dhn 5/12/2020 17:45:22'!
roll2: aCollection then: aSymbol
	"Display the faces in aCollection on the receiver in succession and store the final value in results. If 2 values have been collected in results, have the model perform aSymbol"
	| limit linger t i x |
	
	limit _ 1600 + (500 atRandom).
	linger _ limit + 700. 	"to pause before vanishing"
	t _ 0.
	i _ 0.
	self when: #morphicStep evaluate: [ :delta |
		i _ i + 1.
		t _ t + delta.
		t < limit 	"limit on the total time of activity"
			ifTrue: [x _ self perform: (aCollection atWrap: i)]
			ifFalse: [
				model testMode ifTrue: [self perform: (self class faces at: (model hardRoll * 2))].
				t > linger ifTrue: [
					self stopStepping.
					model hops add: x.
					model hops size > 1 
						ifTrue: [model perform: aSymbol].
					self removeActionsForEvent: #morphicStep.
					owner removeMorph: self]]].
	self startSteppingStepTime: 85. 	"time of each step in the activity"
! !

!DieMorph methodsFor: 'operation' stamp: 'dhn 9/6/2017 22:10:55'!
show: aCollection
	"Display the succession of faces in aCollection on the die, then hop the token"
	| limit linger t i x |
	
	limit _ 1600 + (500 atRandom).
	linger _ limit + 700. 	"to pause before vanishing"
	t _ 0.
	i _ 0.
	self when: #morphicStep evaluate: [ :delta |
		i _ i + 1.
		t _ t + delta.
		t < limit 	"limit on the total time of activity"
			ifTrue: [x _ self perform: (aCollection atWrap: i)]
			ifFalse: [
				model testMode ifTrue: [self perform: (self class faces at: (model hardRoll * 2))].
				t > linger ifTrue: [
					self stopStepping.
					model hopFor: x.
					self removeActionsForEvent: #morphicStep.
					owner removeMorph: self]]].
	self startSteppingStepTime: 85. 	"time of each step in the activity"
! !

!DieMorph methodsFor: 'operation' stamp: 'dhn 8/21/2017 10:49:21'!
show: aCollection event: aSymbol
	"Display the succession of faces in aCollection; answer the value of the final face"
	| limit linger t i |
	
	limit _ 1600 + (500 atRandom).
	linger _ limit + 700. 	"to pause before vanishing"
	t _ 0.
	i _ 0.
	self when: #morphicStep evaluate: [ :delta |
		i _ i + 1.
		t _ t + delta.
		t < limit 	"limit on the total time of activity"
			ifTrue: [value _ self perform: (aCollection atWrap: i)]
			ifFalse: [
				t > linger ifTrue: [
					self stopStepping.
					self removeActionsForEvent: #morphicStep.
					owner removeMorph: self.
					model remainder: value.
					]]].
	self startSteppingStepTime: 85. 	"time of each step in the activity"
! !

!DieMorph methodsFor: 'operation' stamp: 'dhn 8/21/2017 10:51:07'!
showEffect: aCollection
	"Display the succession of faces in aCollection; answer the value of the final face"
	| limit linger t i |
	
	limit _ 1600 + (500 atRandom).
	linger _ limit + 700. 	"to pause before vanishing"
	t _ 0.
	i _ 0.
	self when: #morphicStep evaluate: [ :delta |
		i _ i + 1.
		t _ t + delta.
		t < limit 	"limit on the total time of activity"
			ifTrue: [value _ self perform: (aCollection atWrap: i)]
			ifFalse: [
				t > linger ifTrue: [
					self stopStepping.
					self removeActionsForEvent: #morphicStep.
					owner removeMorph: self.
					model franchiseEffect: value]]].
	self startSteppingStepTime: 85. 	"time of each step in the activity"
! !

!DieMorph methodsFor: 'operation' stamp: 'dhn 9/20/2017 18:20:21'!
showEffect: aCollection then: aSymbol
	"Display the succession of faces in aCollection; answer the value of the final face"
	| limit linger t i |
	
	limit _ 1600 + (500 atRandom).
	linger _ limit + 700. 	"to pause before vanishing"
	t _ 0.
	i _ 0.
	self when: #morphicStep evaluate: [ :delta |
		i _ i + 1.
		t _ t + delta.
		t < limit 	"limit on the total time of activity"
			ifTrue: [value _ self perform: (aCollection atWrap: i)]
			ifFalse: [
				t > linger ifTrue: [
					self stopStepping.
					self removeActionsForEvent: #morphicStep.
					owner removeMorph: self.
					model franchiseEffect: value.
					model perform: aSymbol]]].
	self startSteppingStepTime: 85. 	"time of each step in the activity"
! !

!DieMorph methodsFor: 'access' stamp: 'dhn 8/21/2017 10:49:57'!
value
	"Answer the value"
	
	^ value! !

!DieMorph class methodsFor: 'reference' stamp: 'dhn 8/21/2017 08:47:44'!
faces
	"Answer the possible faces, in both orientations"
	
	^ #(
		#face1 	#face1
		#face2 	#face2b
		#face3 	#face3b
		#face4 	#face4
		#face5 	#face5
		#face6 	#face6b
		)! !

!DieMorph class methodsFor: 'instance creation' stamp: 'dhn 8/21/2017 11:16:12'!
new: aSize
	"Answer an instance of this class with aSize@aSize extent"
	
	^ self new morphExtent: aSize@aSize! !

!ArrowMorph methodsFor: 'drawing' stamp: 'dhn 11/12/2016 19:13:00'!
drawOn: aCanvas

	aCanvas image: form at: 0@0! !

!ArrowMorph methodsFor: 'accessing' stamp: 'dhn 11/12/2016 19:23:27'!
form
	"Answer the value of form"

	^ form! !

!ArrowMorph methodsFor: 'accessing' stamp: 'dhn 11/12/2016 19:23:27'!
form: anObject
	"Set the value of form"

	form _ anObject! !

!ArrowMorph class methodsFor: 'instance creation' stamp: 'dhn 1/20/2017 11:56:31'!
includeInNewMorphMenu
	"Not to be instantiated from the menu"
	^ false! !

!ArrowMorph class methodsFor: 'instance creation' stamp: 'dhn 5/14/2017 12:52:40'!
leftOn: aWorld
	"Open a right-pointing arrow in aWorld"
	
	^ self new
		form: (BitBltCanvas arrowOfDirection: #left size: 40) as8BitColorForm! !

!ArrowMorph class methodsFor: 'instance creation' stamp: 'dhn 5/14/2017 12:46:15'!
rightOn: aWorld
	"Open a right-pointing arrow in aWorld"

	^ self new
		form: (BitBltCanvas arrowOfDirection: #right size: 40) as8BitColorForm! !

!CellView methodsFor: 'accessing' stamp: 'dhn 1/14/2017 13:17:39'!
marksPane
	"Answer the value of marksPane"

	^ marksPane! !

!CellView methodsFor: 'accessing' stamp: 'dhn 1/14/2017 13:17:39'!
marksPane: anObject
	"Set the value of marksPane"

	marksPane _ anObject! !

!CellView methodsFor: 'accessing' stamp: 'dhn 1/14/2017 13:17:39'!
textPane
	"Answer the value of textPane"

	^ textPane! !

!CellView methodsFor: 'accessing' stamp: 'dhn 1/14/2017 13:17:39'!
textPane: anObject
	"Set the value of textPane"

	textPane _ anObject! !

!CellView class methodsFor: 'instance creation' stamp: 'dhn 1/20/2017 11:57:03'!
includeInNewMorphMenu
	"Not to be instantiated from the menu"
	^ false! !

!PlotGraphMorph methodsFor: 'drawing' stamp: 'dhn 1/18/2017 18:21:02'!
asNormalizedPoints: aCollection
	"Answer an array of points which are mapped on [0, T] in both dimensions, where T is a multiple of 10"
	| yArray xArray result |

	yArray _ yFactor * (self normalize: aCollection asOrderedCollection with: yScaleFactor).
	xArray _ xFactor * (self normalize: (0 to: aCollection size) asArray).
	
	result _ OrderedCollection new.
	1 to: yArray size	do: [ :i | result add: (xArray at: i) @ (yArray at: i) ].
	
	^ result.! !

!PlotGraphMorph methodsFor: 'drawing' stamp: 'dhn 3/18/2017 20:16:23'!
drawOn: aCanvas
	"Draw all the lines, including axes, on the graph"
	| fully lineColor |
	
	fully _ 10 raisedTo: yMax log asInteger.

	aCanvas line: (self toMorphic:0@yMin) to: (self toMorphic: 0 @ yMax) width: 2 color: Color lightGray.
	aCanvas line: (self toMorphic: xMin@0) to: (self toMorphic: xMax@0) width: 2 color: Color lightGray.
	aCanvas line: (self toMorphic: 0@fully) to: (self toMorphic: xMax@fully) width: 2 color: Color lightRed.
	
	owner owner rank: sorted.
	
	sorted do: [:ea |
		lineColor _ ea color.
		ea history size > 1 ifTrue: [
			points _ self asNormalizedPoints: ea history.

			1 to: points size - 1 do: [:n | | p |
				aCanvas 	"continue the graph"
					line: (self toMorphic: (p _ points at: n)) 	"from point"
					to: (self toMorphic: (points at: n + 1)) 	"to point"
					width: 2 color: lineColor]]].! !

!PlotGraphMorph methodsFor: 'drawing' stamp: 'dhn 5/23/2015 11:50'!
normalize: aCollection
	"Answer aCollection divided by its maximum"
	| max |
	max _ aCollection inject: 0 into: [:a :c | (a > c)
		ifTrue: [a]
		ifFalse: [c]].
	^ OrderedCollection new
		addAll: aCollection / (max * 1.0)! !

!PlotGraphMorph methodsFor: 'drawing' stamp: 'dhn 5/26/2015 20:09'!
normalize: aCollection with: aFactor
	"Answer aCollection divided by its maximum and scaled by maximum/aFactor"
	| max |
	max _ aCollection inject: 0 into: [:a :c | (a > c)
		ifTrue: [a]
		ifFalse: [c]].
	^ OrderedCollection new
		addAll: (aCollection / (max * 1.0)) * (max / aFactor)! !

!PlotGraphMorph methodsFor: 'drawing' stamp: 'dhn 9/29/2016 10:58:56'!
plotData
	"Sort then plot for each player"

	sorted _ SortedCollection new
		sortBlock: [:a :c | a history last > c history last].
	sorted addAll: players.
	self redrawNeeded

! !

!PlotGraphMorph methodsFor: 'drawing' stamp: 'dhn 5/12/2016 10:39'!
startTime
	"Answer the value of startTime"
	
	startTime ifNil: [startTime _ Time localMillisecondClock].
	^ startTime! !

!PlotGraphMorph methodsFor: 'accessing' stamp: 'dhn 5/6/2015 09:33'!
color: aColor

	super color: aColor.
! !

!PlotGraphMorph methodsFor: 'accessing' stamp: 'dhn 5/23/2015 16:09'!
data: aCollection

	data _ aCollection
! !

!PlotGraphMorph methodsFor: 'accessing' stamp: 'dhn 9/30/2016 20:57:20'!
details
	"Update the plot"

	self 
		players: owner owner model players;
		plotData! !

!PlotGraphMorph methodsFor: 'accessing' stamp: 'dhn 9/28/2016 20:37:04'!
players
	"Answer the value of players"

	^ players! !

!PlotGraphMorph methodsFor: 'accessing' stamp: 'dhn 9/28/2016 20:37:25'!
players: anObject
	"Set the value of players"

	players _ anObject! !

!PlotGraphMorph methodsFor: 'accessing' stamp: 'dhn 5/11/2016 02:06'!
points
	"Answer the value of points"

	^ points! !

!PlotGraphMorph methodsFor: 'accessing' stamp: 'dhn 5/11/2016 02:06'!
points: anObject
	"Set the value of points"

	points _ anObject! !

!PlotGraphMorph methodsFor: 'accessing' stamp: 'dhn 6/11/2016 12:13'!
resumed: anObject
	"Set the value of resumed"

	resumed _ anObject! !

!PlotGraphMorph methodsFor: 'accessing' stamp: 'dhn 5/11/2016 02:06'!
startTime: anObject
	"Set the value of startTime"

	startTime _ anObject! !

!PlotGraphMorph methodsFor: 'accessing' stamp: 'dhn 5/26/2015 12:25'!
yScaleFactor: aNumber

	yScaleFactor _ aNumber
! !

!PlotGraphMorph methodsFor: 'initialization' stamp: 'dhn 5/12/2016 09:50'!
initialize

	super initialize! !

!PlotGraphMorph methodsFor: 'initialization' stamp: 'dhn 5/11/2016 21:17'!
setXYFactors
	"Set the values of xFactor and yFactor"

	xFactor _ 10 raisedTo: xMax log asInteger.
	yFactor _ 10 raisedTo: yMax log asInteger
! !

!PlotGraphMorph class methodsFor: 'instance creation' stamp: 'dhn 1/20/2017 11:58:36'!
includeInNewMorphMenu
	"Not to be instantiated from the menu"
	^ false! !

!PlotGraphMorph class methodsFor: 'display' stamp: 'dhn 5/11/2016 16:01'!
ticLength
	"Answer the length of tic marks"
	
	^ 0.2! !

!GamePopUp class methodsFor: 'dialogs' stamp: 'dhn 6/8/2019 20:47:57'!
inform: aMessage title: aTitle
	"Display a modal dialog with aTitle containing aMessage"
	"Can be dismissed by clicking anywhere below the title"
	
	self 
		confirm: aTitle
		trueChoice: aMessage
		falseChoice: ''! !

!Asset methodsFor: 'accessing' stamp: 'dhn 9/25/2011 10:37'!
cost
	"Answer the value of cost"

	cost ifNil: [cost := 0].
	^ cost ! !

!Asset methodsFor: 'accessing' stamp: 'dhn 9/18/2011 10:43'!
cost: anObject
	"Set the value of cost"

	cost := anObject! !

!Asset methodsFor: 'accessing' stamp: 'dhn 10/13/2011 12:28'!
count
	"Answer the number of harvests"

	count isNil ifTrue: [count := 0].
	^ count! !

!Asset methodsFor: 'accessing' stamp: 'dhn 10/13/2011 12:28'!
count: anObject
	"Set the value of count"

	count := anObject! !

!Asset methodsFor: 'accessing' stamp: 'dhn 9/23/2014 20:19'!
description: anObject
	"Set the value of description"

	description := anObject! !

!Asset methodsFor: 'accessing' stamp: 'dhn 12/6/2011 11:18'!
factor
	"Answer the value of factor"

	factor isNil ifTrue: [factor := 1].
	^ factor! !

!Asset methodsFor: 'accessing' stamp: 'dhn 12/6/2011 09:24'!
factor: anObject
	"Set the value of factor"

	factor := anObject! !

!Asset methodsFor: 'accessing' stamp: 'dhn 9/25/2011 10:36'!
gross
	"Answer the value of gross"

	gross ifNil: [gross := 0].
	^ gross! !

!Asset methodsFor: 'accessing' stamp: 'dhn 9/18/2011 10:43'!
gross: anObject
	"Set the value of gross"

	gross := anObject! !

!Asset methodsFor: 'accessing' stamp: 'dhn 12/6/2011 14:35'!
missed
	"Answer the count of missed opportunities for this asset"

	missed ifNil: [missed := 0].
	^ missed! !

!Asset methodsFor: 'accessing' stamp: 'dhn 12/6/2011 14:33'!
missed: anObject
	"Set the value of missed"

	missed := anObject! !

!Asset methodsFor: 'accessing' stamp: 'dhn 12/6/2011 18:03'!
owner
	"Answer the value of owner"

	^ owner! !

!Asset methodsFor: 'accessing' stamp: 'dhn 12/6/2011 18:03'!
owner: anObject
	"Set the value of owner"

	owner := anObject! !

!Asset methodsFor: 'accessing' stamp: 'dhn 10/13/2011 12:27'!
quality
	"Answer the sum of each harvest quality."

	quality isNil ifTrue: [quality := 0].
	^ quality! !

!Asset methodsFor: 'accessing' stamp: 'dhn 10/13/2011 12:27'!
quality: anObject
	"Set the value of quality"

	quality := anObject! !

!Asset methodsFor: 'accessing' stamp: 'dhn 9/25/2011 10:36'!
quantity
	"Answer the value of quantity"

	quantity ifNil: [quantity := 0].
	^ quantity! !

!Asset methodsFor: 'accessing' stamp: 'dhn 9/19/2011 11:17'!
quantity: anObject
	"Set the value of quantity"

	quantity := anObject! !

!Asset methodsFor: 'accessing' stamp: 'dhn 9/8/2017 15:19:22'!
singleOwner
	"Answer true if the asset can have only one owner"

	singleOwner isNil ifTrue: [singleOwner _ false].
	^ singleOwner! !

!Asset methodsFor: 'as yet unclassified' stamp: 'dhn 1/18/2014 12:19'!
description
	^ description! !

!Asset methodsFor: 'as yet unclassified' stamp: 'dhn 8/27/2016 14:45:06'!
profit: aGross orLoss: aCost 
	| pnl msg |
	pnl := aGross - aCost.
	pnl >= 0
		ifTrue: [msg := ' profit']
		ifFalse: [msg := ' loss'.
			pnl := pnl negated].
	^ '$' , pnl asInteger printStringWithCommas , msg! !

!Asset methodsFor: 'initialize-release' stamp: 'dhn 9/25/2011 05:20'!
initialize
	super initialize.
! !

!Asset class methodsFor: 'as yet unclassified' stamp: 'dhn 1/20/2014 08:18'!
optionCost
	^ self price * self auctionQuantity! !

!BoardSpace methodsFor: 'initialization' stamp: 'dhn 1/13/2017 18:00:11'!
initialize

	marks _ OrderedCollection new! !

!BoardSpace methodsFor: 'accessing' stamp: 'dhn 1/11/2017 19:04:31'!
label
	"Answer the value of label"

	^ label! !

!BoardSpace methodsFor: 'accessing' stamp: 'dhn 1/11/2017 19:04:31'!
label: anObject
	"Set the value of label"

	label _ anObject! !

!BoardSpace methodsFor: 'accessing' stamp: 'dhn 1/13/2017 18:08:29'!
marks
	"Answer  the value of marks"
	
	^ marks! !

!BoardSpace methodsFor: 'accessing' stamp: 'dhn 1/11/2017 19:04:31'!
marks: anObject
	"Set the value of marks"

	marks _ anObject! !

!BoardSpace methodsFor: 'accessing' stamp: 'dhn 1/11/2017 19:04:31'!
routine
	"Answer the value of routine"

	^ routine! !

!BoardSpace methodsFor: 'accessing' stamp: 'dhn 1/11/2017 19:04:31'!
routine: anObject
	"Set the value of routine"

	routine _ anObject! !

!BoardSpace methodsFor: 'operating' stamp: 'dhn 1/13/2017 17:59:12'!
markAddFor: aPlayer
	"Set the marker for aPlayer in marks"
	
	marks add: aPlayer marker! !

!BoardSpace methodsFor: 'operating' stamp: 'dhn 1/13/2017 17:50:53'!
markRemFor: aPlayer
	"Remove the marker for aPlayer in marks"
	
	marks remove: aPlayer marker ifAbsent: []! !

!Direction methodsFor: 'as yet unclassified' stamp: 'dhn 7/15/2016 21:20'!
testLong
	| ans |
	Transcript clear.
	1
		to: 12
		do: [:from | 1
				to: 12
				do: [:to | 
					ans := Direction
								longest: from
								to: to
								in: 12.
					Transcript newLine; show: from; tab; show: to; tab; show: ans; newLine]]! !

!Direction methodsFor: 'as yet unclassified' stamp: 'dhn 7/15/2016 21:20'!
testShort
	| ans |
	Transcript clear.
	1
		to: 12
		do: [:from | 1
				to: 12
				do: [:to | 
					ans := Direction
								shortest: from
								to: to
								in: 12.
					Transcript newLine; show: from; tab; show: to; tab; show: ans; newLine]]! !

!Direction class methodsFor: 'as yet unclassified' stamp: 'dhn 8/8/2013 09:53'!
longest: a to: b in: n 
	^ (Direction shortest: a to: b in: n) negated! !

!Direction class methodsFor: 'as yet unclassified' stamp: 'dhn 8/8/2013 09:48'!
shortest: a to: b in: n 
	^ (Float twoPi * (b + n - a / n)) sin sign! !

!GameHistogram methodsFor: 'accessing' stamp: 'dhn 10/7/2014 17:10'!
distribution

	^ distribution! !

!GameHistogram methodsFor: 'accessing' stamp: 'dhn 10/7/2014 17:11'!
distribution: anObject

	distribution := anObject! !

!GameHistogram methodsFor: 'accessing' stamp: 'dhn 11/12/2016 22:08:56'!
incrementAt: anIndex
	"Add 1 to the amount in the distribution at anIndex"
	| x |
	
	x _ distribution atWrap: anIndex.
	distribution atWrap: anIndex put: x + 1! !

!GameHistogram methodsFor: 'accessing' stamp: 'dhn 10/7/2014 17:15'!
maximum
	"Answer the maximum of the distribution"
	^ self distribution inject: 0 into: [:a :c | (a > c)	
		ifTrue: [a]
		ifFalse: [c]].! !

!GameHistogram methodsFor: 'accessing' stamp: 'dhn 10/7/2014 17:17'!
size
	^ self distribution size! !

!GameHistogram class methodsFor: 'instance creation' stamp: 'dhn 10/7/2014 17:11'!
ofSize: size
	| arr |
	arr := Array new: size.
	1 to: size do: [:i | arr at: i put: 0].
	^ self new distribution: arr! !

!Gamer methodsFor: 'accessing' stamp: 'dhn 9/3/2013 21:29'!
assets
	^ assets! !

!Gamer methodsFor: 'accessing' stamp: 'dhn 3/18/2017 12:48:35'!
color
	"Answer the value of color"

	^ color! !

!Gamer methodsFor: 'accessing' stamp: 'dhn 3/18/2017 12:48:10'!
color: anObject
	"Set the value of color"

	color := anObject! !

!Gamer methodsFor: 'accessing' stamp: 'dhn 8/22/2016 13:34:58'!
die
	"Answer the value of die"

	^ die! !

!Gamer methodsFor: 'accessing' stamp: 'dhn 8/22/2016 13:35:45'!
die: anObject
	"set the value of die"

	die _ anObject! !

!Gamer methodsFor: 'accessing' stamp: 'dhn 7/24/2016 12:46'!
identity
	"Answer the value of identity"
	
	identity ifNil: [identity _ ''].
	^ identity! !

!Gamer methodsFor: 'accessing' stamp: 'dhn 7/25/2016 12:12'!
identity: anObject
	"Set the value of identity"

	identity := anObject asString withBlanksCondensed! !

!Gamer methodsFor: 'accessing' stamp: 'dhn 6/27/2013 17:34'!
marker

	^ marker! !

!Gamer methodsFor: 'accessing' stamp: 'dhn 6/27/2013 17:34'!
marker: anObject

	marker := anObject! !

!Gamer methodsFor: 'accessing' stamp: 'dhn 4/25/2012 20:18'!
mgr
	"Answer the value of mgr"

	^ mgr! !

!Gamer methodsFor: 'accessing' stamp: 'dhn 4/25/2012 20:18'!
mgr: anObject
	"Set the value of mgr"

	mgr := anObject! !

!Gamer methodsFor: 'accessing' stamp: 'dhn 8/24/2016 21:27:17'!
oldPosition
	"Answer the value of oldPosition"

	^ oldPosition! !

!Gamer methodsFor: 'accessing' stamp: 'dhn 8/24/2016 21:27:37'!
oldPosition: anObject
	"set the value of oldPosition"

	oldPosition _ anObject! !

!Gamer methodsFor: 'accessing' stamp: 'dhn 4/25/2012 20:57'!
passedGo
	"Answer the value of passedGo"

	passedGo ifNil: [passedGo := false].
	^ passedGo! !

!Gamer methodsFor: 'accessing' stamp: 'dhn 4/25/2012 20:18'!
passedGo: anObject
	"Set the value of passedGo"

	passedGo := anObject! !

!Gamer methodsFor: 'accessing' stamp: 'dhn 4/25/2012 20:58'!
position
	"Answer the value of position"

	position ifNil: [position := 1].
	^ position! !

!Gamer methodsFor: 'accessing' stamp: 'dhn 10/7/2014 12:24'!
position: anObject
	"Set the value of position; record frequency"

	position := anObject.
	self mgr spaceFreq incrementAt: anObject.! !

!Gamer methodsFor: 'accessing' stamp: 'dhn 4/25/2012 20:18'!
roll
	"Answer the value of roll"

	^ roll! !

!Gamer methodsFor: 'accessing' stamp: 'dhn 9/27/2016 21:26:40'!
roll: anObject
	"Set the value of roll"

	roll _ anObject! !

!Gamer methodsFor: 'statistics' stamp: 'dhn 4/25/2012 20:46'!
avoidedDebt
	"Answer the value of avoidedDebt"

	avoidedDebt ifNil: [avoidedDebt := 0].
	^ avoidedDebt! !

!Gamer methodsFor: 'statistics' stamp: 'dhn 4/25/2012 20:18'!
avoidedDebt: anObject
	"Set the value of avoidedDebt"

	avoidedDebt := anObject! !

!Gamer methodsFor: 'statistics' stamp: 'dhn 4/25/2012 20:18'!
cash
	"Answer the value of cash"

	^ cash! !

!Gamer methodsFor: 'statistics' stamp: 'dhn 4/25/2012 20:18'!
cash: anObject
	"Set the value of cash"

	cash := anObject! !

!Gamer methodsFor: 'statistics' stamp: 'dhn 4/25/2012 20:18'!
debt
	"Answer the value of debt"

	^ debt! !

!Gamer methodsFor: 'statistics' stamp: 'dhn 4/25/2012 20:18'!
debt: anObject
	"Set the value of debt"

	debt := anObject! !

!Gamer methodsFor: 'statistics' stamp: 'dhn 4/25/2012 20:49'!
expenseCount
	"Answer the value of expenseCount"

	expenseCount ifNil: [expenseCount := 0].
	^ expenseCount! !

!Gamer methodsFor: 'statistics' stamp: 'dhn 4/25/2012 20:18'!
expenseCount: anObject
	"Set the value of expenseCount"

	expenseCount := anObject! !

!Gamer methodsFor: 'statistics' stamp: 'dhn 4/25/2012 20:18'!
history
	"Answer the value of history"

	^ history! !

!Gamer methodsFor: 'statistics' stamp: 'dhn 4/25/2012 20:18'!
history: anObject
	"Set the value of history"

	history := anObject! !

!Gamer methodsFor: 'statistics' stamp: 'dhn 4/25/2012 20:51'!
inFlow
	"Answer the value of inFlow"
	inFlow ifNil: [inFlow := 0].
	^ inFlow! !

!Gamer methodsFor: 'statistics' stamp: 'dhn 4/25/2012 20:18'!
inFlow: anObject
	"Set the value of inFlow"

	inFlow := anObject! !

!Gamer methodsFor: 'statistics' stamp: 'dhn 4/25/2012 20:52'!
interestPd
	"Answer the value of interestPd"
	interestPd ifNil: [interestPd := 0].
	^ interestPd! !

!Gamer methodsFor: 'statistics' stamp: 'dhn 4/25/2012 20:18'!
interestPd: anObject
	"Set the value of interestPd"

	interestPd := anObject! !

!Gamer methodsFor: 'statistics' stamp: 'dhn 9/30/2016 22:18:02'!
netAssets
	"Answer the value of the receiver's net assets"
	| sum |
	
	sum _ cash + debt.
	assets do: [:a | sum _ sum + a assetValue].
	^ sum! !

!Gamer methodsFor: 'statistics' stamp: 'dhn 4/25/2012 20:54'!
outFlow
	"Answer the value of outFlow"
	outFlow ifNil: [outFlow := 0].
	^ outFlow! !

!Gamer methodsFor: 'statistics' stamp: 'dhn 4/25/2012 20:18'!
outFlow: anObject
	"Set the value of outFlow"

	outFlow := anObject! !

!Gamer methodsFor: 'statistics' stamp: 'dhn 4/25/2012 20:55'!
paidInterest
	"Answer the value of paidInterest"

	paidInterest ifNil: [paidInterest := 0].
	^ paidInterest! !

!Gamer methodsFor: 'statistics' stamp: 'dhn 4/25/2012 20:18'!
paidInterest: anObject
	"Set the value of paidInterest"

	paidInterest := anObject! !

!Gamer methodsFor: 'statistics' stamp: 'dhn 8/27/2016 17:42:17'!
rollStats: aRoll
	"Collect statistics concerning the value of the die"
	
	self totalRoll: aRoll + self totalRoll. 
	self turns: 1 + self turns. 
	self mgr triggerEvent: #itemChange! !

!Gamer methodsFor: 'statistics' stamp: 'dhn 9/7/2018 15:37:32'!
tally: anAmount
	"Answer anAmount after accounting for it"
	
	self cash: anAmount + self cash.
	anAmount > 0 
		ifTrue: [self inFlow: anAmount + self inFlow]
		ifFalse: [self outFlow: anAmount + self outFlow].
	0 > self cash 
		ifTrue: [
		self mgr updatePlayer.
		self tally: self emergencyLoan].
	history addLast: history last  + anAmount.
	^ anAmount
! !

!Gamer methodsFor: 'statistics' stamp: 'dhn 4/25/2012 21:00'!
totalRoll
	"Answer the value of totalRoll"


	totalRoll ifNil: [totalRoll := 0].
	^ totalRoll! !

!Gamer methodsFor: 'statistics' stamp: 'dhn 4/25/2012 20:18'!
totalRoll: anObject
	"Set the value of totalRoll"

	totalRoll := anObject! !

!Gamer methodsFor: 'statistics' stamp: 'dhn 4/25/2012 21:01'!
turns
	"Answer the value of turns"

	turns ifNil: [turns := 0].
	^ turns! !

!Gamer methodsFor: 'statistics' stamp: 'dhn 4/25/2012 20:18'!
turns: anObject
	"Set the value of turns"

	turns := anObject! !

!Gamer methodsFor: 'statistics' stamp: 'dhn 4/25/2012 21:01'!
years
	"Answer the value of years"

	years ifNil: [years := 0].
	^ years! !

!Gamer methodsFor: 'statistics' stamp: 'dhn 4/25/2012 20:18'!
years: anObject
	"Set the value of years"

	years := anObject! !

!Gamer methodsFor: 'movement' stamp: 'dhn 4/26/2012 17:43'!
forwardTo: anIndex around: aLimit
	"Answer an index value which starts back at 1 when a limit is reached."
	anIndex > aLimit 
		ifFalse: [^anIndex]
		ifTrue:[ "Use recursion to limit gross excesses."
			self passedGo: true.
			self years: 1 + self years.
			^self forwardTo: anIndex - aLimit around: aLimit
			].! !

!Gamer methodsFor: 'operating' stamp: 'dhn 9/15/2017 18:55:12'!
outOfAssets
	"Answer whether the receiver is out of assets"
	
	^ assets allSatisfy: [:a | a quantity <= 0]! !

!Season methodsFor: 'accessing' stamp: 'dhn 1/22/2014 13:41'!
assetName

	^ assetName! !

!Season methodsFor: 'accessing' stamp: 'dhn 1/22/2014 13:41'!
assetName: anObject

	assetName := anObject! !

!Season methodsFor: 'accessing' stamp: 'dhn 2/13/2012 11:42'!
color
	"Answer the value of color"

	^ color! !

!Season methodsFor: 'accessing' stamp: 'dhn 2/13/2012 11:42'!
color: anObject
	"Set the value of color"

	color := anObject! !

!Season methodsFor: 'accessing' stamp: 'dhn 2/13/2012 11:45'!
desc
	"Answer the value of desc"

	^ desc! !

!Season methodsFor: 'accessing' stamp: 'dhn 2/13/2012 11:45'!
desc: anObject
	"Set the value of desc"

	desc := anObject! !

!Season methodsFor: 'accessing' stamp: 'dhn 2/13/2012 11:46'!
range
	"Answer the value of range"

	^ range! !

!Season methodsFor: 'accessing' stamp: 'dhn 4/14/2012 15:08'!
range: aPoint
	"Set the value of range as from@to"

	range := aPoint! !

!Season methodsFor: 'accessing' stamp: 'dhn 4/14/2012 15:07'!
textColor
	"Answer whether the color of the text is white (true) or black"

	textColor ifNil: [textColor := false].
	^ textColor! !

!Season methodsFor: 'accessing' stamp: 'dhn 4/14/2012 15:06'!
textColor: aBool
	"Set the value of textColor"

	textColor := aBool! !

!Season methodsFor: 'initialize-release' stamp: 'dhn 2/24/2012 21:51'!
initialize
	super initialize! !

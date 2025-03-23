'From Cuis 5.0 [latest update: #4208] on 14 June 2020 at 5:48:03 pm'!
'Description Simulation of the Construction board game, a Euro-style game for 2 to 6 players, which is similar to Monopoly.'!
!provides: 'Construction' 1 234!
!requires: 'Game' 1 24 nil!
SystemOrganization addCategory: #'Construction-Model'!
SystemOrganization addCategory: #'Construction-Graphics'!


!classDefinition: #Contract category: #'Construction-Model'!
Game subclass: #Contract
	instanceVariableNames: 'availableOptions exercisedOptions listOfOptions fates drawnFates paymentList leases statsItem optionsItem optionsReport loanItem loanReport assetAuctionItem auctionList jobAuctionItem windowCount moveButton latestPlayer invoice forfeitJob cutIncome expenseFactor demo spaceEffect contingency'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Construction-Model'!
!classDefinition: 'Contract class' category: #'Construction-Model'!
Contract class
	instanceVariableNames: ''!

!classDefinition: #ContractToken category: #'Construction-Graphics'!
Token subclass: #ContractToken
	instanceVariableNames: 'doubled'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Construction-Graphics'!
!classDefinition: 'ContractToken class' category: #'Construction-Graphics'!
ContractToken class
	instanceVariableNames: ''!

!classDefinition: #Construction category: #'Construction-Graphics'!
GameBoard subclass: #Construction
	instanceVariableNames: 'seasonsArea numbersArea othersArea'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Construction-Graphics'!
!classDefinition: 'Construction class' category: #'Construction-Graphics'!
Construction class
	instanceVariableNames: ''!

!classDefinition: #AuctionMachinery category: #'Construction-Graphics'!
AuctionAsset subclass: #AuctionMachinery
	instanceVariableNames: 'acknowledged'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Construction-Graphics'!
!classDefinition: 'AuctionMachinery class' category: #'Construction-Graphics'!
AuctionMachinery class
	instanceVariableNames: ''!

!classDefinition: #AuctionJob category: #'Construction-Graphics'!
AuctionView subclass: #AuctionJob
	instanceVariableNames: 'currentBump'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Construction-Graphics'!
!classDefinition: 'AuctionJob class' category: #'Construction-Graphics'!
AuctionJob class
	instanceVariableNames: ''!

!classDefinition: #DebtView category: #'Construction-Graphics'!
LoanView subclass: #DebtView
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Construction-Graphics'!
!classDefinition: 'DebtView class' category: #'Construction-Graphics'!
DebtView class
	instanceVariableNames: ''!

!classDefinition: #BuyMachinery category: #'Construction-Graphics'!
OptionsView subclass: #BuyMachinery
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Construction-Graphics'!
!classDefinition: 'BuyMachinery class' category: #'Construction-Graphics'!
BuyMachinery class
	instanceVariableNames: ''!

!classDefinition: #JobView category: #'Construction-Graphics'!
GameView subclass: #JobView
	instanceVariableNames: 'items index'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Construction-Graphics'!
!classDefinition: 'JobView class' category: #'Construction-Graphics'!
JobView class
	instanceVariableNames: ''!

!classDefinition: #StatsView category: #'Construction-Graphics'!
GameView subclass: #StatsView
	instanceVariableNames: 'textPane'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Construction-Graphics'!
!classDefinition: 'StatsView class' category: #'Construction-Graphics'!
StatsView class
	instanceVariableNames: ''!

!classDefinition: #ConAsset category: #'Construction-Model'!
Asset subclass: #ConAsset
	instanceVariableNames: 'costAvoided holder expense'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Construction-Model'!
!classDefinition: 'ConAsset class' category: #'Construction-Model'!
ConAsset class
	instanceVariableNames: ''!

!classDefinition: #Contingencies category: #'Construction-Model'!
ConAsset subclass: #Contingencies
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Construction-Model'!
!classDefinition: 'Contingencies class' category: #'Construction-Model'!
Contingencies class
	instanceVariableNames: ''!

!classDefinition: #Franchise category: #'Construction-Model'!
ConAsset subclass: #Franchise
	instanceVariableNames: 'desc location'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Construction-Model'!
!classDefinition: 'Franchise class' category: #'Construction-Model'!
Franchise class
	instanceVariableNames: ''!

!classDefinition: #BigPhil category: #'Construction-Model'!
Franchise subclass: #BigPhil
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Construction-Model'!
!classDefinition: 'BigPhil class' category: #'Construction-Model'!
BigPhil class
	instanceVariableNames: ''!

!classDefinition: #LostMiner category: #'Construction-Model'!
Franchise subclass: #LostMiner
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Construction-Model'!
!classDefinition: 'LostMiner class' category: #'Construction-Model'!
LostMiner class
	instanceVariableNames: ''!

!classDefinition: #Stinky category: #'Construction-Model'!
Franchise subclass: #Stinky
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Construction-Model'!
!classDefinition: 'Stinky class' category: #'Construction-Model'!
Stinky class
	instanceVariableNames: ''!

!classDefinition: #Westwood category: #'Construction-Model'!
Franchise subclass: #Westwood
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Construction-Model'!
!classDefinition: 'Westwood class' category: #'Construction-Model'!
Westwood class
	instanceVariableNames: ''!

!classDefinition: #Hints category: #'Construction-Model'!
ConAsset subclass: #Hints
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Construction-Model'!
!classDefinition: 'Hints class' category: #'Construction-Model'!
Hints class
	instanceVariableNames: ''!

!classDefinition: #Iron category: #'Construction-Model'!
ConAsset subclass: #Iron
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Construction-Model'!
!classDefinition: 'Iron class' category: #'Construction-Model'!
Iron class
	instanceVariableNames: ''!

!classDefinition: #Backhoe category: #'Construction-Model'!
Iron subclass: #Backhoe
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Construction-Model'!
!classDefinition: 'Backhoe class' category: #'Construction-Model'!
Backhoe class
	instanceVariableNames: ''!

!classDefinition: #Dozer category: #'Construction-Model'!
Iron subclass: #Dozer
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Construction-Model'!
!classDefinition: 'Dozer class' category: #'Construction-Model'!
Dozer class
	instanceVariableNames: ''!

!classDefinition: #Excavator category: #'Construction-Model'!
Iron subclass: #Excavator
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Construction-Model'!
!classDefinition: 'Excavator class' category: #'Construction-Model'!
Excavator class
	instanceVariableNames: ''!

!classDefinition: #Grader category: #'Construction-Model'!
Iron subclass: #Grader
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Construction-Model'!
!classDefinition: 'Grader class' category: #'Construction-Model'!
Grader class
	instanceVariableNames: ''!

!classDefinition: #Scraper category: #'Construction-Model'!
Iron subclass: #Scraper
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Construction-Model'!
!classDefinition: 'Scraper class' category: #'Construction-Model'!
Scraper class
	instanceVariableNames: ''!

!classDefinition: #Truck category: #'Construction-Model'!
Iron subclass: #Truck
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Construction-Model'!
!classDefinition: 'Truck class' category: #'Construction-Model'!
Truck class
	instanceVariableNames: ''!

!classDefinition: #Others category: #'Construction-Model'!
ConAsset subclass: #Others
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Construction-Model'!
!classDefinition: 'Others class' category: #'Construction-Model'!
Others class
	instanceVariableNames: ''!

!classDefinition: #You category: #'Construction-Model'!
ConAsset subclass: #You
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Construction-Model'!
!classDefinition: 'You class' category: #'Construction-Model'!
You class
	instanceVariableNames: ''!

!classDefinition: #Exclusive category: #'Construction-Model'!
BoardSpace subclass: #Exclusive
	instanceVariableNames: 'brand'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Construction-Model'!
!classDefinition: 'Exclusive class' category: #'Construction-Model'!
Exclusive class
	instanceVariableNames: ''!

!classDefinition: #Job category: #'Construction-Model'!
BoardSpace subclass: #Job
	instanceVariableNames: 'market'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Construction-Model'!
!classDefinition: 'Job class' category: #'Construction-Model'!
Job class
	instanceVariableNames: ''!

!classDefinition: #Market category: #'Construction-Model'!
BoardSpace subclass: #Market
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Construction-Model'!
!classDefinition: 'Market class' category: #'Construction-Model'!
Market class
	instanceVariableNames: ''!

!classDefinition: #SkidPad category: #'Construction-Model'!
BoardSpace subclass: #SkidPad
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Construction-Model'!
!classDefinition: 'SkidPad class' category: #'Construction-Model'!
SkidPad class
	instanceVariableNames: ''!

!classDefinition: #Weather category: #'Construction-Model'!
BoardSpace subclass: #Weather
	instanceVariableNames: 'amount'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Construction-Model'!
!classDefinition: 'Weather class' category: #'Construction-Model'!
Weather class
	instanceVariableNames: ''!

!classDefinition: #YearEnd category: #'Construction-Model'!
BoardSpace subclass: #YearEnd
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Construction-Model'!
!classDefinition: 'YearEnd class' category: #'Construction-Model'!
YearEnd class
	instanceVariableNames: ''!

!classDefinition: #Contractor category: #'Construction-Model'!
Gamer subclass: #Contractor
	instanceVariableNames: 'markets options priceFactor shutDown split drawnOption jobRoll jobCount jobDone rollAdjustment jobMAvg'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Construction-Model'!
!classDefinition: 'Contractor class' category: #'Construction-Model'!
Contractor class
	instanceVariableNames: ''!

!classDefinition: #Contingency category: #'Construction-Model'!
Object subclass: #Contingency
	instanceVariableNames: 'description function argument factor result'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Construction-Model'!
!classDefinition: 'Contingency class' category: #'Construction-Model'!
Contingency class
	instanceVariableNames: ''!

!classDefinition: #Announcement category: #'Construction-Model'!
Contingency subclass: #Announcement
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Construction-Model'!
!classDefinition: 'Announcement class' category: #'Construction-Model'!
Announcement class
	instanceVariableNames: ''!


!Contract commentStamp: 'dhn 8/22/2016 15:31:27' prior: 0!
The model for the board of Construction Game.!

!ContractToken commentStamp: 'dhn 8/22/2016 17:58:41' prior: 0!
The game piece for a contractor - a player in Construction Game.!

!Construction commentStamp: 'dhn 8/25/2018 14:02:59' prior: 0!
Manage the visual effects of the Construction Game. To start the game, do the following:

Construction start.

Reference:

http://farmgame.com/product/the-construction-game/!

!AuctionMachinery commentStamp: '<historical>' prior: 0!
A Construction Game window which makes it possible for players to raise money by auctioning equipment.!

!AuctionJob commentStamp: '<historical>' prior: 0!
A Construction Game window which makes it possible for players to bid on competitive jobs.!

!BuyMachinery commentStamp: '<historical>' prior: 0!
A Construction Game window which makes it possible for contractors to make purchases.!

!JobView commentStamp: '<historical>' prior: 0!
A Construction Game window which shows the job invoice, an itemized list of the expense and income resulting from doing the job.!

!StatsView commentStamp: '<historical>' prior: 0!
A Construction Game window which shows statistics about the player's assets, the player, and others.!

!ConAsset commentStamp: 'dhn 8/22/2016 15:38:32' prior: 0!
An asset in the Construction Game.!

!Contingencies commentStamp: 'dhn 8/22/2016 15:36:37' prior: 0!
A description for a contingency which has been drawn in the Construction Game.!

!Franchise commentStamp: '<historical>' prior: 0!
The abstract class for a franchise. In effect, a franchise is the monopoly of an asset since it can have only one owner.!

!BigPhil commentStamp: 'dhn 8/22/2016 15:52:14' prior: 0!
The monopoly for concrete.!

!LostMiner commentStamp: 'dhn 8/22/2016 15:51:57' prior: 0!
The sand and gravel monopoly.!

!Stinky commentStamp: 'dhn 8/22/2016 15:51:49' prior: 0!
The land fill monopoly.!

!Westwood commentStamp: 'dhn 8/22/2016 15:54:20' prior: 0!
The asphalt paving monopoly.!

!Hints commentStamp: 'dhn 8/13/2017 19:24:04' prior: 0!
Suggestions for playing the Construction game.!

!Iron commentStamp: 'dhn 8/22/2016 15:45:14' prior: 0!
The abstract class for machines, as opposed to franchises.!

!Backhoe commentStamp: 'dhn 8/22/2016 15:41:44' prior: 0!
The backhoe asset.!

!Dozer commentStamp: '<historical>' prior: 0!
The bulldozer asset.!

!Excavator commentStamp: 'dhn 8/22/2016 15:42:50' prior: 0!
The excavator asset.!

!Grader commentStamp: 'dhn 8/22/2016 15:44:06' prior: 0!
The grader asset.!

!Scraper commentStamp: 'dhn 8/22/2016 15:50:58' prior: 0!
The scraper asset.!

!Truck commentStamp: 'dhn 8/22/2016 15:52:50' prior: 0!
The truck asset.!

!Others commentStamp: 'dhn 8/22/2016 15:50:41' prior: 0!
Other players.!

!You commentStamp: 'dhn 8/22/2016 15:55:22' prior: 0!
The current player.!

!Exclusive commentStamp: '<historical>' prior: 0!
Characteristics of a franchise license.!

!Job commentStamp: '<historical>' prior: 0!
Characteristics of a construction job.!

!Market commentStamp: '<historical>' prior: 0!
Doubles income for the market. Records receivables amount.!

!SkidPad commentStamp: '<historical>' prior: 0!
Deal with having pneumonia.!

!Weather commentStamp: '<historical>' prior: 0!
Gain or lose based on the weather.!

!YearEnd commentStamp: '<historical>' prior: 0!
The first board space. Gives gifts at Christmas. Records receivables amount.!

!Contractor commentStamp: 'dhn 4/15/2012 12:50' prior: 0!
A player in the Construction Game.
!

!Contingency commentStamp: '<historical>' prior: 0!
A contingency in Construction Game. Contingencies can be positive or negative for the outcome of a job.!

!Announcement commentStamp: '<historical>' prior: 0!
An Announcement is a class which is detected by name, resulting in the early display of its description in the drawContingency method.!

!Construction class methodsFor: 'instance creation' stamp: 'dhn 1/20/2017 18:58:07'!
initializedInstance

	^ self start! !

!Contractor methodsFor: 'accessing' stamp: 'dhn 4/16/2012 13:48'!
shutDown
	"Answer the value of shutDown"
	shutDown ifNil: [shutDown := false].
	^ shutDown! !

!Contractor methodsFor: 'accessing' stamp: 'dhn 4/16/2012 11:03'!
shutDown: aBoolean
	shutDown := aBoolean.! !

!Contract methodsFor: 'auction' stamp: 'dhn 9/15/2016 18:18:14'!
assetAuctionItem
	"Answer the value of assetAuctionItem"

	assetAuctionItem ifNil: [assetAuctionItem _ 0]. 	"nil is unacceptable during model initialization"
	^ assetAuctionItem! !

!Contract methodsFor: 'auction' stamp: 'dhn 9/19/2016 11:36:38'!
assetAuctionItem: anObject
	"Set the value of assetAuctionItem"
	
	(assetAuctionItem _ anObject) ifNotNil: [
		self triggerEvent: #itemChange.
		self changed: #assetAuctionItem]! !

!Contract methodsFor: 'auction' stamp: 'dhn 9/17/2016 14:15:17'!
assetAuctionList
	"Answer a list for the asset auction window"
	
	^ auctionList! !

!Contract methodsFor: 'auction' stamp: 'dhn 9/17/2016 14:13:42'!
assetsToSell
	"Answer the assets and quantities to be sold"
	| list qty |
	
	list _ OrderedCollection new.
	(self class equipmentList , self class franchiseList) do: [:each |
		qty _ (currentPlayer assets at: each asSymbol) quantity.
		qty > 0
			ifTrue: [list addLast: each, '(', qty asString, ')']].
	^ list! !

!Contract methodsFor: 'auction' stamp: 'dhn 9/17/2016 13:55:14'!
auctionList
	"Answer the value of auctionList"
	
	^ auctionList! !

!Contract methodsFor: 'auction' stamp: 'dhn 9/17/2016 13:56:07'!
auctionList: anObject
	"Set the value of auctionList"
	
	auctionList _ anObject! !

!Contract methodsFor: 'auction' stamp: 'dhn 9/20/2016 15:17:45'!
jobAuctionItem
	"Answer the value of jobAuctionItem"

	jobAuctionItem ifNil: [jobAuctionItem _ 1]. 	"nil is unacceptable during model initialization"
	^ jobAuctionItem! !

!Contract methodsFor: 'auction' stamp: 'dhn 9/19/2016 17:50:21'!
jobAuctionItem: anObject
	"Set the value of jobAuctionItem"
	
	(jobAuctionItem _ anObject) ifNotNil: [
		self triggerEvent: #itemChange.
		self changed: #jobAuctionItem]! !

!Contract methodsFor: 'auction' stamp: 'dhn 9/21/2016 12:43:26'!
jobAuctionList
	"Answer a list for the job auction window"

	^ self class bidIncrement! !

!Contract methodsFor: 'auction' stamp: 'dhn 5/7/2020 20:47:15'!
jobWinner: aName bid: aBid
	"Change current player to aName and move to job, if necessary"
	| space playr |
	
	aName = currentPlayer identity
		ifTrue: [
			playr _ currentPlayer.
			space _ playr position]
		ifFalse: [
			(spaces at: currentPlayer position) markAddFor: currentPlayer.
			token delete.
			space _ currentPlayer position.
			currentPlayer _ (players detect: [:pl | pl identity = aName] ifNone: []).
			playr _ currentPlayer.
			self triggerEvent: #titleChange with: playr.
			self positionBoardTo: playr position.
			(spaces at: playr position) markRemFor: playr.
			token openInWorld: world.
			token morphPosition: tokenPos.
			token tokenId contents: currentPlayer identity.
			token doubled contents: currentPlayer doubledString.
			token color: currentPlayer color.
			token setBalloonText: 'token for ', currentPlayer identity.
			token moveFrom: playr position to: space].
	self updateHistory.
	self enableAll: {'End Turn'}.
	playr canDoJob ifTrue: [self enableAll: {'Do Job'}].
	playr tally: aBid negated.
	self updatePlayer! !

!Contract methodsFor: 'options' stamp: 'dhn 4/15/2012 12:41'!
availableOptions
	"Answer the value of availableOptions"

	^ availableOptions! !

!Contract methodsFor: 'options' stamp: 'dhn 8/26/2016 08:05:52'!
optionsItem
	"Answer the value of optionsItem"

	optionsItem ifNil: [optionsItem _ 0]. 	"nil is unacceptable during model initialization"
	^ optionsItem! !

!Contract methodsFor: 'options' stamp: 'dhn 9/12/2016 11:28:30'!
optionsItem: anObject
	"Set the value of optionsItem and optionsReport"
	| item enab |
	
	(optionsItem _ anObject) ifNotNil: [
	anObject ~= 0
		ifTrue: [item _ self optionsList at: anObject.
			optionsReport _ self reportFor: currentPlayer on: item.
			(Compiler evaluate: 'Franchise subclasses includes: ', item)
				ifTrue: [
					currentPlayer position = (Compiler evaluate: item, ' location')
						ifTrue: [enab _ true]
						ifFalse: [enab _ false]]
				ifFalse: [enab _ true]]
		ifFalse: [
			optionsReport _ ''.
			enab _ false].
		self triggerEvent: #itemChange.
		self triggerEvent: #buyButton: with: enab.
		self changed: #optionsItem]! !

!Contract methodsFor: 'options' stamp: 'dhn 9/12/2016 14:34:48'!
optionsList
	"Answer the shopping list for a player"
	
	^ (OrderedCollection new)
		addAll: self class equipmentList;
		addAll: self class franchiseList;
		yourself! !

!Contract methodsFor: 'options' stamp: 'dhn 8/26/2016 19:39:19'!
optionsReport

	optionsItem > 0
		ifTrue: [^ self optionsReport: (self optionsList at: optionsItem)]
		ifFalse: [^ '']
! !

!Contract methodsFor: 'options' stamp: 'dhn 4/28/2019 14:59:28'!
optionsReport: anAsset
	"Show the status of anAsset for shopping purposes"
	| p |
	
	p _ currentPlayer assets at: anAsset ifAbsent: [^ 'No such asset named ', anAsset].
	p owner: currentPlayer.
	"exerciseButton disableButton."
	^ p reportOptionTo: self! !

!Contract methodsFor: 'options' stamp: 'dhn 9/12/2016 20:25:59'!
pay: down borrow: balance for: aSymbol amount: qty 
	"Purchase a franchise"
	| asset x y |
	
	x := availableOptions at: aSymbol.
	y := Franchise subclasses includes: x class.
	y & x holder notNil
		ifTrue: [
			GamePopUp 
				inform: (String streamContents: [:str |
				str
					nextPutAll: 'Sorry, but the ';
					nextPutAll: x listName;
					nextPutAll: ' franchise is held by ';
					nextPutAll: x holder identity]) 
			title: 'Franchise Taken']
		ifFalse: [y ifTrue: [x holder: currentPlayer].
			currentPlayer debt: balance negated + currentPlayer debt.
			currentPlayer tally: down negated.
			asset := currentPlayer assets at: aSymbol.
			asset quantity: qty + asset quantity.
			asset cost: down + balance + asset cost.
			currentPlayer canDoJob
				ifTrue: [currentPlayer jobDone
					ifFalse: [self enableAll: {'Do Job'}]]].
	self updatePlayer! !

!Contract methodsFor: 'options' stamp: 'dhn 4/28/2019 15:01:37'!
reportFor: aPlayer on: anAsset
	| p |
	p := aPlayer assets at: anAsset ifAbsent: [^ 'No such asset named ', anAsset].
	p owner: aPlayer.
	"exerciseButton disableButton."
	^ p reportOptionTo: self! !

!Contract methodsFor: 'options' stamp: 'dhn 10/2/2016 16:02:09'!
reviewOption
	"Complete a purchase"
	| option key cost down balance |
	
	self triggerEvent: #deleteOpenWindows.
	key _ (listOfOptions list at: listOfOptions selectedItem) asSymbol.
	option _ Construction optionsDesc at: key.
	cost _ option class price * currentPlayer priceFactor.
	down _ 0.2 * cost.
	balance _ cost - down.
	self
		pay: down
		borrow: balance
		for: option listName asSymbol
		amount: 1! !

!Contract methodsFor: 'options' stamp: 'dhn 9/23/2014 20:20'!
setUpLeases
	leases := Dictionary new.
	leases at: #Stinky put: (Stinky new description: 'STINKY''S Garbage and Landfill').
	leases at: #LostMiner put: (LostMiner new description: 'LOST MINER').
	leases at: #Westwood put: (Westwood new description: 'WESTWOOD Asphalt and Paving').
	leases at: #BigPhil put: (BigPhil new description: 'BIG PHIL''S Concrete Plant').
	^ leases
! !

!Contract methodsFor: 'space-related' stamp: 'dhn 8/9/2017 21:05:06'!
decideCompetitive
	"If one or more players have the equipment, enable Auction"
	| req any |
	
	req _ Contract requiredEquipment
				at: (Contract jobSeason atWrap: currentPlayer position).
	any _ players
				detect: [:a | (a assets at: req) quantity > 0]
				ifNone: [].
	any notNil
		ifTrue: [
			self disableAll: {'Move'. 'End Turn'. 'Do Job'}.
			self triggerEvent: #jobAuctionRequired with: currentPlayer position]
		ifFalse: [
			self disableAll: {'Do Job'}.
			self updateHistory.
			self enableAll: {'End Turn'}]! !

!Contract methodsFor: 'space-related' stamp: 'dhn 4/28/2019 21:29:51'!
franchiseEffect: anObject
	"Show the effect of landing on an owned franchise"
	| fran z amt owner user |
	
	self disableAll: {'Move'}.
	fran _ self class requiredEquipment at: (self class jobSeason at: currentPlayer position).
	amt _ Compiler evaluate: ((fran asString), ' duty').
	z _ amt * anObject.
	user _ currentPlayer.
	owner _ (availableOptions at: fran) holder.
	self triggerEvent: #showJobView: with: 'Franchise Effect'.
	owner = user
		ifTrue: [(String streamContents: [:str |
			str
				nextPutAll: 'First Friendly Bank paid you because you own ';
				nextPutAll: (leases at: fran) description.
			invoice details: str contents amount: (self emphasized: z)]).
			user earned: z for: fran.
			user tally: z]
		ifFalse: [| payee | owner ifNotNil: [
					payee _ owner identity.
					owner earned: z for: fran.
					owner tally: z.
					owner appendHistory.
					(String streamContents: [:str |
						str
							nextPutAll: 'You paid ';
							nextPutAll: payee;
							nextPutAll: ' for your bill from ';
							nextPutAll: (leases at: fran) description.
						invoice details: str contents amount: (self emphasized: z negated)]).
					user paid: z for: fran.
					user tally: z negated]].
	currentPlayer jobDone: true.
	self updatePlayer.
	self updateHistory.
	self enableAll: {'End Turn'}.
	^ z! !

!Contract methodsFor: 'space-related' stamp: 'dhn 8/14/2017 10:49:26'!
fund: aSymbol for: anAmount 
	"Credit the franchise owner aSymbol with anAmount"
	| owner user whom z |
	
	owner _ (self availableOptions at: aSymbol) holder.
	user _ self currentPlayer.
	owner = user
		ifTrue: [user avoided: anAmount for: aSymbol.
			z _ 0]
		ifFalse: [owner isNil
				ifTrue: [whom _ 'First Friendly Bank']
				ifFalse: [whom _ owner identity.
					owner tally: anAmount.
					(owner assets at: aSymbol)
						recordGross: anAmount].
			(user assets at: aSymbol)
				recordCost: anAmount
				for: currentPlayer.
			z _ anAmount negated].
	self updatePlayer.
	self updateHistory.
	self enableAll: {'End Turn'}.
	^ z -> whom! !

!Contract methodsFor: 'space-related' stamp: 'dhn 1/6/2018 14:18:43'!
space1
	"Year End"
	| z |
	
	self disableAll: {'Move'}.
	GamePopUp inform: Contract taleAtChristmas title: 'Christmas for Employees'.
	z _ 1000 negated.
	currentPlayer tally: z.
	self updatePlayer.
	z _ 10000.
	currentPlayer 
		tally: z;
		reset.
	currentPlayer	history addLast: currentPlayer netAssets.
	self updatePlayer.
	self updateHistory.
	self enableAll: {'End Turn'}.
	^ z -> nil! !

!Contract methodsFor: 'space-related' stamp: 'dhn 9/8/2014 13:17'!
space10
	"Mar week 1"
	^ (self
		spacePlain: (self currentPlayer pay: 1000 negated for: #Backhoe)) -> nil! !

!Contract methodsFor: 'space-related' stamp: 'dhn 9/8/2014 15:45'!
space11
	"Mar week 2"
	^ self spaceTruck: 4000! !

!Contract methodsFor: 'space-related' stamp: 'dhn 8/14/2017 10:46:48'!
space12
	"Mar week 3"
	^ self fund: #LostMiner for: 3000
! !

!Contract methodsFor: 'space-related' stamp: 'dhn 9/8/2014 13:19'!
space13
	"Mar week 4"
	^ (self spacePlain: 2000 negated) -> nil! !

!Contract methodsFor: 'space-related' stamp: 'dhn 9/8/2014 15:08'!
space14
	"Apr week 1"
	^ (self
		spacePlain: (self currentPlayer pay: 5000 negated for: #Grader)) -> nil! !

!Contract methodsFor: 'space-related' stamp: 'dhn 9/8/2014 21:09'!
space15
	"Apr week 2"
	^ self fund: #BigPhil for: 15000.
! !

!Contract methodsFor: 'space-related' stamp: 'dhn 9/8/2014 15:13'!
space16
	"Apr week 3"
	^ 0 -> nil! !

!Contract methodsFor: 'space-related' stamp: 'dhn 9/8/2014 15:14'!
space17
	"Apr week 4"
	^ (self spacePlain: 5000 negated) -> nil! !

!Contract methodsFor: 'space-related' stamp: 'dhn 7/17/2013 08:02'!
space18
	"May week 1"
	^ self fund: #Westwood for: 8000.
! !

!Contract methodsFor: 'space-related' stamp: 'dhn 9/8/2014 15:45'!
space19
	"May week 2"
	^ self spaceTruck: 7000! !

!Contract methodsFor: 'space-related' stamp: 'dhn 4/29/2019 13:41:20'!
space2
	"Jan week 1"
	| z |
	
	self disableAll: {'Move'}.
	z _ 0.
	self currentPlayer passedGo
		ifTrue: [z _ self salary].
	self updatePlayer.
	currentPlayer markets at: #RESIDENTIAL put: 2.
	self queryWin: won.
	self triggerEvent: #itemChange.
	^ z -> nil! !

!Contract methodsFor: 'space-related' stamp: 'dhn 7/17/2013 08:03'!
space20
	"May week 3"
	^ self fund: #BigPhil for: 12000.
! !

!Contract methodsFor: 'space-related' stamp: 'dhn 9/8/2014 15:15'!
space21
	"May week 4"
	^ (self
		spacePlain: (self currentPlayer pay: 3000 negated for: #Excavator)) -> nil! !

!Contract methodsFor: 'space-related' stamp: 'dhn 7/17/2013 08:03'!
space22
	"Jun week 1"
	^ self fund: #Westwood for: 10000.
! !

!Contract methodsFor: 'space-related' stamp: 'dhn 9/8/2014 15:16'!
space23
	"Jun week 2"
	^ (self spacePlain: 10000 negated) -> nil! !

!Contract methodsFor: 'space-related' stamp: 'dhn 9/8/2014 15:18'!
space24
	"Jun week 3"
	^ (self spacePlain: 7000 negated) -> nil! !

!Contract methodsFor: 'space-related' stamp: 'dhn 9/8/2014 15:18'!
space25
	"Jun week 4"
	^ (self
		spacePlain: (self currentPlayer pay: 2000 negated for: #Dozer)) -> nil! !

!Contract methodsFor: 'space-related' stamp: 'dhn 9/8/2014 21:10'!
space26
	"Jul week 1"
	^ self fund: #Stinky for: 3000.
! !

!Contract methodsFor: 'space-related' stamp: 'dhn 9/8/2014 15:19'!
space27
	"Jul week 2"
	^ (self
		spacePlain: (self currentPlayer pay: 1000 negated for: #Backhoe)) -> nil! !

!Contract methodsFor: 'space-related' stamp: 'dhn 9/8/2014 15:20'!
space28
	"Jul week 3"
	^ (self spacePlain: 4000 negated) -> nil! !

!Contract methodsFor: 'space-related' stamp: 'dhn 9/8/2014 15:20'!
space29
	"Jul week 4"
	^ (self
		spacePlain: (self currentPlayer pay: 10000 negated for: #Scraper)) -> nil! !

!Contract methodsFor: 'space-related' stamp: 'dhn 4/29/2019 13:41:30'!
space3
	"Jan week 2"
	| z |
	
	self disableAll: {'Move'}.
	z _ 0.
	self currentPlayer passedGo
		ifTrue: [z _ self salary].
	self updatePlayer.
	currentPlayer markets at: #COMMERCIAL put: 2.
	self queryWin: won.
	self triggerEvent: #itemChange.
	^ z -> nil! !

!Contract methodsFor: 'space-related' stamp: 'dhn 7/17/2013 08:04'!
space30
	"Aug week 1"
	^ self fund: #Westwood for: 25000.
! !

!Contract methodsFor: 'space-related' stamp: 'dhn 7/17/2013 08:04'!
space31
	"Aug week 2"
	^ self fund: #BigPhil for: 30000.
! !

!Contract methodsFor: 'space-related' stamp: 'dhn 9/8/2014 15:21'!
space32
	"Aug week 3"
	^ 0 -> nil! !

!Contract methodsFor: 'space-related' stamp: 'dhn 9/8/2014 15:21'!
space33
	"Aug week 4"
	^ (self
		spacePlain: (self currentPlayer pay: 15000 negated for: #Scraper)) -> nil! !

!Contract methodsFor: 'space-related' stamp: 'dhn 9/8/2014 15:46'!
space34
	"Sep week 1"
	^ self spaceTruck: 15000! !

!Contract methodsFor: 'space-related' stamp: 'dhn 9/8/2014 15:22'!
space35
	"Sep week 2"
	^ (self spacePlain: 10000 negated) -> nil! !

!Contract methodsFor: 'space-related' stamp: 'dhn 9/8/2014 15:23'!
space36
	"Sep week 3"
	^ (self spacePlain: 3000 negated) -> nil! !

!Contract methodsFor: 'space-related' stamp: 'dhn 9/8/2014 21:10'!
space37
	"Sep week 4"
	^ self fund: #LostMiner for: 2000.
! !

!Contract methodsFor: 'space-related' stamp: 'dhn 9/8/2014 15:46'!
space38
	"Sep week 5"
	^ self spaceTruck: 10000! !

!Contract methodsFor: 'space-related' stamp: 'dhn 9/8/2014 15:26'!
space39
	"Oct week 1"
	^ 0 -> nil! !

!Contract methodsFor: 'space-related' stamp: 'dhn 4/29/2019 13:41:51'!
space4
	"Jan week 3"
	| z |
	
	self disableAll: {'Move'}.
	z _ 0.
	self currentPlayer passedGo
		ifTrue: [z _ self salary].
	self updatePlayer.
	currentPlayer markets at: #INSTITUTIONAL put: 2.
	self queryWin: won.
	self triggerEvent: #itemChange.
	^ z -> nil! !

!Contract methodsFor: 'space-related' stamp: 'dhn 9/8/2014 15:26'!
space40
	"Oct week 2"
	^ (self
		spacePlain: (self currentPlayer pay: 5000 negated for: #Excavator)) -> nil! !

!Contract methodsFor: 'space-related' stamp: 'dhn 7/17/2013 08:05'!
space41
	"Oct week 3"
	^ self fund: #LostMiner for: 5000.
! !

!Contract methodsFor: 'space-related' stamp: 'dhn 7/17/2013 08:05'!
space42
	"Oct week 4"
	^ self fund: #BigPhil for: 7000.
! !

!Contract methodsFor: 'space-related' stamp: 'dhn 7/17/2013 08:05'!
space43
	"Nov week 1"
	^ self fund: #Stinky for: 5000.
! !

!Contract methodsFor: 'space-related' stamp: 'dhn 7/17/2013 08:06'!
space44
	"Nov week 2"
	^ self fund: #BigPhil for: 15000.
! !

!Contract methodsFor: 'space-related' stamp: 'dhn 9/8/2014 15:27'!
space45
	"Nov week 3"
	^ (self
		spacePlain: (self currentPlayer pay: 7000 negated for: #Grader)) -> nil! !

!Contract methodsFor: 'space-related' stamp: 'dhn 9/24/2016 12:00:09'!
space46
	"Nov week 4"
	
	((availableOptions at: #Stinky) holder)
		ifNotNil: [^ self rollForFranchise]! !

!Contract methodsFor: 'space-related' stamp: 'dhn 9/24/2016 11:59:36'!
space47
	"Dec week 1"
	
	((availableOptions at: #LostMiner) holder)
		ifNotNil: [^ self rollForFranchise]! !

!Contract methodsFor: 'space-related' stamp: 'dhn 9/24/2016 11:58:21'!
space48
	"Dec week 2"
	
	((availableOptions at: #Westwood) holder)
		ifNotNil: [^ self rollForFranchise]! !

!Contract methodsFor: 'space-related' stamp: 'dhn 9/24/2016 11:57:21'!
space49
	"Dec week 3"
		
	((availableOptions at: #BigPhil) holder)
		ifNotNil: [^ self rollForFranchise]! !

!Contract methodsFor: 'space-related' stamp: 'dhn 4/29/2019 13:42:01'!
space5
	"Jan week 4"
	| z |
	
	self disableAll: {'Move'}.
	z _ 0.
	self currentPlayer passedGo
		ifTrue: [z _ self salary].
	self updatePlayer.
	currentPlayer markets at: #MUNICIPAL put: 2.
	self queryWin: won.
	self triggerEvent: #itemChange.
	^ z -> nil! !

!Contract methodsFor: 'space-related' stamp: 'dhn 4/29/2019 13:42:11'!
space6
	"Jan week 5"
	| z |
	
	self disableAll: {'Move'}.
	z _ 0.
	self currentPlayer passedGo
		ifTrue: [z _ self salary].
	self updatePlayer.
	currentPlayer markets at: #'HEAVY HIGHWAY' put: 2.
	self queryWin: won.
	self triggerEvent: #itemChange.
	^ z -> nil! !

!Contract methodsFor: 'space-related' stamp: 'dhn 9/8/2014 15:28'!
space7
	"Feb week 1"
	| x |
	x := self currentPlayer tally: 5000.
	self updatePlayer.
	^ (self spacePlain: x) -> nil! !

!Contract methodsFor: 'space-related' stamp: 'dhn 9/8/2014 15:29'!
space8
	"Feb week 2"
	| x |
	x := self currentPlayer tally: 5000 negated.
	self updatePlayer.
	^ (self spacePlain: x) -> nil! !

!Contract methodsFor: 'space-related' stamp: 'dhn 8/12/2017 13:58:29'!
space9
	"Feb week 3"
	
	self disableAll: {'Move'}.
	self removeMarkers.
	
	"slide board so that player appears to advance to 21."
	token sickMove.
	^ 0 -> nil! !

!Contract methodsFor: 'space-related' stamp: 'dhn 10/1/2016 11:16:38'!
spacePlain: anAmount
	"A plain, ordinary, unremarkable space"
	self disableAll: {'Move'}.
	self updateHistory.
	self enableAll: {'End Turn'.}.
	^ anAmount
! !

!Contract methodsFor: 'space-related' stamp: 'dhn 10/1/2016 11:17:32'!
spaceTruck: aRent 
	| z |
	
	z _ 0.
	self disableAll: {'Move'}.
	(self currentPlayer assets at: #Truck) quantity > 0
		ifTrue: [
			self currentPlayer avoided: aRent for: #Truck.
			z _ 0 -> nil]
		ifFalse: [z _ self payRent: aRent for: #Truck].
	self updateHistory.
	self enableAll: {'End Turn'}.
	^ z! !

!Contract methodsFor: 'space-related' stamp: 'dhn 8/14/2017 23:21:54'!
whatSpaceSays
	"Perform the method associated with the space where the player is"

	^ self perform: ((spaces atWrap: self currentPlayer position) routine)! !

!Contract methodsFor: 'space-related' stamp: 'dhn 9/8/2014 13:12'!
whom: aSymbol
	"Answer the owner of aSymbol"
	| owner |
	owner := (self availableOptions at: aSymbol) holder.
	owner ifNotNil: [^ owner identity].
	^ self class bankName
! !

!Contract methodsFor: 'contingency' stamp: 'dhn 4/28/2019 18:03:23'!
adjust: anAssociation
	^ anAssociation! !

!Contract methodsFor: 'contingency' stamp: 'dhn 4/28/2019 20:40:13'!
equipmentDemo: aFactor
	"Set the value of demo"
	
	demo _ aFactor.
	^ 0
! !

!Contract methodsFor: 'contingency' stamp: 'dhn 4/28/2019 22:55:01'!
interest: aRate
	"Charge a player interest at aRate"
	| int |
	
	int _ 0.
	0 > currentPlayer debt
		ifTrue: [int _ aRate * currentPlayer debt negated roundTo: 1.
			currentPlayer paidInterest: 1 + currentPlayer paidInterest.
			currentPlayer interestPd: int + currentPlayer interestPd]
		ifFalse: [currentPlayer avoidedDebt: 1 + currentPlayer avoidedDebt].
	^ int negated! !

!Contract methodsFor: 'contingency' stamp: 'dhn 4/28/2019 15:47:26'!
payBigPhil: anAmount 
	"Pay the owner of BigPhil"
	
	^ currentPlayer identity = (self whom: #BigPhil)
		ifTrue: [0]
		ifFalse: [currentPlayer pay: anAmount forFranchise: #BigPhil]! !

!Contract methodsFor: 'contingency' stamp: 'dhn 4/28/2019 16:01:05'!
payLostMiner: anAmount
	"Pay the owner of LostMiner"
	
	^ currentPlayer identity = (self whom: #LostMiner)
		ifTrue: [0]
		ifFalse: [currentPlayer pay: anAmount forFranchise: #LostMiner]! !

!Contract methodsFor: 'contingency' stamp: 'dhn 4/28/2019 16:03:05'!
payStinky: anAmount 
	"Pay the owner of Stinky"
	
	^ currentPlayer identity = (self whom: #Stinky)
		ifTrue: [0]
		ifFalse: [currentPlayer pay: anAmount forFranchise: #Stinky]! !

!Contract methodsFor: 'contingency' stamp: 'dhn 4/28/2019 16:05:56'!
payWestwood: anAmount
	"Pay the owner of Westwood"
	
	^ currentPlayer identity = (self whom: #Westwood)
		ifTrue: [0]
		ifFalse: [currentPlayer pay: anAmount forFranchise: #Westwood]! !

!Contract methodsFor: 'contingency' stamp: 'dhn 4/28/2019 18:52:35'!
perMachine: anAmount 
	"Answer anAmount per machine"
	| tot |
	
	tot _ 0.
	currentPlayer assets do: [:item | 
		(item class inheritsFrom: Iron)
			ifTrue: [item cost: item cost + anAmount.
				tot _ tot + item quantity]].
	^ tot * anAmount! !

!Contract methodsFor: 'contingency' stamp: 'dhn 4/28/2019 17:58:37'!
perPlayer: anAmount
	"Collect anAmount from each player"
	| tot |
	
	tot _ 0.
	players do: [:each | each identity ~= currentPlayer identity ifTrue: [
		tot _ tot + anAmount.
		each tally: anAmount negated.]]. 
	^ tot! !

!Contract methodsFor: 'contingency' stamp: 'dhn 4/28/2019 17:21:07'!
realTax: aRate 
	"Pay aRate on purchase price of all properties owned."
	| total exp |
	
	total _ 0.
	currentPlayer assets
		do: [:each | 
			exp _ aRate * (each quantity * each class price).
			each cost: each cost + exp.
			total _ total + exp].
	^ total negated! !

!Contract methodsFor: 'contingency' stamp: 'dhn 4/28/2019 17:16:47'!
rentTrucks: anAmount
	"Rent a truck from every player in the game who has one."
	| tot |
	
	tot _ 0.
	(currentPlayer assets at: #Truck) quantity > 0
		ifFalse: [
			self players do: [:pl | 
				pl ~= currentPlayer
					ifTrue: [
						(pl assets at: #Truck) quantity > 0
							ifTrue: [
								pl tally: anAmount.
								tot _ tot - anAmount]]]].
	^ tot! !

!Contract methodsFor: 'contingency' stamp: 'dhn 4/29/2019 09:44:19'!
replaceTires: anAmount 
	"Pay anAmount for tires if you own a truck"
	| tot veh |
	
	tot _ 0.
	veh _ currentPlayer assets at: #Truck.
	veh quantity > 0
		ifTrue: [
			veh cost: veh cost + anAmount negated.
			tot _ anAmount].
	^ tot! !

!Contract methodsFor: 'contingency' stamp: 'dhn 4/29/2019 09:35:25'!
sewerPlug: anAmount
	"Reward player for having an excavator handy"
	
	(currentPlayer assets at: #Excavator) quantity > 0
		ifTrue: [^ anAmount].
	^ 0! !

!Contract methodsFor: 'operating' stamp: 'dhn 4/28/2019 22:30:09'!
closeDown: aBool
	"Shut down the player"
	
	currentPlayer shutDown: true.
	^ 0
! !

!Contract methodsFor: 'operating' stamp: 'dhn 4/28/2019 15:41:47'!
debtInterest
	"Inform player that interest is due"
	| z |

	z _ 0.
	0 > currentPlayer debt
		ifTrue: [GamePopUp inform: 'You owe 10% of all outstanding notes.' title: 'Interest Due'.
			z _ 0.1 * currentPlayer debt.
			currentPlayer paidInterest: 1 + currentPlayer paidInterest.
			currentPlayer interestPd: z + currentPlayer interestPd]
		ifFalse: [currentPlayer avoidedDebt: 1 + currentPlayer avoidedDebt].
	currentPlayer  tally: z.
	self updatePlayer
! !

!Contract methodsFor: 'operating' stamp: 'dhn 4/28/2019 15:23:49'!
debtTax
	"Inform player that income tax is due"
	
	self disableAll: {'Move'}.
	GamePopUp inform: 'You owe $5,000 for Federal income tax.' title: 'Tax Time'.
	currentPlayer tally: 5000 negated.
	self enableAll: {'End Turn'}.
	self updatePlayer
! !

!Contract methodsFor: 'operating' stamp: 'dhn 8/24/2016 10:14:20'!
declareBroke: aString
	"Inform that the player named aString is out of cash"
	
	GamePopUp 
		inform: aString , ' is out of cash and must auction 
assets until cash is no longer negative.'
		title: 'Out of Cash'
! !

!Contract methodsFor: 'operating' stamp: 'dhn 9/28/2016 12:16:52'!
declareOver: aString
	"Inform that the player named aString is over the debt limit"
	
	GamePopUp 
		inform: (String streamContents: [:str |
			str
				nextPutAll: currentPlayer identity;
				nextPutAll: ' must use cash to bring debt to $';
				nextPutAll: currentPlayer playerDebtLimit value negated printStringWithCommas;
				nextPutAll: ' or less.']) 
		title: 'Debt Too High'
! !

!Contract methodsFor: 'operating' stamp: 'dhn 4/28/2019 21:26:38'!
doJob
	"Try to do the job for this space"

	(currentPlayer shutDown or: [forfeitJob])
		ifFalse: [currentPlayer jobDone: true.
			contingency _ (self class ccSpaces includes: currentPlayer position)
				ifTrue: [ self drawContingency] ifFalse: [nil].
			self doSpace].
	self disableAll: {'Do Job'}.
	self updateHistory.
	self enableAll: {'End Turn'}! !

!Contract methodsFor: 'operating' stamp: 'dhn 4/28/2019 21:20:29'!
doSpace
	"Determine if player can do the job"
	
	(self class alwaysDo: currentPlayer position)
		ifTrue: [self spaceEffect: self whatSpaceSays]
		ifFalse: [
			self forfeitJob
				ifFalse:[
					currentPlayer canDoJob
						ifTrue: [self harvest]]]! !

!Contract methodsFor: 'operating' stamp: 'dhn 4/28/2019 21:28:53'!
emphasized: anAmount
	"Answer a bold-faced string morph for anAmount, colored red if negative"
	| amt |
	
	amt _ '$', anAmount abs printStringWithCommas.
	^ anAmount < 0
		ifTrue: [(StringMorph contents: amt font: nil emphasis: 1) color: Color red]
		ifFalse: [StringMorph contents: amt font: nil emphasis: 1]! !

!Contract methodsFor: 'operating' stamp: 'dhn 6/10/2019 09:32:35'!
endTurn
	"End a player's turn"
	
	(spaces atWrap: currentPlayer position) markAddFor: currentPlayer.
"	self addMarkerIDInMarks; removeAllMarkersInCells."
	self enableAll: {'Auction'}.
	currentPlayer cash < 0
		ifTrue: [self disableAll: {'Move'}.
			currentPlayer outOfAssets
				ifTrue: [self removeFromGame]
				ifFalse: [
					self declareBroke: currentPlayer identity]]
		ifFalse: [
			currentPlayer debt < currentPlayer playerDebtLimit value
				ifTrue: [
					self declareOver: currentPlayer identity]
				ifFalse: [currentPlayer netAssets >= self goal
					ifTrue: [won ifFalse: [self declareWinner]].
			currentPlayer priceFactor: 1.
			contingency _ nil.
			currentPlayer jobDone ifFalse: [currentPlayer jobMissed].
			currentPlayer jobDone: false.
			forfeitJob _ false.
			self disableAll: {'Do Job'}.
			self triggerEvent: #deleteOpenWindows.
			windowCount _ 0.
			self nextPlayer.
			self won
				ifTrue: [self wonButtonsState]
				ifFalse: [self enableAll: {'Move'. 'Stats'}.
					self disableAll: {'End Turn'}]]]! !

!Contract methodsFor: 'operating' stamp: 'dhn 10/5/2018 21:07:07'!
goalProgress
	"Answer the percent toward goal of the current player"
	
	^ String streamContents: [ :strm | 
		(self currentPlayer netAssets / self goal * 100) printOn: strm fractionDigits: 1]! !

!Contract methodsFor: 'operating' stamp: 'dhn 5/27/2020 16:43:54'!
hammerDown: aBid for: aProperty by: aBidder
	"Record the sale at auction"
	| winner |
	
	winner _ players detect: [:a | a identity = aBidder] ifNone: [].
	winner tally: aBid negated.
	aProperty expense: aProperty cost + aBid.
	winner assets add: aProperty.
	winner assets reSort.
	aProperty owner: winner.
	self triggerEvent: #itemChange
! !

!Contract methodsFor: 'operating' stamp: 'dhn 10/6/2018 20:33:17'!
numbersReport
	"Answer the string for displaying a player's cash, debt, and property value"
	
	^ String streamContents: [:string |
		string
			nextPutAll: 'Cash: $';
			nextPutAll: currentPlayer cash truncated printStringWithCommas;
			nextPutAll: ' Debt: $';
			nextPutAll: currentPlayer debt negated asInteger printStringWithCommas;
			nextPutAll: ' Property: $';
			nextPutAll: currentPlayer propertyValue printStringWithCommas]! !

!Contract methodsFor: 'operating' stamp: 'dhn 9/25/2016 20:53:33'!
payRent: anAmount for: aSymbol 
	"Pay amount to the first player to the left who has asset named aSymbol."
	| ix |
	
	ix _ self wrapIndex: self playerIndex - 1 around: players size.
	players size - 1
		timesRepeat: [| owner |
			owner _ players at: ix.
			(owner assets at: aSymbol) quantity > 0
				ifTrue: [(currentPlayer assets at: aSymbol)
						recordCost: anAmount
						for: currentPlayer.
					(owner assets at: aSymbol)
						recordGross: anAmount.
					owner tally: anAmount.
					self updatePlayer.
					^ anAmount negated -> owner identity].
			ix _ self wrapIndex: ix - 1 around: players size].
	"At this point, no player owns an asset named aSymbol."
	(currentPlayer assets at: aSymbol)
		recordCost: anAmount
		for: currentPlayer.
	^ anAmount negated -> 'First Friendly Bank'! !

!Contract methodsFor: 'operating' stamp: 'dhn 10/1/2016 11:15:10'!
queryWin: aBool
		aBool ifTrue: [self wonButtonsState]
		ifFalse: [
			self updateHistory.
			self enableAll: {'End Turn'}]! !

!Contract methodsFor: 'operating' stamp: 'dhn 4/29/2019 14:30:43'!
reduced: aFactor
	"Set the value of a player's price factor, e.g. half price"
	"This method is for compatibility with #contingencyDesc"
	
	currentPlayer priceFactor: aFactor.
	^ 0! !

!Contract methodsFor: 'operating' stamp: 'dhn 8/14/2017 11:07:02'!
removeFromGame
	"Remove a player from the game"
	
	GamePopUp 
		inform: currentPlayer identity , ' has exceeded the debt 
limit and is out of the game' 
		title: 'YER OUT!!!!'.
	availableOptions
		do: [:h | h value holder = currentPlayer
				ifTrue: [h value holder: nil]].
	(players includes: currentPlayer)
		ifTrue: [players removeAll: {currentPlayer}.
			playerIndex _ playerIndex - 1.
			self 
				nextPlayer; 
				triggerEvent: #setupToken: with: currentPlayer;
				enableAll: {'Move'}].
	1 = players size
		ifTrue: [
			nil inform: self players first identity , ' has won the game by default.'
				title: 'THE WINNAH!!'.
			self disableAll: {'Pay Loan'. 'Purchases'. 'Do Job'. 'Move'}.
			self won: true]! !

!Contract methodsFor: 'operating' stamp: 'dhn 4/29/2019 13:38:45'!
salary
	"Inform player that salary will be received"
	| z |
	
	GamePopUp 
		inform: 'You have collected outstanding receivables 
in the amount of $10,000.' 
		title: 'Whoopee!!!!'.
	z _ 10000.
	currentPlayer tally: z.
	self updatePlayer.
	currentPlayer reset.
	currentPlayer history addLast: currentPlayer netAssets.
	^ z
! !

!Contract methodsFor: 'operating' stamp: 'dhn 10/1/2016 13:42:49'!
updateHistory
	"Change player's history"
	
	latestPlayer = playerIndex 
		ifTrue: [currentPlayer updateHistory]
		ifFalse: [
			latestPlayer _ playerIndex.
			currentPlayer appendHistory].
	self triggerEvent: #itemChange! !

!Contract methodsFor: 'operating' stamp: 'dhn 4/30/2019 18:01:48'!
updateIron: anAsset with: aRoll 
	"Compute the results of a move"
	| what amt yield total mkt reduced title |

	yield _ 0.
	reduced _ false.
	currentPlayer shutDown
		ifTrue: [GamePopUp inform: 'The IRS has shut you down for the rest of the year.' title: 'Loss of Income']
		ifFalse: [
			what _ currentPlayer assets at: anAsset.
			amt _ what quantity + demo.
			title _ String streamContents: [:cnts |
				cnts 
					nextPutAll: amt asString;
					nextPut: $ ;
					nextPutAll: anAsset.
				amt > 1 ifTrue: [cnts nextPut: $s]].
			self triggerEvent: #showJobView: with: title.
			mkt _ currentPlayer markets
						at: (self class requiredEquipment keyAtValue: anAsset ifAbsent: []).
			yield _ (what class at: aRoll for: amt)
						* mkt * expenseFactor.
			yield >= 0
				ifTrue: [| str |
					contingency isNil
						ifTrue:[total _ yield + spaceEffect key]
						ifFalse:[total _ contingency result + (yield + spaceEffect key) * contingency factor.
							contingency factor < 1 ifTrue: [reduced _ true.]].
					what gross: total + what gross.
					what quality: aRoll + what quality.
					what count: 1 + what count.
					str _ String new writeStream.

					spaceEffect
						ifNotNil: [
							str nextPutAll: 'Job Expense'.
							spaceEffect value
								ifNotNil: [str nextPutAll: ': (paid to ' , spaceEffect value , ')'].
							self invoice details: str contents amount: (self emphasized: spaceEffect key asInteger)].
							
					contingency
						ifNotNil: [
							contingency class ~= Announcement
								ifTrue: [
									str 
										reset;
										nextPutAll: 'Contingency: ' , contingency description.
									self invoice details: str contents amount: (self emphasized: contingency result asInteger)]].

					str 
						reset;
						nextPutAll: 'Equipment Performance @ ' , aRoll asString.
					mkt = 2
						ifTrue: [str nextPutAll: ' (doubled)'].
					self invoice details: str contents amount: (self emphasized: yield asInteger).
						
					str
						reset;
						nextPutAll: '______________'; newLine;
						nextPutAll: ' Net'.
					reduced ifTrue: [str nextPutAll: ' reduced by ', contingency factor printString].
					self invoice details: str contents amount: (self emphasized: total asInteger)]].
	demo _ 0.
	expenseFactor _ 1.
	^ total! !

!Contract methodsFor: 'operating' stamp: 'dhn 9/25/2016 17:51:21'!
updatePlayer
	"Ensure that all the statistics are updated"

	self triggerEvent: #itemChange! !

!Contract methodsFor: 'operating' stamp: 'dhn 10/1/2016 11:19:27'!
wonButtonsState
	"Set buttons to a state appropriate for the game having been won"

	self disableAll: {'Pay Loan'. 'Purchases'. 'Do Job'. 'Move'}.
	self updateHistory.
	self enableAll: {'End Turn'}.
! !

!Contract methodsFor: 'initialize-release' stamp: 'dhn 5/5/2017 15:54:57'!
doSettings
	"Provide a facility for changing settings"
	| ans |
	
	ans _ (PopUpMenu withCaption: 'Settings' chooseFrom: 'Change the goal of the game\Change auctioneer''s beat\Change test mode').
	ans > 0 ifTrue: [self perform: (#(#setGoal #setBeat #setTestMode) at: ans)]! !

!Contract methodsFor: 'initialize-release' stamp: 'dhn 8/27/2016 14:59:08'!
initialButtonState
	"Establish the button state at the start of the game"
	
	self enableAll: {'Purchase'}.
	self disableAll: {'End Turn'. 'Do Job'}! !

!Contract methodsFor: 'initialize-release' stamp: 'dhn 4/29/2019 10:22:25'!
initialize

	super initialize.
	spaces _ self setUpSpaces.
	spaceFreq _ GameHistogram ofSize: spaces size.
	cellCount _ self class cellsForGame.
	won _ false.
	demo _ 0.
	expenseFactor _ 1.
	windowCount _ 0.
	fates _ Construction contingencyDesc shuffled.
	availableOptions _ Construction optionsDesc.
	drawnFates _ OrderedCollection new.
	leases _ self setUpLeases! !

!Contract methodsFor: 'initialize-release' stamp: 'dhn 10/16/2016 14:37:44'!
setTestMode
	"Optionally toggle test mode"
	| trans ans |
	
	trans _ self testMode
		ifTrue: ['true to false']
		ifFalse: ['false to true'].
	ans _ nil confirm: 'Change Test Mode (', trans, ')'.
	ans ifTrue: [
		self testMode: self testMode not.
		self testMode ifTrue: [goal _ self testGoal]]! !

!Contract methodsFor: 'initialize-release' stamp: 'dhn 1/11/2017 20:56:37'!
setUpSpaces
	"Initialize the board spaces"
	| col |
	
	col _ OrderedCollection new.
	1 to: self class describeSpaces size do: [:ix |
		col add: (BoardSpace new
			label: (self class describeSpaces at: ix);
			routine: ('space', ix asString) asSymbol)].
	^ col! !

!Contract methodsFor: 'initialize-release' stamp: 'dhn 8/17/2017 13:18:47'!
setUpToken
	"Answer a token, used throughout the game, for the current player."
	| tok |
	
	tok _ ContractToken newFor: self.
	tok openInWorld: world.
	tok morphExtent: world morphExtent * (0.090@0.080).
	tok morphPosition: tok posAdjust.
	tokenPos _ tok morphPosition.
	tok delete. 	"not needed until next player"
	^ tok
	! !

!Contract methodsFor: 'initialize-release' stamp: 'dhn 8/9/2017 11:41:33'!
setupPlayer: aName color: aColor
	"Establish a player named aName and colored aColor"
	| pl |
	
	self players add: (pl _ Contractor new
		color: aColor;
		marker: (EllipseMorph new
			setBalloonText: 'marker for ', aName;
			color: aColor;
			morphExtent: 18@10);
		mgr: self;
		identity: aName).
	currentPlayer _ pl.
	self availableOptions do: [:opt | pl options addLast: opt]! !

!Contract methodsFor: 'initialize-release' stamp: 'dhn 6/14/2020 17:41:55'!
testGoal
	"Answer the value of TestGoal"
	| g x |
	
	TestMode ifTrue: [
		TestGoal 
			ifNil: [g _ goal asString]
			ifNotNil: [g _ TestGoal asString].
		x _ (StringRequestMorph request: 'Test Goal?' initialAnswer: g).
		x ~= '' 
			ifTrue:  [self testGoal: x asNumber]
			ifFalse: [self testGoal: self goal].
		^ TestGoal]! !

!Contract methodsFor: 'initialize-release' stamp: 'dhn 10/16/2016 14:04:35'!
testGoal: anObject
	"Set the value of TestGoal"
	
	TestGoal _ anObject! !

!Contract methodsFor: 'initialize-release' stamp: 'dhn 10/16/2016 12:41:40'!
testMode
	"Answer the value of testMode"
	
	TestMode ifNil: [TestMode _ false].
	^ TestMode! !

!Contract methodsFor: 'initialize-release' stamp: 'dhn 10/16/2016 12:42:02'!
testMode: aBool
	"Set the value of testMode"
	
	TestMode _ aBool! !

!Contract methodsFor: 'fates' stamp: 'dhn 4/28/2019 17:53:59'!
drawContingency
	"Randomly draw a fate card"
	| con |
	
	con _ self drawCard: fates discard: drawnFates.
	con result: (self perform: con function withArguments: {con argument}).
	self triggerEvent: #itemChange.
	con class = Announcement
		ifTrue: [GamePopUp inform: con description title: 'Contractor Contingency:'].
	^ con! !

!Contract methodsFor: 'harvesting' stamp: 'dhn 4/28/2019 21:20:46'!
harvest
	"Determine how well the job is done"
	
	self spaceEffect: self whatSpaceSays.
	self rollTheDie
! !

!Contract methodsFor: 'harvesting' stamp: 'dhn 4/28/2019 22:02:33'!
remainder: roll
	"Do the rest of the job calculations"
	| machine income |
	
	machine _ Construction ironMap
		at: (Contract jobSeason atWrap: self currentPlayer position).
	currentPlayer jobHistory: roll.
	income _ 0.
	((Smalltalk at: machine) inheritsFrom: Iron)
		ifTrue: [income _ self updateIron: machine with: roll].
	self currentPlayer tally: income.
	self cutIncome: 1.
	self updatePlayer.
	^ income! !

!Contract methodsFor: 'harvesting' stamp: 'dhn 8/16/2017 16:38:56'!
rollForFranchise
	"Show the die rolling"
	| bone |

	bone _ currentPlayer die openInWorld: world.
	bone referencePosition: token referencePosition - (0@2 * token morphHeight).
	bone showEffect: bone class faces shuffled! !

!Contract methodsFor: 'harvesting' stamp: 'dhn 8/16/2017 16:39:51'!
rollTheDie
	"Show the die rolling; answer its final value"
	| bone |

	bone _ currentPlayer die openInWorld: world.
	bone referencePosition: token referencePosition - (0@2 * token morphHeight).
	bone show: bone class faces shuffled event: #jobDone
! !

!Contract methodsFor: 'accessing' stamp: 'dhn 4/28/2019 21:03:28'!
contingency
	"Answer the value of contingency"
	
	contingency ifNil: [contingency _ 0->'none'].
	^ contingency! !

!Contract methodsFor: 'accessing' stamp: 'dhn 4/28/2019 21:04:20'!
contingency: anObject 
	"Set the value of contingency"
	
	contingency _ anObject.
	^ anObject! !

!Contract methodsFor: 'accessing' stamp: 'dhn 4/28/2019 19:27:18'!
cutIncome
	"Answer the cutIncome factor"
	
	cutIncome ifNil: [cutIncome _ 1].
	^ cutIncome! !

!Contract methodsFor: 'accessing' stamp: 'dhn 4/28/2019 19:29:03'!
cutIncome: aFactor 
	"Set the value of cutIncome"
	
	cutIncome _ aFactor.
	^ 0
! !

!Contract methodsFor: 'accessing' stamp: 'dhn 4/28/2019 20:24:55'!
expenseOnly: aNumber
	"Set the value of expenseFactor"

	expenseFactor _ aNumber.
	^ 0
! !

!Contract methodsFor: 'accessing' stamp: 'dhn 4/28/2019 18:08:45'!
forfeitJob
	"Answer the value of forfeitJob"
	
	forfeitJob ifNil: [forfeitJob _ false].
	^ forfeitJob! !

!Contract methodsFor: 'accessing' stamp: 'dhn 4/28/2019 18:12:41'!
forfeitJob: aBool
	"Set the value of forfeitJob"
	
	forfeitJob _ aBool.
	^ 0
! !

!Contract methodsFor: 'accessing' stamp: 'dhn 9/9/2018 13:45:15'!
invoice
	"Answer the value of invoice"
	
	^ invoice! !

!Contract methodsFor: 'accessing' stamp: 'dhn 9/9/2018 13:45:37'!
invoice: anObject
	"Set the value of invoice"
	
	^ invoice _ anObject! !

!Contract methodsFor: 'accessing' stamp: 'dhn 4/15/2012 12:41'!
listOfOptions: anObject
	"Set the value of listOfOptions"

	listOfOptions := anObject! !

!Contract methodsFor: 'accessing' stamp: 'dhn 9/28/2016 15:30:14'!
moveButton
	"Answer the value of moveButton"
	
	^ moveButton! !

!Contract methodsFor: 'accessing' stamp: 'dhn 9/28/2016 15:34:24'!
moveButton: anObject
	"Set the value of moveButton"
	
	^ moveButton _ anObject! !

!Contract methodsFor: 'accessing' stamp: 'dhn 4/15/2012 12:41'!
paymentList
	"Answer the value of paymentList"

	^ paymentList! !

!Contract methodsFor: 'accessing' stamp: 'dhn 4/15/2012 12:41'!
paymentList: anObject
	"Set the value of paymentList"

	paymentList := anObject! !

!Contract methodsFor: 'accessing' stamp: 'dhn 8/15/2017 09:25:11'!
seasonAt: aPosition
	"Answer the season at aPosition"
	| pos |
	
	pos _ (1 to: spaces size) atWrap: aPosition.
	^ self class season detect: [:a | (a range x <= pos) and: [a range y >= pos]]! !

!Contract methodsFor: 'accessing' stamp: 'dhn 4/28/2019 20:58:33'!
spaceEffect: anObject
	"Set the value of spaceEffect"
	
	spaceEffect _ anObject.
! !

!Contract methodsFor: 'accessing' stamp: 'dhn 1/11/2017 15:44:39'!
spaces
	"Answer the value of spaces"
	
	^ spaces! !

!Contract methodsFor: 'accessing' stamp: 'dhn 1/11/2017 15:45:06'!
spaces: anObject
	"Set the value of spaces"
	
	^ spaces _ anObject! !

!Contract methodsFor: 'accessing' stamp: 'dhn 9/22/2016 20:24:17'!
windowPosition: aPoint
	"Answer a staggered position for a window"
	
	windowCount _ windowCount + 1.
	^ aPoint + (windowCount * (20@20))! !

!Contract methodsFor: 'loan' stamp: 'dhn 9/15/2016 15:21:34'!
loanItem
	"Answer the value of loanItem"

	loanItem ifNil: [loanItem _ 0]. 	"nil is unacceptable during model initialization"
	^ loanItem! !

!Contract methodsFor: 'loan' stamp: 'dhn 9/15/2016 15:21:16'!
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
		self triggerEvent: #itemChange.
		self triggerEvent: #payButton: with: enab.
		self changed: #loanItem]! !

!Contract methodsFor: 'loan' stamp: 'dhn 9/15/2016 15:19:28'!
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
	^ list
! !

!Contract methodsFor: 'loan' stamp: 'dhn 10/6/2018 21:45:53'!
loanReportFor: anInteger
	"Answer the effect on cash and debt of a payment selected by anInteger"
	| pmt enab |

	anInteger > 0
		ifTrue: [
			enab _ true.
			pmt _ anInteger * self class paymentIncrement min: currentPlayer debt negated.
			^ (String streamContents: [:string |
				string 
					nextPutAll: 'By making this payment, ', currentPlayer identity, ' would have:';
					newLine; newLine;
					nextPut: $$;
					nextPutAll: (currentPlayer cash - pmt) asInteger printStringWithCommas , ' in cash and';
					newLine;
					nextPut: $$;
					nextPutAll: (currentPlayer debt + pmt) negated asInteger printStringWithCommas, ' in debt and';
					newLine;
					nextPutAll: '$' , currentPlayer playerDebtLimit value negated  printStringWithCommas , ' debt limit.'])]
		ifFalse: [
			enab _ false.
			^ ''].
	self triggerEvent: #itemChange.
	self triggerEvent: #payButton: with: enab.
	self changed: #loanItem! !

!Contract methodsFor: 'statistics' stamp: 'dhn 8/27/2016 12:46:45'!
statsItem
	"Answer the value of statsItem"

	statsItem ifNil: [statsItem _ 0]. 	"nil is unacceptable during model initialization"
	^ statsItem! !

!Contract methodsFor: 'statistics' stamp: 'dhn 8/27/2016 14:59:59'!
statsItem: anObject
	"Set the value of statsItem"
	
	(statsItem _ anObject) ifNotNil: [
		self triggerEvent: #itemChange.
		self changed: #statsItem]! !

!Contract methodsFor: 'statistics' stamp: 'dhn 1/18/2017 17:26:36'!
statsList
	"Answer a list for the status window"
	
	^ self class equipmentList , self class franchiseList , {'Yourself'. 'Players'. 'Contingencies'. 'Hints'}! !

!Contract methodsFor: 'statistics' stamp: 'dhn 8/28/2016 14:15:10'!
statsReport
	"Answer the status report for the asset listed at statsItem"

	statsItem > 0
		ifTrue: [^ self statsReport: (self statsList at: statsItem)]
		ifFalse: [^ '']
! !

!Contract methodsFor: 'statistics' stamp: 'dhn 8/27/2016 15:03:28'!
statsReport: aString
	"Answer the status of an asset named aString, possessed by the current player"
	| p |
	
	p _ currentPlayer assets at: aString ifAbsent: [^ 'No such asset named ', aString].
	^ String streamContents: [:str |
		str
			nextPutAll: p description;
			nextPut: $:; newLine;
			nextPutAll: (p reportAsAssetFor: currentPlayer); newLine]! !

!Contract class methodsFor: 'operation' stamp: 'dhn 9/8/2014 21:31'!
alwaysDo: aPosition
	"Answer true if expenses at aPosition apply."
	^ #(1 2 3 4 5 6 7 8 9 46 47 48 49 ) includes: aPosition! !

!Contract class methodsFor: 'operation' stamp: 'dhn 4/29/2012 19:58'!
ccSpaces
	"Answer the positions where Contractor Contingencies apply."
	^ #(14 20 22 23 29 30 33 34 35 38 40 44 45 )! !

!Contract class methodsFor: 'operation' stamp: 'dhn 10/2/2016 17:05:54'!
defaultGoal
	"Answer the default winning net asset goal"
	
	^ 1500000.
! !

!Contract class methodsFor: 'operation' stamp: 'dhn 2/17/2017 10:57:42'!
describeSpaces
	"Descriptions for the spaces on the board."
	
	^ OrderedCollection new
		add: 'DECEMBER
Week 4

PAY $1,000 for Christmas gifts to hard-working employees.

Receive $10,000 from outstanding receivables as you pass.';

	add: 'JANUARY
Week 1

Boomville approves thousands of new home permits. Double all residential construction gross profits this year.';

	add: 'JANUARY
Week 2

Boomville is selected as the site for a new MegaMall. Double all commercial construction gross profits this year.';

	add: 'JANUARY
Week 3

Boomville''s explosive growth requires new schools. Double all institutional construction gross profits this year.';

add: 'JANUARY
Week 4

Boomville levies a big tax increase to pay for roads and utilities. Double all municipal construction gross profits this year.';

	add: 'JANUARY
Week 5

Boomville approves a new airport. Double all heavy/highway construction gross profits this year.';

	add: 'FEBRUARY
Week 1

Early warm weather allows you to start construction ahead of schedule. Collect $5,000.';

	add: 'FEBRUARY
Week 2


Sudden blast of winter weather shuts down construction. Pay $5,000.';

	add: 'FEBRUARY
Week 3

Bout of pneumonia puts you flat on your back for three months. Move to the 4th week in May';

	add: 'MARCH
Week 1

Extra grading required in new single-family subdivision. Pay fuel bill of $1,000 per backhoe';

	add: 'MARCH
Week 2

Big job requires you to pay $4,000 to rent a truck.';

	add: 'MARCH
Week 3

Gravel is needed for house foundations. Pay LOST MINER $3,000.';

	add: 'MARCH
Week 4

Hire surveyor to lay out tricky steep multi-family site for excavation. Pay $2,000.';

	add: 'APRIL
Week 1

Federal funding of sewer line requires you to pay prevailing wage. Pay labor costs of $5,000 per grader.
Contractor Contingency.';

	add: 'APRIL
Week 2

Street improvements including curbs, sidewalks, and ADA ramps require concrete. Pay BIG PHIL''S CONCRETE $15,000.

Pay Federal Income Taxes $5,000.';

	add: 'APRIL
Week 3

COMPETITIVE BID
(Good Luck)';

	add: 'APRIL
Week 4

Worker accidentally runs over a stack of sewer pipe while excavating a MiniMall. Pay $5,000.';

	add: 'MAY
Week 1

Mall parking lot requires paving. Pay WESTWOOD ASPHALT $8,000.';

	add: 'MAY
Week 2

Huge boulders found during excavation require you to rent a truck for $7,000.';

	add: 'MAY
Week 3

Design of new public library requires retaining walls, sidewalks, curbs, and ramps. Pay BIG PHIL''S CONCRETE $12,000.
Contractor Contingency.';

	add: 'MAY
Week 4

Layer of extra-hard rock hampers excavation of new school foundation. Replace bucket on every excavator you own. Pay $3,000.';

	add: 'JUNE
Week 1

New school requires parking lot. Pay WESTWOOD PAVING $10,000.
Contractor Contingency.';

	add: 'JUNE
Week 2

Pay equipment operators $10,000 to excavate foundations for courthouse.
Contractor Contingency.';

	add: 'JUNE
Week 3

Extra material and labor costs for finish grading on shopping mall parking lot add up. Pay $7,000.';

	add: 'JUNE
Week 4

Dozers need service. Pay $2,000 each for oil, filter, grease and hydraulic hoses.';

	add: 'JULY
Week 1

Windstorm trashes your subdivision site. Pay STINKY''S GARBAGE & LANDFILL $3,000 to pick up the debris.

Pay 10% interest on all outstanding notes.';

	add: 'JULY
Week 2

Digging through hardpan at new housing site requires extra service to all backhoes. Pay $1,000 each.';

	add: 'JULY
Week 3

While installing septic system backhoe punches through tank. Pay $4,000 to fix the mess.';

	add: 'JULY
Week 4

Around-the-clock construction of the new airport wears out self-loading scraper parts. Pay $10,000 per machine to overhaul.
Contractor Contingency.';

	add: 'AUGUST
Week 1

Pay WESTWOOD PAVING $25,000 to asphalt a new section of four-lane highway.
Contractor Contingency.';

	add: 'AUGUST
Week 2

Pay BIG PHIL''S $30,000 for concrete to build an overpass for a new freeway to the airport.';

	add: 'AUGUST
Week 3

COMPETITIVE BID
(Don''t get burned like last time!!!!)';

	add: 'AUGUST
Week 4

Pay equipment operators $15,000 per scraper for labor and overtime racked up building the new reservoir.
Contractor Contingency.';

	add: 'SEPTEMBER
Week 1

Illegal dumping requires you to remove trash. Pay $15,000 to rent a truck.
Contractor Contingency.';

	add: 'SEPTEMBER
Week 2

Pay $10,000 for traffic signals, signage and pavement striping to finish new 4-way intersection.
Contractor Contingency.';

	add: 'SEPTEMBER
Week 3

Install sanitary sewer system for single-family residence. Pay labor and materials costs of $3,000.';

	add: 'SEPTEMBER
Week 4

Purchase crushed rock for pipe building. Pay LOST MINER $2,000.

Pay 10% interest on all outstanding notes';

	add: 'SEPTEMBER
Week 5

Excavation and removal job requires you to pay $10,000 to rent a truck.
Contractor Contingency.';

	add: 'OCTOBER
Week 1

COMPETITIVE BID
(Who needs this job the most??)';

	add: 'OCTOBER
Week 2

Purchase pipe, valves and fittings for potable water system servicing the new Buttercup Elementary School. Pay $5,000 per excavator.
Contractor Contingency.';

	add: 'OCTOBER
Week 3

Unstable soil at new warehouse site requires you to import sand and gravel. Pay LOST MINER $5,000.';

	add: 'OCTOBER
Week 4

Megabucks Shopping Mall refinishes its sidewalks, ramps and gutters. Pay BIG PHIL''S CONCRETE $7,000.';

	add: 'NOVEMBER
Week 1

Haul contaminated material from gas station project. Pay STINKY''S GARBAGE & LANDFILL $5,000.';

	add: 'NOVEMBER
Week 2

Install new fire protection main, hydrants and replace the paving. Pay BIG PHIL''S CONCRETE $15,000.
Contractor Contingency.';

	add: 'NOVEMBER
Week 3

Flaggers and concrete barricades are needed for traffic control during road improvement job. Pay $7,000 per grader.
Contractor Contingency.';

	add: 'NOVEMBER
Week 4

If owned, pay owner for annual disposal usage $4,000 to $24,000. If you own, bank pays you. If unowned, you may purchase the exclusive right to the revenue stream for $100,000.';

	add: 'DECEMBER
Week 1

If owned, pay owner for annual material purchases $6,000 to $36,000. If you own, bank pays you. If unowned, you may purchase the exclusive right to the revenue stream for $200,000.';

	add: 'DECEMBER
Week 2

If owned, pay owner for annual material purchases $10,000 to $60,000. If you own, bank pays you. If unowned, you may purchase the exclusive right to the revenue stream for $300,000.';

	add: 'DECEMBER
Week 3

If owned, pay owner for annual material purchases $15,000 to $90,000. If you own, bank pays you. If unowned, you may purchase the exclusive right to the revenue stream for $500,000.';

	yourself! !

!Contract class methodsFor: 'operation' stamp: 'dhn 9/28/2016 16:54:58'!
franchiseSpaces
	"Answer the positions which are franchises"
	
	^ #(46 47 48 49)! !

!Contract class methodsFor: 'operation' stamp: 'dhn 9/8/2014 20:57'!
interestDue: aPosition 
	"Answer true if interest expenses are due at aPosition."
	^ #(26 37 ) includes: aPosition! !

!Contract class methodsFor: 'operation' stamp: 'dhn 9/23/2016 13:59:13'!
jobSeason
	"Answer a collection of job seasons in order of their board positions."
	
	^ OrderedCollection new
		addAll: #(nil nil nil nil nil nil nil nil nil);
		addAll: #(#RESIDENTIAL #RESIDENTIAL #RESIDENTIAL #RESIDENTIAL);
		addAll: #(#MUNICIPAL #MUNICIPAL #MUNICIPAL);
		addAll: #(#COMMERCIAL #COMMERCIAL #COMMERCIAL);
		addAll: #(#INSTITUTIONAL #INSTITUTIONAL #INSTITUTIONAL #INSTITUTIONAL);
		addAll: #(#COMMERCIAL #COMMERCIAL);
		addAll: #(#RESIDENTIAL #RESIDENTIAL #RESIDENTIAL);
		addAll: #(#'HEAVY HIGHWAY' #'HEAVY HIGHWAY' #'HEAVY HIGHWAY' #'HEAVY HIGHWAY' #'HEAVY HIGHWAY');
		addAll: #(#MUNICIPAL #MUNICIPAL);
		addAll: #(#RESIDENTIAL #RESIDENTIAL);
		addAll: #(#INSTITUTIONAL #INSTITUTIONAL #INSTITUTIONAL);
		addAll: #(#COMMERCIAL #COMMERCIAL #COMMERCIAL);
		addAll: #(#MUNICIPAL #MUNICIPAL);
		add: #STINKY;
		add: #'LOST MINER';
		add: #WESTWOOD;
		add: #'BIG PHIL';
		yourself! !

!Contract class methodsFor: 'operation' stamp: 'dhn 4/29/2012 16:32'!
paymentIncrement
	"Answer the payment increment for displaying loan payment choices"
	^ 10000! !

!Contract class methodsFor: 'operation' stamp: 'dhn 9/24/2016 12:54:58'!
requiredEquipment
	"Associate season with asset class."
	
	^ Dictionary new
		add: #RESIDENTIAL -> #Backhoe;
		add: #COMMERCIAL -> #Dozer;
		add: #INSTITUTIONAL -> #Excavator;
		add: #MUNICIPAL -> #Grader;
		add: #'HEAVY HIGHWAY' -> #Scraper;
		add: #STINKY -> #Stinky;
		add: #'LOST MINER' -> #LostMiner;
		add: #WESTWOOD -> #Westwood;
		add: #'BIG PHIL' -> #BigPhil;
		yourself! !

!Contract class methodsFor: 'operation' stamp: 'dhn 2/27/2020 13:30:19'!
spaceAttributes
	"Attributes of the spaces on the board."
	
	^ OrderedCollection new
		add: YearEnd new;
		add: Market new;
		add: Market new;
		add: Market new;
		add: Market new;
		add: Market new;
		add: (Weather new amount: 5000);
		add: (Weather new amount: -5000);
		add: SkidPad new;
		add: (Job new market: #RESIDENTIAL);
		add: (Job new market: #RESIDENTIAL);
		add: (Job new market: #RESIDENTIAL);
		add: (Job new market: #RESIDENTIAL);
		add: (Job new market: #MUNICIPAL);
		add: (Job new market: #MUNICIPAL);
		add: (Job new market: #MUNICIPAL);
		add: (Job new market: #COMMERCIAL);
		add: (Job new market: #COMMERCIAL);
		add: (Job new market: #COMMERCIAL);
		add: (Job new market: #INSTITUTIONAL);
		add: (Job new market: #INSTITUTIONAL);
		add: (Job new market: #INSTITUTIONAL);
		add: (Job new market: #INSTITUTIONAL);
		add: (Job new market: #COMMERCIAL);
		add: (Job new market: #COMMERCIAL);
		add: (Job new market: #RESIDENTIAL);
		add: (Job new market: #RESIDENTIAL);
		add: (Job new market: #RESIDENTIAL);
		add: (Job new market: #'HEAVY HIGHWAY');
		add: (Job new market: #'HEAVY HIGHWAY');
		add: (Job new market: #'HEAVY HIGHWAY');
		add: (Job new market: #'HEAVY HIGHWAY');
		add: (Job new market: #'HEAVY HIGHWAY');
		add: (Job new market: #MUNICIPAL);
		add: (Job new market: #MUNICIPAL);
		add: (Job new market: #RESIDENTIAL);
		add: (Job new market: #RESIDENTIAL);
		add: (Job new market: #INSTITUTIONAL);
		add: (Job new market: #INSTITUTIONAL);
		add: (Job new market: #INSTITUTIONAL);
		add: (Job new market: #COMMERCIAL);
		add: (Job new market: #COMMERCIAL);
		add: (Job new market: #COMMERCIAL);
		add: (Job new market: #MUNICIPAL);
		add: (Job new market: #MUNICIPAL);
		add: (Exclusive new brand: #STINKY);
		add: (Exclusive new brand: #'LOST MINER');
		add: (Exclusive new brand: #WESTWOOD);
		add: (Exclusive new brand: #'BIG PHIL');
	yourself! !

!Contract class methodsFor: 'operation' stamp: 'dhn 1/6/2018 13:55:09'!
taleAtChristmas
	"Answer the popup text for space 1"

	^ 'You will spend $1,000 for Christmas gifts, 
and you have collected outstanding receivables 
in the amount of $10,000.'! !

!Contract class methodsFor: 'operation' stamp: 'dhn 9/8/2014 20:58'!
taxDue: aPosition 
	"Answer true if income tax is due at aPosition."
	^ aPosition = 15! !

!Contract class methodsFor: 'lists' stamp: 'dhn 2/27/2020 11:30:28'!
assetList
	"Answer a list for the status window"
	
	^ Contract equipmentList , Contract franchiseList , #('Yourself' 'Players' 'Graphs' 'Contingencies')! !

!Contract class methodsFor: 'lists' stamp: 'dhn 2/27/2020 11:28:01'!
equipmentList
	"Answer a list in the order needed for purchases and status"
	^ #('Backhoe' 'Dozer' 'Excavator' 'Grader' 'Scraper' 'Truck')! !

!Contract class methodsFor: 'lists' stamp: 'dhn 2/27/2020 11:29:00'!
franchiseList
	"Answer a list in the order needed for purchases and status"
	^ #('Stinky' 'LostMiner' 'Westwood' 'BigPhil')! !

!Contract class methodsFor: 'lists' stamp: 'dhn 8/15/2017 09:13:04'!
season
	"Answer  Seasons in order of their starting board positions."
	
	^ OrderedCollection new
		add: (Season new desc: 'YEAR END'; color: Color lightBlue; range: 1 @ 1);
		add: (Season new desc: 'Residential'; color: Color yellow; range: 2 @ 2);
		add: (Season new desc: 'Commercial'; color: Color green; range: 3 @ 3);
		add: (Season new desc: 'Institutional'; color: Color red; range: 4 @ 4);
		add: (Season new desc: 'Municipal'; color: Color brown; range: 5 @ 5; textColor: true);
		add: (Season new desc: 'Heavy Highway'; color: Color gray; range: 6 @ 6; textColor: true);
		add: (Season new desc: ''; color: Color white; range: 7 @ 9);
		add: (Season new desc: 'RESIDENTIAL'; color: Color yellow; range: 10 @ 13);
		add: (Season new desc: 'MUNICIPAL'; color: Color brown; range: 14 @ 16; textColor: true);
		add: (Season new desc: 'COMMERCIAL'; color: Color green; range: 17 @ 19);
		add: (Season new desc: 'INSTITUTIONAL'; color: Color red; range: 20 @ 23);
		add: (Season new desc: 'COMMERCIAL'; color: Color green; range: 24 @ 25);
		add: (Season new desc: 'RESIDENTIAL'; color: Color yellow; range: 26 @ 28);
		add: (Season new desc: 'HEAVY HIGHWAY'; color: Color gray; range: 29 @ 33; textColor: true);
		add: (Season new desc: 'MUNICIPAL'; color: Color brown; range: 34 @ 35; textColor: true);
		add: (Season new desc: 'RESIDENTIAL'; color: Color yellow; range: 36 @ 37);
		add: (Season new desc: 'INSTITUTIONAL'; color: Color red; range: 38 @ 40);
		add: (Season new desc: 'COMMERCIAL'; color: Color green; range: 41 @ 43);
		add: (Season new desc: 'MUNICIPAL'; color: Color brown; range: 44 @ 45; textColor: true);
		add: (Season new desc: 'STINKY''S'; color: Color yellow; range: 46 @ 46);
		add: (Season new desc: 'LOST MINER'; color: Color green; range: 47 @ 47);
		add: (Season new desc: 'WESTWOOD'; color: Color brown; range: 48 @ 48; textColor: true);
		add: (Season new desc: 'BIG PHIL''S'; color: Color gray; range: 49 @ 49; textColor: true);
		yourself
		! !

!Contract class methodsFor: 'auction' stamp: 'dhn 7/22/2016 17:42'!
assetListAuction
	"Answer the list of assets in order suitable for auction."
	
	^ #('Backhoe' 'Dozer' 'Excavator' 'Grader' 'Scraper' 'Truck' 'Stinky' 'LostMiner' 'Westwood' 'BigPhil')! !

!Contract class methodsFor: 'auction' stamp: 'dhn 9/8/2014 13:14'!
bankName
	^ 'First Friendly Bank'! !

!Contract class methodsFor: 'auction' stamp: 'dhn 9/19/2016 22:09:56'!
bidSpaces
	"Answer the positions where competitive bids are required."
	
	^ #(16 32 39)! !

!Contract class methodsFor: 'setup' stamp: 'dhn 5/19/2014 10:34'!
boardColor
	"Answer the color of the board itself"
	^Color yellow alpha: 0.7! !

!Contract class methodsFor: 'setup' stamp: 'dhn 7/13/2016 15:09'!
cellColorForGame
	"Answer the color of the board spaces"
	
	^ Color peach lighter! !

!Contract class methodsFor: 'setup' stamp: 'dhn 4/26/2012 10:25'!
cellsForGame
	"Answer the number of board spaces game"
	^7! !

!ContractToken methodsFor: 'accessing' stamp: 'dhn 9/24/2016 16:20:38'!
doubled
	"Answer the value of doubled"

	^ doubled! !

!ContractToken methodsFor: 'initialization' stamp: 'dhn 6/5/2020 21:22:51'!
initialize

	super initialize.
	
	labelArea _ LayoutMorph newColumn 
		layoutSpec: LayoutSpec useAll;
		color: Color transparent;
		name: 'label area';
		separation: 1;
		axisEdgeWeight: #center.
	labelArea
		addMorph: self makeIdArea;
		addMorph: self makeDoubledArea.

	self addMorphFront: labelArea! !

!ContractToken methodsFor: 'initialization' stamp: 'dhn 11/13/2016 16:29:42'!
layoutSubmorphs

	labelArea morphExtent: self morphExtent! !

!ContractToken methodsFor: 'initialization' stamp: 'dhn 6/5/2020 21:22:26'!
makeDoubledArea
	"Lay out the area for the arrow"
	| area |
	
	area _ LayoutMorph newRow
		color: Color transparent;
		name: #doubled;
		axisEdgeWeight: #center.
	
	doubled _ (StringMorph contents: '') 
		emphasis: 1;
		font: GameBoard gameFont.
		
	area addMorph: doubled.
	^ area layoutSpec: (LayoutSpec  
		proportionalWidth: 1.0)	! !

!ContractToken methodsFor: 'initialization' stamp: 'dhn 6/5/2020 21:23:17'!
makeIdArea
	"Lay out the area for the arrow"
	| area |
	
	area _ LayoutMorph newRow
		color: Color transparent;
		name: #id;
		axisEdgeWeight: #center.
	
	tokenId _ (StringMorph contents: 'Player') 
		emphasis: 1;
		font: GameBoard gameFont.
		
	area addMorph: tokenId.
	^ area layoutSpec: (LayoutSpec  
		proportionalWidth: 1.0)	! !

!ContractToken methodsFor: 'operations' stamp: 'dhn 4/6/2019 11:48:30'!
leftFrom: from to: to
	"Animate relocation of self when player must go BACK to 'to' from 'from' "
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

!ContractToken methodsFor: 'operations' stamp: 'dhn 4/12/2019 19:28:16'!
moveFrom: positionA to: positionB
	"Determine best direction and move"
	
	(Direction shortest: positionA to: positionB in: model spaces size) > 0
		ifTrue: [self rightFrom: positionA to: positionB]
		ifFalse: [self leftFrom: positionA to: positionB]! !

!ContractToken methodsFor: 'operations' stamp: 'dhn 4/28/2019 15:33:51'!
moved
	"Perform the results of the move"
	| pl mr |
	
	pl _ model currentPlayer.
	mr _ model.
	pl split: false.
	doubled contents: pl doubledString.
	(Contract taxDue: pl position) ifTrue: [mr debtTax].
	(Contract interestDue: pl position) ifTrue: [mr debtInterest].
	(Contract alwaysDo: pl position) 	ifTrue: [mr doSpace].
	pl rollAdjustment: 0.
	pl canDoJob ifTrue: [mr enableAll: {'Do Job'}].
	(Contract bidSpaces includes: pl position) 
		ifTrue: [
			mr decideCompetitive.
			mr disableAll: {'Do Job'}]
		ifFalse: [
			mr updateHistory.
			mr enableAll: {'End Turn'}]! !

!ContractToken methodsFor: 'operations' stamp: 'dhn 3/28/2019 17:27:50'!
position: aCell
	"Position the receiver over the board cell numbered by aCell"
	| horiz |
	
	self morphPosition: self posAdjust.
	horiz _ (model cells at: aCell) morphPosition x.
	self morphPosition: (self morphPosition translatedBy: (horiz@0))! !

!ContractToken methodsFor: 'operations' stamp: 'dhn 4/6/2019 11:48:07'!
rightFrom: from to: to
	"Animate relocation of self when player moves ahead to 'to' from 'from' "
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

!ContractToken methodsFor: 'operations' stamp: 'dhn 8/14/2017 11:53:01'!
sickMove
	"Animate relocation of self when player lands on space 9"
	| oldPos posns limit i|
	
	oldPos _ model currentPlayer oldPosition.
	self arrowRight.
	posns _ (Interval from: oldPos to: oldPos + 12 by: 1) asArray.
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
				model currentPlayer position: 21.
				self doubled contents: model currentPlayer doubledString.
				model currentPlayer canDoJob ifTrue: [model enableAll: {'Do Job'}]]].
	self startSteppingStepTime: 500! !

!ContractToken class methodsFor: 'instance creation' stamp: 'dhn 1/20/2017 11:57:32'!
includeInNewMorphMenu
	"Not to be instantiated from the menu"
	^ false! !

!Construction methodsFor: 'initialization' stamp: 'dhn 4/6/2019 12:01:24'!
buildMorphicWindow

	pasteup _ GamePasteUp new
		name: #pasteup;
		color: Color transparent.
		
	layoutMorph addMorph: pasteup layoutSpec: LayoutSpec useAll.
	board _ LayoutMorph newColumn name: #board.
	board color:  (Color r: 0.986 g: 0.986 b: 0.986).
	pasteup addMorph: board.
	model world: pasteup.
	
	model when: #quitGame send: #delete to: self.
	model when: #itemChange send: #displayNumbers to: self.
	model when: #titleChange send: #titleChange: to: self with: #player.
	model when: #jobAuctionRequired send: #showJobAuctionAt: to: self with: #pos.
	model when: #showToken send: #showToken to: self.
	model when: #showJobView: send: #showJobView: to: self with: #title.
	model when: #showSeasons: send: #showSeasons: to: self with: #index.
	model when: #endOfMove send: #possiblyDoJob to: self.
! !

!Construction methodsFor: 'initialization' stamp: 'dhn 10/19/2016 16:06:52'!
initialize

	super initialize! !

!Construction methodsFor: 'initialization' stamp: 'dhn 4/17/2017 14:01:11'!
layoutSubmorphs

    super layoutSubmorphs.
    self board morphExtent: self board owner morphExtent! !

!Construction methodsFor: 'initialization' stamp: 'dhn 6/6/2020 11:19:05'!
makeButtonArea
	"Lay out the area for buttons"
	
	buttonArea _ (LayoutMorph newRow separation: 5)
		layoutSpec: (LayoutSpec 
			proportionalWidth: 1.0
			proportionalHeight: self class titleHeight
			offAxisEdgeWeight: #center).
	buttonArea
			color: Color transparent;
			name: #buttons;
			axisEdgeWeight: #center.
			
	board addMorph: buttonArea.
	
	^ buttonArea
		! !

!Construction methodsFor: 'initialization' stamp: 'dhn 6/6/2020 11:19:28'!
makeCellsArea
	"Lay out the area which shows some spaces of the board"
	| cellArea view mm mt |
	
	cellArea _ (LayoutMorph newRow separation: 0)
		layoutSpec: (LayoutSpec 
			proportionalWidth: 1.0
			proportionalHeight: 1.0
			offAxisEdgeWeight: #center);
		name: #'cell area'.
	
	1 to: self class cellsForGame do: [:ix |
		view _ (CellView newColumn
			layoutSpec: (LayoutSpec proportionalWidth: 1 / self class cellsForGame);
			name: #cell).
		view addMorph: (mt _ (GameCell 
			textProvider: self
			textGetter: #describe)
				layoutSpec: (LayoutSpec proportionalWidth: 1.0);
				color: self class cellColor;
				borderWidth: 1;
				name: 'cell text').
		view addMorph: (mm _ (LayoutMorph newRow separation: 4)
			layoutSpec: (LayoutSpec 
				proportionalWidth: 1.0
				fixedHeight: 20
				offAxisEdgeWeight: #center);
			color: self class cellColor;
			axisEdgeWeight: #center;
			name: #marks).
		view 
			marksPane: mm;
			textPane: mt.
		model cells add: view].
		
	^ cellArea addAllMorphs: model cells reversed
		
! !

!Construction methodsFor: 'initialization' stamp: 'jmv 6/11/2020 16:31:40'!
makeNumbersArea
	"Lay out the area for player cash on hand"
	
	numbersArea _ (LayoutMorph newRow separation: 0)
		layoutSpec: (LayoutSpec proportionalWidth: 1.0
			proportionalHeight: self class titleHeight
			offAxisEdgeWeight: #center).
	numbersArea
			color: Color transparent;
			name: #numbers;
			axisEdgeWeight: #center.
			
	^ numbersArea addMorph: ((StringMorph contents: '') 
		emphasis: 1;
		font: (FontFamily defaultFamilyPointSize: 22))
		! !

!Construction methodsFor: 'initialization' stamp: 'dhn 6/6/2020 11:21:13'!
makeOthersArea
	"Lay out the area for player cash on hand"
	
	othersArea _ (LayoutMorph newRow separation: 0)
		layoutSpec: (LayoutSpec proportionalWidth: 1.0
			proportionalHeight: self class titleHeight
			offAxisEdgeWeight: #center).
	^ othersArea
		color: Color transparent;
		name: #others;
		axisEdgeWeight: #center! !

!Construction methodsFor: 'initialization' stamp: 'dhn 6/6/2020 11:20:58'!
makeSeasonsArea
	"Lay out the area for seasons"
	
	seasonsArea _ (LayoutMorph newRow separation: 0)
		layoutSpec: (LayoutSpec 
			proportionalWidth: 1.0
			proportionalHeight: 0.08
			offAxisEdgeWeight: #center).
	^ seasonsArea
			color: Color lightGreen;
			name: #seasons! !

!Construction methodsFor: 'initialization' stamp: 'dhn 9/28/2016 15:53:42'!
playButtonSet
	"Answer the buttons used to play the game"

	buttonArea 
		removeAllMorphs;
		addMorph: self makeShowStatsButton;
		addMorph: self makePayLoanButton;
		addMorph: self makeAuctionButton;
		addMorph: self makePurchasesButton;
		addMorph: self makeHistoryButton;
		addMorph: self makeEndTurnButton;
		addMorph: self makeDoJobButton;
		addMorph: (model moveButton: self makeMoveButton);
		addMorph: self makeQuitGameButton.
! !

!Construction methodsFor: 'initialization' stamp: 'dhn 4/10/2019 18:08:53'!
setupToken: aPlayer
	"Place the player's token on the board"
	| w h |
	
	w _ owner morphExtent x * 0.13.
	h _ w * 0.5.
	model token id contents: aPlayer identity.
	model token doubled contents: aPlayer doubledString.
	model token 
		color: aPlayer color;
		morphExtent: w@h;
		morphPosition: owner morphExtent * (0.006@0.72).
	pasteup addMorph: model token.
	^ model token! !

!Construction methodsFor: 'initialization' stamp: 'jmv 6/11/2020 16:31:44'!
showSeasons: associations 
	"Display the seasons contained in associations"
	| width set bm txt dx |
			
	seasonsArea removeAllMorphs.
	width _ layoutMorph morphWidth / self class cellsForGame.
	set _ OrderedCollection new.
	associations do: [:k | 	| first last sea |
			first _ k key x - 1.
			last _ k key y.
			bm _ LayoutMorph newRow
				axisEdgeWeight: #center;
				name: #season.
			seasonsArea addMorph: bm
				layoutSpec: (LayoutSpec proportionalWidth: width * (last - first) proportionalHeight: 1.0).
			sea _ k value.
			bm color: sea color.
			txt _ StringMorph new
				emphasis: 1;  "emphasis: bold=1"
				font: (FontFamily defaultFamilyPointSize: 18).
			bm addMorph: txt..
			txt color: (sea textColor
				ifTrue: [Color white]
				ifFalse: [Color black]).
			txt contents: sea desc.
			dx _ Construction ironMap.
			(dx includesKey: sea desc asSymbol)
				ifTrue: [txt
						setBalloonText: ('Requires ' , (dx at: sea desc asSymbol) asString)].
			set add: txt].
	^ set! !

!Construction methodsFor: 'initialization' stamp: 'dhn 9/11/2016 16:12:56'!
startButtonSet
	"Answer the buttons used to start the game"

	buttonArea 
		removeAllMorphs;
		addMorph: self makeAddPlayerButton;
		addMorph: self makeSettingsButton;
		addMorph: self makeTourButton;
		addMorph: self makeQuitGameButton.
! !

!Construction methodsFor: 'initialization' stamp: 'dhn 9/9/2018 14:07:42'!
startGame
	"Change the buttons and start the game"
	
	self playButtonSet.
	model playerIndex: 0. "retain players in order of entry"
	model 
		testGoal;
		nextPlayer.
	model initialButtonState! !

!Construction methodsFor: 'accessing' stamp: 'dhn 8/2/2016 17:23:31'!
describe

	^ ''! !

!Construction methodsFor: 'accessing' stamp: 'dhn 9/10/2016 19:45:38'!
model
	"Answer the value of model"

	^ model! !

!Construction methodsFor: 'accessing' stamp: 'dhn 7/25/2016 11:26'!
numbersArea
	"Answer the value of numbersArea"

	^ numbersArea! !

!Construction methodsFor: 'windows' stamp: 'dhn 4/12/2017 17:50:03'!
displayInvoice: details title: aTitle
	"Display the results of doing the job"
	| inv |
	
	inv _ JobView openOn: model.
	inv 
		setLabel: aTitle;
		setWindowColor: model currentPlayer color;
		openInWorld: pasteup;
		morphPosition: self windowPosition;
		morphExtent: 310@180;						
		details: details! !

!Construction methodsFor: 'windows' stamp: 'dhn 5/24/2020 12:05:32'!
showAssetAuction
	"Open an auction machinery window"
	| pl win purpose |
	
	model disableAll: {'Auction'. 'End Turn'}.
	model auctionList: model assetsToSell.
	pl _ model currentPlayer.
	purpose _ pl identity, '''s Assets'.
	win _ AuctionMachinery openOn: model.			
	win buyers color: Color lightBrown.
	win openInWorld: pasteup.
	win 
		setLabel: 'Auction of ', purpose;
		color: (Color r: 0.986 g: 0.986 b: 0.986);
		setWindowColor: pl color;
		startButtons;
		morphPosition: self windowPosition;
		morphExtent: 450@300! !

!Construction methodsFor: 'windows' stamp: 'dhn 5/9/2020 22:31:08'!
showJobAuctionAt: aPosition
	"Open a job auction window on the job at aPosition"
	| win seas |

	model disableAll: {'Auction'. 'End Turn'}.
	seas _ model seasonAt: aPosition.
	win _ AuctionJob openOn: model.			
	win buyers color: seas color.
	win 
		setWindowColor: Color lightBrown;
		setLabel: seas desc, ' job auction'.
	win 
		buyerButtons;
		morphExtent: 450@300;
		openInHand.
	win chant addFirst: 'The auction has started, what am I bid?'.
	win showChant.
	win beat: #announceSold! !

!Construction methodsFor: 'windows' stamp: 'dhn 2/19/2020 21:17:44'!
showJobView: aTitle
	"Show window for reporting job results"
	
	model invoice: (JobView openOn: model title: aTitle).
	model invoice
		openInWorld: pasteup;
		setWindowColor: model currentPlayer color;
		morphPosition: self windowPosition;
		morphExtent: 340 @ 380! !

!Construction methodsFor: 'windows' stamp: 'dhn 6/12/2019 12:30:50'!
showLoan
	"Show window for reducing debt"
	| pl win |
		
	pl _ model currentPlayer.
	win _ DebtView openOn: model.
	win openInWorld: pasteup.
	win
		setLabel: pl identity, '''s Debt';
		player: pl;
		setWindowColor: pl color;
		startButtons;
		morphPosition: self windowPosition;
		morphExtent: 365 @ 220.
				
	model disableAll: {'Pay Loan'}! !

!Construction methodsFor: 'windows' stamp: 'dhn 2/19/2020 19:36:10'!
showOpts
	"Show window for buying assets"
	| pl win |
		
	pl _ model currentPlayer.
	pl options notEmpty
		ifTrue: [
			win _ BuyMachinery openOn: model.
			win openInWorld: pasteup.
			win
				setLabel: pl identity, '''s Shopping';
				setWindowColor: pl color;
				startButtons;
				morphPosition: self windowPosition;
				morphExtent: 390 @ 275.
				model disableAll: {'Purchase'}]! !

!Construction methodsFor: 'windows' stamp: 'dhn 3/23/2017 20:57:30'!
showStats
	"Open a window on a player's statistics"
	| pl win |
		
	pl _ model currentPlayer.
	win _ StatsView openOn: model.
	win openInWorld: pasteup.
	win
		setLabel: pl identity, '''s Statistics';
		setWindowColor: pl color;
		morphPosition: self windowPosition;
		morphExtent: 300 @ 260.
	model disableAll: {'Stats'}! !

!Construction methodsFor: 'windows' stamp: 'dhn 4/11/2019 11:43:10'!
windowPosition
	"Answer the position for a window"
	
	^ self morphPosition + (model windowPosition: self class viewPositionLeft)! !

!Construction methodsFor: 'operation' stamp: 'jmv 6/11/2020 16:31:37'!
displayNumbers
	"Display financial state of the players"
	| otherLead pluralForm others |

	numbersArea submorphs first 
		contents: model numbersReport;
		color: model currentPlayer color.
	pluralForm _ model players size = 2
		ifTrue: ['Player''s']
		ifFalse: ['Players'''].
	otherLead _ (StringMorph contents: (String streamContents: [:string |
		string
			nextPutAll: 'Other ';
			nextPutAll: pluralForm;
			nextPutAll: ' Cash: '])).
	otherLead
		emphasis: 1;
		color: Color lightBrown;
		font: (FontFamily defaultFamilyPointSize: 18).
	othersArea 
		removeAllMorphs;
		addMorph: otherLead.
	others _ model players select: [:a | a ~= model currentPlayer].
	others do: [:ea | | x |
		x _ ' $', ea cash truncated printStringWithCommas.
		othersArea addMorph: ((StringMorph contents: x) 
			emphasis: 1;
			color: ea color;
			setBalloonText: 'cash held by ', ea identity;
			font: (FontFamily defaultFamilyPointSize: 18))]! !

!Construction methodsFor: 'operation' stamp: 'dhn 6/14/2020 17:34:19'!
doTour
	"Start the tour of the board"
	| choice resp |
	
	model disableAll: {'Players'. 'Tour'}.
	choice _ (PopUpMenu labelArray: #('Automatic' 'Interactive')) startUpWithCaption: nil.
	choice = 1 ifTrue: [self tourAt: 500].
	choice = 2 ifTrue: [
		resp _ '1'.
		[resp ~= ''] whileTrue: [
			resp _ StringRequestMorph request: 'Board starting where?' initialAnswer: resp.
			(resp notEmpty and: [resp asNumber > 0]) ifTrue: [
				self showSeasons: (model parseSeasonsAt: resp asNumber).
				self model cellsAt: resp asNumber]]].
	model enableAll: {'Players'. 'Tour'}
	! !

!Construction methodsFor: 'operation' stamp: 'dhn 4/6/2019 11:58:11'!
possiblyDoJob
	"Enable the 'Do Job' button if player has the equipment"
	
	model currentPlayer canDoJob
		ifTrue: [ model enableAll: {'Do Job'}]! !

!Construction methodsFor: 'operation' stamp: 'dhn 3/23/2017 20:57:57'!
showToken
	"Establish the size and position of the token"
	| w h |
	
	w _ self morphExtent x * 0.13.
	h _ w * 0.5.
	model token 
		morphExtent: w@h;
		morphPosition: self morphExtent * (0.006@0.72);
		openInWorld: pasteup! !

!Construction methodsFor: 'operation' stamp: 'jmv 6/11/2020 16:31:52'!
titleChange: aPlayer
	"Change the title, showing player data in color"
	"Display financial state of the players"
	| otherLead pluralForm others |
	
	gameTitle contents: aPlayer identity , '''s turn.'.
	gameTitle color: aPlayer color.
	
	numbersArea submorphs first 
		contents: model numbersReport;
		color: model currentPlayer color.
	pluralForm _ model players size = 2
		ifTrue: ['Player''s']
		ifFalse: ['Players'''].
	otherLead _ (StringMorph contents: (String streamContents: [:string |
		string
			nextPutAll: 'Other ';
			nextPutAll: pluralForm;
			nextPutAll: ' Cash: '])).
	otherLead
		emphasis: 1;
		color: Color lightBrown;
		font: (FontFamily defaultFamilyPointSize: 18).
	othersArea 
		removeAllMorphs;
		addMorph: otherLead.
	others _ model players select: [:a | a ~= model currentPlayer].
	others do: [:ea | | x |
		x _ ' $', ea cash truncated printStringWithCommas.
		othersArea addMorph: ((StringMorph contents: x) 
			emphasis: 1;
			color: ea color;
			setBalloonText: 'cash held by ', ea identity;
			font: (FontFamily defaultFamilyPointSize: 18))]! !

!Construction methodsFor: 'operation' stamp: 'dhn 1/11/2017 15:45:58'!
tourAt: anInterval 
	"Take a tour of the board."
	| limit i |
	
	limit _ model spaces size + 2.
	i _ 0.
	self when: #morphicStep evaluate: [ :delta |
		i _ i + 1.
		i < limit 
			ifTrue: [model positionBoardTo: i]
			ifFalse: [
				self stopStepping.
				self removeActionsForEvent: #morphicStep]].
	self startSteppingStepTime: anInterval. 	"time of each increment of the hop"
! !

!Construction methodsFor: 'buttons' stamp: 'dhn 1/5/2018 10:59:17'!
makeAddPlayerButton
	"Answer the 'Players' button"

	^ (GameButtonMorph label: 'Players' action: #getPlayers state: true model: self)
		layoutSpec: self class buttonLayoutSpec;
		setBalloonText: 'Use this button to enter names of two to six players;
entering an empty name or cancel will start the game'! !

!Construction methodsFor: 'buttons' stamp: 'dhn 1/5/2018 11:00:45'!
makeAuctionButton
	"Answer the 'Auction' button"
	
	^ (GameButtonMorph label: 'Auction' action: #showAssetAuction state: true model: self)
		layoutSpec: self class buttonLayoutSpec;
		setBalloonText: 'Start an auction for assets'! !

!Construction methodsFor: 'buttons' stamp: 'dhn 1/5/2018 11:00:56'!
makeDoJobButton
	"Answer the 'Do Job' button"
	
	^ (GameButtonMorph label: 'Do Job' action: #doJob state: false model: model)
		layoutSpec: self class buttonLayoutSpec;
		setBalloonText: 'Do the job for the market indicated above the space.'! !

!Construction methodsFor: 'buttons' stamp: 'dhn 1/5/2018 11:01:10'!
makeEndTurnButton
	"Answer the 'End Turn' button"
	
	^ (GameButtonMorph label: 'End Turn' action: #endTurn state: false model: model)
		layoutSpec: self class buttonLayoutSpec;
		setBalloonText: 'Let the next player have a turn. Not enabled as long as Move is enabled.'! !

!Construction methodsFor: 'buttons' stamp: 'dhn 1/5/2018 11:01:22'!
makeHistoryButton
	"Answer the 'History' button"
	
	^ (GameButtonMorph label: 'History' action: #showHistory state: true model: self)
		layoutSpec: self class buttonLayoutSpec;
		setBalloonText: 'Show a graph of players'' progress'! !

!Construction methodsFor: 'buttons' stamp: 'dhn 1/5/2018 11:01:35'!
makeMoveButton
	"Answer the 'Move' button"
	
	^ (GameButtonMorph label: 'Move' action: #move state: true model: model)
		layoutSpec: self class buttonLayoutSpec;
		setBalloonText: 'Move the player from one to six spaces, based on the "roll" of a die.'! !

!Construction methodsFor: 'buttons' stamp: 'dhn 1/5/2018 11:01:47'!
makePayLoanButton
	"Answer the 'Pay Loan' button"
	
	^ (GameButtonMorph label: 'Pay Loan' action: #showLoan state: true model: self)
		layoutSpec: self class buttonLayoutSpec;
		setBalloonText: 'Transfer cash to pay off debt.'! !

!Construction methodsFor: 'buttons' stamp: 'dhn 1/5/2018 11:02:00'!
makePurchasesButton
	"Answer the 'Purchases' button"
	
	^ (GameButtonMorph label: 'Purchase' action: #showOpts state: true model: self)
		layoutSpec: self class buttonLayoutSpec;
		setBalloonText: 'Buy equipment and franchises.'! !

!Construction methodsFor: 'buttons' stamp: 'dhn 1/5/2018 11:02:10'!
makeQuitGameButton
	"Answer the 'Quit' button"
	
	^ (GameButtonMorph label: 'Quit' action: #quitGame state: true model: self)
		layoutSpec: self class buttonLayoutSpec;
		setBalloonText: 'Completely ends the game. Nothing is saved.';
		color: (Color orange alpha: 0.9)! !

!Construction methodsFor: 'buttons' stamp: 'dhn 1/5/2018 11:02:20'!
makeSettingsButton
	"Answer the 'Settings' button"
	
	^ (GameButtonMorph label: 'Settings' action: #doSettings state: true model: model)
		layoutSpec: self class buttonLayoutSpec;
		setBalloonText: 'Change some of the game parameters'! !

!Construction methodsFor: 'buttons' stamp: 'dhn 1/5/2018 11:02:31'!
makeShowStatsButton
	"Answer the 'Stats' button"
	
	^ (GameButtonMorph label: 'Stats' action: #showStats state: true model: self)
		layoutSpec: self class buttonLayoutSpec;
		setBalloonText: 'Lots of information here'! !

!Construction methodsFor: 'buttons' stamp: 'dhn 1/5/2018 11:02:42'!
makeTourButton
	"Answer the 'Tour' button"
	
	^ (GameButtonMorph label: 'Tour' action: #doTour state: true model: self)
		layoutSpec: self class buttonLayoutSpec;
		setBalloonText: 'Cause the board to move around so you can see what is in all the spaces.'! !

!Construction methodsFor: 'termination' stamp: 'dhn 8/16/2017 16:46:05'!
quitGame
	(self confirm: 'Are you sure you want to quit ', Construction asString, '?')
		ifTrue: [model quitGame]! !

!Construction class methodsFor: 'instance creation' stamp: 'dhn 1/5/2018 10:57:53'!
buttonLayoutSpec
	"Answer the LayoutSpec for game buttons"

	^ LayoutSpec proportionalWidth: 0.06 proportionalHeight: 0.8! !

!Construction class methodsFor: 'instance creation' stamp: 'dhn 7/19/2016 15:54'!
cellColor
	"Answer the color for a cell"
	
	^ Color r: 1.0 g: 0.93 b: 0.83! !

!Construction class methodsFor: 'instance creation' stamp: 'dhn 7/13/2016 12:58'!
cellsForGame
	"Answer the number of board spaces in view at any time"
	
	^ 7! !

!Construction class methodsFor: 'instance creation' stamp: 'dhn 1/20/2017 18:50:43'!
includeInNewMorphMenu
	"Instantiate from the menu"
	
	^ true! !

!Construction class methodsFor: 'instance creation' stamp: 'dhn 9/1/2016 21:30:46'!
labelAreaHeight

	^ 50! !

!Construction class methodsFor: 'instance creation' stamp: 'dhn 8/14/2017 11:49:36'!
start
	"Start the Construction Game"
	| win world |
	
	win _ self new.
	win 
		widgetsColor: win windowColor; "standard color for the window frame"
		color:  (Color r: 0.986 g: 0.986 b: 0.986); "background color"
		model: Contract new;
		buildMorphicWindow;
		setLabel: 'A Board Game'.
		
	win board
		addMorph: win makeTitleArea;
		addMorph: win makeNumbersArea;
		addMorph: win makeOthersArea.
		
	win gameTitle
		contents: 'Construction';
		color: Color lightBrown.
	win model buttons: win makeButtonArea.
	win board
		addMorph: win makeSeasonsArea;
		addMorph: win makeCellsArea.
	win model positionBoardTo: 1.
	win startButtonSet.
	win showSeasons: (win model parseSeasonsAt: 1).
	
	"Now do open it"
	world _ Processor activeProcess animatedUI.
	win morphExtent: (world morphExtent * (0.99@0.8)).
	world addMorph: win position: 0@60.
	win someSubmorphPositionOrExtentChanged.

	win model token: win model setUpToken.
	
	^ win
! !

!Construction class methodsFor: 'database' stamp: 'dhn 4/28/2019 22:19:17'!
contingencyDesc
	^ OrderedCollection new
	add: (Contingency for: #interest: with: 0.1 factor: 1 text: 'First Friendly Bank responds instantly to a rise in prime rate. Pay 10% on outstanding notes.');
	add: (Announcement for: #closeDown: with: true factor: 1 text: 'IRS shuts you down after finding discrepancies 
in your income taxes. Do not accept any contracts 
for the rest of the year, including this job.');
	add: (Announcement for: #reduced: with: 1/2 factor: 1 text: 'A competitor retires and offers you the pick 
	of his equipment at half price. For this turn only, 
you may buy all the big iron you can afford 
at these bargain basement prices.');
	add: (Announcement for: #equipmentDemo: with: 2 factor: 1 text: 'Free equipment demonstration. Add 2 
	machines when calculating this job income.');
	add: (Contingency for: #rentTrucks: with: 5000 factor: 1 text: 'Rent a truck from every player in the game who has one. Pay $5,000 each.');
	add: (Contingency for: #adjust: with: 10000 negated factor: 1 text: 'Employment Security audit finds in favor of the State and it costs you.');
	add: (Contingency for: #adjust: with: 10000 negated factor: 1 text: 'Uncle Sam wants you to help him balance the budget. Pay income taxes.');
	add: (Contingency for: #adjust: with: 20000 negated factor: 1 text: 'Following doctor''s orders to cut back on stress, you go fishing for a week. Foul-ups in your abscence run up job costs..');
	add: (Contingency for: #adjust: with: 20000 factor: 1 text: 'Bankruptcy court liquidates assets of project owner who went under and you collect your share of the kill.');
	add: (Contingency for: #adjust: with: 10000 factor: 1 text: 'Your bid anticipated the city''s engineering snafu and you collect more with the change order.');
	add: (Contingency for: #perMachine: with: 1000 negated factor: 1 text: 'Annual license fees due. Pay $1,000 per machine.');
	add: (Contingency for: #perMachine: with: 1000 negated factor: 1 text: 'Vandals break windows on all your equipment. Pay $1,000 per machine.');
	add: (Contingency for: #adjust: with: 5000 negated factor: 1 text: 'Pipe laser goes haywire and sewer pipe gets laid 6 inches too high. Pay to reset pipe.');
	add: (Announcement for: #cutIncome: with: 1/2 factor: 1/2 text: 'Bad news floods in: the crew broke a water main. 
Cut net income for this job in half.');
	add: (Contingency for: #adjust: with: 20000 factor: 1 text: 'Creative design engineering gets the enviros off your back, allowing you to both repair a salmon spawning stream and construct the job and you collect money.');
	add: (Contingency for: #adjust: with: 2000 negated factor: 1 text: 'Dept. of Labor and Industries fines you for a faulty backup alarm on your backhoe and you have to cough up for the fine.');
	add: (Announcement for: #expenseOnly: with: 0 factor: 1 text: 'A human skeleton carbon-dated at 6,500 years 
	old is found on your job site. All work screeches to a halt!! 
	Pay expenses on this job but do not receive income.');
	add: (Contingency for: #adjust: with: 3000 negated factor: 1 text: 'Your word processor crashed and ate a big part of the contract you were getting ready to bid on. Pay to upgrade your computer.');
	add: (Contingency for: #adjust: with: 5000 negated factor: 1 text: 'Leak test for water main fails. Liquidate assets to find, repair, and retest.');
	add: (Contingency for: #adjust: with: 5000 factor: 1 text: 'Big rainstorm in the middle of the project leads to a change order adding 2 storm water basins and you shovel in the dough.');
	add: (Contingency for: #adjust: with: 10000 factor: 1 text: 'Faulty job audit puts the prime contractor between a rock and a hard place. Judge finds in favor of the subcontractors, forces him to pay up, and you receive money.');
	add: (Contingency for: #adjust: with: 25000 negated factor: 1 text: 'On a weekend trip to Vegas, you blow your wad and then some. You swear off gambling for good, except in the construction business, but it costs you a bundle!!.');
	add: (Contingency for: #payLostMiner: with: 10000 negated factor: 1 text: 'Your bid skimps on gravel and the project owner''s engineer calls you on it. Pay Lost Miner for extra rock.');
	add: (Contingency for: #adjust: with: 5000 negated factor: 1 text: 'Steep ditch side-slopes put you on shaky ground with inspector. Pay fine.');
	add: (Contingency for: #adjust: with: 3000 factor: 1 text: 'Extended warranty pays off when backhoe goes kaput!! Collect insurance.');
	add: (Announcement for: #forfeitJob: with: true factor: 1 text: 'Whoops!! You''ve exceeded your bonding 
	insurance capacity and must forfeit this job.');
	add: (Contingency for: #adjust: with: 5000 negated factor: 1 text: 'You need to hire a lawyer to enforce a contract. Pay for Gogh, Gettum & Howe to represent you in court.');
	add: (Contingency for: #adjust: with: 4000 factor: 1 text: 'Engineer does turnaround on driveway location. Collect money for the change order.');
	add: (Contingency for: #adjust: with: 10000 factor: 1 text: 'Rocky start on soil excavation pans out smoother than expected and you benefit with higher income.');
	add: (Contingency for: #adjust: with: 5000 factor: 1 text: 'The sun shines, the birds sing and your equipment runs without a breakdown. The job is finished ahead of schedule and you collect incentive fees.');
	add: (Contingency for: #adjust: with: 10000 factor: 1 text: 'Your engineer''s computer reveals a more cost efficient project design and your income is increased.');
	add: (Contingency for: #adjust: with: 5000 negated factor: 1 text: 'You didn''t do your homework on your last bid. Remove and replace unsuitable soil at your own cost.');
	add: (Contingency for: #adjust: with: 10000 factor: 1 text: 'Sawbucks add up from the sale of timber cleared off job site and you haul in the bucks.');
	add: (Contingency for: #replaceTires: with: 5000 negated factor: 1 text: 'Sharp rocks put holes in your budget. Pay to replace tires if you own a truck.');
	add: (Contingency for: #adjust: with: 25000 factor: 1 text: 'You are hired to remove and dispose of unsuitable material from a building site and discover it is high grade peat. You find a market for it and increase your income.');
	add: (Contingency for: #adjust: with: 5000 negated factor: 1 text: 'Your backhoe runs low on oil and the engine goes up in smoke. Pay repair bill.');
	add: (Contingency for: #adjust: with: 5000 negated factor: 1 text: 'Government agency fines you for not complying with minority hiring quotas specified in the contract.');
	add: (Contingency for: #payBigPhil: with: 20000 negated factor: 1 text: 'Pay BIG PHIL''S CONCRETE to pour sidewalks, gutters and storm basins.');
	add: (Contingency for: #perPlayer: with: 10000 factor: 1 text: 'You''re the only contractor in town who filled out all the government paperwork to handle contaminated material. Each player pays you $10,000 to clean up their sites.');
	add: (Contingency for: #perPlayer: with: 2000 factor: 1 text: 'Sell topsoil from job site dirt cheap. Collect $2,000 from each player.');
	add: (Contingency for: #payStinky: with: 25000 negated factor: 1 text: 'Contaminated soil is unearthed on the job site. Pay STINKY''S GARBAGE & LANDFILL to accept the material.');
	add: (Contingency for: #realTax: with: 0.1 factor: 1 text: 'One step ahead of the grim reaper, the tax man visits again. Real estate taxes are due. Pay 10% on the list price of all properties owned.');
	add: (Contingency for: #adjust: with: 10000 factor: 1 text: 'Job site has better than expected soil. It compacts beautifully and grades as smooth as a baby''s bottom and your income is increased.');
	add: (Contingency for: #sewerPlug: with: 5000 factor: 1 text: 'With a plugged sewer main, the city needs an excavator - and quick!! If you own one, you benefit.');
	add: (Contingency for: #adjust: with: 15000 factor: 1 text: 'You''re the first contractor in your area to install GPS sensors on your equipment. The extra efficiency increases your profits.');
	add: (Contingency for: #adjust: with: 5000 factor: 1 text: 'Clear dry weather for the whole job boosts profits for you.');
	add: (Contingency for: #adjust: with: 5000 negated factor: 1 text: 'Heads up!! Shortage of hard hats and inadequate safety procedures results in an OSHA fine.');
	add: (Contingency for: #payWestwood: with: 15000 negated factor: 1 text: 'You''ve been steamrolled by under estimating the amount of paving needed for a parking lot. Pay WESTWOOD ASPHALT for additional material.');
	yourself.
! !

!Construction class methodsFor: 'database' stamp: 'dhn 8/1/2014 20:39'!
debtLimit
	"Answer the year -> debt limit associations for a player to stay in the game."
	^ OrderedCollection
		with: 5 -> 100000 negated
		with: 10 -> 200000 negated
		"300000 negated otherwise"! !

!Construction class methodsFor: 'database' stamp: 'dhn 9/22/2014 12:58'!
defaultGoal
	"Answer the default winning net asset goal"
	^ 1500000.
! !

!Construction class methodsFor: 'database' stamp: 'dhn 1/18/2017 18:12:56'!
hintsDesc
	"Answer the game hints"
	
	^ OrderedCollection new
	add: '
Enter two to six names of players, then use the "Move" and "End Turn" buttons alternately to take turns. During your turn, any button which is not gray is enabled for your use. To see what buttons and other parts of the board do, let the cursor linger over them.';
	add: 'If you have the required equipment at a space on the board, the "Do Job" button will be enabled. Whether this is advantageous for you depends on your amount of that particular equipment and the "roll" of the die when you optionally click the "Do Job" button. Clicking the "End Turn" button instead will skip the job. Try to take advantage of being doubled in a market.';
	add: 'Some jobs involve competetive bidding. The auction will be held even if only one player has the equipment. When there are no more bids, the auctioneer will declare "SOLD" after a few seconds.';
	add: 'To purchase a franchise (e.g. Stinky''s) a player must be on that space.';
	yourself
! !

!Construction class methodsFor: 'database' stamp: 'dhn 9/23/2016 15:29:05'!
ironMap
	"Provide the association between season and equipment"
	
	^ Dictionary new
		add: #RESIDENTIAL -> #Backhoe;
		add: #Residential -> #Backhoe;
		add: #COMMERCIAL -> #Dozer;
		add: #Commercial -> #Dozer;
		add: #INSTITUTIONAL -> #Excavator;
		add: #Institutional -> #Excavator;
		add: #MUNICIPAL -> #Grader;
		add: #Municipal -> #Grader;
		add: #'HEAVY HIGHWAY' -> #Scraper;
		add: #'Heavy Highway' -> #Scraper;
		add: #STINKY -> #Stinky;
		add: #'LOST MINER' -> #LostMiner;
		add: #WESTWOOD -> #Westwood;
		add: #'BIG PHIL' -> #BigPhil;
		yourself! !

!Construction class methodsFor: 'database' stamp: 'dhn 7/13/2016 13:02'!
optionsDesc
	"Answer a dictionary of things that contractors can purchase."
	
	^ Dictionary new
		add: #Backhoe->Backhoe new;
		add: #Dozer->Dozer new;
		add: #Excavator->Excavator new;
		add: #Grader->Grader new;
		add: #Scraper->Scraper new;
		add: #Truck->Truck new;
		add: #Stinky->Stinky new;
		add: #LostMiner->LostMiner new;
		add: #Westwood->Westwood new;
		add: #BigPhil->BigPhil new;
		yourself! !

!Construction class methodsFor: 'documentation' stamp: 'dhn 10/16/2016 11:55:53'!
how
	"
	Construction start.
	"! !

!AuctionMachinery methodsFor: 'operation' stamp: 'dhn 5/27/2020 16:41:30'!
beginAuction

	model assetAuctionItem: 0.
	currentBump _ self bidBump first.
	begun _ true.
	self 
		soldEndButtons;
		buyerButtons;
		beat: #propertySold! !

!AuctionMachinery methodsFor: 'operation' stamp: 'dhn 5/27/2020 16:41:12'!
details
	"Set the contents of the chant pane"
	
	model assetAuctionItem > 0
		ifTrue: [
			self openingFor: model assetAuctionItem.
			beginButton enableButton]! !

!AuctionMachinery methodsFor: 'operation' stamp: 'dhn 5/26/2020 21:23:21'!
offer: aName
	"Record a bid by aName and start the auction"

	self offer: currentBid + currentBump by: aName.
	begun  _ true! !

!AuctionMachinery methodsFor: 'operation' stamp: 'dhn 5/27/2020 16:27:33'!
offer: anAmount by: aName
	"State that a bid of anAmount was made by aName"

	currentBidder _ aName.
	self chant addFirst: (String streamContents: [:str |
		str
			nextPut: $$;
			nextPutAll: anAmount printStringWithCommas;
			nextPutAll: ' was bid by '; 
			nextPutAll: currentBidder; newLine]).
	self showChant.
	going _ 0.
	buyers submorphsDo: [:ea | ea enableButton].
	(buyers findDeepSubmorphThat: [:mm | mm label = aName] ifAbsent: []) disableButton
! !

!AuctionMachinery methodsFor: 'operation' stamp: 'dhn 5/26/2020 18:39:28'!
propertySold
	"Finalize the sale"
	
	model assetAuctionItem: 0.
	currentBidder = model class bankName
		ifTrue: [
			asset owner tally: currentBid.
			asset owner: nil] 
		ifFalse: [
			model hammerDown: currentBid for: asset by: currentBidder].
	acknowledged _ true.
	"model possiblyEnable."
	self delete
! !

!AuctionMachinery methodsFor: 'buttons' stamp: 'dhn 5/27/2020 12:48:31'!
buyerButtons
	"Set bidding buttons for players."
	| col |
	
	col _ OrderedCollection new.
	model players do: [:ea |
		col add: ((BidderButton label: ea identity action: #offer: state: true model: self)
			morphExtent: 70@30;
			color: ea color;
			setProperty: #'handlesMouseDown:' toValue: true;
			setBalloonText: 'bidder')].
	buyers addAllMorphs: col reversed! !

!AuctionMachinery methodsFor: 'buttons' stamp: 'dhn 5/26/2020 21:36:14'!
makeEndButton
	"Answer the 'End' button"
	
	endButton _ GameButtonMorph label: 'End' action: #propertySold state: false model: self.
	endButton 
		morphExtent: 70@30;
		setBalloonText: 'Close the auction window.'.
	^ endButton! !

!AuctionJob methodsFor: 'initialization' stamp: 'dhn 6/6/2020 11:23:35'!
buildMorphicWindow
	"Lay out the window for auctioning a job"
	
	textPane _ (TextModelMorph
		withModel: (TextModel withText: '')) 	"note the different model specification"
			askBeforeDiscardingEdits: false;	"discard changes to the text"
			name: 'chant'. 	"give the TextModelMorph a name which will appear in the halos"
	textPane 
		layoutSpec: (LayoutSpec 
			proportionalWidth: 1.0
			proportionalHeight: 1.0
			offAxisEdgeWeight: #center).
			
	self layoutMorph
		addMorph: textPane;
		addMorph: (buyers _ self setUpBuyers)! !

!AuctionJob methodsFor: 'initialization' stamp: 'dhn 5/10/2020 12:17:40'!
initialize

	super initialize.
	currentBid _ 0.
	currentBump _ 1000! !

!AuctionJob methodsFor: 'buttons' stamp: 'dhn 4/12/2017 18:08:03'!
buyerButtons
	"Set bidding buttons for players with the required equipment"
	| col req any |
	
	req _ Contract requiredEquipment
				at: (Contract jobSeason at: model currentPlayer position).
	any _ model players select: [:a | (a assets at: req) quantity > 0].
	any notNil
		ifTrue: [
			col _ OrderedCollection new.
			any do: [:ea |
				col add: ((BidderButton label: ea identity action: #offer: state: true model: self)
					morphExtent: 70@30;
					color: ea color;
					setBalloonText: 'bidder')].
			buyers addAllMorphs: col reversed]! !

!AuctionJob methodsFor: 'buttons' stamp: 'dhn 5/10/2020 13:29:11'!
makeEndButton
	"Answer the 'End' button"
	
	endButton _ GameButtonMorph 
		label: 'End' 
		action: #jobSold 
		state: true 
		model: self.
	endButton 
		morphExtent: 70@30;
		setBalloonText: 'Finish the auction and close the window.'.
	^ endButton! !

!AuctionJob methodsFor: 'operation' stamp: 'dhn 5/9/2020 22:47:03'!
announceSold
	"SOLD!! the job"
	
	buyers 
		removeAllMorphs
		addMorph: self makeEndButton.
	chant addFirst: (String streamContents: [:str |
		str
			nextPutAll: 'SOLD!! Job awarded to ';
			nextPutAll: currentBidder;
			nextPutAll: ' for $';
			nextPutAll: currentBid printStringWithCommas; newLine]).
	self showChant
! !

!AuctionJob methodsFor: 'operation' stamp: 'dhn 5/9/2020 22:27:27'!
beat: aSymbol
	"Produce the auctioneer's chant; perform aSymbol when limit is exceeded"
	| limit |
	
	limit _ 4.
	self when: #morphicStep evaluate: [ :delta |
		begun 
			ifTrue: [
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
						self removeActionsForEvent: #morphicStep]]].
	self startSteppingStepTime: model chantBeat. 	"time between chants"! !

!AuctionJob methodsFor: 'operation' stamp: 'dhn 6/3/2020 14:05:30'!
bidBump
	"Answer the bid increments"
	
	^ (1000 to: 20000 by: 1000) asOrderedCollection ! !

!AuctionJob methodsFor: 'operation' stamp: 'dhn 9/26/2016 21:33:07'!
details
	"Not required for job auctions"
! !

!AuctionJob methodsFor: 'operation' stamp: 'dhn 5/10/2020 11:56:34'!
jobSold
	"Turn things over to the winner"

	model jobWinner: currentBidder bid: currentBid.
	self delete
! !

!AuctionJob methodsFor: 'operation' stamp: 'dhn 5/9/2020 21:59:41'!
offer: aName
	"Record a bid by aName and start the auction"

	self offer: currentBid + currentBump by: aName.
	begun  _ true! !

!AuctionJob methodsFor: 'operation' stamp: 'dhn 5/9/2020 22:01:40'!
offer: anObject by: aName
	"State that an offer referred to by anObject was made by aName"

	self currentBid: anObject.
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

!AuctionJob methodsFor: 'accessing' stamp: 'dhn 5/9/2020 21:55:54'!
currentBump: anObject
	"Set the value of currentBump"

	currentBump _ anObject! !

!AuctionJob methodsFor: 'termination' stamp: 'dhn 11/11/2016 15:39:33'!
closeBoxHit

	model 
		jobAuctionItem: nil;
		enableAll: {'Auction'. 'End Turn'}.
	super closeBoxHit! !

!AuctionJob methodsFor: 'termination' stamp: 'dhn 5/6/2017 11:12:14'!
endIt
	
	model 
		jobAuctionItem: nil;
		jobWinner: currentBidder bid: currentBid;
		enableAll: {'Auction'. 'End Turn'}.
	self delete
! !

!AuctionJob class methodsFor: 'class initialization' stamp: 'dhn 10/30/2016 21:20:04'!
openOn: aModel
	"Answer an instance of this class on aModel"
	| win |

	win _ self open: aModel.
	win removeWindowMenu.
			
	aModel when: #itemChange send: #details to: win.
	aModel when: #deleteOpenWindows send: #endIt to: win.
	
	^ win
! !

!DebtView class methodsFor: 'instance creation' stamp: 'dhn 5/3/2019 11:47:59'!
paymentIncrement
	"Answer the payment increment for displaying loan payment choices"
	
	^ 10000! !

!BuyMachinery methodsFor: 'operating' stamp: 'dhn 5/4/2019 11:11:04'!
buy
	"Purchase an asset"
	| key option cost down balance |

	key _ model optionsList at: model optionsItem.
	option _ Construction optionsDesc at: key.
	cost _ option class price * model currentPlayer priceFactor.
	down _ 0.2 * cost.
	balance _ cost - down.
	model
		pay: down
		borrow: balance
		for: option listName asSymbol
		amount: 1;
		updateHistory;
		enableAll: {'doJob'}.
	self details! !

!JobView methodsFor: 'initialization' stamp: 'dhn 6/6/2020 11:25:05'!
buildMorphicWindow
	"Lay out the window for job invoice"
	| top bottom left right text amount |
	
	layoutMorph beColumn.
	top _ LayoutMorph newRow name: #top.
	bottom _ (LayoutMorph newRow)
		layoutSpec: (LayoutSpec 
			proportionalWidth: 1.0
			proportionalHeight: 0.15
			offAxisEdgeWeight: #center).
	layoutMorph
		addMorph: top proportionalHeight: 0.85;
		addMorph: bottom proportionalHeight: 0.15.
	
	left _ LayoutMorph newColumn name: #left.
	right _ LayoutMorph newColumn name: #right.
	top
		addMorph: left proportionalWidth: 0.7;
		addAdjusterAndMorph: right proportionalWidth: 0.3.
	
	1 to: 4 do: [:ea |
		text _ (TextModelMorph
			withModel: (TextModel withText: '')) 	"note the different model specification"
				askBeforeDiscardingEdits: false;
				name: 'item', ea asString.
		amount _ LayoutMorph newColumn name: 'amount', ea asString..
		left addMorph: text proportionalHeight: 0.4.
		right addMorph: amount.
		items add: {text. amount}]! !

!JobView methodsFor: 'initialization' stamp: 'dhn 9/8/2018 12:01:53'!
initialize

	super initialize.
	items _ OrderedCollection new.
	index _ 0! !

!JobView methodsFor: 'termination' stamp: 'dhn 9/12/2016 19:37:24'!
closeBoxHit

	super closeBoxHit! !

!JobView methodsFor: 'termination' stamp: 'dhn 9/12/2016 19:37:02'!
endIt
	
	self delete! !

!JobView methodsFor: 'accessing' stamp: 'dhn 10/29/2016 16:04:55'!
details
	"To be compatible - do nothing"! !

!JobView methodsFor: 'accessing' stamp: 'dhn 9/9/2018 13:59:18'!
details: string1 amount: string2

	index _ index + 1.
	(items at: index) first model actualContents: string1.
	(items at: index) second addMorph: string2! !

!JobView class methodsFor: 'class initialization' stamp: 'dhn 9/12/2016 21:03:49'!
openOn: aModel title: atitle
	"Answer an instance of this class on aModel with a label of atitle"
	| win |

	win _ self open: aModel label: atitle.
	win removeWindowMenu.
			
	aModel when: #deleteOpenWindows send: #endIt to: win.
	
	^ win
! !

!StatsView methodsFor: 'initialization' stamp: 'dhn 6/12/2019 13:05:59'!
buildMorphicWindow
	"Lay out the window for statistics"
	| list |
	
	self layoutMorph beRow.
	list _ (PluggableListMorph
		model: model
		listGetter: #statsList
		indexGetter: #statsItem
		indexSetter: #statsItem:
		mainView: self
		menuGetter: nil
		keystrokeAction: nil)
			name: 'stats list'.
	textPane _ (TextModelMorph
		withModel: (TextModel withText: '')) 	"note the different model specification"
			askBeforeDiscardingEdits: false;	"discard changes to the text"
			name: 'stat description'. 	"give the TextModelMorph a name which will appear in the halos"

	self layoutMorph
		addMorph: list proportionalWidth: 0.6;
		addAdjusterAndMorph: textPane layoutSpec: (LayoutSpec useAll)! !

!StatsView methodsFor: 'termination' stamp: 'dhn 9/12/2016 17:15:08'!
closeBoxHit

	model 
		statsItem: nil;
		enableAll: {'Stats'}.
	super closeBoxHit! !

!StatsView methodsFor: 'termination' stamp: 'dhn 8/27/2016 12:11:24'!
endIt
	
	model 
		statsItem: nil;
		enableAll: {'Stats'}.
	self delete! !

!StatsView methodsFor: 'accessing' stamp: 'dhn 8/27/2016 12:11:53'!
details

	textPane model actualContents: model statsReport 	"note that the textPane model differs from the model for this view"! !

!ConAsset methodsFor: 'operating' stamp: 'dhn 4/15/2012 13:21'!
assetValue
	^self class price * self quantity! !

!ConAsset methodsFor: 'operating' stamp: 'dhn 8/26/2016 08:41:06'!
optionHeader
	| str |
	str := String new writeStream.
	str nextPutAll: self listName, ' price: ';
		 nextPutAll: '$' , self class price asInteger printStringWithCommas.
	^ str contents
! !

!ConAsset methodsFor: 'operating' stamp: 'dhn 7/21/2013 14:16'!
recordCost: anAmount for: aPlayer
	cost := anAmount + self cost.
	aPlayer expenseCount: 1 + aPlayer expenseCount.
! !

!ConAsset methodsFor: 'operating' stamp: 'dhn 7/21/2013 14:18'!
recordGross: anAmount
	gross := anAmount + self gross! !

!ConAsset methodsFor: 'initialize-release' stamp: 'dhn 3/13/2014 11:51'!
initialize
	super initialize.
	description := self listName! !

!ConAsset methodsFor: 'initialize-release' stamp: 'dhn 4/30/2019 17:31:10'!
listName

	self subclassResponsibility! !

!ConAsset methodsFor: 'accessing' stamp: 'dhn 7/19/2013 15:25'!
costAvoided
	"Answer the value of costAvoided"

	costAvoided ifNil: [costAvoided := 0].
	^ costAvoided! !

!ConAsset methodsFor: 'accessing' stamp: 'dhn 7/19/2013 15:26'!
costAvoided: anObject
	"Set the value of costAvoided"

	costAvoided := anObject! !

!ConAsset methodsFor: 'accessing' stamp: 'dhn 6/3/2020 14:38:13'!
expense
	"Answer the value of expense"

	^ expense ifNil: [expense _ 0]! !

!ConAsset methodsFor: 'accessing' stamp: 'dhn 6/3/2020 14:38:48'!
expense: anObject
	"Set the value of expense"

	expense _ anObject! !

!ConAsset methodsFor: 'accessing' stamp: 'dhn 7/21/2013 12:06'!
holder
	"Answer the value of holder"

	^ holder! !

!ConAsset methodsFor: 'accessing' stamp: 'dhn 7/21/2013 12:06'!
holder: anObject
	"Set the value of holder"

	holder := anObject! !

!ConAsset methodsFor: 'reporting' stamp: 'dhn 7/15/2016 18:07'!
profitAndLoss
	"Answer the P&L report"

	^ String streamContents: [:str |
		str 
			nextPutAll: self quantity asString;
			nextPutAll: ' each';
			newLine;
			nextPutAll: '$' , self cost asInteger printStringWithCommas;
			nextPutAll: ' = cost';
			newLine;
			nextPutAll: '$' , self gross asInteger printStringWithCommas;
			nextPutAll: ' = gross';
			newLine;
			nextPutAll: '$' , self costAvoided asInteger printStringWithCommas;
			nextPutAll: ' = cost avoided';
			newLine;
			nextPutAll: (self profit: self gross + self costAvoided orLoss: self cost);
			newLine]! !

!ConAsset methodsFor: 'reporting' stamp: 'dhn 8/17/2013 16:27'!
reportAsAssetFor: aPlayer
	^ self profitAndLoss! !

!ConAsset methodsFor: 'reporting' stamp: 'dhn 8/26/2016 08:42:09'!
termsAndConditions
	"Answer the purchase terms for an asset"
	| theCost down balance |
	
	theCost := owner priceFactor * self class price.
	down := 0.2 * theCost.
	balance := theCost - down.
	^ String streamContents: [:str |
		str 
			nextPutAll: 'Purchasing ';
			nextPutAll: self listName;
			nextPutAll: ' requires ';
			nextPutAll: '$' , down asInteger printStringWithCommas;
			nextPutAll: ' cash and a loan for ';
			nextPutAll: '$' , balance asInteger printStringWithCommas, '.'; newLine;
			nextPutAll: 'Currently you have ', quantity asString, '.']! !

!Contingencies methodsFor: 'as yet unclassified' stamp: 'dhn 5/19/2014 15:33'!
initialize
	super initialize.
! !

!Contingencies methodsFor: 'as yet unclassified' stamp: 'dhn 5/19/2014 15:26'!
listName
	^ 'Contingencies drawn at random

'! !

!Contingencies methodsFor: 'as yet unclassified' stamp: 'dhn 10/2/2016 16:01:01'!
reportAsAssetFor: aPlayer
	"Answer the list of contingency cards"

	^ String streamContents: [:str |
		(1 to: Construction contingencyDesc size)
			do: [:ix | 
				str 
					nextPutAll: (Construction contingencyDesc at: ix) description; 
					newLine; newLine]]! !

!Contingencies methodsFor: 'as yet unclassified' stamp: 'dhn 5/19/2014 15:54'!
reset! !

!Contingencies class methodsFor: 'as yet unclassified' stamp: 'dhn 5/19/2014 15:44'!
price
	^ 0! !

!Franchise methodsFor: 'as yet unclassified' stamp: 'dhn 7/19/2013 15:32'!
canGoOnSale
	^ false! !

!Franchise methodsFor: 'as yet unclassified' stamp: 'dhn 7/15/2016 18:22'!
reportOptionTo: anObject
	"Answer the description of an option"

	^ String streamContents: [:str |
		str 
			nextPutAll: self optionHeader;
			newLine;
			newLine;
			nextPutAll: self termsAndConditions]! !

!Franchise methodsFor: 'as yet unclassified' stamp: 'dhn 4/28/2012 22:02'!
reset! !

!Franchise methodsFor: 'initialize-release' stamp: 'dhn 4/15/2012 13:29'!
initialize
	super initialize! !

!Franchise class methodsFor: 'as yet unclassified' stamp: 'dhn 5/5/2012 12:11'!
at: aRoll for: aQuantity
	"Answer the yield for a Franchise."
	^0! !

!BigPhil methodsFor: 'as yet unclassified' stamp: 'dhn 7/19/2013 21:32'!
listName
	^ 'BigPhil'! !

!BigPhil class methodsFor: 'economics' stamp: 'dhn 9/24/2016 11:17:51'!
duty
	"A factor in the landing fee"
	
	^ 15000! !

!BigPhil class methodsFor: 'economics' stamp: 'dhn 5/5/2012 12:16'!
price
	"Per each"
	^500000! !

!BigPhil class methodsFor: 'site' stamp: 'dhn 9/24/2016 12:42:32'!
location
	"Answer the location"
	
	^ 49! !

!LostMiner methodsFor: 'as yet unclassified' stamp: 'dhn 7/19/2013 21:34'!
listName
	^ 'LostMiner'! !

!LostMiner class methodsFor: 'economics' stamp: 'dhn 9/24/2016 11:16:52'!
duty
	"A factor in the landing fee"
	
	^ 6000! !

!LostMiner class methodsFor: 'economics' stamp: 'dhn 5/5/2012 12:15'!
price
	"Per each"
	^200000! !

!LostMiner class methodsFor: 'site' stamp: 'dhn 9/24/2016 12:41:32'!
location
	"Answer the location"
	
	^ 47 ! !

!Stinky methodsFor: 'as yet unclassified' stamp: 'dhn 7/19/2013 21:34'!
listName
	^ 'Stinky'! !

!Stinky class methodsFor: 'economics' stamp: 'dhn 9/24/2016 11:15:21'!
duty
	"A factor in the landing fee"
	
	^ 4000! !

!Stinky class methodsFor: 'economics' stamp: 'dhn 5/5/2012 12:13'!
price
	"Per each"
	^100000! !

!Stinky class methodsFor: 'site' stamp: 'dhn 9/24/2016 12:43:37'!
location
	"Answer the location"
	
	^ 46! !

!Westwood methodsFor: 'as yet unclassified' stamp: 'dhn 7/19/2013 21:35'!
listName
	^ 'Westwood'! !

!Westwood class methodsFor: 'economics' stamp: 'dhn 9/24/2016 11:17:25'!
duty
	"A factor in the landing fee"
	
	^ 10000! !

!Westwood class methodsFor: 'economics' stamp: 'dhn 5/5/2012 12:16'!
price
	"Per each"
	^300000! !

!Westwood class methodsFor: 'site' stamp: 'dhn 9/24/2016 12:43:07'!
location
	"Answer the location"
	
	^ 48! !

!Hints methodsFor: 'as yet unclassified' stamp: 'dhn 1/18/2017 17:28:36'!
initialize
	super initialize.
! !

!Hints methodsFor: 'as yet unclassified' stamp: 'dhn 1/18/2017 17:30:33'!
listName
	^ 'Hints for Construction Game'! !

!Hints methodsFor: 'as yet unclassified' stamp: 'dhn 1/18/2017 17:34:16'!
reportAsAssetFor: aPlayer
	"Answer the game hints"

	^ String streamContents: [:str |
		(1 to: Construction hintsDesc size)
			do: [:ix | 
				str 
					nextPutAll: (Construction hintsDesc at: ix);
					newLine; newLine]]! !

!Hints methodsFor: 'as yet unclassified' stamp: 'dhn 1/18/2017 17:28:36'!
reset! !

!Hints class methodsFor: 'as yet unclassified' stamp: 'dhn 1/18/2017 17:28:36'!
price
	^ 0! !

!Iron methodsFor: 'as yet unclassified' stamp: 'dhn 7/19/2013 15:31'!
canGoOnSale
	^ true! !

!Iron methodsFor: 'as yet unclassified' stamp: 'dhn 7/15/2016 18:31'!
profitAndLoss
	"Answer the P&L for a machine"

	^ String streamContents: [:str |
		str 
			nextPutAll: self quantity asString;
			nextPutAll: ' each'; newLine;
			nextPut: $$;
			nextPutAll: self cost asInteger printStringWithCommas;
			nextPutAll: ' = cost'; newLine;
			nextPut: $$;
			nextPutAll: self gross asInteger printStringWithCommas;
			nextPutAll: ' = gross'; newLine;
			nextPut: $$;
			nextPutAll: self costAvoided asInteger printStringWithCommas;
			nextPutAll: ' = cost avoided'; newLine;
			nextPutAll: self missed asInteger printStringWithCommas;
			nextPutAll: ' missed opportunities'; newLine;
			nextPutAll: (self profit: self gross + self costAvoided orLoss: self cost);
			newLine]! !

!Iron methodsFor: 'as yet unclassified' stamp: 'dhn 7/15/2016 18:46'!
reportOptionTo: anObject
	"Answer the option report for a machine"

	^ String streamContents: [:str |
		str 
			nextPutAll: self optionHeader;
			newLine;
			newLine.
		owner priceFactor < 1 
			ifTrue: [str nextPutAll: 'SALE!! FOR THIS TURN ONLY!!'; newLine].
		str nextPutAll: self termsAndConditions]! !

!Iron methodsFor: 'initialize-release' stamp: 'dhn 4/15/2012 13:25'!
initialize
	super initialize.
! !

!Iron methodsFor: 'accessing' stamp: 'dhn 7/19/2016 14:04'!
reportAsAssetFor: aPlayer
	"Answer the asset report for a machine"
	| sea fctr |
	
	sea _ (aPlayer mgr seasonAt: aPlayer position) desc.
	(aPlayer markets includesKey: sea asSymbol) 
		ifTrue: [fctr _ aPlayer markets at: sea asSymbol]
		ifFalse: [fctr _ 1].
	^ String streamContents: [:str |
		str 
			nextPutAll: self profitAndLoss;
			nextPutAll: 'Job performance schedule:'; newLine.
	1 to: 6 do: [:i | 
		str 
			nextPutAll: i asString;
			nextPutAll: ': $';
			nextPutAll: (i * self quantity * fctr * self class yieldRate) printStringWithCommas;
			newLine]]! !

!Iron methodsFor: 'accessing' stamp: 'dhn 4/15/2012 13:25'!
reset! !

!Iron class methodsFor: 'as yet unclassified' stamp: 'dhn 4/29/2012 20:18'!
at: aRoll for: aQuantity 
	"Answer the revenue as if looking it up in a table."
	^ self yieldRate * aRoll * aQuantity! !

!Backhoe methodsFor: 'as yet unclassified' stamp: 'dhn 7/19/2013 21:31'!
listName
	^ 'Backhoe'! !

!Backhoe class methodsFor: 'as yet unclassified' stamp: 'dhn 4/16/2012 15:10'!
price
	"Per each"
	^50000! !

!Backhoe class methodsFor: 'as yet unclassified' stamp: 'dhn 4/29/2012 20:17'!
yieldRate
	"When multiplied by die value, determines gross income per machine"
	^ 1000! !

!Dozer methodsFor: 'as yet unclassified' stamp: 'dhn 7/19/2013 21:32'!
listName
	^ 'Dozer'! !

!Dozer class methodsFor: 'as yet unclassified' stamp: 'dhn 4/16/2012 15:10'!
price
	"Per each"
	^75000! !

!Dozer class methodsFor: 'as yet unclassified' stamp: 'dhn 4/29/2012 20:16'!
yieldRate
	"When multiplied by die value, determines gross income per machine"
	^ 2000! !

!Excavator methodsFor: 'as yet unclassified' stamp: 'dhn 7/19/2013 21:33'!
listName
	^ 'Excavator'! !

!Excavator class methodsFor: 'as yet unclassified' stamp: 'dhn 4/16/2012 15:11'!
price
	"Per each"
	^100000! !

!Excavator class methodsFor: 'as yet unclassified' stamp: 'dhn 4/29/2012 20:19'!
yieldRate
	"When multiplied by die value, determines gross income per machine"
	^ 3000! !

!Grader methodsFor: 'as yet unclassified' stamp: 'dhn 7/19/2013 21:33'!
listName
	^ 'Grader'! !

!Grader class methodsFor: 'as yet unclassified' stamp: 'dhn 4/16/2012 15:11'!
price
	"Per each"
	^150000! !

!Grader class methodsFor: 'as yet unclassified' stamp: 'dhn 4/29/2012 20:20'!
yieldRate
	"When multiplied by die value, determines gross income per machine"
	^ 5000! !

!Scraper methodsFor: 'as yet unclassified' stamp: 'dhn 7/19/2013 21:34'!
listName
	^ 'Scraper'! !

!Scraper class methodsFor: 'as yet unclassified' stamp: 'dhn 4/16/2012 15:11'!
price
	"Per each"
	^200000! !

!Scraper class methodsFor: 'as yet unclassified' stamp: 'dhn 4/29/2012 20:20'!
yieldRate
	"When multiplied by die value, determines gross income per machine"
	^ 7000! !

!Truck methodsFor: 'as yet unclassified' stamp: 'dhn 7/19/2013 15:33'!
canGoOnSale
	^ true! !

!Truck methodsFor: 'as yet unclassified' stamp: 'dhn 7/19/2013 21:35'!
listName
	^ 'Truck'! !

!Truck methodsFor: 'as yet unclassified' stamp: 'dhn 7/15/2016 18:52'!
profitAndLoss
	"Answer the P&L report for a truck"

	^ String streamContents: [:str |
		str 
			nextPutAll: self quantity asString;
			nextPutAll: ' each'; newLine;
			nextPutAll: '$' , self cost asInteger printStringWithCommas;
			nextPutAll: ' = cost'; newLine;
			nextPutAll: '$' , self gross asInteger printStringWithCommas;
			nextPutAll: ' = gross'; newLine;
			nextPutAll: '$' , self costAvoided asInteger printStringWithCommas;
			nextPutAll: ' = cost avoided'; newLine;
		 	nextPutAll: (self profit: self gross + self costAvoided orLoss: self cost);
			newLine]! !

!Truck methodsFor: 'as yet unclassified' stamp: 'dhn 8/23/2013 15:40'!
reportAsAssetFor: aPlayer
	^ self profitAndLoss.
! !

!Truck methodsFor: 'as yet unclassified' stamp: 'dhn 7/15/2016 18:57'!
reportOption
	"Answer the option report for a truck"

	^ String streamContents: [:str |
		str 
			nextPutAll: self optionHeader;
			newLine;
			newLine.
		owner priceFactor < 1 
			ifTrue: [str nextPutAll: 'SALE!! FOR THIS TURN ONLY!!'; newLine].
		str nextPutAll: self termsAndConditions]! !

!Truck class methodsFor: 'as yet unclassified' stamp: 'dhn 4/16/2012 16:06'!
at: aRoll for: aQuantity
	"Answer the yield for a truck."
	^0! !

!Truck class methodsFor: 'as yet unclassified' stamp: 'dhn 4/16/2012 15:07'!
price
	"Per each"
	^100000! !

!Truck class methodsFor: 'as yet unclassified' stamp: 'dhn 5/6/2012 15:05'!
yieldRate
	^ 0! !

!Others methodsFor: 'as yet unclassified' stamp: 'dhn 4/17/2012 12:00'!
initialize
	super initialize.
! !

!Others methodsFor: 'as yet unclassified' stamp: 'dhn 3/13/2014 12:10'!
listName
	^ 'All Players'! !

!Others methodsFor: 'as yet unclassified' stamp: 'dhn 8/27/2016 15:09:04'!
reportAsAssetFor: aPlayer
	"Answer the status report for all players"
	
	^ String streamContents: [:str |
		self owner mgr players do: [:pl | 
			str 
				newLine; 
				nextPutAll: pl identity;
				nextPut: $:; newLine;
				nextPutAll: pl years asString; 
				nextPutAll: ' years as a contractor'; newLine; 
				nextPutAll: 'Board position: ';
				nextPutAll: (self spaceOf: pl); newLine; 
				nextPut: $$;
				nextPutAll: (pl netAssets roundTo: 1) printStringWithCommas; 
				nextPutAll: ' net assets'; newLine]]! !

!Others methodsFor: 'as yet unclassified' stamp: 'dhn 4/17/2012 12:00'!
reset! !

!Others methodsFor: 'as yet unclassified' stamp: 'dhn 8/11/2017 21:11:01'!
spaceOf: aPlayer
	"Answer a string describing the player's position on the board"
	| str i1 sub2 i2 sub |
	
	str := (owner mgr spaces atWrap: aPlayer position) label.
	i1 := str indexOf: Character space ifAbsent: [0].
	sub2 := str copyFrom: i1 + 1 to: 20.
	i2 := sub2 indexOf: Character lf ifAbsent: [0].
	sub := str copyFrom: 1 to: i1 + i2 - 1.
	i2 := sub indexOf: Character lf ifAbsent: [0].
	sub at: i2 put: Character space.
	^ sub
! !

!Others class methodsFor: 'as yet unclassified' stamp: 'dhn 4/17/2012 12:00'!
price
	^ 0! !

!You methodsFor: 'as yet unclassified' stamp: 'dhn 3/13/2014 12:07'!
initialize
	super initialize.
! !

!You methodsFor: 'as yet unclassified' stamp: 'dhn 3/13/2014 12:08'!
listName
	^ 'Current Player'! !

!You methodsFor: 'as yet unclassified' stamp: 'dhn 10/6/2018 20:46:01'!
reportAsAssetFor: aPlayer
	"Answer the performance report for a player"
	| exp mkts2 limit |
	
	exp _ owner outFlow negated.
	mkts2 _ owner markets select: [:a | a value > 1].
	^ String streamContents: [:str |
		str 
			nextPut: $$;
			nextPutAll: owner inFlow asInteger printStringWithCommas;
			nextPutAll: ' income'; newLine;
		 	nextPut: $$;
			nextPutAll: (exp roundTo: 1) printStringWithCommas;
			nextPutAll: ' expense'; newLine.
		owner jobCount ~= 0
			ifTrue: [ | mavg |
				(owner jobRoll / owner jobCount) printOn: str fractionDigits: 1.
				str nextPutAll: ' = average job performance'; newLine.
				(mavg _ owner movingAvg)
					ifNotNil: [
						mavg printOn: str fractionDigits: 1.
						str nextPutAll: ' = moving average job performance'; newLine]].
		owner expenseCount > 0
			ifTrue: [str 
				nextPut: $$;
				nextPutAll: (exp // owner expenseCount roundTo: 1) printStringWithCommas;
				nextPutAll: ' average expense'; newLine].
		exp ~= 0 
			ifTrue: [
				(owner inFlow / exp) printOn: str fractionDigits: 2.
				str nextPutAll: ' = income to expense ratio'; newLine].
		str
			nextPutAll: 'Doubled markets: ';
			nextPutAll: mkts2 keys asString; newLine.					
		limit _ Construction debtLimit
			detect: [:a | a key > owner years] ifNone: [300000 negated].
		str 
			nextPut: $$;
			nextPutAll: limit value negated printStringWithCommas;
		 	nextPutAll: ' = debt limit'; newLine;
			nextPut: $$;
			nextPutAll: owner interestPd asInteger negated printStringWithCommas;
			nextPutAll: ' interest paid'; newLine;
		 	nextPutAll: owner paidInterest asString;
			nextPutAll: ' occasions interest was paid'; newLine.
		owner paidInterest = 0
			ifFalse: [str 
				nextPut: $$;
				nextPutAll: (owner interestPd negated / owner paidInterest roundTo: 1) printStringWithCommas;
				nextPutAll: ' = average interest payment'; newLine].
		str 
			nextPutAll: owner avoidedDebt asString;
			nextPutAll: ' times interest was avoided'; newLine;
		 	nextPutAll: owner shutDown asString;
			nextPutAll: ': shut down'; newLine;
		 	nextPut: $$;
			nextPutAll: (exp / (owner years + 1) roundTo: 1) printStringWithCommas;
			nextPutAll: ' average yearly expense'; newLine.
		 	(owner turns / (owner years + 1)) printOn: str fractionDigits: 1.
		str
		 	nextPutAll: ' turns per year'; newLine;
			nextPutAll: owner years asString;
			nextPutAll: ' full years contracting'; newLine]! !

!You methodsFor: 'as yet unclassified' stamp: 'dhn 4/17/2012 11:57'!
reset! !

!You class methodsFor: 'as yet unclassified' stamp: 'dhn 4/17/2012 11:57'!
price
	^ 0! !

!Exclusive methodsFor: 'accessing' stamp: 'dhn 2/27/2020 13:21:42'!
brand
	"Answer the value of brand"

	^ brand! !

!Exclusive methodsFor: 'accessing' stamp: 'dhn 2/27/2020 13:21:42'!
brand: anObject
	"Set the value of brand"

	brand _ anObject! !

!Job methodsFor: 'accessing' stamp: 'dhn 2/27/2020 12:21:34'!
market
	"Answer the value of market"

	^ market! !

!Job methodsFor: 'accessing' stamp: 'dhn 2/27/2020 12:21:34'!
market: anObject
	"Set the value of market"

	market _ anObject! !

!Weather methodsFor: 'accessing' stamp: 'dhn 2/27/2020 12:14:15'!
amount
	"Answer the value of amount"

	^ amount! !

!Weather methodsFor: 'accessing' stamp: 'dhn 2/27/2020 12:14:15'!
amount: anObject
	"Set the value of amount"

	amount _ anObject! !

!Contractor methodsFor: 'accessing' stamp: 'dhn 4/15/2012 12:45'!
addOption: anObject
	anObject notNil ifTrue: [self options addFirst: anObject].
! !

!Contractor methodsFor: 'accessing' stamp: 'dhn 8/19/2013 09:16'!
assets
	^ assets! !

!Contractor methodsFor: 'accessing' stamp: 'dhn 9/28/2016 16:59:02'!
canDoJob
	"Answer true if contractor can do this job"
	| sea req |
	
	sea _ (mgr seasonAt: position) desc.
	req _ mgr class requiredEquipment
				at: sea asSymbol
				ifAbsent: [^ false].
	self shutDown
		ifTrue: [^ false].

	^ (assets at: req) quantity > 0 and: [(mgr class franchiseSpaces includes: self position) not]! !

!Contractor methodsFor: 'accessing' stamp: 'dhn 3/18/2017 12:35:42'!
color
	"Answer the value of color"

	^ color! !

!Contractor methodsFor: 'accessing' stamp: 'dhn 3/18/2017 12:35:20'!
color: anObject
	"Set the value of color"

	color := anObject! !

!Contractor methodsFor: 'accessing' stamp: 'dhn 8/24/2016 11:02:36'!
emergencyLoan
	"Inform of the need to sell equipment"
	
	GamePopUp inform: 'You are out of money and have to sell equipment.' title: 'Auction Equipment'.
	^ 0
! !

!Contractor methodsFor: 'accessing' stamp: 'dhn 1/23/2018 20:00:12'!
jobCount
	"Answer the value of job count"
	
	^ jobCount! !

!Contractor methodsFor: 'accessing' stamp: 'dhn 8/11/2013 09:44'!
jobDone
	jobDone ifNil: [jobDone := false].
	^ jobDone! !

!Contractor methodsFor: 'accessing' stamp: 'dhn 1/23/2018 20:02:45'!
jobDone: aBool
	"Set the value of jobDone"
	
	jobDone _ aBool
! !

!Contractor methodsFor: 'accessing' stamp: 'dhn 1/23/2018 20:03:47'!
jobRoll
	"Answer the value of jobRoll"

	^ jobRoll! !

!Contractor methodsFor: 'accessing' stamp: 'dhn 4/28/2012 11:08'!
markets
	"Answer the value of markets"

	^ markets! !

!Contractor methodsFor: 'accessing' stamp: 'dhn 4/15/2012 12:46'!
options
	"Answer the value of options"

	^ options! !

!Contractor methodsFor: 'accessing' stamp: 'dhn 5/4/2012 19:41'!
priceFactor
	"Answer the value of priceFactor"
	priceFactor
		ifNil: [priceFactor := 1].
	^ priceFactor! !

!Contractor methodsFor: 'accessing' stamp: 'dhn 9/11/2014 19:53'!
priceFactor: aFactor 
	"Set the value of priceFactor"
	priceFactor := aFactor.
	^ 0
! !

!Contractor methodsFor: 'accessing' stamp: 'dhn 5/2/2012 11:12'!
split: anObject
	"Set the value of split"

	split := anObject! !

!Contractor methodsFor: 'contingency' stamp: 'dhn 4/28/2012 19:54'!
pay: anObject for: anAsset
	^ anObject * (self assets at: anAsset) quantity! !

!Contractor methodsFor: 'contingency' stamp: 'dhn 8/25/2013 12:54'!
pay: anAmount forFranchise: aSymbol 
	| owner asset |
	owner := (mgr availableOptions at: aSymbol) holder.
	owner isNil
		ifFalse: [owner = self
				ifTrue: [
					asset := assets at: aSymbol.
	asset costAvoided: asset costAvoided + anAmount negated.
					^ 0]
				ifFalse: [owner tally: anAmount negated.
					^ anAmount]].
	^ anAmount! !

!Contractor methodsFor: 'contingency' stamp: 'dhn 8/22/2013 13:44'!
propertyValue
	| tot |
	tot := 0.
	assets
		do: [:item | tot := tot + (item class price * item quantity)].
	^ tot! !

!Contractor methodsFor: 'space-related' stamp: 'dhn 10/1/2016 13:39:51'!
appendHistory
	"Add to the end of history"
	
	history addLast: self netAssets! !

!Contractor methodsFor: 'space-related' stamp: 'dhn 3/18/2017 20:52:27'!
doubledString
	"Answer the string signifying whether the market is doubled for the receiver"
	| mkt |
	
	mkt _ (mgr seasonAt: self position) desc asSymbol.
	^ (markets at: mkt ifAbsent: [^ '']) > 1 ifTrue: ['(doubled)'] ifFalse:['']! !

!Contractor methodsFor: 'space-related' stamp: 'dhn 9/27/2016 21:44:28'!
harvestPosition
	"Answer the cell number for the die during harvest"
	
	^ 1 + roll + rollAdjustment! !

!Contractor methodsFor: 'space-related' stamp: 'dhn 5/2/2012 14:30'!
reset
	shutDown := false.
	passedGo := false.
	markets keysDo: [:a | markets at: a put: 1].
	self assets do: [:a | a reset].
! !

!Contractor methodsFor: 'space-related' stamp: 'dhn 9/27/2016 21:49:22'!
rollAdjustment: anObject
	"Set the value of rollAdjustment"
	
	rollAdjustment _ anObject! !

!Contractor methodsFor: 'space-related' stamp: 'dhn 9/27/2016 21:58:58'!
rollForHarvest
	"Set the roll adjustment so that the die will be in the right position"

	rollAdjustment _ roll negated! !

!Contractor methodsFor: 'space-related' stamp: 'dhn 10/1/2016 11:21:05'!
tally: anAmount 
	"Account for a player spending or receiving anAmount"
	
	self cash: anAmount + self cash.
	anAmount > 0
		ifTrue: [self inFlow: anAmount + self inFlow]
		ifFalse: [self outFlow: anAmount + self outFlow].
	mgr updateHistory! !

!Contractor methodsFor: 'space-related' stamp: 'dhn 10/1/2016 13:41:44'!
updateHistory
	"Change current history"
	
	history at: history size put: self netAssets! !

!Contractor methodsFor: 'franchise-related' stamp: 'dhn 5/7/2012 11:08'!
avoided: anAmount for: aSymbol 
	| asset old |
	asset := self assets at: aSymbol.
	old := asset costAvoided.
	asset costAvoided: old + anAmount! !

!Contractor methodsFor: 'franchise-related' stamp: 'dhn 5/7/2012 11:14'!
earned: anAmount for: aSymbol 
	| asset old |
	asset := self assets at: aSymbol.
	old := asset gross.
	asset gross: old + anAmount! !

!Contractor methodsFor: 'franchise-related' stamp: 'dhn 5/7/2012 11:20'!
paid: anAmount for: aSymbol 
	| asset old |
	asset := self assets at: aSymbol.
	old := asset cost.
	asset cost: old + anAmount! !

!Contractor methodsFor: 'operating' stamp: 'dhn 8/1/2013 12:57'!
outOfAssets
	^ assets allSatisfy: [:a | a quantity <= 0]! !

!Contractor methodsFor: 'operating' stamp: 'dhn 10/2/2016 16:02:15'!
playerDebtLimit
	"Answer the player's debt limit based on years in business"
	^ Construction debtLimit
		detect: [:a | a key > self years]
		ifNone: [300000 negated] ! !

!Contractor methodsFor: 'operating' stamp: 'dhn 8/24/2013 12:03'!
sellAsset: aString for: aNumber 
	| lot asset |
	self tally: aNumber.
	lot := assets at: aString.
	lot gross: lot gross + aNumber.
	lot quantity: lot quantity - 1.
	asset := mgr availableOptions at: aString asSymbol.
	asset value holder = self
		ifTrue: [asset value holder: nil]! !

!Contractor methodsFor: 'initialize-release' stamp: 'dhn 5/27/2020 15:50:45'!
initialize

	cash _ 100000.
	debt _ 0.
	assets _ self setupAssets.
	assets do: [:ea | ea quantity > 0 ifTrue: [ea owner: self]].
	markets _ self setupMarkets.
	options _ OrderedCollection new.
	history _ OrderedCollection with: self netAssets.
	jobMAvg _ OrderedCollection new.
	jobRoll _ 0.
	jobCount _ 0! !

!Contractor methodsFor: 'initialize-release' stamp: 'dhn 1/18/2017 17:29:16'!
setupAssets
	"Answer the initial state for assets"
	|set|
	
	set _ Dictionary new.
	set add: #Backhoe->(Backhoe new quantity: 2; cost: 100000);
		add: #Dozer->(Dozer new quantity: 1; cost: 75000);
		add: #Excavator->Excavator new;
		add: #Grader->Grader new;
		add: #Scraper->Scraper new;
		add: #Truck->Truck new;
		add: #Yourself->You new;
		add: #Players->Others new;
		add: #Stinky->Stinky new;
		add: #LostMiner->LostMiner new;
		add: #Westwood->Westwood new;
		add: #BigPhil->BigPhil new;
		add: #Contingencies->Contingencies new;
		add: #Hints->Hints new;
		yourself.
	(set at: #Yourself) owner: self.
	(set at: #Players) owner: self.
	^ set
! !

!Contractor methodsFor: 'initialize-release' stamp: 'dhn 8/17/2016 21:50:43'!
setupMarkets
	"Answer the initial state for markets"
	
	^ Dictionary new
		add: #RESIDENTIAL -> 1;
		add: #COMMERCIAL -> 1;
		add: #INSTITUTIONAL -> 1;
		add: #MUNICIPAL -> 1;
		add: #'HEAVY HIGHWAY' -> 1;
		yourself! !

!Contractor methodsFor: 'job-related' stamp: 'dhn 3/28/2019 15:53:28'!
jobHistory: aRoll
	"Account for job performance"
	
	jobRoll _ jobRoll + aRoll.
	jobCount _ jobCount + 1.
	jobMAvg add: aRoll! !

!Contractor methodsFor: 'job-related' stamp: 'dhn 9/12/2016 20:24:24'!
jobMissed
	| market asset |
	
	market _ Contract jobSeason atWrap: position.
	market
		ifNotNil: [
			asset _ assets at: (Contract requiredEquipment at: market).
			asset missed: 1 + asset missed]! !

!Contractor methodsFor: 'job-related' stamp: 'dhn 1/23/2018 17:03:22'!
movingAvg
	"Answer the moving average of job rolls"
	| sub |
	
	^ (jobMAvg size >= self class movingAverageBase)
		ifTrue: [
			"get the last elements from jobMAvg"
			sub _ jobMAvg copyFrom: jobMAvg size - self class movingAverageBase + 1 to: jobMAvg size.
			"compute the moving average"
			(sub inject: 0 into: [:a :c | a + c]) / self class movingAverageBase]
		ifFalse: [nil]! !

!Contractor methodsFor: 'job-related' stamp: 'dhn 3/28/2019 15:52:56'!
updateJobRoll: aRoll
	"Append aRoll to jobRoll"
	
	^ jobRoll notNil 
		ifTrue: [jobRoll add: aRoll; yourself]
		ifFalse: [jobRoll _ OrderedCollection with: aRoll]! !

!Contractor class methodsFor: 'operating' stamp: 'dhn 2/16/2017 19:57:23'!
moveInterval
	"Answer the amount of time in milliseconds between moves during animation"
	
	^ 400! !

!Contractor class methodsFor: 'operating' stamp: 'dhn 1/23/2018 15:42:16'!
movingAverageBase
	"Answer the number of elements which participate in the moving average"
	
	^ 5! !

!Contingency methodsFor: 'as yet unclassified' stamp: 'dhn 9/10/2014 21:07'!
argument
	^ argument! !

!Contingency methodsFor: 'as yet unclassified' stamp: 'dhn 9/10/2014 21:07'!
argument: anObject
	argument := anObject! !

!Contingency methodsFor: 'as yet unclassified' stamp: 'dhn 9/10/2014 21:04'!
description
	^ description! !

!Contingency methodsFor: 'as yet unclassified' stamp: 'dhn 9/10/2014 21:06'!
description: aString 
	description := aString! !

!Contingency methodsFor: 'as yet unclassified' stamp: 'dhn 9/10/2014 21:08'!
factor
	^ factor! !

!Contingency methodsFor: 'as yet unclassified' stamp: 'dhn 9/10/2014 21:08'!
factor: anObject 
	factor := anObject! !

!Contingency methodsFor: 'as yet unclassified' stamp: 'dhn 9/10/2014 21:04'!
function
	^ function! !

!Contingency methodsFor: 'as yet unclassified' stamp: 'dhn 9/10/2014 21:05'!
function: aSymbol
	function := aSymbol! !

!Contingency methodsFor: 'as yet unclassified' stamp: 'dhn 9/10/2014 20:56'!
initialize
	super initialize! !

!Contingency methodsFor: 'as yet unclassified' stamp: 'dhn 9/11/2014 13:56'!
result
	^ result! !

!Contingency methodsFor: 'as yet unclassified' stamp: 'dhn 9/11/2014 13:56'!
result: anObject 
	result := anObject! !

!Contingency class methodsFor: 'as yet unclassified' stamp: 'dhn 8/29/2016 18:24:21'!
factor: aFactor text: aDescription
	"Answer a contingency"
	
	^ self new
		factor: aFactor;
		description: aDescription
	! !

!Contingency class methodsFor: 'as yet unclassified' stamp: 'dhn 9/11/2014 11:31'!
for: aSymbol with: anArgument factor: aFactor text: aDescription
	^ self new function: aSymbol;
	argument: anArgument;
	factor: aFactor;
	description: aDescription
	! !

!Announcement methodsFor: 'as yet unclassified' stamp: 'dhn 9/11/2014 17:13'!
initialize
	super initialize! !

!classDefinition: #Account category: 'Portfolio2'!
Object subclass: #Account
	instanceVariableNames: 'name'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio2'!

!Account methodsFor: 'testing' stamp: 'HAW 5/25/2019 12:23:47'!
hasRegistered: aTransaction

	self subclassResponsibility ! !

!Account methodsFor: 'testing' stamp: 'HAW 5/25/2019 12:24:25'!
isComposedBy: anAccount

	self subclassResponsibility ! !

!Account methodsFor: 'testing' stamp: 'AS 11/7/2025 11:37:43'!
name

	^name! !


!Account methodsFor: 'balance' stamp: 'HAW 5/25/2019 12:23:40'!
balance

	self subclassResponsibility ! !


!Account methodsFor: 'transactions' stamp: 'HAW 5/25/2019 12:23:27'!
addTransactionsTo: aCollectionOfTransactions

	self subclassResponsibility ! !

!Account methodsFor: 'transactions' stamp: 'HAW 5/25/2019 12:23:15'!
transactions

	self subclassResponsibility ! !


!Account methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:24:04'!
addedTo: aPortfolio

	self subclassResponsibility ! !


!classDefinition: #Portfolio category: 'Portfolio2'!
Account subclass: #Portfolio
	instanceVariableNames: 'accounts parents'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio2'!

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 11:49:20'!
accountsIncludes: anAccount

	^accounts includes: anAccount ! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:05:04'!
accountsIsEmpty
	
	^accounts isEmpty ! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 11:49:06'!
accountsSize
	
	^accounts size! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:19:20'!
add: accountToAdd

	self assertCanAdd: accountToAdd.
		
	accounts add: accountToAdd.
	accountToAdd addedTo: self 
	! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:17:31'!
rootParents
	
	| rootParents |
	
	rootParents := Set new.
	self addRootParentsTo: rootParents.
	
	^ rootParents! !


!Portfolio methodsFor: 'initialization' stamp: 'HAW 5/25/2019 12:03:18'!
initialize

	accounts := OrderedCollection new.
	parents := OrderedCollection new.! !

!Portfolio methodsFor: 'initialization' stamp: 'AS 11/7/2025 11:10:25'!
initializeName: aNameOfPortfolioOwner

	accounts := OrderedCollection new.
	parents := OrderedCollection new.
	name := aNameOfPortfolioOwner.! !

!Portfolio methodsFor: 'initialization' stamp: 'AS 11/7/2025 11:11:36'!
initializeName: aNameOfPortfolioOwner with: aReceptiveAccountToAdd

	accounts := OrderedCollection new.
	parents := OrderedCollection new.
	name := aNameOfPortfolioOwner.
	self add: aReceptiveAccountToAdd.! !

!Portfolio methodsFor: 'initialization' stamp: 'AS 11/7/2025 11:13:57'!
initializeName: aNameOfPortfolioOwner with: firstReceptiveAccountToAdd with:secondReceptiveAccountToAdd

	accounts := OrderedCollection new.
	parents := OrderedCollection new.
	name := aNameOfPortfolioOwner.
	self add: firstReceptiveAccountToAdd.
	self add: secondReceptiveAccountToAdd .! !


!Portfolio methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:19:36'!
balance
	
	^accounts sum: [ :anAccount | anAccount balance ] ifEmpty: [ 0 ]! !


!Portfolio methodsFor: 'transactions' stamp: 'HAW 5/25/2019 11:42:55'!
addTransactionsTo: aCollectionOfTransactions

	accounts do: [ :anAccount | anAccount addTransactionsTo: aCollectionOfTransactions ]! !

!Portfolio methodsFor: 'transactions' stamp: 'HAW 5/25/2019 11:38:32'!
transactions
	
	| transactions |
	
	transactions := OrderedCollection new.
	accounts do: [ :anAccount | anAccount addTransactionsTo: transactions ].
	
	^transactions ! !

!Portfolio methodsFor: 'transactions' stamp: 'AS 11/7/2025 14:57:37'!
visitTransactionsWith: anTransactionOperation

	accounts do: [ :anAccount | anAccount visitTransactionsWith: anTransactionOperation ]! !


!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:02:59'!
addedTo: aPortfolio 
	
	parents add: aPortfolio ! !


!Portfolio methodsFor: 'testing' stamp: 'HAW 5/25/2019 12:20:56'!
anyRootParentIsComposedBy: accountToAdd

	^self rootParents anySatisfy: [ :aParent | aParent isComposedBy: accountToAdd]! !

!Portfolio methodsFor: 'testing' stamp: 'HAW 5/25/2019 11:28:29'!
hasRegistered: aTransaction

	^accounts anySatisfy: [ :anAccount | anAccount hasRegistered: aTransaction ]! !

!Portfolio methodsFor: 'testing' stamp: 'HAW 5/29/2019 16:24:54'!
isComposedBy: anAccount

	^ self = anAccount or: [ accounts anySatisfy: [ :composedAccount | (composedAccount isComposedBy: anAccount) or: [ anAccount isComposedBy: composedAccount ]]]! !

!Portfolio methodsFor: 'testing' stamp: 'AS 11/7/2025 11:47:11'!
visitInstanceVariable: aVisitor

	accounts do: aVisitor! !


!Portfolio methodsFor: 'visitors' stamp: 'AS 11/7/2025 15:12:15'!
operate: anAccountOperation

	anAccountOperation visitPortfolio: self.! !

!Portfolio methodsFor: 'visitors' stamp: 'AS 11/7/2025 15:16:01'!
visitAccountsWith: anAccountOperation

	accounts do: [ :anAccount | anAccount operate: anAccountOperation ]! !


!Portfolio methodsFor: 'account management - private' stamp: 'HAW 5/25/2019 12:17:31'!
addRootParentsTo: rootParents

	parents 
		ifEmpty: [ rootParents add: self ] 
		ifNotEmpty: [ parents do: [ :aParent | aParent addRootParentsTo: rootParents ]]! !

!Portfolio methodsFor: 'account management - private' stamp: 'HAW 5/25/2019 12:20:36'!
assertCanAdd: accountToAdd

	(self anyRootParentIsComposedBy: accountToAdd) ifTrue: [ self signalCanNotAddAccount ].
! !

!Portfolio methodsFor: 'account management - private' stamp: 'HAW 5/25/2019 11:48:34'!
signalCanNotAddAccount
	
	self error: self class canNotAddAccountErrorMessage! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'Portfolio2'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'instance creation' stamp: 'AS 11/7/2025 11:05:30'!
named: aNameOfPortfolioOwner

	^self new initializeName: aNameOfPortfolioOwner! !

!Portfolio class methodsFor: 'instance creation' stamp: 'AS 11/7/2025 12:03:07'!
named: aNameOfPortfolioOwner with: aReceptiveAccountToAdd

	^self new initializeName: aNameOfPortfolioOwner with: aReceptiveAccountToAdd .! !

!Portfolio class methodsFor: 'instance creation' stamp: 'AS 11/7/2025 11:06:57'!
named: aNameOfPortfolioOwner with: firstReceptiveAccountToAdd with: secondReceptiveAccountToAdd

	^self new initializeName: aNameOfPortfolioOwner with: firstReceptiveAccountToAdd with: secondReceptiveAccountToAdd .! !

!Portfolio class methodsFor: 'instance creation' stamp: 'HAW 5/25/2019 11:18:21'!
with: anAccount

	^self new 
		add: anAccount;
		yourself! !

!Portfolio class methodsFor: 'instance creation' stamp: 'HAW 5/25/2019 11:23:59'!
with: anAccount with: anotherAccount

	^self new 
		add: anAccount;
		add: anotherAccount;
		yourself! !


!Portfolio class methodsFor: 'errorMessage' stamp: 'HAW 5/25/2019 11:48:55'!
canNotAddAccountErrorMessage
	
	^'Can not add repeated account to a portfolio'! !


!classDefinition: #ReceptiveAccount category: 'Portfolio2'!
Account subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio2'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'AS 11/7/2025 10:44:04'!
initialize

	transactions := OrderedCollection new.! !

!ReceptiveAccount methodsFor: 'initialization' stamp: 'AS 11/7/2025 10:44:01'!
initializeName: aNameOfTheReceptiveAccountOwner

	transactions := OrderedCollection new.
	name := aNameOfTheReceptiveAccountOwner.! !


!ReceptiveAccount methodsFor: 'transactions' stamp: 'HAW 5/25/2019 11:38:52'!
addTransactionsTo: aCollectionOfTransactions

	aCollectionOfTransactions addAll: transactions ! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!ReceptiveAccount methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:24:46'!
balance

	^transactions 
		inject: 0
		into: [ :currentBalance :transaction | transaction affectBalance: currentBalance ]! !


!ReceptiveAccount methodsFor: 'testing' stamp: 'NR 10/21/2019 18:55:56'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !

!ReceptiveAccount methodsFor: 'testing' stamp: 'HAW 5/25/2019 11:54:51'!
isComposedBy: anAccount

	^self = anAccount ! !


!ReceptiveAccount methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:03:32'!
addedTo: aPortfolio 
	
	! !


!ReceptiveAccount methodsFor: 'visitors' stamp: 'AS 11/7/2025 14:54:11'!
operate: anAccountVisitor

	anAccountVisitor visitReceptiveAccount: self.! !

!ReceptiveAccount methodsFor: 'visitors' stamp: 'AS 11/7/2025 14:57:26'!
visitTransactionsWith: anTransactionOperation

	transactions do: [:transaction | transaction operate: anTransactionOperation ] .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ReceptiveAccount class' category: 'Portfolio2'!
ReceptiveAccount class
	instanceVariableNames: ''!

!ReceptiveAccount class methodsFor: 'instance creation' stamp: 'AS 11/7/2025 10:42:43'!
named: aNameOfTheReceptiveAccountOwner

	^self new initializeName: aNameOfTheReceptiveAccountOwner 

	! !


!classDefinition: #AccountReport category: 'Portfolio2'!
Object subclass: #AccountReport
	instanceVariableNames: 'account'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio2'!

!AccountReport methodsFor: 'initialization' stamp: 'AS 11/7/2025 10:20:31'!
initializeOn: anAccountToReport 
	
	account := anAccountToReport.! !


!AccountReport methodsFor: 'operations' stamp: 'AS 11/7/2025 10:21:02'!
depositLegOperation: transaction

	self subclassResponsibility! !

!AccountReport methodsFor: 'operations' stamp: 'AS 11/7/2025 10:21:02'!
depositOperation: transaction

	self subclassResponsibility! !

!AccountReport methodsFor: 'operations' stamp: 'AS 11/7/2025 10:21:02'!
withdrawLegOperation: transaction

	self subclassResponsibility! !

!AccountReport methodsFor: 'operations' stamp: 'AS 11/7/2025 10:21:02'!
withdrawOperation: transaction

	self subclassResponsibility! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountReport class' category: 'Portfolio2'!
AccountReport class
	instanceVariableNames: ''!

!AccountReport class methodsFor: 'as yet unclassified' stamp: 'AS 11/7/2025 10:08:28'!
on: anAccountToReport

	self subclassResponsibility .! !


!classDefinition: #AccountSummary category: 'Portfolio2'!
AccountReport subclass: #AccountSummary
	instanceVariableNames: 'summary'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio2'!

!AccountSummary methodsFor: 'operations' stamp: 'AS 11/7/2025 09:53:37'!
depositLegOperation: transaction

	^ summary add: ('Entrada por transferencia de ', transaction value printString)! !

!AccountSummary methodsFor: 'operations' stamp: 'AS 11/7/2025 09:53:41'!
depositOperation: transaction

	^ summary add: ('Depósito por ', transaction value printString)! !

!AccountSummary methodsFor: 'operations' stamp: 'AS 11/7/2025 09:53:45'!
withdrawLegOperation: transaction

	^ summary add: ('Salida por transferencia de ', transaction value printString)! !

!AccountSummary methodsFor: 'operations' stamp: 'AS 11/7/2025 09:53:50'!
withdrawOperation: transaction

	^ summary add: ('Extracción por ', transaction value printString)! !


!AccountSummary methodsFor: 'summarize' stamp: 'AS 11/4/2025 11:36:00'!
addBalance

	^ summary add: ('Balance = ', account balance printString)! !

!AccountSummary methodsFor: 'summarize' stamp: 'AS 11/7/2025 14:51:17'!
generateTransactionsSummary

	^ account visitTransactionsWith: self.! !

!AccountSummary methodsFor: 'summarize' stamp: 'AS 11/7/2025 10:12:41'!
lines
	
	summary := OrderedCollection new.
	
	self generateTransactionsSummary.

	self addBalance.

	^summary! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountSummary class' category: 'Portfolio2'!
AccountSummary class
	instanceVariableNames: ''!

!AccountSummary class methodsFor: 'instance creation' stamp: 'AS 11/7/2025 10:14:04'!
on: anAccountToReport 

	^self new initializeOn: anAccountToReport! !


!classDefinition: #TransferNet category: 'Portfolio2'!
AccountReport subclass: #TransferNet
	instanceVariableNames: 'net'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio2'!

!TransferNet methodsFor: 'net' stamp: 'AS 11/7/2025 09:46:23'!
addNet: anAmountToAddToNet

	net := net + anAmountToAddToNet .! !

!TransferNet methodsFor: 'net' stamp: 'AS 11/7/2025 09:46:55'!
substractNet: anAmountToSubstractToNet

	net := net - anAmountToSubstractToNet .! !


!TransferNet methodsFor: 'report' stamp: 'AS 11/7/2025 14:52:29'!
calculateNetTransfer

	^ account visitTransactionsWith: self.! !

!TransferNet methodsFor: 'report' stamp: 'AS 11/7/2025 10:19:47'!
value

	net := 0.

	self calculateNetTransfer.
	
	^net.! !


!TransferNet methodsFor: 'operations' stamp: 'AS 11/7/2025 09:50:01'!
depositLegOperation: transfer

	^ self addNet: transfer value.! !

!TransferNet methodsFor: 'operations' stamp: 'AS 11/7/2025 09:50:34'!
depositOperation: transfer

	! !

!TransferNet methodsFor: 'operations' stamp: 'AS 11/7/2025 09:49:51'!
withdrawLegOperation: transfer

	^ self substractNet: transfer value! !

!TransferNet methodsFor: 'operations' stamp: 'AS 11/7/2025 09:50:40'!
withdrawOperation: transfer

	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferNet class' category: 'Portfolio2'!
TransferNet class
	instanceVariableNames: ''!

!TransferNet class methodsFor: 'instance creation' stamp: 'AS 11/7/2025 10:16:19'!
on: anAccountToReport 
	
	^self new initializeOn: anAccountToReport! !


!classDefinition: #AccountTransaction category: 'Portfolio2'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio2'!

!AccountTransaction methodsFor: 'operation' stamp: 'AS 11/7/2025 09:34:36'!
operate: aOperation

	self subclassResponsibility! !


!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:39'!
affectBalance: aBalance

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: 'Portfolio2'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'NR 10/21/2019 18:54:27'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: 'Portfolio2'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio2'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !


!Deposit methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:02'!
affectBalance: aBalance

	^aBalance + value ! !


!Deposit methodsFor: 'operation' stamp: 'AS 11/7/2025 09:53:24'!
operate: aOperation 

	aOperation depositOperation: self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'Portfolio2'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #TransferLegs category: 'Portfolio2'!
AccountTransaction subclass: #TransferLegs
	instanceVariableNames: 'transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio2'!

!TransferLegs methodsFor: 'balance' stamp: 'AS 11/4/2025 10:14:19'!
affectBalance: aBalance

	self subclassResponsibility! !


!TransferLegs methodsFor: 'testing' stamp: 'AS 11/7/2025 10:04:54'!
transfer

	^transfer! !


!TransferLegs methodsFor: 'operation' stamp: 'AS 11/7/2025 09:37:04'!
operate: aOperation

	self subclassResponsibility! !


!TransferLegs methodsFor: 'value' stamp: 'AS 11/4/2025 10:14:26'!
value

	self subclassResponsibility! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferLegs class' category: 'Portfolio2'!
TransferLegs class
	instanceVariableNames: ''!

!TransferLegs class methodsFor: 'instance creation' stamp: 'AS 11/4/2025 10:13:31'!
register: aTransfer on: account

	| transfer |
	
	transfer := self of: aTransfer.
	account register: transfer.
		
	^ transfer! !


!classDefinition: #DepositLeg category: 'Portfolio2'!
TransferLegs subclass: #DepositLeg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio2'!

!DepositLeg methodsFor: 'initialization' stamp: 'AS 11/4/2025 10:07:12'!
initializeOf: aTransfer 

	transfer := aTransfer.! !


!DepositLeg methodsFor: 'value' stamp: 'AS 11/4/2025 10:06:52'!
value

	^ transfer value! !


!DepositLeg methodsFor: 'balance' stamp: 'AS 11/4/2025 10:06:40'!
affectBalance: aBalance

	^aBalance + transfer value. ! !


!DepositLeg methodsFor: 'testing' stamp: 'AS 11/7/2025 10:02:14'!
withdrawLeg

	^transfer withdrawLeg ! !


!DepositLeg methodsFor: 'operation' stamp: 'AS 11/7/2025 09:53:09'!
operate: aOperation

	aOperation depositLegOperation: self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DepositLeg class' category: 'Portfolio2'!
DepositLeg class
	instanceVariableNames: ''!

!DepositLeg class methodsFor: 'instance creation' stamp: 'AS 11/4/2025 10:07:59'!
of: aTransfer

	^ self new initializeOf: aTransfer ! !


!classDefinition: #WithdrawLeg category: 'Portfolio2'!
TransferLegs subclass: #WithdrawLeg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio2'!

!WithdrawLeg methodsFor: 'initialization' stamp: 'AS 11/4/2025 10:08:19'!
initializeOf: aTransfer 

	transfer := aTransfer.! !


!WithdrawLeg methodsFor: 'value' stamp: 'AS 11/4/2025 10:08:19'!
value

	^ transfer value! !


!WithdrawLeg methodsFor: 'balance' stamp: 'AS 11/4/2025 10:08:28'!
affectBalance: aBalance

	^aBalance - transfer value. ! !


!WithdrawLeg methodsFor: 'testing' stamp: 'AS 11/7/2025 10:03:28'!
depositLeg

	^transfer depositLeg ! !


!WithdrawLeg methodsFor: 'operation' stamp: 'AS 11/7/2025 09:53:14'!
operate: aOperation

	aOperation withdrawLegOperation: self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'WithdrawLeg class' category: 'Portfolio2'!
WithdrawLeg class
	instanceVariableNames: ''!

!WithdrawLeg class methodsFor: 'instance creation' stamp: 'AS 11/4/2025 10:08:19'!
of: aTransfer

	^ self new initializeOf: aTransfer ! !


!classDefinition: #Withdraw category: 'Portfolio2'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio2'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !


!Withdraw methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:15'!
affectBalance: aBalance

	^aBalance - value! !


!Withdraw methodsFor: 'operation' stamp: 'AS 11/7/2025 09:53:28'!
operate: aOperation 

	aOperation withdrawOperation: self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'Portfolio2'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #PortfolioReport category: 'Portfolio2'!
Object subclass: #PortfolioReport
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio2'!

!PortfolioReport methodsFor: 'as yet unclassified' stamp: 'AS 11/7/2025 15:09:59'!
visitPortfolio: aPortfolio

	self subclassResponsibility! !

!PortfolioReport methodsFor: 'as yet unclassified' stamp: 'AS 11/7/2025 15:10:04'!
visitReceptiveAccount: aReceptiveAccount

	self subclassResponsibility! !


!classDefinition: #PortfolioSummary category: 'Portfolio2'!
PortfolioReport subclass: #PortfolioSummary
	instanceVariableNames: 'lines portfolio spaces'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio2'!

!PortfolioSummary methodsFor: 'initialization' stamp: 'AS 11/7/2025 15:23:37'!
initializePortfolio: aPortfolioToSummarize

	portfolio := aPortfolioToSummarize.! !


!PortfolioSummary methodsFor: 'summarize' stamp: 'AS 11/7/2025 15:47:53'!
addName: aNameToAdd

	lines add: spaces, aNameToAdd .! !

!PortfolioSummary methodsFor: 'summarize' stamp: 'AS 11/7/2025 15:45:51'!
addToLines: aLine
	
	lines add: spaces, aLine! !

!PortfolioSummary methodsFor: 'summarize' stamp: 'AS 11/7/2025 15:46:10'!
incrementIdentatioWhile: aBlock

	spaces := spaces, '   '.
	aBlock ensure: [ spaces := spaces allButLast: 3 ]! !

!PortfolioSummary methodsFor: 'summarize' stamp: 'AS 11/7/2025 15:48:14'!
lines

	lines := OrderedCollection new.
	spaces := ''.
	
	portfolio operate: self.
	
	^lines ! !


!PortfolioSummary methodsFor: 'visitors' stamp: 'AS 11/7/2025 16:01:25'!
visitPortfolio: aPortfolio

	self addName: aPortfolio name.
	
	self incrementIdentatioWhile: [
		aPortfolio visitAccountsWith: self.
		self addToLines: 'Balance = ', aPortfolio balance printString ].
	! !

!PortfolioSummary methodsFor: 'visitors' stamp: 'AS 11/7/2025 15:47:36'!
visitReceptiveAccount: aReceptiveAccount 
	
	| accountSummaryLines |
	
	self addName: aReceptiveAccount name.
	accountSummaryLines := (AccountSummary on: aReceptiveAccount) lines.
	self incrementIdentatioWhile: [ accountSummaryLines do: [ :aLine | self addToLines: aLine ]]
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PortfolioSummary class' category: 'Portfolio2'!
PortfolioSummary class
	instanceVariableNames: ''!

!PortfolioSummary class methodsFor: 'instance creation' stamp: 'AS 11/7/2025 15:23:57'!
on: aPortfolio

	^self new initializePortfolio: aPortfolio.! !


!classDefinition: #PortfolioTreePrinter category: 'Portfolio2'!
PortfolioReport subclass: #PortfolioTreePrinter
	instanceVariableNames: 'portfolio tree spaces'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio2'!

!PortfolioTreePrinter methodsFor: 'initialization' stamp: 'AS 11/7/2025 11:39:55'!
initializeOn: portfolioToPrint 
	
	portfolio := portfolioToPrint.! !


!PortfolioTreePrinter methodsFor: 'printer' stamp: 'AS 11/7/2025 15:10:23'!
addName: aNameToAdd

	tree add: spaces, aNameToAdd.! !

!PortfolioTreePrinter methodsFor: 'printer' stamp: 'AS 11/7/2025 15:15:03'!
lines
	
	tree := OrderedCollection new.
	spaces := ''.
	
	portfolio operate: self.
	
	^tree! !


!PortfolioTreePrinter methodsFor: 'visitors' stamp: 'AS 11/7/2025 15:17:20'!
visitPortfolio: aPortfolio

	self addName: aPortfolio name.
	spaces := spaces, '   '.
	aPortfolio visitAccountsWith: self.
	spaces := spaces allButLast: 3! !

!PortfolioTreePrinter methodsFor: 'visitors' stamp: 'AS 11/7/2025 15:18:06'!
visitReceptiveAccount: aReceptiveAccount

	self addName: aReceptiveAccount name.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PortfolioTreePrinter class' category: 'Portfolio2'!
PortfolioTreePrinter class
	instanceVariableNames: ''!

!PortfolioTreePrinter class methodsFor: 'instance creation' stamp: 'AS 11/7/2025 11:35:11'!
on: portfolio 
	
	^self new initializeOn: portfolio ! !


!classDefinition: #Transfer category: 'Portfolio2'!
Object subclass: #Transfer
	instanceVariableNames: 'value withdrawLeg depositLeg'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio2'!

!Transfer methodsFor: 'initialization' stamp: 'AS 11/4/2025 10:18:07'!
initializeAmount: aValue withdrawAccount: source depositAccount: destination 
	
	value := aValue.
	withdrawLeg := WithdrawLeg register: self on: source.
	depositLeg := DepositLeg register: self on: destination.! !


!Transfer methodsFor: 'testing' stamp: 'AS 11/4/2025 09:54:20'!
depositLeg
	
	^depositLeg! !

!Transfer methodsFor: 'testing' stamp: 'AS 11/4/2025 10:09:17'!
value
	
	^ value ! !

!Transfer methodsFor: 'testing' stamp: 'AS 11/4/2025 09:54:13'!
withdrawLeg
	
	^withdrawLeg! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: 'Portfolio2'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'instance creation' stamp: 'AS 11/7/2025 10:00:59'!
register: anAmout from: source to: destination 
	
	self assertTheSource: source isNotEqualToDestion: destination.
	
	self assertAmountIsPositive: anAmout.
	
	^self new initializeAmount: anAmout withdrawAccount: source depositAccount: destination .! !


!Transfer class methodsFor: 'error message' stamp: 'AS 11/4/2025 12:05:36'!
canNotTransferBetweenTheSameAmounts

^ 'Can not transfer between the same accounts'.
! !

!Transfer class methodsFor: 'error message' stamp: 'AS 11/4/2025 12:05:43'!
canNotTransferNonPositiveAmount

^ 'Can not transfer between the same accounts'.
! !


!Transfer class methodsFor: 'assertions' stamp: 'AS 11/4/2025 12:06:22'!
assertAmountIsPositive: anAmout

	^ anAmout <= 0 ifTrue: [self error: self canNotTransferNonPositiveAmount ]! !

!Transfer class methodsFor: 'assertions' stamp: 'AS 11/4/2025 12:06:47'!
assertTheSource: source isNotEqualToDestion: destination

	^ source = destination ifTrue: [self error: self canNotTransferBetweenTheSameAmounts ]! !


!classDefinition: #AccountSummaryTest category: 'Portfolio2'!
TestCase subclass: #AccountSummaryTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio2'!

!AccountSummaryTest methodsFor: 'test' stamp: 'AS 11/7/2025 10:13:17'!
test01SummaryOfAReceptiveAccountWithoutTransactionsHasOnlyBalance

	|account summary expectedSummary |
	
	account := ReceptiveAccount new.
	
	summary := AccountSummary on: account.
	
	expectedSummary := OrderedCollection with: 'Balance = 0'. 
	
	self assert: summary lines equals: expectedSummary! !

!AccountSummaryTest methodsFor: 'test' stamp: 'AS 11/7/2025 10:13:24'!
test02SummaryOfAReceptiveAccountWithDepositHasWithdrawReport

	|account summary expectedSummary |
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account .
	
	summary := AccountSummary on: account.
	
	expectedSummary := OrderedCollection with: 'Depósito por 100' with: 'Balance = 100'. 
	
	self assert: summary lines equals: expectedSummary! !

!AccountSummaryTest methodsFor: 'test' stamp: 'AS 11/7/2025 10:13:27'!
test03SummaryOfAReceptiveAccountWithWithdrawHasWithdrawReport

	|account summary expectedSummary |
	
	account := ReceptiveAccount new.
	Withdraw register: 100 on: account .
	
	summary := AccountSummary on: account.
	
	expectedSummary := OrderedCollection with: 'Extracción por 100' with: 'Balance = -100'. 
	
	self assert: summary lines equals: expectedSummary! !

!AccountSummaryTest methodsFor: 'test' stamp: 'AS 11/7/2025 10:13:31'!
test04SummaryOfAReceptiveAccountWithWithdrawLegHasWithdrawLegReport

	
	|source destination summary expectedSummary |
	
	source := ReceptiveAccount new.
	destination := ReceptiveAccount new.
	
	Transfer register: 100 from: source to: destination.
	
	summary := AccountSummary on: source.
	
	expectedSummary := OrderedCollection with: 'Salida por transferencia de 100' with: 'Balance = -100'. 
	
	self assert: summary lines equals: expectedSummary! !

!AccountSummaryTest methodsFor: 'test' stamp: 'AS 11/7/2025 10:13:35'!
test05SummaryOfAReceptiveAccountWithDepositLegHasDepositLegReport

	
	|source destination summary expectedSummary |
	
	source := ReceptiveAccount new.
	destination := ReceptiveAccount new.
	
	Transfer register: 100 from: source to: destination.
	
	summary := AccountSummary on: destination.
	
	expectedSummary := OrderedCollection with: 'Entrada por transferencia de 100' with: 'Balance = 100'. 
	
	self assert: summary lines equals: expectedSummary! !

!AccountSummaryTest methodsFor: 'test' stamp: 'AS 11/7/2025 10:13:44'!
test06SummaryOfAReceptiveAccountWithMultipleTransactions

	
	|source destination summary expectedSummary |
	
	source := ReceptiveAccount new.
	
	destination := ReceptiveAccount new.
	Deposit register: 400 on: destination .
	
	Transfer register: 100 from: source to: destination.
	
	Withdraw register: 200 on: destination.
	
	Transfer register: 200 from: destination to: source.
	
	summary := AccountSummary on: destination.
	
	expectedSummary := OrderedCollection with: 'Depósito por 400' with: 'Entrada por transferencia de 100' with: 'Extracción por 200' with: 'Salida por transferencia de 200' with: 'Balance = 100'. 
	
	self assert: summary lines equals: expectedSummary! !


!classDefinition: #PortfolioSummaryTest category: 'Portfolio2'!
TestCase subclass: #PortfolioSummaryTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio2'!

!PortfolioSummaryTest methodsFor: 'test' stamp: 'AS 11/7/2025 15:33:16'!
test01SummaryOfAPortfolioWithSomeReceptiveAccountsAndSubPortfolios

	|portfolio expectedSummary summary |

	portfolio := Portfolio named: 'Portfolio de Messi'.
	
	summary := PortfolioSummary on: portfolio .
	
	expectedSummary := OrderedCollection with: 'Portfolio de Messi' with: '   Balance = 0'.
	
	self assert: summary lines equals: expectedSummary! !

!PortfolioSummaryTest methodsFor: 'test' stamp: 'AS 11/7/2025 16:05:25'!
test02SummaryOfAnEmptyPortfolio

	|portfolio account1 subporfolio account2 expectedSummary summary |
	account1 := ReceptiveAccount named: 'Cuenta de De Paul'.
	Deposit register: 100 on: account1 .
	account2 := ReceptiveAccount named: 'Cuenta de Lo Celso'.
	subporfolio := Portfolio named: 'Portfolio de Paredes' with: account2.
	portfolio := Portfolio named: 'Portfolio de Messi' with: account1 with: subporfolio.
	
	summary := PortfolioSummary on: portfolio .
	
	expectedSummary := { 'Portfolio de Messi'. '   Cuenta de De Paul'. '      Depósito por 100'. '      Balance = 100'.'   Portfolio de Paredes'.'      Cuenta de Lo Celso'. '         Balance = 0'.'      Balance = 0'. '   Balance = 100'.}.
	
	self assert: summary lines equals: expectedSummary asOrderedCollection ! !


!classDefinition: #PortfolioTest category: 'Portfolio2'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio2'!

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:16:26'!
test01BalanceOfPortfolioWithoutAccountsIsZero

	self assert: 0 equals: Portfolio new balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'NR 5/27/2021 17:36:04'!
test02BalanceOfPortfolioWithAccountsIsSumOfAccountsBalance

	| account portfolio |
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	portfolio := Portfolio with: account.
	
	self assert: account balance equals: portfolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:23:25'!
test03BalanceOfPortfolioIsCalculatedRecursivelyOnPortfolios

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortofolio |
	
	simplePortfolioAccount := ReceptiveAccount new.
	Deposit register: 100 on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	Withdraw register: 50 on: composedPortfolioAccount.
	composedPortofolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	self assert: (composedPortfolioAccount balance + simplePortfolio balance) equals: composedPortofolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:43:15'!
test04PortfolioWithoutAccountsHasNoRegisteredTransaction

	self deny: (Portfolio new hasRegistered: (Deposit for: 100))! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:43:11'!
test05PortfolioHasRegisteredItsAccountsTransactions

	| account portfolio deposit |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 on: account.
	portfolio := Portfolio with: account.
	
	self assert: (portfolio hasRegistered: deposit)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:06'!
test06PortfolioLooksForRegisteredTransactionsRecursively

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortfolio composedPortfolioAccountWithdraw simplePortfolioAccountDeposit |
	
	simplePortfolioAccount := ReceptiveAccount new.
	simplePortfolioAccountDeposit := Deposit register: 100 on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	composedPortfolioAccountWithdraw := Withdraw register: 50 on: composedPortfolioAccount.
	composedPortfolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	self assert: (composedPortfolio hasRegistered: simplePortfolioAccountDeposit).
	self assert: (composedPortfolio hasRegistered: composedPortfolioAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:10'!
test07PortfolioHasNoTransactionWhenHasNoAccounts

	self assert: Portfolio new transactions isEmpty! !

!PortfolioTest methodsFor: 'tests' stamp: 'NR 6/22/2020 07:31:19'!
test08PortfolioTransactionsIncludesAllItsAccountsTransactions

	| account portfolio accountDeposit anotherAccount portfolioTransactions anotherAccountWithdraw |
	
	account := ReceptiveAccount new.
	accountDeposit := Deposit register: 100 on: account.
	anotherAccount := ReceptiveAccount new.
	anotherAccountWithdraw := Withdraw register: 100 on: account.
	portfolio := Portfolio with: account.
	
	portfolioTransactions := portfolio transactions.
	
	self assert: 2 equals: portfolioTransactions size.
	self assert: (portfolioTransactions includes: accountDeposit).
	self assert: (portfolioTransactions includes: anotherAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:20'!
test09PortfolioTransactionsAreCalculatedRecursively

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortfolio composedPortfolioAccountWithdraw simplePortfolioAccountDeposit composedPortfolioTransactions |
	
	simplePortfolioAccount := ReceptiveAccount new.
	simplePortfolioAccountDeposit := Deposit register: 100 on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	composedPortfolioAccountWithdraw := Withdraw register: 50 on: composedPortfolioAccount.
	composedPortfolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	composedPortfolioTransactions := composedPortfolio transactions.
	self assert: 2 equals: composedPortfolioTransactions size.
	self assert: (composedPortfolioTransactions includes: simplePortfolioAccountDeposit).
	self assert: (composedPortfolioTransactions includes: composedPortfolioAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:24'!
test10PortfolioCanNotIncludeTheSameAccountMoreThanOnce

	| account portfolio |
	
	account := ReceptiveAccount new.
	portfolio := Portfolio with: account.
	
	self 
		should: [ portfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: portfolio accountsSize.
			self assert: (portfolio accountsIncludes: account) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:28'!
test11PortfolioCanNotIncludeAccountOfItsPortfolios

	| account simplePortfolio composedPortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio with: account.
	composedPortfolio := Portfolio with: simplePortfolio.
	
	self 
		should: [ composedPortfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: composedPortfolio accountsSize.
			self assert: (composedPortfolio accountsIncludes: simplePortfolio) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:32'!
test12PortfolioCanNotIncludeItself

	| account simplePortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio with: account.
	
	self 
		should: [ simplePortfolio add: simplePortfolio ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: simplePortfolio accountsSize.
			self assert: (simplePortfolio accountsIncludes: account) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 12:01:51'!
test13ComposedPortfolioCanNotHaveParentPortfolioAccount

	| account simplePortfolio composedPortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio new.
	composedPortfolio := Portfolio with: simplePortfolio.
	composedPortfolio add: account.
	
	self 
		should: [ simplePortfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: simplePortfolio accountsIsEmpty ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 12:12:16'!
test14ComposedPortfolioCanNotHaveAccountOfAnyRootParentRecursively

	| account leftParentPortfolio leftRootParentPortfolio portfolio rightParentPortfolio rightRootParentPortfolio |
	
	account := ReceptiveAccount new.
	portfolio := Portfolio new.
	leftParentPortfolio := Portfolio with: portfolio .
	leftRootParentPortfolio := Portfolio with: leftParentPortfolio.
	leftRootParentPortfolio add: account.
	
	rightParentPortfolio := Portfolio with: portfolio .
	rightRootParentPortfolio := Portfolio with: rightParentPortfolio.
	rightRootParentPortfolio add: account.

	self 
		should: [ portfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: portfolio accountsIsEmpty ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/29/2019 16:31:18'!
test15PortfolioCanNotIncludeAnyOfTheComposedAccountOfPortfolioToAdd

	| portfolioToAdd portfolioToModify rootPortfolio sharedAccount |
	
	sharedAccount := ReceptiveAccount new.
	portfolioToModify := Portfolio new.
	rootPortfolio := Portfolio with: sharedAccount with: portfolioToModify.
	portfolioToAdd := Portfolio with: sharedAccount.
	
	self 
		should: [ portfolioToModify add: portfolioToAdd ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError | 
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: portfolioToModify accountsIsEmpty ]! !


!classDefinition: #PortfolioTreePrinterTest category: 'Portfolio2'!
TestCase subclass: #PortfolioTreePrinterTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio2'!

!PortfolioTreePrinterTest methodsFor: 'test' stamp: 'AS 11/7/2025 11:34:30'!
test01EmptyTreePrinter

	|portfolio expectedTree treePrinter |

	portfolio := Portfolio named: 'Portfolio de Messi'.
	
	treePrinter := PortfolioTreePrinter on: portfolio .
	
	expectedTree := OrderedCollection with: 'Portfolio de Messi'.
	
	self assert: treePrinter lines equals: expectedTree! !

!PortfolioTreePrinterTest methodsFor: 'test' stamp: 'AS 11/7/2025 12:03:21'!
test02TreePrinterOfPortfolioWithOneReceptiveAccounts

	|portfolio expectedTree treePrinter |

	portfolio := Portfolio named: 'Portfolio de Messi' with: (ReceptiveAccount named: 'Cuenta de Messi').
	
	treePrinter := PortfolioTreePrinter on: portfolio .
	
	expectedTree := OrderedCollection with: 'Portfolio de Messi' with: '   Cuenta de Messi'.
	
	self assert: treePrinter lines equals: expectedTree! !

!PortfolioTreePrinterTest methodsFor: 'test' stamp: 'AS 11/7/2025 12:03:50'!
test03TreePrinterOfPortfolioWithMutipleReceptiveAccounts

	|portfolio expectedTree treePrinter |

	portfolio := Portfolio named: 'Portfolio de Messi' with: (ReceptiveAccount named: 'Cuenta de Messi') with: (ReceptiveAccount named: 'Cuenta de De Paul').
	
	treePrinter := PortfolioTreePrinter on: portfolio .
	
	expectedTree := OrderedCollection with: 'Portfolio de Messi' with: '   Cuenta de Messi' with: '   Cuenta de De Paul'.
	
	self assert: treePrinter lines equals: expectedTree! !

!PortfolioTreePrinterTest methodsFor: 'test' stamp: 'AS 11/7/2025 12:04:13'!
test04TreePrinterOfPortfolioWithOneSubPortfolio

	|portfolio expectedTree treePrinter |

	portfolio := Portfolio named: 'Portfolio de Messi' with: (Portfolio named: 'Portfolio de De Paul').
	
	treePrinter := PortfolioTreePrinter on: portfolio .
	
	expectedTree := OrderedCollection with: 'Portfolio de Messi' with: '   Portfolio de De Paul'.
	
	self assert: treePrinter lines equals: expectedTree! !

!PortfolioTreePrinterTest methodsFor: 'test' stamp: 'AS 11/7/2025 12:04:55'!
test05TreePrinterOfPortfolioWithMultipleSubPortfolio

	|portfolio expectedTree treePrinter |

	portfolio := Portfolio named: 'Portfolio de Messi' with: (Portfolio named: 'Portfolio de De Paul') with: (Portfolio named: 'Portfolio de Paredes').
	
	treePrinter := PortfolioTreePrinter on: portfolio .
	
	expectedTree := OrderedCollection with: 'Portfolio de Messi' with: '   Portfolio de De Paul' with: '   Portfolio de Paredes'.
	
	self assert: treePrinter lines equals: expectedTree! !

!PortfolioTreePrinterTest methodsFor: 'test' stamp: 'AS 11/7/2025 11:59:27'!
test06TreePrinterOfPortfolioWithSubPortfolioAndReceptiveAccount

	|portfolio expectedTree treePrinter |

	portfolio := Portfolio named: 'Portfolio de Messi' with: (ReceptiveAccount named: 'Cuenta de De Paul') with: (Portfolio named: 'Portfolio de Paredes').
	
	treePrinter := PortfolioTreePrinter on: portfolio .
	
	expectedTree := OrderedCollection with: 'Portfolio de Messi' with: '   Cuenta de De Paul' with: '   Portfolio de Paredes'.
	
	self assert: treePrinter lines equals: expectedTree! !

!PortfolioTreePrinterTest methodsFor: 'test' stamp: 'AS 11/7/2025 15:08:11'!
test07TreePrinterOfPortfolioWithIdentacion

	|portfolio expectedTree treePrinter |

	portfolio := Portfolio named: 'Portfolio de Messi' with: (ReceptiveAccount named: 'Cuenta de De Paul') with: (Portfolio named: 'Portfolio de Paredes' with: (ReceptiveAccount named: 'Cuenta de Lo Celso')).
	
	treePrinter := PortfolioTreePrinter on: portfolio .
	
	expectedTree := OrderedCollection with: 'Portfolio de Messi' with: '   Cuenta de De Paul' with: '   Portfolio de Paredes' with: '      Cuenta de Lo Celso'.
	
	self assert: treePrinter lines equals: expectedTree! !


!classDefinition: #ReceptiveAccountTest category: 'Portfolio2'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio2'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:19:48'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance .
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:19:54'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 on: account.
		
	self assert: 100 equals: account balance .
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:02'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	Withdraw register: 50 on: account.
		
	self assert: 50 equals: account balance .
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:32'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:46'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 on: account.
	withdraw := Withdraw register: 50 on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:54'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100.
	withdraw := Withdraw for: 50.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered:withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:21:24'!
test07AccountKnowsItsTransactions 

	| account1 deposit1 |
	
	account1 := ReceptiveAccount new.
	
	deposit1 := Deposit register: 100 on: account1.
		
	self assert: 1 equals: account1 transactions size .
	self assert: (account1 transactions includes: deposit1).
! !


!classDefinition: #TransferNetTest category: 'Portfolio2'!
TestCase subclass: #TransferNetTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio2'!

!TransferNetTest methodsFor: 'test' stamp: 'AS 11/7/2025 10:16:56'!
test01NetTransferWithoutTransfers

	| source transferNet|
	
	source := ReceptiveAccount new.
	
	transferNet := TransferNet on: source.
	
	self assert: transferNet value equals: 0! !

!TransferNetTest methodsFor: 'test' stamp: 'AS 11/7/2025 10:17:10'!
test02NetTransferWithDeposit

	| source transferNet |
	
	source := ReceptiveAccount new.
	Deposit register: 100 on: source. 
		
	transferNet := TransferNet on: source.
	
	self assert: transferNet value equals: 0! !

!TransferNetTest methodsFor: 'test' stamp: 'AS 11/7/2025 10:17:26'!
test03NetTransferWithWithdraw

	| source transferNet |
	
	source := ReceptiveAccount new.
	Withdraw register: 100 on: source. 
		
	transferNet := TransferNet on: source.
	
	self assert: transferNet value equals: 0! !

!TransferNetTest methodsFor: 'test' stamp: 'AS 11/7/2025 10:17:37'!
test04NetTransferWithOutgoingTransfer

	| source destination transferNet |
	
	source := ReceptiveAccount new.
	destination:= ReceptiveAccount new.
	
	Transfer register: 100 from: source to: destination .
		
	transferNet := TransferNet on: source.
	
	self assert: transferNet value equals: -100! !

!TransferNetTest methodsFor: 'test' stamp: 'AS 11/7/2025 10:19:14'!
test05NetTransferWithIngoingTransfer

	| source destination transferNet |
	
	source := ReceptiveAccount new.
	destination:= ReceptiveAccount new.
	
	Transfer register: 100 from: source to: destination .
		
	transferNet := TransferNet on: destination.
	
	self assert: transferNet value equals: 100! !

!TransferNetTest methodsFor: 'test' stamp: 'AS 11/7/2025 10:19:23'!
test06NetTransferWithBothTransfers

	| source destination transferNet |
	
	source := ReceptiveAccount new.
	destination:= ReceptiveAccount new.
	
	Transfer register: 200 from: source to: destination.
	
	Transfer register: 100 from: destination to: source.
	
	transferNet := TransferNet on: destination.
	
	self assert: transferNet value equals: 100! !


!classDefinition: #TransferTest category: 'Portfolio2'!
TestCase subclass: #TransferTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio2'!

!TransferTest methodsFor: 'test' stamp: 'AS 11/7/2025 10:00:59'!
test01TransferAffectBalanceOfBothAccounts

	|source destination|
	
	source := ReceptiveAccount new.
	Deposit register: 100 on: source .
	destination := ReceptiveAccount new.
	
	Transfer register: 100 from: source to: destination.
	
	self assert: source balance equals: 0.
	self assert: destination balance equals: 100.! !

!TransferTest methodsFor: 'test' stamp: 'AS 11/7/2025 10:01:00'!
test02SourceAccountKnowWithdrawLeg

	|source destination transfer |
	
	source := ReceptiveAccount new.
	Deposit register: 100 on: source .
	destination := ReceptiveAccount new.
	
	transfer := Transfer register: 100 from: source to: destination.
	
	self assert: (source hasRegistered: transfer withdrawLeg).
! !

!TransferTest methodsFor: 'test' stamp: 'AS 11/7/2025 10:01:00'!
test03DestinationAccountKnowDepositLeg

	|source destination transfer |
	
	source := ReceptiveAccount new.
	Deposit register: 100 on: source .
	destination := ReceptiveAccount new.
	
	transfer := Transfer register: 100 from: source to: destination.
	
	self assert: (destination hasRegistered: transfer depositLeg).! !

!TransferTest methodsFor: 'test' stamp: 'AS 11/7/2025 10:05:30'!
test04WithdrawLegKnowDepositLeg

	|source destination transfer |
	
	source := ReceptiveAccount new.
	Deposit register: 100 on: source .
	destination := ReceptiveAccount new.
	
	transfer := Transfer register: 100 from: source to: destination.
	
	self assert: transfer withdrawLeg depositLeg equals: transfer depositLeg.! !

!TransferTest methodsFor: 'test' stamp: 'AS 11/7/2025 10:02:14'!
test05DepositLegKnowWithdrawLeg

	|source destination transfer |
	
	source := ReceptiveAccount new.
	Deposit register: 100 on: source .
	destination := ReceptiveAccount new.
	
	transfer := Transfer register: 100 from: source to: destination.
	
	self assert: transfer depositLeg withdrawLeg equals: transfer withdrawLeg.! !

!TransferTest methodsFor: 'test' stamp: 'AS 11/7/2025 10:01:00'!
test6CanNotTransferBetweenSameAccounts

	|source |
	
	source := ReceptiveAccount new.
	Deposit register: 100 on: source .
	
	self should: [Transfer register: 100 from: source to: source ] raise: Error description: [Transfer canNotTransferBetweenTheSameAmounts ].! !

!TransferTest methodsFor: 'test' stamp: 'AS 11/7/2025 10:01:00'!
test7CanNotTransferNonPositiveAmount

	|source destination |
	
	source := ReceptiveAccount new.
	Deposit register: 100 on: source .
	destination := ReceptiveAccount new.
	
	self should: [Transfer register: 0 from: source to: destination ] raise: Error description: [Transfer canNotTransferNonPositiveAmount ].! !

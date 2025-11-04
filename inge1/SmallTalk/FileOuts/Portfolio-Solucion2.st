!classDefinition: #Account category: #'Portfolio-Solucion'!
Object subclass: #Account
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!Account methodsFor: 'testing' stamp: 'HAW 5/25/2019 12:23:47'!
hasRegistered: aTransaction

	self subclassResponsibility ! !

!Account methodsFor: 'testing' stamp: 'HAW 5/25/2019 12:24:25'!
isComposedBy: anAccount

	self subclassResponsibility ! !


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


!classDefinition: #Portfolio category: #'Portfolio-Solucion'!
Account subclass: #Portfolio
	instanceVariableNames: 'accounts parents'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

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

!classDefinition: 'Portfolio class' category: #'Portfolio-Solucion'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'HAW 5/25/2019 11:48:55'!
canNotAddAccountErrorMessage
	
	^'Can not add repeated account to a portfolio'! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'HAW 5/25/2019 11:18:21'!
with: anAccount

	^self new 
		add: anAccount;
		yourself! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'HAW 5/25/2019 11:23:59'!
with: anAccount with: anotherAccount

	^self new 
		add: anAccount;
		add: anotherAccount;
		yourself! !


!classDefinition: #ReceptiveAccount category: #'Portfolio-Solucion'!
Account subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:35'!
initialize

	super initialize.
	transactions := OrderedCollection new.! !


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


!classDefinition: #AccountSummary category: #'Portfolio-Solucion'!
Object subclass: #AccountSummary
	instanceVariableNames: 'account summary'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!AccountSummary methodsFor: 'initialization' stamp: 'AS 11/4/2025 11:20:30'!
initializeFor: anAccountToSummarize 
	
	account := anAccountToSummarize.
	summary := OrderedCollection new.! !


!AccountSummary methodsFor: 'summarize' stamp: 'AS 11/4/2025 11:36:00'!
addBalance

	^ summary add: ('Balance = ', account balance printString)! !

!AccountSummary methodsFor: 'summarize' stamp: 'AS 11/4/2025 15:45:24'!
generateTransactionsSummary

	^ account transactions do: [:transaction | 
			transaction class = Deposit ifTrue: [summary add: ('Depósito por ', transaction value printString)].
			transaction class = Withdraw ifTrue: [summary add: ('Extracción por ', transaction value printString)].
			transaction class = DepositLeg ifTrue: [summary add: ('Entrada por transferencia de ', transaction value printString)].
			transaction class = WithdrawLeg ifTrue: [summary add: ('Salida por transferencia de ', transaction value printString)].
	].! !

!AccountSummary methodsFor: 'summarize' stamp: 'AS 11/4/2025 15:45:08'!
summarize
	
	self generateTransactionsSummary.

	self addBalance.

	^summary! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountSummary class' category: #'Portfolio-Solucion'!
AccountSummary class
	instanceVariableNames: ''!

!AccountSummary class methodsFor: 'instance creation' stamp: 'AS 11/4/2025 11:14:17'!
for: account 

	^(self new initializeFor: account) summarize! !


!classDefinition: #AccountTransaction category: #'Portfolio-Solucion'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:39'!
affectBalance: aBalance

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: #'Portfolio-Solucion'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'NR 10/21/2019 18:54:27'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: #'Portfolio-Solucion'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !


!Deposit methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:02'!
affectBalance: aBalance

	^aBalance + value ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: #'Portfolio-Solucion'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Withdraw category: #'Portfolio-Solucion'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !


!Withdraw methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:15'!
affectBalance: aBalance

	^aBalance - value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: #'Portfolio-Solucion'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Transfer category: #'Portfolio-Solucion'!
Object subclass: #Transfer
	instanceVariableNames: 'value withdrawLeg depositLeg'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

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

!classDefinition: 'Transfer class' category: #'Portfolio-Solucion'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'instance creation' stamp: 'AS 11/4/2025 12:06:47'!
amount: anAmout from: source to: destination 
	
	self assertTheSource: source isNotEqualToDestion: destination.
	
	self assertAmountIsPositive: anAmout.
	
	^self new initializeAmount: anAmout withdrawAccount: source depositAccount: destination .! !

!Transfer class methodsFor: 'instance creation' stamp: 'AS 11/4/2025 12:06:22'!
assertAmountIsPositive: anAmout

	^ anAmout <= 0 ifTrue: [self error: self canNotTransferNonPositiveAmount ]! !

!Transfer class methodsFor: 'instance creation' stamp: 'AS 11/4/2025 12:06:47'!
assertTheSource: source isNotEqualToDestion: destination

	^ source = destination ifTrue: [self error: self canNotTransferBetweenTheSameAmounts ]! !


!Transfer class methodsFor: 'error message' stamp: 'AS 11/4/2025 12:05:36'!
canNotTransferBetweenTheSameAmounts

^ 'Can not transfer between the same accounts'.
! !

!Transfer class methodsFor: 'error message' stamp: 'AS 11/4/2025 12:05:43'!
canNotTransferNonPositiveAmount

^ 'Can not transfer between the same accounts'.
! !



!classDefinition: #TransferLegs category: #'Portfolio-Solucion'!
Object subclass: #TransferLegs
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!TransferLegs methodsFor: 'balance' stamp: 'AS 11/4/2025 10:14:19'!
affectBalance: aBalance

	self subclassResponsibility! !


!TransferLegs methodsFor: 'testing' stamp: 'AS 11/4/2025 10:15:53'!
mmm

	self subclassResponsibility! !


!TransferLegs methodsFor: 'value' stamp: 'AS 11/4/2025 10:14:26'!
value

	self subclassResponsibility! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferLegs class' category: #'Portfolio-Solucion'!
TransferLegs class
	instanceVariableNames: ''!

!TransferLegs class methodsFor: 'instance creation' stamp: 'AS 11/4/2025 10:13:31'!
register: aTransfer on: account

	| transfer |
	
	transfer := self of: aTransfer.
	account register: transfer.
		
	^ transfer! !


!classDefinition: #DepositLeg category: #'Portfolio-Solucion'!
TransferLegs subclass: #DepositLeg
	instanceVariableNames: 'transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!DepositLeg methodsFor: 'initialization' stamp: 'AS 11/4/2025 10:07:12'!
initializeOf: aTransfer 

	transfer := aTransfer.! !


!DepositLeg methodsFor: 'value' stamp: 'AS 11/4/2025 10:06:52'!
value

	^ transfer value! !


!DepositLeg methodsFor: 'balance' stamp: 'AS 11/4/2025 10:06:40'!
affectBalance: aBalance

	^aBalance + transfer value. ! !


!DepositLeg methodsFor: 'testing' stamp: 'AS 11/4/2025 10:16:20'!
mmm

	^transfer withdrawLeg ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DepositLeg class' category: #'Portfolio-Solucion'!
DepositLeg class
	instanceVariableNames: ''!

!DepositLeg class methodsFor: 'instance creation' stamp: 'AS 11/4/2025 10:07:59'!
of: aTransfer

	^ self new initializeOf: aTransfer ! !


!classDefinition: #WithdrawLeg category: #'Portfolio-Solucion'!
TransferLegs subclass: #WithdrawLeg
	instanceVariableNames: 'transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!WithdrawLeg methodsFor: 'initialization' stamp: 'AS 11/4/2025 10:08:19'!
initializeOf: aTransfer 

	transfer := aTransfer.! !


!WithdrawLeg methodsFor: 'value' stamp: 'AS 11/4/2025 10:08:19'!
value

	^ transfer value! !


!WithdrawLeg methodsFor: 'balance' stamp: 'AS 11/4/2025 10:08:28'!
affectBalance: aBalance

	^aBalance - transfer value. ! !


!WithdrawLeg methodsFor: 'testing' stamp: 'AS 11/4/2025 10:16:25'!
mmm

	 ^transfer depositLeg! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'WithdrawLeg class' category: #'Portfolio-Solucion'!
WithdrawLeg class
	instanceVariableNames: ''!

!WithdrawLeg class methodsFor: 'instance creation' stamp: 'AS 11/4/2025 10:08:19'!
of: aTransfer

	^ self new initializeOf: aTransfer ! !


!classDefinition: #TransferNet category: #'Portfolio-Solucion'!
Object subclass: #TransferNet
	instanceVariableNames: 'account source_CHANGE_ME net'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!TransferNet methodsFor: 'initialization' stamp: 'AS 11/4/2025 15:40:09'!
initializeFor: anAccountToReportTheTransferNet 
	
	account := anAccountToReportTheTransferNet.
	net := 0.! !


!TransferNet methodsFor: 'report' stamp: 'AS 11/4/2025 15:43:31'!
calculateNetTransfer

	^ account transactions do: [:transfer | 
		transfer class = WithdrawLeg ifTrue: [net := net - transfer value].
		transfer class = DepositLeg ifTrue: [net := net + transfer value].
	]! !

!TransferNet methodsFor: 'report' stamp: 'AS 11/4/2025 15:43:31'!
reportTransferNet

	self calculateNetTransfer.
	
	^net.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferNet class' category: #'Portfolio-Solucion'!
TransferNet class
	instanceVariableNames: ''!

!TransferNet class methodsFor: 'instance creation' stamp: 'AS 11/4/2025 15:36:24'!
for: source 
	
	^(self new initializeFor: source) reportTransferNet! !


!classDefinition: #AccountSummaryTest category: #'Portfolio-Solucion'!
TestCase subclass: #AccountSummaryTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!AccountSummaryTest methodsFor: 'test' stamp: 'AS 11/4/2025 11:12:57'!
test01SummaryOfAReceptiveAccountWithoutTransactionsHasOnlyBalance

	|account summary expectedSummary |
	
	account := ReceptiveAccount new.
	
	summary := AccountSummary for: account.
	
	expectedSummary := OrderedCollection with: 'Balance = 0'. 
	
	self assert: summary equals: expectedSummary! !

!AccountSummaryTest methodsFor: 'test' stamp: 'AS 11/4/2025 11:39:14'!
test02SummaryOfAReceptiveAccountWithDepositHasWithdrawReport

	|account summary expectedSummary |
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account .
	
	summary := AccountSummary for: account.
	
	expectedSummary := OrderedCollection with: 'Depósito por 100' with: 'Balance = 100'. 
	
	self assert: summary equals: expectedSummary! !

!AccountSummaryTest methodsFor: 'test' stamp: 'AS 11/4/2025 11:39:43'!
test03SummaryOfAReceptiveAccountWithWithdrawHasWithdrawReport

	|account summary expectedSummary |
	
	account := ReceptiveAccount new.
	Withdraw register: 100 on: account .
	
	summary := AccountSummary for: account.
	
	expectedSummary := OrderedCollection with: 'Extracción por 100' with: 'Balance = -100'. 
	
	self assert: summary equals: expectedSummary! !

!AccountSummaryTest methodsFor: 'test' stamp: 'AS 11/4/2025 11:45:25'!
test04SummaryOfAReceptiveAccountWithWithdrawLegHasWithdrawLegReport

	
	|source destination summary expectedSummary |
	
	source := ReceptiveAccount new.
	destination := ReceptiveAccount new.
	
	Transfer amount: 100 from: source to: destination.
	
	summary := AccountSummary for: source.
	
	expectedSummary := OrderedCollection with: 'Salida por transferencia de 100' with: 'Balance = -100'. 
	
	self assert: summary equals: expectedSummary! !

!AccountSummaryTest methodsFor: 'test' stamp: 'AS 11/4/2025 11:45:46'!
test05SummaryOfAReceptiveAccountWithDepositLegHasDepositLegReport

	
	|source destination summary expectedSummary |
	
	source := ReceptiveAccount new.
	destination := ReceptiveAccount new.
	
	Transfer amount: 100 from: source to: destination.
	
	summary := AccountSummary for: destination.
	
	expectedSummary := OrderedCollection with: 'Entrada por transferencia de 100' with: 'Balance = 100'. 
	
	self assert: summary equals: expectedSummary! !

!AccountSummaryTest methodsFor: 'test' stamp: 'AS 11/4/2025 11:52:24'!
test06SummaryOfAReceptiveAccountWithMultipleTransactions

	
	|source destination summary expectedSummary |
	
	source := ReceptiveAccount new.
	
	destination := ReceptiveAccount new.
	Deposit register: 400 on: destination .
	
	Transfer amount: 100 from: source to: destination.
	
	Withdraw register: 200 on: destination.
	
	Transfer amount: 200 from: destination to: source.
	
	summary := AccountSummary for: destination.
	
	expectedSummary := OrderedCollection with: 'Depósito por 400' with: 'Entrada por transferencia de 100' with: 'Extracción por 200' with: 'Salida por transferencia de 200' with: 'Balance = 100'. 
	
	self assert: summary equals: expectedSummary! !


!classDefinition: #PortfolioTest category: #'Portfolio-Solucion'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

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


!classDefinition: #ReceptiveAccountTest category: #'Portfolio-Solucion'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

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


!classDefinition: #TransferNetTest category: #'Portfolio-Solucion'!
TestCase subclass: #TransferNetTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!TransferNetTest methodsFor: 'test' stamp: 'AS 11/4/2025 15:34:17'!
test01NetTransferWithoutTransfers

	| source |
	
	source := ReceptiveAccount new.
	
	self assert: (TransferNet for: source) equals: 0! !

!TransferNetTest methodsFor: 'test' stamp: 'AS 11/4/2025 15:37:48'!
test02NetTransferWithOutgoingTransfer

	| source destination |
	
	source := ReceptiveAccount new.
	destination:= ReceptiveAccount new.
	
	Transfer amount: 100 from: source to: destination .
	
	self assert: (TransferNet for: source) equals: -100! !

!TransferNetTest methodsFor: 'test' stamp: 'AS 11/4/2025 15:40:51'!
test03NetTransferWithIngoingTransfer

	| source destination |
	
	source := ReceptiveAccount new.
	destination:= ReceptiveAccount new.
	
	Transfer amount: 100 from: source to: destination .
	
	self assert: (TransferNet for: destination) equals: 100! !

!TransferNetTest methodsFor: 'test' stamp: 'AS 11/4/2025 15:41:54'!
test04NetTransferWithBothTransfers

	| source destination |
	
	source := ReceptiveAccount new.
	destination:= ReceptiveAccount new.
	
	Transfer amount: 200 from: source to: destination.
	
	Transfer amount: 100 from: destination to: source.
	
	self assert: (TransferNet for: destination) equals: 100! !


!classDefinition: #TransferTest category: #'Portfolio-Solucion'!
TestCase subclass: #TransferTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!TransferTest methodsFor: 'test' stamp: 'AS 11/4/2025 09:46:10'!
test01TransferAffectBalanceOfBothAccounts

	|source destination|
	
	source := ReceptiveAccount new.
	Deposit register: 100 on: source .
	destination := ReceptiveAccount new.
	
	Transfer amount: 100 from: source to: destination.
	
	self assert: source balance equals: 0.
	self assert: destination balance equals: 100.! !

!TransferTest methodsFor: 'test' stamp: 'AS 11/4/2025 10:19:28'!
test02SourceAccountKnowWithdrawLeg

	|source destination transfer |
	
	source := ReceptiveAccount new.
	Deposit register: 100 on: source .
	destination := ReceptiveAccount new.
	
	transfer := Transfer amount: 100 from: source to: destination.
	
	self assert: (source hasRegistered: transfer withdrawLeg).
! !

!TransferTest methodsFor: 'test' stamp: 'AS 11/4/2025 10:19:49'!
test03DestinationAccountKnowDepositLeg

	|source destination transfer |
	
	source := ReceptiveAccount new.
	Deposit register: 100 on: source .
	destination := ReceptiveAccount new.
	
	transfer := Transfer amount: 100 from: source to: destination.
	
	self assert: (destination hasRegistered: transfer depositLeg).! !

!TransferTest methodsFor: 'test' stamp: 'AS 11/4/2025 10:18:38'!
test04WithdrawLegKnowDepositLeg

	|source destination transfer |
	
	source := ReceptiveAccount new.
	Deposit register: 100 on: source .
	destination := ReceptiveAccount new.
	
	transfer := Transfer amount: 100 from: source to: destination.
	
	self assert: transfer withdrawLeg mmm equals: transfer depositLeg.! !

!TransferTest methodsFor: 'test' stamp: 'AS 11/4/2025 10:18:51'!
test05DepositLegKnowWithdrawLeg

	|source destination transfer |
	
	source := ReceptiveAccount new.
	Deposit register: 100 on: source .
	destination := ReceptiveAccount new.
	
	transfer := Transfer amount: 100 from: source to: destination.
	
	self assert: transfer depositLeg mmm equals: transfer withdrawLeg.! !

!TransferTest methodsFor: 'test' stamp: 'AS 11/4/2025 12:08:01'!
test6CanNotTransferBetweenSameAccounts

	|source |
	
	source := ReceptiveAccount new.
	Deposit register: 100 on: source .
	
	self should: [Transfer amount: 100 from: source to: source ] raise: Error description: [Transfer canNotTransferBetweenTheSameAmounts ].! !

!TransferTest methodsFor: 'test' stamp: 'AS 11/4/2025 12:09:19'!
test7CanNotTransferNonPositiveAmount

	|source destination |
	
	source := ReceptiveAccount new.
	Deposit register: 100 on: source .
	destination := ReceptiveAccount new.
	
	self should: [Transfer amount: 0 from: source to: destination ] raise: Error description: [Transfer canNotTransferNonPositiveAmount ].! !

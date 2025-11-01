!classDefinition: #AccountTransaction category: #'Portfolio-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'AS 10/24/2025 21:00:08'!
affectBalance: aTataBalance

	self subclassResponsibility! !

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: #'Portfolio-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'NR 10/17/2019 03:22:00'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: #'Portfolio-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'AS 10/24/2025 21:00:47'!
affectBalance: aTataBalance

	^aTataBalance + value.! !

!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: #'Portfolio-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Withdraw category: #'Portfolio-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'AS 10/24/2025 21:04:45'!
affectBalance: aTataBalance

	^aTataBalance - value. ! !

!Withdraw methodsFor: 'value' stamp: 'AS 10/24/2025 21:03:58'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: #'Portfolio-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Portfolio category: #'Portfolio-Ejercicio'!
Object subclass: #Portfolio
	instanceVariableNames: 'accounts portfolios'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Portfolio methodsFor: 'accounts' stamp: 'AS 10/24/2025 21:44:26'!
addReceptiveAccount: aReceptiveAccount

	accounts add: aReceptiveAccount .! !


!Portfolio methodsFor: 'initialization' stamp: 'AS 10/28/2025 09:38:04'!
initialize

	accounts := OrderedCollection new.
	portfolios := OrderedCollection new.! !


!Portfolio methodsFor: 'portfolios' stamp: 'AS 10/28/2025 09:38:18'!
addPortfolio: aPortfolio

	portfolios add: aPortfolio.! !


!Portfolio methodsFor: 'testing' stamp: 'AS 10/28/2025 10:25:48'!
hasRegistered: aTransaction

	^self transactions includes: aTransaction .! !


!Portfolio methodsFor: 'transactions' stamp: 'AS 10/28/2025 10:22:00'!
transactions

	| transactions |
	
	transactions := OrderedCollection new.
	
	accounts collect: [:account | transactions addAllLast: account transactions].
	
	portfolios collect: [:portfolio | transactions addAllLast: portfolio transactions].
	
	^transactions 
! !


!Portfolio methodsFor: 'balance' stamp: 'AS 10/28/2025 10:01:29'!
accountBalances

	^ accounts sum: [:account | account balance] ifEmpty: [0]! !

!Portfolio methodsFor: 'balance' stamp: 'AS 10/28/2025 10:03:15'!
balance
	
	^self accountBalances + self portfolioBalances.! !

!Portfolio methodsFor: 'balance' stamp: 'AS 10/28/2025 10:01:53'!
portfolioBalances

	^ portfolios sum: [:portfolio | portfolio balance] ifEmpty: [0]! !


!classDefinition: #ReceptiveAccount category: #'Portfolio-Ejercicio'!
Object subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'NR 10/17/2019 15:06:56'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!ReceptiveAccount methodsFor: 'balance' stamp: 'AS 10/24/2025 21:26:06'!
balance

	|tataBalance|
	
	tataBalance := 0.

	transactions do: [:transaction | tataBalance := transaction affectBalance: tataBalance].
	
	^tataBalance .! !


!ReceptiveAccount methodsFor: 'testing' stamp: 'NR 10/17/2019 03:28:43'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !


!classDefinition: #PortfolioTest category: #'Portfolio-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!PortfolioTest methodsFor: 'test' stamp: 'AS 10/24/2025 21:49:36'!
test01GetBalanceFromAnEmptyPortfolio

	| portfolio |
	
	portfolio := Portfolio new.
	
	self assert: 0 equals: portfolio balance! !

!PortfolioTest methodsFor: 'test' stamp: 'AS 10/24/2025 21:48:55'!
test02AddOneAccountToPortfolio

	| portfolio receptiveAccount |
	
	portfolio := Portfolio new.
	
	receptiveAccount := ReceptiveAccount new.
	Deposit register: 100 on: receptiveAccount.
	
	portfolio addReceptiveAccount: receptiveAccount .
	
	self assert: 100 equals: portfolio balance! !

!PortfolioTest methodsFor: 'test' stamp: 'AS 10/24/2025 21:48:27'!
test03AddTwoAccountsToPortfolio

	| portfolio receptiveAccount1 receptiveAccount2 |
	
	portfolio := Portfolio new.
	
	receptiveAccount1 := ReceptiveAccount new.
	Deposit register: 100 on: receptiveAccount1.
	
	receptiveAccount2 := ReceptiveAccount new.
	Deposit register: 200 on: receptiveAccount2.
	
	portfolio addReceptiveAccount: receptiveAccount1 .
	portfolio addReceptiveAccount: receptiveAccount2 .
	
	self assert: 300 equals: portfolio balance! !

!PortfolioTest methodsFor: 'test' stamp: 'AS 10/28/2025 09:40:18'!
test04AddOnePortfolioToPortfolio

	| portfolio subPortfolio receptiveAccount |
	
	portfolio := Portfolio new.
	
	subPortfolio := Portfolio new.
	
	receptiveAccount := ReceptiveAccount new.
	Deposit register: 100 on: receptiveAccount.
	
	subPortfolio addReceptiveAccount: receptiveAccount.
	
	portfolio addPortfolio: subPortfolio.

	self assert: 100 equals: portfolio balance! !

!PortfolioTest methodsFor: 'test' stamp: 'AS 10/28/2025 09:37:26'!
test05AddMoreThanOnePortfolioToPortfolio

	| portfolio subPortfolio1 subPortfolio2 receptiveAccount1 receptiveAccount2 |
	
	portfolio := Portfolio new.
	
	subPortfolio1 := Portfolio new.
	subPortfolio2 := Portfolio new.
	
	receptiveAccount1 := ReceptiveAccount new.
	Deposit register: 100 on: receptiveAccount1.
	
	subPortfolio1 addReceptiveAccount: receptiveAccount1.
	
	receptiveAccount2 := ReceptiveAccount new.
	Deposit register: 400 on: receptiveAccount2.
	
	subPortfolio2 addReceptiveAccount: receptiveAccount2.
	
	portfolio addPortfolio: subPortfolio1.
	portfolio addPortfolio: subPortfolio2.
	
	self assert: 500 equals: portfolio balance! !

!PortfolioTest methodsFor: 'test' stamp: 'AS 10/28/2025 10:23:51'!
test06PortfolioHasRegisteredATransaction

	| portfolio subPortfolio receptiveAccount transaction |
	
	portfolio := Portfolio new.
	
	subPortfolio := Portfolio new.
	
	receptiveAccount := ReceptiveAccount new.
	transaction := Deposit register: 200 on: receptiveAccount.
	
	subPortfolio addReceptiveAccount: receptiveAccount.
	
	portfolio addPortfolio: subPortfolio.

	self assert: (portfolio hasRegistered: transaction)! !

!PortfolioTest methodsFor: 'test' stamp: 'AS 10/28/2025 10:26:03'!
test07PortfolioKnowsItsTransactions

	| portfolio subPortfolio receptiveAccount transaction|
	
	portfolio := Portfolio new.
	
	subPortfolio := Portfolio new.
	
	receptiveAccount := ReceptiveAccount new.
	transaction := Deposit register: 100 on: receptiveAccount.
	
	subPortfolio addReceptiveAccount: receptiveAccount.
	
	portfolio addPortfolio: subPortfolio.
	
	self assert: (portfolio transactions includes: transaction).! !


!classDefinition: #ReceptiveAccountTest category: #'Portfolio-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'AS 10/24/2025 21:02:42'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'AS 10/24/2025 21:02:51'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 on: account.
		
	self assert: 100 equals: account balance.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'AS 10/24/2025 21:02:56'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	Withdraw register: 50 on: account.
		
	self assert: 50 equals: account balance.
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

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 5/17/2021 17:29:53'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| deposit withdraw account |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 200.
	withdraw := Withdraw for: 50.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered:withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 11/2/2020 17:14:01'!
test07AccountKnowsItsTransactions 

	| account1 deposit1 |
	
	account1 := ReceptiveAccount new.
	
	deposit1 := Deposit register: 50 on: account1.
		
	self assert: 1 equals: account1 transactions size.
	self assert: (account1 transactions includes: deposit1).
! !

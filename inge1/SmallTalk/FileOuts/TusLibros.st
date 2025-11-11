!classDefinition: #CartTest category: #TusLibros!
TestCase subclass: #CartTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CartTest methodsFor: 'tests' stamp: 'AS 11/11/2025 11:02:09'!
test01ElCarritoSeCreaVacio

	|cart catalog|
	
	catalog := Set new.
	
	cart := Cart acceptingItemsOf: catalog.
	
	self assert: cart isEmpty! !

!CartTest methodsFor: 'tests' stamp: 'AS 11/11/2025 11:03:07'!
test02ElCarritoAgregaUnLibroQueEstaEnElCatalogo

	|cart catalog book|
	
	book := 'Manual'.
	catalog := Set with: book.
	
	cart := Cart acceptingItemsOf: catalog.
	
	cart add: book.
	
	self assert: (cart includes: book).! !

!CartTest methodsFor: 'tests' stamp: 'AS 11/11/2025 11:12:37'!
test03ElCarritoNoPuedeAgregaUnLibroQueNoEstaEnElCatalogo

	|cart catalog book|
	
	book := 'Manual'.
	catalog := Set with: book.
	
	cart := Cart acceptingItemsOf: catalog.
	
	self should: [cart add: 'Diccionario'.] raise: Error description: [Cart addingBookErrorMessage ].
	self deny: (cart includes: 'Diccionario').! !

!CartTest methodsFor: 'tests' stamp: 'AS 11/11/2025 11:04:53'!
test04ElCarritoPuedeAgregaMasUnLibroQueEsteEnElCatalogo

	|cart catalog book|
	
	book := 'Manual'.
	catalog := Set with: book.
	
	cart := Cart acceptingItemsOf: catalog.
	
	cart add: 3 of: book.
	
	self assert: (cart includes: book).
	self assert: (cart occurrencesOf: book) equals: 3.! !


!classDefinition: #Cart category: #TusLibros!
Object subclass: #Cart
	instanceVariableNames: 'items catalog'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cart methodsFor: 'testing' stamp: 'AS 11/11/2025 11:01:38'!
includes: aBook
	^items includes: aBook.! !

!Cart methodsFor: 'testing' stamp: 'AS 11/11/2025 10:52:14'!
isEmpty

	^items size = 0.! !

!Cart methodsFor: 'testing' stamp: 'AS 11/11/2025 11:06:30'!
occurrencesOf: aBook 
	
	^items occurrencesOf: aBook .! !


!Cart methodsFor: 'initialization' stamp: 'AS 11/11/2025 10:14:45'!
initialize

	items := Bag new.! !

!Cart methodsFor: 'initialization' stamp: 'AS 11/11/2025 11:00:13'!
initializeAcceptingItemsOf: aCatalog 
	
	catalog := aCatalog.
	items := Bag new.! !


!Cart methodsFor: 'assertions' stamp: 'AS 11/11/2025 11:11:37'!
assertBookIsInTheCatalog: aBookToAdd

	^ (catalog includes: aBookToAdd) ifFalse: [self error: Cart addingBookErrorMessage]! !


!Cart methodsFor: 'adding' stamp: 'AS 11/11/2025 11:11:37'!
add: aBookToAdd 

	self assertBookIsInTheCatalog: aBookToAdd.
	
	items add: aBookToAdd.! !

!Cart methodsFor: 'adding' stamp: 'AS 11/11/2025 11:06:00'!
add: quantityOfBooks of: aBook 
	quantityOfBooks timesRepeat: [self add: aBook ].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cart class' category: #TusLibros!
Cart class
	instanceVariableNames: ''!

!Cart class methodsFor: 'error message' stamp: 'AS 11/11/2025 11:10:35'!
addingBookErrorMessage

	'Can not add a book that is not in the catalog'! !


!Cart class methodsFor: 'instance creation' stamp: 'AS 11/11/2025 10:59:18'!
acceptingItemsOf: catalog 

	^self new initializeAcceptingItemsOf: catalog ! !

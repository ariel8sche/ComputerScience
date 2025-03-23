https://github.com/Cuis-Smalltalk/Games/tree/master/Solitaire
=============================
# Techniques of Interest

- Shows the structure of a complex application with a number of classes.

- Drag 'n Drop

- Card Images

- Undo

- Momento Pattern: save/restore game play

- FreeCell and Klondike games share behaviors implemented in their parent class: CardTableMorph

- Rule based interactions.  E.g. CardContainerMorph>>okToPickUp: aCard

- Continuation Passing: Card Moves are animated asynchronously, passing in the 'next' action.  See CardTableMorph>>slideto:nSteps:delay:next:

- Dynamic DropShadows: See CardMorph>>setDropShadowMorph

- CardTableMorph class initializes games and causes table setup for Klondike, FreeCell, your-solitaire-game-here.

- FreeCell and Klondike register with the FileList to restore saved game files.

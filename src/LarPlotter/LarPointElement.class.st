Class {
	#name : 'LarPointElement',
	#superclass : 'BlElement',
	#instVars : [
		'point',
		'sizePoint'
	],
	#category : 'LarPlotter-Element',
	#package : 'LarPlotter',
	#tag : 'Element'
}

{ #category : 'as yet unclassified' }
LarPointElement >> centerOn: aPoint [
	self relocate: aPoint - ((self defaultSize +self sizePoint) / 2)
]

{ #category : 'as yet unclassified' }
LarPointElement >> changeColorToBlue [
 self  background: (Color fromHexString: '#0000ff')
]

{ #category : 'as yet unclassified' }
LarPointElement >> changeColorToGreen [
 self  background: (Color fromHexString: '#0B6623')
]

{ #category : 'as yet unclassified' }
LarPointElement >> changeColorToRed [
 self  background: (Color fromHexString: '#d30000')
]

{ #category : 'as yet unclassified' }
LarPointElement >> changeColorToYellow [
 self  background: (Color fromHexString: '#ffff00')
]

{ #category : 'as yet unclassified' }
LarPointElement >> defaultSize [
	^ 7 @ 7
]

{ #category : 'as yet unclassified' }
LarPointElement >> increaseSize [
self sizePoint: sizePoint + 1.

self
size:  (self defaultSize + self sizePoint);
centerOn: (point x @ point y).
]

{ #category : 'as yet unclassified' }
LarPointElement >> initialize: aPoint [
	| aMouseOverHandler aMouseOutHandler |
	self sizePoint: 0 @ 0.
	super initialize.
	point := aPoint.


	aMouseOverHandler := BlEventHandler
			on: BlMouseOverEvent
			do: [ :anEvent "anEvent currentTarget background: Color veryVeryLightGray." | anEvent currentTarget border: (BlBorder paint: Color red width: 2) ].
	aMouseOutHandler := BlEventHandler
			on: BlMouseOutEvent
			do: [ :anEvent "anEvent currentTarget background: Color white." | anEvent currentTarget border: (BlBorder paint: Color black) ].
	^ self
		size: self defaultSize;
		
		geometry: BlCircleGeometry new;
		centerOn: aPoint x @ aPoint y;
		background: Color lightGray;
		when: BlClickEvent
			do: [ :event | event currentTarget phlow spawnObject: point object ];
		addEventHandler: aMouseOverHandler;
		addEventHandler: aMouseOutHandler;
		aptitude: (BrGlamorousWithExplicitContextMenuAptitude
				items: {'Inspect Point Object' -> [  :event | event phlow spawnObject: point object].
						'Inspect Point' -> [  :event | event phlow spawnObject: point ].
						'Increase Size' -> [ self increaseSize].
						'Change Color to Blue' -> [ self changeColorToBlue ].
						'Change Color to Red' -> [ self changeColorToRed ].
						'Change Color to Green' -> [ self changeColorToGreen ].
						'Change Color to Yellow' -> [ self changeColorToYellow ]});
		aptitude: (BrGlamorousWithExplicitTooltipAptitude text: point tooltip);
		yourself	
]

{ #category : 'accessing' }
LarPointElement >> sizePoint [
	^ sizePoint
]

{ #category : 'accessing' }
LarPointElement >> sizePoint: anObject [
	sizePoint := anObject
]

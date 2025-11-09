Class {
	#name : #LarPointElement,
	#superclass : #BlElement,
	#instVars : [
		'point',
		'sizePoint'
	],
	#category : #'LarPlotter-Element'
}

{ #category : #'as yet unclassified' }
LarPointElement >> centerOn: aPoint [
	self relocate: aPoint - ((self defaultSize +self sizePoint) / 2)
]

{ #category : #'as yet unclassified' }
LarPointElement >> defaultSize [
	^ 7 @ 7
]

{ #category : #'as yet unclassified' }
LarPointElement >> increaseSize [
self sizePoint: sizePoint + 1.

self
size:  (self defaultSize + self sizePoint);
centerOn: (point x @ point y).
]

{ #category : #'as yet unclassified' }
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
		aptitude: (BrGlamorousWithExplicitTooltipAptitude text: point tooltip);
		geometry: BlCircleGeometry new;
		centerOn: aPoint x @ aPoint y;
		background: Color lightGray;
		when: BlClickEvent
			do: [ :event | event currentTarget phlow spawnObject: point object ];
		addEventHandler: aMouseOverHandler;
		addEventHandler: aMouseOutHandler;
		yourself	"relocate: aPoint x @ aPoint y - 100@100;"
]

{ #category : #accessing }
LarPointElement >> sizePoint [
	^ sizePoint
]

{ #category : #accessing }
LarPointElement >> sizePoint: anObject [
	sizePoint := anObject
]

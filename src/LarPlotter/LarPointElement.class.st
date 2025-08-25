Class {
	#name : #LarPointElement,
	#superclass : #BlElement,
	#instVars : [
		'point'
	],
	#category : #'LarPlotter-Element'
}

{ #category : #'as yet unclassified' }
LarPointElement >> centerOn: aPoint [
	self relocate: aPoint - (self defaultSize / 2)
]

{ #category : #'as yet unclassified' }
LarPointElement >> defaultSize [
	^ 20 @ 20
]

{ #category : #'as yet unclassified' }
LarPointElement >> initialize: aPoint [
	super initialize.
	point := aPoint.
	^ self
		size: self defaultSize;
		geometry: BlCircleGeometry new;
		centerOn: (aPoint x @ aPoint y);
		background: Color lightGray	"relocate: aPoint x @ aPoint y - 100@100;"
]

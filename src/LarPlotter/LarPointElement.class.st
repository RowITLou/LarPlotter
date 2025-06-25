Class {
	#name : #LarPointElement,
	#superclass : #BlPoint2D,
	#instVars : [
		'point'
	],
	#category : #'LarPlotter-Element'
}

{ #category : #'as yet unclassified' }
LarPointElement >> initialize: aPoint [
	
	super initialize.
	point := aPoint.
	^self 
	x: point x;
	y: point y.
	
	
]

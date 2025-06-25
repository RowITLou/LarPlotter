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
	<return: #BlElement>
	super initialize.
	^self 
	x: aPoint x;
	y: aPoint y.
	
	
]

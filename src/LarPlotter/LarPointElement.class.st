Class {
	#name : #LarPointElement,
	#superclass : #BlElement,
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
	    size: 20@20;
	    geometry: BlCircleGeometry new;
	    relocate:(aPoint x)@(aPoint y);
		
		background: Color lightGray.
		
]

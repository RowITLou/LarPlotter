"
This class creates elements for ticks on the y axis in a graph
"
Class {
	#name : #LarTickYElement,
	#superclass : #BlElement,
	#instVars : [
		'width',
		'length',
		'tick'
	],
	#category : #'LarPlotter-Element'
}

{ #category : #'as yet unclassified' }
LarTickYElement >> initialize: aTick [
"<return: #LarTickElement>"
super initialize. 
    tick := aTick.
	^self
	size: (tick length) @ (tick width);
	border: (BlBorder paint: Color black width: 1);
	background: (BlBackground paint: Color black);
	constraintsDo: [ :c |
		c grid vertical alignTop.
		c grid horizontal alignCenter ]; yourself.
]

"
This class creates elements for ticks on the y axis in a graph
"
Class {
	#name : #LarTickYElement,
	#superclass : #BlElement,
	#instVars : [
		'width',
		'length'
	],
	#category : #'LarPlotter-Element'
}

{ #category : #'as yet unclassified' }
LarTickYElement >> create: sizeWidth with: sizeLength [
"<return: #LarTickElement>"
super initialize. 
    width:= sizeWidth.
    length:= sizeLength.
	^self
	size: length@ width;
	border: (BlBorder paint: Color black width: 1);
	background: (BlBackground paint: Color black);
	constraintsDo: [ :c |
		c grid vertical alignCenter.
		c grid horizontal alignCenter ]; yourself.
]

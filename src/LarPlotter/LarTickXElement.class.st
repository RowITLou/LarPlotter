"
This class creates the element for ticks on the x axis for a graph
"
Class {
	#name : #LarTickXElement,
	#superclass : #BlElement,
	#instVars : [
		'width',
		'length',
		'tick'
	],
	#category : #'LarPlotter-Element'
}

{ #category : #'as yet unclassified' }
LarTickXElement >> initialize: aTick [
super initialize.
    tick := aTick.
    
	^self
	size: (tick width)@ (tick length);
	border: (BlBorder paint: Color black width: 1);
	background: (BlBackground paint: Color black);
	constraintsDo: [ :c |
		c ignoreByLayout.
		c ignored vertical alignCenter.
		c ignored horizontal alignCenter ]; yourself

]

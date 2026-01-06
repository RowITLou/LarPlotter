"
This class creates the element for a title of a graph
"
Class {
	#name : 'LarTitelElement',
	#superclass : 'BlTextElement',
	#instVars : [
		'titel'
	],
	#category : 'LarPlotter-Element',
	#package : 'LarPlotter',
	#tag : 'Element'
}

{ #category : 'as yet unclassified' }
LarTitelElement >> initialize: aTitel [
super initialize.
titel := aTitel.
^self
	defaultFontSize: 30;
	
	text: titel text asRopedText;
	background: Color white;
	border: (BlBorder paint: Color white width: 1);
	
			margin: (BlInsets all: 20);
			padding: (BlInsets all: 5);
	constraintsDo: [ :c |
		c horizontal fitContent.
		c vertical fitContent.
		c grid vertical alignCenter.
		c grid horizontal alignCenter ]; yourself 
]

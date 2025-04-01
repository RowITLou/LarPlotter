"
This class creates the label element for each tick in a graph
"
Class {
	#name : #LarTickLabelElement,
	#superclass : #BlTextElement,
	#instVars : [
		'textLabel'
	],
	#category : #'LarPlotter-Element'
}

{ #category : #'as yet unclassified' }
LarTickLabelElement >> create: labelText [

super initialize.
^self
	defaultFontSize: 30;
	
	text: labelText asRopedText;
	background: Color white;
	border: (BlBorder paint: Color white width: 1);
	"margin: (BlInsets all: 20);"
			padding: (BlInsets all: 5);
	constraintsDo: [ :c |
		c horizontal fitContent.
		c vertical fitContent.
		c grid vertical alignCenter.
		c grid horizontal alignCenter ]; yourself 

]

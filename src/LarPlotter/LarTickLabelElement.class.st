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
	constraintsDo: [ :c |
		c ignoreByLayout.
		c ignored vertical alignCenter.
		c ignored horizontal alignCenter ].

]

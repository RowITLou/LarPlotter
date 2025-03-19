"
This class creates the element for a title of a graph
"
Class {
	#name : #LarTitelElement,
	#superclass : #BlTextElement,
	#category : #'LarPlotter-Element'
}

{ #category : #'as yet unclassified' }
LarTitelElement >> create: labelText [
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

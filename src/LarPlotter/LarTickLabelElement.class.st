Class {
	#name : #LarTickLabelElement,
	#superclass : #Object,
	#instVars : [
		'textLabel'
	],
	#category : #'LarPlotter-Element'
}

{ #category : #'as yet unclassified' }
LarTickLabelElement >> create: labelText [
|  label |
	label := BlTextElement new
	defaultFontSize: 30;
	
	text: labelText asRopedText;
	background: Color white;
	border: (BlBorder paint: Color white width: 1);
	constraintsDo: [ :c |
		c ignoreByLayout.
		c ignored vertical alignCenter.
		c ignored horizontal alignCenter ].
 ^label
]

"
This class creates the elements for the axis labels
"
Class {
	#name : #LarLabelAxisElement,
	#superclass : #BlTextElement,
	#instVars : [
		'textLabel'
	],
	#category : #'LarPlotter-Element'
}

{ #category : #'as yet unclassified' }
LarLabelAxisElement >> create: aText [
super initialize.
^self
	defaultFontSize: 30;
		
		text: aText asRopedText ;
		background: (Color white alpha: 0.3);
		border: (BlBorder paint: Color transparent width: 1);
		padding: (BlInsets all: 3);
        constraintsDo: [ :c |
			c ignoreByLayout.
			c ignored vertical alignCenter.
			c ignored horizontal alignCenter ]; yourself.

]

"
This class creates the elements for the axis labels
"
Class {
	#name : #LarLabelAxisElement,
	#superclass : #BlTextElement,
	#instVars : [
		'textLabel',
		'label'
	],
	#category : #'LarPlotter-Element'
}

{ #category : #'as yet unclassified' }
LarLabelAxisElement >> initialize: aLabel [
label := aLabel.
super initialize.
^self
	defaultFontSize: 30;
		
		text: (label text) asRopedText ;
		background: (Color white alpha: 0.3);
		border: (BlBorder paint: Color transparent width: 1);
		
			margin: (BlInsets all: 20);
			padding: (BlInsets all: 5);
        constraintsDo: [ :c |
		c horizontal fitContent.
		c vertical fitContent.
		c grid vertical alignCenter.
		c grid horizontal alignCenter ]; yourself 
]

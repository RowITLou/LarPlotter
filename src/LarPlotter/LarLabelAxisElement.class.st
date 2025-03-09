Class {
	#name : #LarLabelAxisElement,
	#superclass : #Object,
	#instVars : [
		'teytLabel'
	],
	#category : #'LarPlotter-Element'
}

{ #category : #'as yet unclassified' }
LarLabelAxisElement >> create: text [
| labelAxis |
	labelAxis := BlTextElement new
	defaultFontSize: 30;
		
		text: text asRopedText ;
		background: (Color gray alpha: 0.3);
		border: (BlBorder paint: Color white width: 1);
constraintsDo: [ :c |
			c ignoreByLayout.
			c ignored vertical alignCenter.
			c ignored horizontal alignCenter ].
^labelAxis
]

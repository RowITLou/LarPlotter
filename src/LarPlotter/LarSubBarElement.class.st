Class {
	#name : 'LarSubBarElement',
	#superclass : 'BlElement',
	#instVars : [
		'subbar'
	],
	#category : 'LarPlotter-Element',
	#package : 'LarPlotter',
	#tag : 'Element'
}

{ #category : 'as yet unclassified' }
LarSubBarElement >> initialize: aBar [
	| aMouseOverHandler aMouseOutHandler |
	super initialize.
	subbar := aBar.
	aMouseOverHandler := BlEventHandler
			on: BlMouseOverEvent
			do: [ :anEvent | 
				"anEvent currentTarget background: Color veryVeryLightGray."
				anEvent currentTarget border: (BlBorder paint: Color red width: 2) ].
	aMouseOutHandler := BlEventHandler
			on: BlMouseOutEvent
			do: [ :anEvent | 
				"anEvent currentTarget background: Color white."
				anEvent currentTarget border: (BlBorder paint: Color black) ].

	^ self
		background: Color transparent;
		aptitude: (BrGlamorousWithExplicitTooltipAptitude text: subbar tooltip);
		border: (BlBorder builder
				paint: (Color black alpha: 0.5);
				width: 1;
				build);
		constraintsDo: [ :c | 
			c vertical exact: subbar height.

			c horizontal exact: subbar width ];
		when: BlClickEvent
			do: [ :event | event currentTarget phlow spawnObject: subbar object ];
		addEventHandler: aMouseOverHandler;
		addEventHandler: aMouseOutHandler;
		yourself	"layout: BlFrameLayout new;"
]

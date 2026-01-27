"
This creates the elements for bars in a bargraph
"
Class {
	#name : 'LarBarElement',
	#superclass : 'BlElement',
	#instVars : [
		'bar',
		'subbar'
	],
	#category : 'LarPlotter-Element',
	#package : 'LarPlotter',
	#tag : 'Element'
}

{ #category : 'as yet unclassified' }
LarBarElement >> initialize: aBar [
super initialize.
bar := aBar.
self
		background: (Color transparent);
		layout: BlGridLayout vertical;
		border: (BlBorder builder
				paint: (Color blue alpha: 0.5);
				width: 1;
				build);
				"layout: BlFrameLayout new;"
		constraintsDo: [ :c | 
		 c vertical exact: (bar height).
		    
	    c horizontal exact: (bar width)].
	    bar subbar isNil
	    ifTrue:[ self aptitude: (BrGlamorousWithExplicitContextMenuAptitude
				items: {'Inspect Bar Object' -> [ :event | event phlow spawnObject: bar object].
						'Inspect Bar' -> [ :event | event phlow spawnObject: bar  ].
						'Bar Value' -> [ :event | event phlow spawnObject: (bar value) ]})]
		ifFalse:[self aptitude: (BrGlamorousWithExplicitContextMenuAptitude
				items: {'Inspect Bar Object' -> [  :event | event phlow spawnObject: bar object].
						'Inspect Bar' -> [  :event | event phlow spawnObject: bar ].
						'Inspect Subbars' -> [ :event | event phlow spawnObject: (bar subbar)].
						'Bar Value' -> [ :event | event phlow spawnObject: (bar value) ]})].
		
	   
			 ^self
]

{ #category : 'as yet unclassified' }
LarBarElement >> initializeClick: aBar [
| aMouseOverHandler aMouseOutHandler |
super initialize.
bar := aBar.
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
self
		background: (Color transparent);
		layout: BlGridLayout vertical;
		border: (BlBorder builder
				paint: (Color blue alpha: 0.5);
				width: 1;
				build);
				when: BlClickEvent
			do: [ :event | event currentTarget phlow spawnObject: bar object ];
		addEventHandler: aMouseOverHandler;
		addEventHandler: aMouseOutHandler;
				"layout: BlFrameLayout new;"
		constraintsDo: [ :c | 
		 c vertical exact: (bar height).
		    
	    c horizontal exact: (bar width)].
	    bar subbar isNil
	    ifTrue:[ self aptitude: (BrGlamorousWithExplicitContextMenuAptitude
				items: {'Inspect Bar Object' -> [ :event | event phlow spawnObject: bar object].
						'Inspect Bar' -> [ :event | event phlow spawnObject: bar  ].
						'Bar Value' -> [ :event | event phlow spawnObject: (bar value) ]})]
		ifFalse:[self aptitude: (BrGlamorousWithExplicitContextMenuAptitude
				items: {'Inspect Bar Object' -> [  :event | event phlow spawnObject: bar object].
						'Inspect Bar' -> [  :event | event phlow spawnObject: bar ].
						'Inspect Subbars' -> [ :event | event phlow spawnObject: (bar subbar)].
						'Bar Value' -> [ :event | event phlow spawnObject: (bar value) ]})].
		
	   
			 ^self
			 
	
]

"
This creates the elements for bars in a bargraph
"
Class {
	#name : #LarBarElement,
	#superclass : #BlElement,
	#instVars : [
		'bar'
	],
	#category : #'LarPlotter-Element'
}

{ #category : #'as yet unclassified' }
LarBarElement >> initialize: aBar [
super initialize.
bar := aBar.
^self
		background: (Color white);
		border: (BlBorder builder
				paint: (Color blue alpha: 0.5);
				width: 1;
				build);
				"layout: BlFrameLayout new;"
		constraintsDo: [ :c | 
		 c vertical exact: (bar height).
		    
	    c horizontal exact: (bar width)
			]; yourself.
]

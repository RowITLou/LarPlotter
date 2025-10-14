Class {
	#name : #LarSubBarElement,
	#superclass : #BlElement,
	#instVars : [
		'subbar'
	],
	#category : #'LarPlotter-Element'
}

{ #category : #'as yet unclassified' }
LarSubBarElement >> initialize: aBar [
super initialize.
subbar := aBar.
^self
		background: Color transparent;
		aptitude: (BrGlamorousWithExplicitTooltipAptitude text: subbar tooltip);
		border: (BlBorder builder
				paint: (Color black alpha: 0.5);
				width: 1;
				build);
				"layout: BlFrameLayout new;"
		constraintsDo: [ :c | 
		 c vertical exact: (subbar height).
		    
	    c horizontal exact: (subbar width)]
	    "when: BlClickEvent do: [ :event | 
				event currentTarget phlow spawnObject: (subbar) ]"
		
	   
			; yourself.
]

{ #category : #accessing }
LarSubBarElement >> tooltip [
	^ tooltip
]

{ #category : #accessing }
LarSubBarElement >> tooltip: anObject [
	tooltip := anObject
]

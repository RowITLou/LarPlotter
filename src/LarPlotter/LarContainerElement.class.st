"
This class creates the container element
"
Class {
	#name : #LarContainerElement,
	#superclass : #BlElement,
	#instVars : [
		'container'
	],
	#category : #'LarPlotter-Element'
}

{ #category : #'as yet unclassified' }
LarContainerElement >> initializeHorizontal [

super initialize.
	self
	
			border: (BlBorder builder
					
					paint: Color black;
					width: 1;
					build);
			
			background: (BlBackground paint: Color white);
			layout: BlGridLayout horizontal;
		constraintsDo: [ :c |
			c horizontal fitContent.
			c vertical fitContent].
			self layout cellSpacing: 3.
			^self yourself.
]

{ #category : #'as yet unclassified' }
LarContainerElement >> initializeHorizontal: aContainer [
container := aContainer. 
super initialize.
	self
	
			border: (BlBorder builder
					
					paint: Color black;
					width: 1;
					build);
			
			background: (BlBackground paint: Color white);
			layout: BlGridLayout horizontal;
		constraintsDo: [ :c |
			c horizontal fitContent.
			c vertical fitContent].
			self layout cellSpacing: 3.
			^self yourself.
]

{ #category : #'as yet unclassified' }
LarContainerElement >> initializeVertical [

super initialize.
	self
	
			border: (BlBorder builder
					
					paint: Color black;
					width: 1;
					build);
			
			background: (BlBackground paint: Color white);
			layout: BlGridLayout vertical;
		constraintsDo: [ :c |
			c horizontal fitContent.
			c vertical fitContent].
			self layout cellSpacing: 3.
			
			
			^self yourself.
]

{ #category : #'as yet unclassified' }
LarContainerElement >> initializeVertical: aContainer [
container := aContainer.
super initialize.
	self
	
			border: (BlBorder builder
					
					paint: Color black;
					width: 1;
					build);
			
			background: (BlBackground paint: Color white);
			layout: BlGridLayout vertical;
		constraintsDo: [ :c |
			c horizontal fitContent.
			c vertical fitContent].
			self layout cellSpacing: 3.
			
			
			^self yourself.
]

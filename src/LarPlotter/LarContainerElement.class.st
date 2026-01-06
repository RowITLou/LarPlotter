"
This class creates the container element
"
Class {
	#name : 'LarContainerElement',
	#superclass : 'BlElement',
	#instVars : [
		'container'
	],
	#category : 'LarPlotter-Element',
	#package : 'LarPlotter',
	#tag : 'Element'
}

{ #category : 'as yet unclassified' }
LarContainerElement >> initializeHorizontal [

super initialize.
	self
	
			"border: (BlBorder builder
					
					paint: Color black;
					width: 1;
					build);"
			
			background: (BlBackground paint: Color transparent);
			layout: BlGridLayout horizontal;
		constraintsDo: [ :c |
			c horizontal fitContent.
			c vertical fitContent].
			self layout cellSpacing: 3.
			^self yourself.
]

{ #category : 'as yet unclassified' }
LarContainerElement >> initializeHorizontal: aContainer [
container := aContainer. 
super initialize.
	self
	
			"border: (BlBorder builder
					
					paint: Color black;
					width: 1;
					build);"
			
			background: (BlBackground paint: Color transparent);
			layout: BlGridLayout horizontal;
		constraintsDo: [ :c |
			c horizontal fitContent.
			c vertical fitContent].
			self layout cellSpacing: 3.
			^self yourself.
]

{ #category : 'as yet unclassified' }
LarContainerElement >> initializeVertical [

super initialize.
	self
	
			"border: (BlBorder builder
					
					paint: Color black;
					width: 1;
					build);"
			
			background: (BlBackground paint: Color transparent);
			layout: BlGridLayout vertical;
		constraintsDo: [ :c |
			c horizontal fitContent.
			c vertical fitContent].
			self layout cellSpacing: 3.
			
			
			^self yourself.
]

{ #category : 'as yet unclassified' }
LarContainerElement >> initializeVertical: aContainer [
container := aContainer.
super initialize.
	self
	
			"border: (BlBorder builder
					
					paint: Color black;
					width: 1;
					build);"
			
			background: (BlBackground paint: Color transparent);
			layout: BlGridLayout vertical;
		constraintsDo: [ :c |
			c horizontal fitContent.
			c vertical fitContent].
			self layout cellSpacing: 3.
			
			
			^self yourself.
]

{ #category : 'as yet unclassified' }
LarContainerElement >> setBlackBorders [
self  childrenDo: [:child| child class == LarContainerElement
ifTrue:[child setBlackBorders]].

self border: (BlBorder builder

paint: Color black;
					width: 1;
					build).
]

{ #category : 'as yet unclassified' }
LarContainerElement >> setBlackBorders: aContainer [
aContainer childrenDo: [:child| child class == LarContainerElement
ifTrue:[child setBlackBorders]].

aContainer border: (BlBorder builder

paint: Color black;
					width: 1;
					build).
]

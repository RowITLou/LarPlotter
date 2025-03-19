"
creates the containerelement
"
Class {
	#name : #LarContainerElement,
	#superclass : #BlElement,
	#category : #'LarPlotter-Element'
}

{ #category : #'as yet unclassified' }
LarContainerElement >> create: height with: width [

super initialize.
	^self
	size: width@height;
			border: (BlBorder builder
					
					paint: Color black;
					width: 3;
					build);
			"constraintsDo: [ :c |
			c horizontal exact:  width.
			c vertical exact:  height ];"
			background: (BlBackground paint: Color white);
			"layout: BlLinearLayout horizontal;" yourself.

]

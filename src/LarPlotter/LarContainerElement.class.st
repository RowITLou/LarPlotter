"
This class creates the container element
"
Class {
	#name : #LarContainerElement,
	#superclass : #BlElement,
	#category : #'LarPlotter-Element'
}

{ #category : #'as yet unclassified' }
LarContainerElement >> create: height with: width [

super initialize.
	self
	"size: width@height;"
			border: (BlBorder builder
					
					paint: Color white;
					width: 1;
					build);
			"constraintsDo: [ :c |
			c horizontal exact:  width.
			c vertical exact:  height ];"
			background: (BlBackground paint: Color white);
			layout: BlGridLayout horizontal;
		constraintsDo: [ :c |
			c horizontal fitContent.
			c vertical fitContent].
			self layout cellSpacing: 3.
			"self layout columnCount: 2.
			"
			"layout: BlLinearLayout horizontal;"^self yourself.

]

{ #category : #'as yet unclassified' }
LarContainerElement >> createVertical: height with: width [

super initialize.
	self
	"size: width@height;"
			border: (BlBorder builder
					
					paint: Color white;
					width: 1;
					build);
			"constraintsDo: [ :c |
			c horizontal exact:  width.
			c vertical exact:  height ];"
			background: (BlBackground paint: Color white);
			layout: BlGridLayout vertical;
		constraintsDo: [ :c |
			c horizontal fitContent.
			c vertical fitContent].
			self layout cellSpacing: 3.
			"self layout columnCount: 4."
			
			"layout: BlLinearLayout horizontal;"^self yourself.
]

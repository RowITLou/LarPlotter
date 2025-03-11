Class {
	#name : #LarContainerElement,
	#superclass : #BlElement,
	#category : #'LarPlotter-Element'
}

{ #category : #'as yet unclassified' }
LarContainerElement >> create: height with: width [
| container |
	container := BlElement new
	size: width@height;
			border: (BlBorder builder
					
					paint: Color black;
					width: 3;
					build);
			background: (BlBackground paint: Color white);
			layout: BlLinearLayout horizontal.
^container
]

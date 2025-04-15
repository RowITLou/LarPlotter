"
This model class is a model container class for graphs. It helps containing and relocating textelements and ticks in the graph. These elements are created automatically when initializing ticks or labels. The relocation will also be done when initializing the element. the user still can change the relocation, size and padding of the container. All changes of the graph must be made with the plotter itself. 
"
Class {
	#name : #LarContainer,
	#superclass : #Object,
	#instVars : [
		'width',
		'height'
	],
	#category : #'LarPlotter-Model'
}

{ #category : #'as yet unclassified' }
LarContainer >> asElement [
^LarContainerElement new initializeHorizontal.
]

{ #category : #'as yet unclassified' }
LarContainer >> asElementVertical [
^LarContainerElement new initializeVertical.
]

{ #category : #accessing }
LarContainer >> height [
	^ height
]

{ #category : #accessing }
LarContainer >> height: anObject [
	height := anObject
]

{ #category : #'as yet unclassified' }
LarContainer >> initialize [
^self
]

{ #category : #'as yet unclassified' }
LarContainer >> initialize: sizeWidth with: sizeHeight [
self width: sizeWidth. 
self height: sizeHeight. 
^self
]

{ #category : #'as yet unclassified' }
LarContainer >> resize: widthX with: lengthX [
self width: widthX. 
self height: lengthX.
^self asElement size: widthX with: lengthX.

]

{ #category : #'as yet unclassified' }
LarContainer >> setBackground: color [
^self asElement background: color.
]

{ #category : #'as yet unclassified' }
LarContainer >> setBorderColor: color [
^self asElement border: (BlBorder paint: color)
]

{ #category : #accessing }
LarContainer >> width [
	^ width
]

{ #category : #accessing }
LarContainer >> width: anObject [
	width := anObject
]

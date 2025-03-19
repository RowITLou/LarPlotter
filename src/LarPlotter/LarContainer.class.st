"
This model class helps containing and relocating textelements and ticks.
"
Class {
	#name : #LarContainer,
	#superclass : #Object,
	#instVars : [
		'width',
		'height',
		'containerElement'
	],
	#category : #'LarPlotter-Model'
}

{ #category : #'as yet unclassified' }
LarContainer >> asElement [
^LarContainerElement new create: height with: width 
]

{ #category : #'as yet unclassified' }
LarContainer >> initialize: sizeWidth with: sizeHeight [
self sizeWidth: sizeWidth. 
self sizeHeight: sizeHeight. 
^self
]

{ #category : #'as yet unclassified' }
LarContainer >> resize: widthX with: lengthX [
self sizeWidth: widthX. 
self sizeHeight: lengthX.
containerElement size: widthX with: lengthX.

]

{ #category : #'as yet unclassified' }
LarContainer >> setBackground: color [
containerElement background: color.
]

{ #category : #'as yet unclassified' }
LarContainer >> setBorderColor: color [
containerElement border: (BlBorder paint: color)
]

{ #category : #'as yet unclassified' }
LarContainer >> sizeHeight [
height isNil
ifTrue:[^0]
ifFalse:[^height]
]

{ #category : #'as yet unclassified' }
LarContainer >> sizeHeight: size [
height := size
]

{ #category : #'as yet unclassified' }
LarContainer >> sizeWidth [
width isNil
ifTrue:[^0]
ifFalse:[^width]
]

{ #category : #'as yet unclassified' }
LarContainer >> sizeWidth: size [
width := size
]

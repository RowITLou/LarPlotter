Class {
	#name : #LarBar,
	#superclass : #Object,
	#instVars : [
		'width',
		'height',
		'barElement'
	],
	#category : #'LarPlotter-Model'
}

{ #category : #'as yet unclassified' }
LarBar >> asElement [
^LarBarElement new create: height with: width
]

{ #category : #'as yet unclassified' }
LarBar >> initialize: sizeHeight [

self sizeHeight: sizeHeight. 
^self asElement.
]

{ #category : #'as yet unclassified' }
LarBar >> initialize: sizeHeight with: sizeWidth [

self sizeHeight: sizeHeight. 
self sizeWidth: sizeWidth. 
^self asElement.
]

{ #category : #'as yet unclassified' }
LarBar >> resize: sizeWidth with: sizeHeight [
self sizeWidth: sizeWidth. 
self sizeHeight: sizeHeight.
barElement size: sizeWidth with: sizeHeight.

]

{ #category : #'as yet unclassified' }
LarBar >> setBackground: color [
barElement background: color.
]

{ #category : #'as yet unclassified' }
LarBar >> setBorderColor: color [
barElement border: (BlBorder paint: color)
]

{ #category : #'as yet unclassified' }
LarBar >> sizeHeight [
height isNil
ifTrue:[^0]
ifFalse:[^height]
]

{ #category : #'as yet unclassified' }
LarBar >> sizeHeight: size [
height := size
]

{ #category : #'as yet unclassified' }
LarBar >> sizeWidth [
width isNil
ifTrue:[^0]
ifFalse:[^width]
]

{ #category : #'as yet unclassified' }
LarBar >> sizeWidth: size [
width := size
]

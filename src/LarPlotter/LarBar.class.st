"
This is the model class for the bars in a bargraph. When creating a graph the method {{gtMethod:name=LarPlotterBar>>addBars:}} can be called. By adding the values we want to be represented the bars get created automatically in the order the values are in the orderedCollection. see the example here {{gtMethod:name=LarPlotterBarExamples>>addBars}}. 
"
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
barElement := LarBarElement new create: height with: width.
^barElement
]

{ #category : #'as yet unclassified' }
LarBar >> barElement [
^barElement
]

{ #category : #'as yet unclassified' }
LarBar >> initialize: sizeHeight with: sizeWidth [

self sizeHeight: sizeHeight. 
self sizeWidth: sizeWidth. 
^self.
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

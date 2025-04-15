"
This is the model class for the bars in a bargraph. When creating a graph the method {{gtMethod:name=LarPlotterBar>>addBars:}} can be called. By adding the values we want to be represented the bars get created automatically in the order the values are in the orderedCollection. see the example here {{gtMethod:name=LarPlotterBarExamples>>addBars}}. 
"
Class {
	#name : #LarBar,
	#superclass : #Object,
	#instVars : [
		'width',
		'height'
	],
	#category : #'LarPlotter-Model'
}

{ #category : #'as yet unclassified' }
LarBar >> asElement [
^LarBarElement new initialize: self.
]

{ #category : #accessing }
LarBar >> height [
	^ height
]

{ #category : #accessing }
LarBar >> height: anObject [
	height := anObject
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
^self asElement

]

{ #category : #'as yet unclassified' }
LarBar >> setBorderColor: color [
self asElement border: (BlBorder paint: color)
]

{ #category : #accessing }
LarBar >> width [
	^ width
]

{ #category : #accessing }
LarBar >> width: anObject [
	width := anObject
]

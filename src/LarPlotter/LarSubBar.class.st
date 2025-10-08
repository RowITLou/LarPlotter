Class {
	#name : #LarSubBar,
	#superclass : #Object,
	#instVars : [
		'width',
		'height',
		'data',
		'object',
		'value'
	],
	#category : #'LarPlotter-Model'
}

{ #category : #'as yet unclassified' }
LarSubBar >> asElement [
^LarSubBarElement new initialize: self.
]

{ #category : #accessing }
LarSubBar >> height [
	^ height
]

{ #category : #accessing }
LarSubBar >> height: anObject [
	height := anObject
]

{ #category : #'as yet unclassified' }
LarSubBar >> initialize: sizeHeight with: sizeWidth [

self height: sizeHeight. 
self width: sizeWidth. 
^self.
]

{ #category : #accessing }
LarSubBar >> width [
	^ width
]

{ #category : #accessing }
LarSubBar >> width: anObject [
	width := anObject
]

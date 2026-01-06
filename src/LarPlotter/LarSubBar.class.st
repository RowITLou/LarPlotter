Class {
	#name : 'LarSubBar',
	#superclass : 'Object',
	#instVars : [
		'width',
		'height',
		'data',
		'object',
		'value',
		'color',
		'tooltip'
	],
	#category : 'LarPlotter-Model',
	#package : 'LarPlotter',
	#tag : 'Model'
}

{ #category : 'as yet unclassified' }
LarSubBar >> asElement [
^LarSubBarElement new initialize: self.
]

{ #category : 'accessing' }
LarSubBar >> color [
	^ color
]

{ #category : 'accessing' }
LarSubBar >> color: anObject [
	color := anObject
]

{ #category : 'accessing' }
LarSubBar >> data [
	^ data
]

{ #category : 'accessing' }
LarSubBar >> data: anObject [
	data := anObject
]

{ #category : 'accessing' }
LarSubBar >> height [
	^ height
]

{ #category : 'accessing' }
LarSubBar >> height: anObject [
	height := anObject
]

{ #category : 'as yet unclassified' }
LarSubBar >> initialize: sizeHeight with: sizeWidth [

self height: sizeHeight. 
self width: sizeWidth. 
^self.
]

{ #category : 'accessing' }
LarSubBar >> object [
	^ object
]

{ #category : 'accessing' }
LarSubBar >> object: anObject [
	object := anObject
]

{ #category : 'accessing' }
LarSubBar >> tooltip [
	^ tooltip
]

{ #category : 'accessing' }
LarSubBar >> tooltip: anObject [
	tooltip := anObject
]

{ #category : 'accessing' }
LarSubBar >> value [
	^ value
]

{ #category : 'accessing' }
LarSubBar >> value: anObject [
	value := anObject
]

{ #category : 'accessing' }
LarSubBar >> width [
	^ width
]

{ #category : 'accessing' }
LarSubBar >> width: anObject [
	width := anObject
]

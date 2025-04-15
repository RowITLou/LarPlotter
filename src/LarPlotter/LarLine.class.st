Class {
	#name : #LarLine,
	#superclass : #Object,
	#instVars : [
		'from',
		'to'
	],
	#category : #'LarPlotter-Model'
}

{ #category : #'as yet unclassified' }
LarLine >> asElement [
^LarLineElement new initialize: self.
]

{ #category : #accessing }
LarLine >> from [
	^ from
]

{ #category : #accessing }
LarLine >> from: anObject [
	from := anObject
]

{ #category : #'as yet unclassified' }
LarLine >> initialize: fromPos with: toPos [
from:= fromPos.
to:= toPos. 
^self
]

{ #category : #accessing }
LarLine >> to [
	^ to
]

{ #category : #accessing }
LarLine >> to: anObject [
	to := anObject
]

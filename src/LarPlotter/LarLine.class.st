Class {
	#name : #LarLine,
	#superclass : #Object,
	#instVars : [
		'lineElement',
		'from',
		'to'
	],
	#category : #'LarPlotter-Model'
}

{ #category : #'as yet unclassified' }
LarLine >> asElement [
lineElement := LarLineElement new create: from with: to.
^lineElement
]

{ #category : #'as yet unclassified' }
LarLine >> initialize: fromPos with: toPos [
from:= fromPos.
to:= toPos. 
^self
]

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

]

{ #category : #'as yet unclassified' }
LarLine >> initialize: fromPos with: toPos [
from:= fromPos.
to:= toPos. 
^self
]


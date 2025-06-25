Class {
	#name : #LarPoint,
	#superclass : #Object,
	#instVars : [
		'x',
		'y'
	],
	#category : #'LarPlotter-Model'
}

{ #category : #'as yet unclassified' }
LarPoint >> asElement [
^LarPointElement new initialize: self.
]

{ #category : #'as yet unclassified' }
LarPoint >> initialize: xPos with: yPos [
x:= xPos.
y:= yPos. 
^self
]

{ #category : #accessing }
LarPoint >> x [
	^ x
]

{ #category : #accessing }
LarPoint >> x: anObject [
	x := anObject
]

{ #category : #accessing }
LarPoint >> y [
	^ y
]

{ #category : #accessing }
LarPoint >> y: anObject [
	y := anObject
]

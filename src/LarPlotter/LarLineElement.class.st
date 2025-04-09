Class {
	#name : #LarLineElement,
	#superclass : #BlLineElement,
	#category : #'LarPlotter-Element'
}

{ #category : #'as yet unclassified' }
LarLineElement >> create: from with: to [
super initialize.

^self
fromAnchor: (BlAbsolutePositionAnchor position: from);
	 toAnchor: (BlAbsolutePositionAnchor position: to).

]

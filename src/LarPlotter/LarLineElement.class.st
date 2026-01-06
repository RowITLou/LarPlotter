Class {
	#name : 'LarLineElement',
	#superclass : 'BlLineElement',
	#instVars : [
		'line'
	],
	#category : 'LarPlotter-Element',
	#package : 'LarPlotter',
	#tag : 'Element'
}

{ #category : 'as yet unclassified' }
LarLineElement >> initialize: aLine [
super initialize.
line := aLine.
^self
fromAnchor: (BlAbsolutePositionAnchor position: line from);
toAnchor: (BlAbsolutePositionAnchor position: line to);
border: (BlBorder paint: Color red width: 2).
]

Class {
	#name : #LarTickYElement,
	#superclass : #BlElement,
	#instVars : [
		'width',
		'length'
	],
	#category : #'LarPlotter-Element'
}

{ #category : #'as yet unclassified' }
LarTickYElement >> create: sizeWidth with: sizeLength [
| tickX |
    width:= sizeWidth.
    length:= sizeLength.
	tickX := BlElement new
	size: length@ width;
	border: (BlBorder paint: Color black width: 1);
	background: (BlBackground paint: Color black).
^tickX
]

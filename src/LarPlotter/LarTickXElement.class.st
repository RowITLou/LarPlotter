Class {
	#name : #LarTickXElement,
	#superclass : #BlElement,
	#instVars : [
		'width',
		'length'
	],
	#category : #'LarPlotter-Element'
}

{ #category : #'as yet unclassified' }
LarTickXElement >> create: sizeWidth with: sizeLength [
| tickX |
    width:= sizeWidth.
    length:= sizeLength.
    
	tickX := BlElement new
	size: width@ length;
	border: (BlBorder paint: Color black width: 1);
	background: (BlBackground paint: Color black).
^tickX
]

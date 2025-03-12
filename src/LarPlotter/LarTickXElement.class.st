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
super initialize.
    width:= sizeWidth.
    length:= sizeLength.
    
	^self
	size: width@ length;
	border: (BlBorder paint: Color black width: 1);
	background: (BlBackground paint: Color black);
	constraintsDo: [ :c |
		c ignoreByLayout.
		c ignored vertical alignCenter.
		c ignored horizontal alignCenter ]; yourself

]

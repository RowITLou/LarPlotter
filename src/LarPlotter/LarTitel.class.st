Class {
	#name : #LarTitel,
	#superclass : #Object,
	#instVars : [
		'titelElement',
		'text'
	],
	#category : #'LarPlotter-Model'
}

{ #category : #'as yet unclassified' }
LarTitel >> asElement [
^titelElement:= LarTickLabelElement new create: text
]

{ #category : #'as yet unclassified' }
LarTitel >> initialize: textTitle [
self text: textTitle.
^self asElement.
]

{ #category : #'as yet unclassified' }
LarTitel >> setBackground: color [
titelElement background: color
]

{ #category : #'as yet unclassified' }
LarTitel >> setBorderColor: color [
titelElement border: (BlBorder paint: color). 
]

{ #category : #'as yet unclassified' }
LarTitel >> setFontSize: number [
titelElement defaultFontSize: number
]

{ #category : #'as yet unclassified' }
LarTitel >> setText: textTitle [
titelElement text: textTitle.
text:= textTitle.
^text
]

{ #category : #'as yet unclassified' }
LarTitel >> text: textTitle [
text:= textTitle.
^text
]

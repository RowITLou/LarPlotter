"
This is the model class for the title of a graph
"
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
^titelElement:= LarTitelElement new create: text
]

{ #category : #'as yet unclassified' }
LarTitel >> gtLiveFor: aView [
	<gtView>
	^aView explicit
		title: 'Live';
		priority: 10;
		stencil: [  self titelElement   ];
		actionUpdateButton.
		"updateWhen: LePageTitleChanged in: self page announcer.
		
	column ifNotNil: [column announcer announce: KBNameUpdate new]."
	"^view"
]

{ #category : #'as yet unclassified' }
LarTitel >> initialize: textTitle [
self text: textTitle.
^self.
]

{ #category : #'as yet unclassified' }
LarTitel >> setBackground: color [
titelElement background: (color)
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
titelElement text: textTitle asRopedText.
text:= textTitle.
]

{ #category : #'as yet unclassified' }
LarTitel >> text: textTitle [
text:= textTitle.
^text
]

{ #category : #'as yet unclassified' }
LarTitel >> titelElement [
^titelElement
]

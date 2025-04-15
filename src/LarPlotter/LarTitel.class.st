"
This is the model class for the title of a graph. By using the following method a title can be added and changed for a graph {{gtMethod:name=LarPlotterBar>>titel:}}.   
"
Class {
	#name : #LarTitel,
	#superclass : #Object,
	#instVars : [
		'text'
	],
	#category : #'LarPlotter-Model'
}

{ #category : #'as yet unclassified' }
LarTitel >> asElement [
^LarTitelElement new initialize: self
]

{ #category : #'as yet unclassified' }
LarTitel >> gtLiveFor: aView [
	<gtView>
	^aView explicit
		title: 'Live';
		priority: 10;
		stencil: [  self asElement   ];
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
self  asElement background: (color)
]

{ #category : #'as yet unclassified' }
LarTitel >> setBorderColor: color [
self asElement border: (BlBorder paint: color). 
]

{ #category : #'as yet unclassified' }
LarTitel >> setFontSize: number [
self asElement defaultFontSize: number
]

{ #category : #'as yet unclassified' }
LarTitel >> setText: textTitle [
self asElement text: textTitle asRopedText.
text:= textTitle.
]

{ #category : #accessing }
LarTitel >> text [
	^ text
]

{ #category : #'as yet unclassified' }
LarTitel >> text: textTitle [
text:= textTitle.
^text
]

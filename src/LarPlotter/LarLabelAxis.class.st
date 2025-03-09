Class {
	#name : #LarLabelAxis,
	#superclass : #Object,
	#instVars : [
		'LabelElement',
		'text'
	],
	#category : #'LarPlotter-Model'
}

{ #category : #'as yet unclassified' }
LarLabelAxis >> asElement [
LabelElement:= LarTickLabelElement new create: text
]

{ #category : #'as yet unclassified' }
LarLabelAxis >> setBackground: color [
LabelElement background: color
]

{ #category : #'as yet unclassified' }
LarLabelAxis >> setBorderColor: color [
LabelElement border: (BlBorder paint: color). 
]

{ #category : #'as yet unclassified' }
LarLabelAxis >> setFontSize: number [
LabelElement defaultFontSize: number
]

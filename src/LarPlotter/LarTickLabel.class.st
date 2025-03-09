Class {
	#name : #LarTickLabel,
	#superclass : #Object,
	#instVars : [
		'labelText',
		'label'
	],
	#category : #'LarPlotter-Model'
}

{ #category : #'as yet unclassified' }
LarTickLabel >> asElement [
label:= LarTickLabelElement new create: labelText
]

{ #category : #'as yet unclassified' }
LarTickLabel >> setBackground: color [
label background: color
]

{ #category : #'as yet unclassified' }
LarTickLabel >> setBorderColor: color [
label border: (BlBorder paint: color). 
]

{ #category : #'as yet unclassified' }
LarTickLabel >> setFontSize: number [
label defaultFontSize: number
]

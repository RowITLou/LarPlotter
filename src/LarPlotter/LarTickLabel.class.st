"
is the model class for the labes of the ticks
"
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
^label:= LarTickLabelElement new create: labelText
]

{ #category : #'as yet unclassified' }
LarTickLabel >> initialize: text [
self labelText: text.
^self.
]

{ #category : #'as yet unclassified' }
LarTickLabel >> labelText: textLabel [
labelText:= textLabel.
^labelText
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

{ #category : #'as yet unclassified' }
LarTickLabel >> setText: textlabel [
label text: textlabel.
labelText:= textlabel.
^labelText
]

"
This is the model class for the Axis labels. When creating a graph we can add titles to the axis of the graph. 
{{gtMethod:name=LarPlotterBar>>addAxisLabel:with:}} 
See the example {{gtMethod:name=LarPlotterBarExamples>>addAxisLabel}}

"
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
^LarLabelAxisElement new create: text. 

]

{ #category : #'as yet unclassified' }
LarLabelAxis >> initialize: textAxis [
self text: textAxis.
^self .
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

{ #category : #'as yet unclassified' }
LarLabelAxis >> setText: textAxis [
LabelElement text: textAxis.
text:= textAxis.
^text
]

{ #category : #'as yet unclassified' }
LarLabelAxis >> text: textAxis [
text:= textAxis.
]

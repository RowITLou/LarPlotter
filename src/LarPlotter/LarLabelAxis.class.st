"
This is the model class for the Axis labels. When creating a graph we can add titles to the axis of the graph. 
{{gtMethod:name=LarPlotterBar>>addAxisLabel:with:}} 
See the example {{gtMethod:name=LarPlotterBarExamples>>addAxisLabel}}

"
Class {
	#name : 'LarLabelAxis',
	#superclass : 'Object',
	#instVars : [
		'text'
	],
	#category : 'LarPlotter-Model',
	#package : 'LarPlotter',
	#tag : 'Model'
}

{ #category : 'as yet unclassified' }
LarLabelAxis >> asElement [
^LarLabelAxisElement new initialize: self.

]

{ #category : 'as yet unclassified' }
LarLabelAxis >> initialize: textAxis [
self text: textAxis.
^self .
]

{ #category : 'as yet unclassified' }
LarLabelAxis >> setBackground: color [
^self asElement background: color
]

{ #category : 'as yet unclassified' }
LarLabelAxis >> setBorderColor: color [
^self asElement border: (BlBorder paint: color). 
]

{ #category : 'as yet unclassified' }
LarLabelAxis >> setFontSize: number [
^self asElement defaultFontSize: number
]

{ #category : 'as yet unclassified' }
LarLabelAxis >> setText: textAxis [
self asElement text: textAxis.
text:= textAxis.
^text
]

{ #category : 'accessing' }
LarLabelAxis >> text [
	^ text
]

{ #category : 'as yet unclassified' }
LarLabelAxis >> text: textAxis [
text:= textAxis.
]

"
This is the model class for the labels of the ticks in a graph. After adding the ticks and defining how much there are we can add labels for each of these ticks and /or the bars. When giving the values of the labels to the graph the labels will be created directly in the method. See the method in the plotter {{gtMethod:name=LarPlotterBar>>addTicksLabel: }} and {{gtMethod:name=LarPlotterBar>>addTicksLabel:with:}} 
See the following example {{gtMethod:name=LarPlotterBarExamples>>graphWithTickLabels}} 

"
Class {
	#name : #LarTickLabel,
	#superclass : #Object,
	#instVars : [
		'labelText'
	],
	#category : #'LarPlotter-Model'
}

{ #category : #'as yet unclassified' }
LarTickLabel >> asElement [
^LarTickLabelElement new initialize: self.
]

{ #category : #'as yet unclassified' }
LarTickLabel >> initialize: text [
self labelText: text.
^self.
]

{ #category : #accessing }
LarTickLabel >> labelText [
	^ labelText
]

{ #category : #'as yet unclassified' }
LarTickLabel >> labelText: anObject [
	labelText := anObject
]

{ #category : #'as yet unclassified' }
LarTickLabel >> setBackground: color [
self asElement background: color
]

{ #category : #'as yet unclassified' }
LarTickLabel >> setBorderColor: color [
self asElement border: (BlBorder paint: color). 
]

{ #category : #'as yet unclassified' }
LarTickLabel >> setFontSize: number [
self asElement defaultFontSize: number
]

{ #category : #'as yet unclassified' }
LarTickLabel >> setText: textlabel [
self asElement text: textlabel.
labelText:= textlabel.
^labelText
]

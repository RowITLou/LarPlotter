Class {
	#name : #LarPlotterLineExample,
	#superclass : #Object,
	#category : #'LarPlotter-Examples'
}

{ #category : #'as yet unclassified' }
LarPlotterLineExample >> addLines [
<gtExample>
|plotter|
"plotter:= LarPlotterBar new initialize: 500 with: 500."
^self newGraph addLines: self values.
]

{ #category : #'as yet unclassified' }
LarPlotterLineExample >> labels [
^ #(#A #B  #C #D #E #F #G #H #I #J #K)
]

{ #category : #'as yet unclassified' }
LarPlotterLineExample >> newGraph [
<gtExample>

^ LarPlotterLine new 
]

{ #category : #'as yet unclassified' }
LarPlotterLineExample >> values [
^ #(20 40 60 80 10 90 70 50 30 10).
]

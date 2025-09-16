Class {
	#name : #LarPlotterLineExamples,
	#superclass : #Object,
	#category : #'LarPlotter-Examples'
}

{ #category : #'as yet unclassified' }
LarPlotterLineExamples >> addAxisLabel [
<gtExample>

	^self addTitel addAxisLabel: 'AxisX' with: 'AxisY'. 
	
]

{ #category : #'as yet unclassified' }
LarPlotterLineExamples >> addLines [
<gtExample>

^self newGraph addLines: self values.
]

{ #category : #'as yet unclassified' }
LarPlotterLineExamples >> addTitel [
<gtExample>

^self addLines title: 'This is a title'. 

]

{ #category : #'as yet unclassified' }
LarPlotterLineExamples >> labels [
^ #(#A #B  #C #D #E #F #G #H #I #J)
]

{ #category : #'as yet unclassified' }
LarPlotterLineExamples >> newGraph [
<gtExample>

^ LarPlotterLine new 
	
]

{ #category : #'as yet unclassified' }
LarPlotterLineExamples >> spec [ 
"https://vega.github.io/vega-lite/examples/data/stocks.csv"
]

{ #category : #'as yet unclassified' }
LarPlotterLineExamples >> values [
^ #(20 40 60 80 10 90 70 50 30 10).

]

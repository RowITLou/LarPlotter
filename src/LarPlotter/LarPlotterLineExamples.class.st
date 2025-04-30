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

^self addLines titel: 'This is a title'. 

]

{ #category : #'as yet unclassified' }
LarPlotterLineExamples >> graphWithTickLabels [
<gtExample>

^self addAxisLabel addTicksLabel: (self labels). 

]

{ #category : #'as yet unclassified' }
LarPlotterLineExamples >> graphWithTickLabelsY [
<gtExample>

^self addAxisLabel addTicksLabel: (self labels) with: self values. 
]

{ #category : #'as yet unclassified' }
LarPlotterLineExamples >> graphWithTicks [
<gtExample>
"^self newGraph addTicks: 8 with: 8. "
^self graphWithTickLabelsY addTicks: self values size. 
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
LarPlotterLineExamples >> values [
^ #(20 40 60 80 10 90 70 50 30 10).

]

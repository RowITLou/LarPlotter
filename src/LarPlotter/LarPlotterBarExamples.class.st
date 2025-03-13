Class {
	#name : #LarPlotterBarExamples,
	#superclass : #Object,
	#category : #'LarPlotter-Examples'
}

{ #category : #'as yet unclassified' }
LarPlotterBarExamples >> addAxisLabel [
<gtExample>
| plotter |
	plotter:= LarPlotterBar new initialize: 500 with: 500.
	plotter addAxisLabel: 'AxisX' with: 'AxisY'. 
	^plotter graph
]

{ #category : #'as yet unclassified' }
LarPlotterBarExamples >> addBars [
<gtExample>
|plotter|
plotter:= LarPlotterBar new initialize: 500 with: 500.
plotter addBars: self values.
^plotter graph
]

{ #category : #'as yet unclassified' }
LarPlotterBarExamples >> addTitel [
<gtExample>
|plotter|
plotter:= LarPlotterBar new initialize: 500 with: 500.
plotter titel: 'This is a title'. 
^plotter graph
]

{ #category : #'as yet unclassified' }
LarPlotterBarExamples >> graphWithTickLabels [
<gtExample>
|plotter|
plotter:= LarPlotterBar new initialize: 500 with: 500.
plotter addTicksLabel: 8 with: 8. 
^plotter graph
]

{ #category : #'as yet unclassified' }
LarPlotterBarExamples >> graphWithTicks [
<gtExample>
|plotter|
plotter:= LarPlotterBar new initialize: 500 with: 500.
plotter addTicks: 8 with: 8. 
^plotter graph
]

{ #category : #'as yet unclassified' }
LarPlotterBarExamples >> newGraph [
<gtExample>
|plotter|
	plotter:= LarPlotterBar new initialize: 500 with: 500. 
	^plotter graph
]

{ #category : #'as yet unclassified' }
LarPlotterBarExamples >> values [
^#(0.2 0.4 0.6 0.8 1.0 0.9 0.7 0.5 0.3 0.1).

]

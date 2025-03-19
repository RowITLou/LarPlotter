"
Here are some examples what you could do with the plotter
"
Class {
	#name : #LarPlotterBarExamples,
	#superclass : #Object,
	#category : #'LarPlotter-Examples'
}

{ #category : #'as yet unclassified' }
LarPlotterBarExamples >> addAxisLabel [
<gtExample>
| plotter |
	"plotter:= LarPlotterBar new initialize: 500 with: 500."
	^self newGraph addAxisLabel: 'AxisX' with: 'AxisY'. 
	
]

{ #category : #'as yet unclassified' }
LarPlotterBarExamples >> addBars [
<gtExample>
|plotter|
"plotter:= LarPlotterBar new initialize: 500 with: 500."
^self newGraph addBars: self values.

]

{ #category : #'as yet unclassified' }
LarPlotterBarExamples >> addTitel [
<gtExample>

^self newGraph titel: 'This is a title'. 

]

{ #category : #'as yet unclassified' }
LarPlotterBarExamples >> changeBackgroundTitle [
<gtExample>
| plotter |
	plotter:= self changeTitle. 
(plotter title) setBackground: (Color  blue). 
^plotter 
]

{ #category : #'as yet unclassified' }
LarPlotterBarExamples >> changeFontTitle [
<gtExample>
| plotter |
	plotter := self addTitel .
	plotter title  setFontSize: 50.
	^plotter
]

{ #category : #'as yet unclassified' }
LarPlotterBarExamples >> changeTitle [
<gtExample>
| plotter |
	plotter := (self changeFontTitle) .
	plotter title setText: 'NewTitle'. 
	^plotter
]

{ #category : #'as yet unclassified' }
LarPlotterBarExamples >> graphWithTickLabels [
<gtExample>

^self newGraph addTicksLabel: 8 with: 8. 

]

{ #category : #'as yet unclassified' }
LarPlotterBarExamples >> graphWithTicks [
<gtExample>
^self newGraph addTicks: 8 with: 8. 

]

{ #category : #'as yet unclassified' }
LarPlotterBarExamples >> newGraph [
<gtExample>

^ LarPlotterBar new initialize: 500 with: 500. 
	
]

{ #category : #'as yet unclassified' }
LarPlotterBarExamples >> values [
^#(0.2 0.4 0.6 0.8 1.0 0.9 0.7 0.5 0.3 0.1).

]

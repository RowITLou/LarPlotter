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
	^self addTitel addAxisLabel: 'AxisX' with: 'AxisY'. 
	
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

^self addBars titel: 'This is a title'. 

]

{ #category : #'as yet unclassified' }
LarPlotterBarExamples >> changeAmountTicks [
<gtExample>
^self graphWithTicks amountTicks: 10 with: 10.
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

^self addAxisLabel addTicksLabel: (self labels). 

]

{ #category : #'as yet unclassified' }
LarPlotterBarExamples >> graphWithTickLabelsY [
<gtExample>

^self addAxisLabel addTicksLabel: (self labels) with: self values. 

]

{ #category : #'as yet unclassified' }
LarPlotterBarExamples >> graphWithTicks [
<gtExample>
^self newGraph addTicks: 8 with: 8. 

]

{ #category : #'as yet unclassified' }
LarPlotterBarExamples >> labels [
^ #(#A #B  #C #D #E #F #G #H #I #J #K)
]

{ #category : #'as yet unclassified' }
LarPlotterBarExamples >> newGraph [
<gtExample>

^ LarPlotterBar new initialize: 500 with: 500. 
	
]

{ #category : #'as yet unclassified' }
LarPlotterBarExamples >> playWithBars [
<gtExample>
| graph |
	graph := self addBars .
	graph bars do: [:bar | 
    (bar barElement)
    background: Color blue;
    border: (BlBorder paint: Color yellow width: 5)].
    ^graph
	
]

{ #category : #'as yet unclassified' }
LarPlotterBarExamples >> values [
^ #(20 40 60 80 10 90 70 50 30 10).

]

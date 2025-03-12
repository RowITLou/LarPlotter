Class {
	#name : #LarPlotterBarExamples,
	#superclass : #Object,
	#category : #'LarPlotter-Examples'
}

{ #category : #'as yet unclassified' }
LarPlotterBarExamples >> bars [
<gtExample>
^(self ticks) addBars: self values.
]

{ #category : #'as yet unclassified' }
LarPlotterBarExamples >> basic [
<gtExample>
| plot |
	plot:= LarPlotterBar new initialize: 500 with: 500. 
	^plot
	
	"relocate
	labe height
	margine
	text label"
]

{ #category : #'as yet unclassified' }
LarPlotterBarExamples >> oneBar [
<gtExample>
^LarBar new initialize: 400
]

{ #category : #'as yet unclassified' }
LarPlotterBarExamples >> test [
<gtExample>
^(LarTick new initialize: 3 with: 10) asElementY.
]

{ #category : #'as yet unclassified' }
LarPlotterBarExamples >> ticks [
<gtExample>
	^ (self basic) addTicks. 
	
	"amount of ticks
	size of ticks
	"
 
]

{ #category : #'as yet unclassified' }
LarPlotterBarExamples >> values [
^#(0.2 0.4 0.6 0.8 1.0 0.9 0.7 0.5 0.3 0.1).

]

Class {
	#name : #BarPlotterExamples,
	#superclass : #Object,
	#category : #'LarPlotter-Other'
}

{ #category : #'as yet unclassified' }
BarPlotterExamples >> containerWithGraphAndBars [
<gtExample>
| graph container |
container := BarPlotter new containerElement: 700.
	graph:= BarPlotter new barsInGraph: self values with: self sizeGraph with: self relocate.
	container addChild: graph.
^container
]

{ #category : #'as yet unclassified' }
BarPlotterExamples >> graphAndLabels [
<gtExample>
| graph labelAxisX labelAxisY |
graph:= self containerWithGraphAndBars.
labelAxisX := BarPlotter new labelAxisX: self sizeGraph with: self sizeLabel with: self relocate.

graph addChild: labelAxisX.
labelAxisY := BarPlotter new labelAxisY: self sizeGraph with: self sizeLabel with: self relocate.
graph addChild: labelAxisY.


^graph
]

{ #category : #'as yet unclassified' }
BarPlotterExamples >> graphAndTicks [
<gtExample>
| graph ticksX ticksY |
	graph:= self containerWithGraphAndBars.
ticksX:= BarPlotter new ticksAxisX: self values size with: self sizeGraph with: self relocate.
ticksY:= BarPlotter new ticksAxisY: self values size with: self sizeGraph with: self relocate.
1 to: self values size do: [:n| graph addChild: (ticksX at: n).
				graph addChild: (ticksY at: n)].
^graph

]

{ #category : #'as yet unclassified' }
BarPlotterExamples >> graphAndTicksLabel [
<gtExample>
| labelsX graph labelsY |
	graph := self graphAndTicks.
labelsX := BarPlotter new labelTicksX: 
self values size with: self sizeGraph with: self relocate.
labelsY := BarPlotter new labelTicksY: 
self values size with: self sizeGraph with: self relocate.
1 to: self values size do: [:n| graph addChild: (labelsX at: n).
				graph addChild: (labelsY at: n)].
^graph
]

{ #category : #'as yet unclassified' }
BarPlotterExamples >> graphTotal [
<gtExample>
| labelAxisX graph labelAxisY ticksX ticksY labelsX labelsY titel|
graph := self containerWithGraphAndBars. 

"Labels for the axis"
labelAxisX := BarPlotter new labelAxisX: self sizeGraph with: self sizeLabel with: self relocate.
graph addChild: labelAxisX.
labelAxisY := BarPlotter new labelAxisY: self sizeGraph with: self sizeLabel with: self relocate.
graph addChild: labelAxisY.

"ticks on both axis"
ticksX:= BarPlotter new ticksAxisX: self values size with: self sizeGraph with: self relocate.
ticksY:= BarPlotter new ticksAxisY: self values size with: self sizeGraph with: self relocate.
1 to: self values size do: [:n| graph addChild: (ticksX at: n).
				graph addChild: (ticksY at: n)].
				
"labels for the ticks on both axis"
labelsX := BarPlotter new labelTicksX: 
self values size with: self sizeGraph with: self relocate.
labelsY := BarPlotter new labelTicksY: 
self values size with: self sizeGraph with: self relocate.
1 to: self values size do: [:n| graph addChild: (labelsX at: n).
				graph addChild: (labelsY at: n)].
				
"titel of the graph"
titel := BarPlotter new titelGraph: self sizeGraph with: self sizeLabel with: self relocate. 
graph addChild: titel. 
				
^graph
]

{ #category : #'as yet unclassified' }
BarPlotterExamples >> graphWithTitel [
<gtExample>
| graph titel |
	graph := self containerWithGraphAndBars. 
titel := BarPlotter new titelGraph: self sizeGraph with: self sizeLabel with: self relocate. 
graph addChild: titel. 
^graph
]

{ #category : #'as yet unclassified' }
BarPlotterExamples >> relocate [
^100
]

{ #category : #'as yet unclassified' }
BarPlotterExamples >> sizeGraph [
^500
]

{ #category : #'as yet unclassified' }
BarPlotterExamples >> sizeLabel [
^50
]

{ #category : #'as yet unclassified' }
BarPlotterExamples >> values [
^#(0.2 0.4 0.6 0.8 1.0 0.9 0.7 0.5 0.3 0.1).
]

Class {
	#name : #LarPlotterLine,
	#superclass : #Object,
	#instVars : [
		'labelAxisX',
		'labelAxisY',
		'graph',
		'amountTicksY',
		'amountTicksX',
		'tickLabelsY',
		'lines',
		'ticksX',
		'ticksY',
		'tickLabelsX',
		'title'
	],
	#category : #'LarPlotter-Plotter'
}

{ #category : #'as yet unclassified' }
LarPlotterLine >> addAxisLabel: textX with: textY [
labelAxisX := LarLabelAxis new initialize: textX. 
labelAxisY := LarLabelAxis new initialize: textY. 
graph addAxisLabel: labelAxisX asElement with: labelAxisY asElement. 
]

{ #category : #'as yet unclassified' }
LarPlotterLine >> addLines: values [
| line |
	1 to: (values size) do: [:n|
 n=1
ifTrue:[line:= LarLine new initialize: (0@0) with: (60*n)@(values at: n)]
ifFalse:[line:= LarLine new initialize: (60*(n-1))@(values at: (n-1)) with: (n*60)@(values at: n)].
graph addLines: (values size) with: n with: (line asElement). 
 lines add: line. 
].
]

{ #category : #'as yet unclassified' }
LarPlotterLine >> addTicks: tickAmount [
|  tickY ticksY |
self tickInitialize.
ticksY removeAll. 
amountTicksY := tickAmount.
	1 to: ( tickAmount ) do: [: n| 
tickY := (LarTick new initialize: 3 with: 10).
graph addTicksY: tickAmount with: (tickY asElementY) with: n.
ticksY add: tickY.

].
]

{ #category : #'as yet unclassified' }
LarPlotterLine >> addTicksLabel: valuesX with: valuesY [
| tick tickLabelsX |
self tickLablesInitialize.
	1 to: (valuesX size ) do: [: n| 
tick := LarTickLabel new initialize: (valuesX at: n).
graph addTicksLabelX: tick asElement with: amountTicksX with: n.
tickLabelsX add: tick. 
].

1 to: ( valuesY size ) do: [: n| 
tick:= LarTickLabel new initialize: (valuesY at: (( valuesY size) - (n-1))). 
graph addTicksLabelY: tick asElement with: valuesY size with: n.
tickLabelsY add: tick.
].


]

{ #category : #'as yet unclassified' }
LarPlotterLine >> graph [
^graph
]

{ #category : #'as yet unclassified' }
LarPlotterLine >> gtLiveFor: aView [
	<gtView>
	^aView explicit
		title: 'Live';
		priority: 10;
		stencil: [ self graph   ];
		actionUpdateButton.
		
]

{ #category : #'as yet unclassified' }
LarPlotterLine >> initialize [
graph := LarPlotterLineElement new create.
self linesDefinition. 
]

{ #category : #'as yet unclassified' }
LarPlotterLine >> linesDefinition [

	lines:=  OrderedCollection new. 
]

{ #category : #'as yet unclassified' }
LarPlotterLine >> tickInitialize [

	ticksX:= OrderedCollection new. 
ticksY := OrderedCollection new.
]

{ #category : #'as yet unclassified' }
LarPlotterLine >> tickLablesInitialize [
tickLabelsX:= OrderedCollection new. 
tickLabelsY := OrderedCollection new.
]

{ #category : #'as yet unclassified' }
LarPlotterLine >> titel: text [

	title := LarTitel new initialize: text. 
	graph addTitle: text with: title asElement. 
]

{ #category : #'as yet unclassified' }
LarPlotterLine >> title [
^title
]

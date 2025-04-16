Class {
	#name : #LarPlotterBar,
	#superclass : #Object,
	#instVars : [
		'labelAxisX',
		'labelAxisY',
		'title',
		'bars',
		'tickLabelsX',
		'tickLabelsY',
		'ticksX',
		'ticksY',
		'spec',
		'dict',
		'amountTicksY'
	],
	#category : #'LarPlotter-Plotter'
}

{ #category : #accessing }
LarPlotterBar class >> withSpec: aSpec [
	 ^ self new
	 	spec: aSpec;
	 	initializeBarGraphFromSpec;
	 	yourself
]

{ #category : #'as yet unclassified' }
LarPlotterBar >> addAxisLabel: textX with: textY [
labelAxisX := LarLabelAxis new initialize: textX. 
labelAxisY := LarLabelAxis new initialize: textY.
]

{ #category : #'as yet unclassified' }
LarPlotterBar >> addBars: values [
| bar |
	1 to: (values size) do: [:n|
bar:= LarBar new initialize: ((values at: n)) with: 65.
 bars add: bar. 
].
]

{ #category : #'as yet unclassified' }
LarPlotterBar >> addTicks: tickAmount [
|  tickY |
self tickInitialize.
ticksY removeAll. 
1 to: ( tickAmount ) do: [: n| 
tickY := (LarTick new initialize: 3 with: 10).
ticksY add: tickY.

].
]

{ #category : #'as yet unclassified' }
LarPlotterBar >> addTicks: tickXAmount with: tickYAmount [
| tickX tickY |
1 to: ( tickYAmount ) do: [: n| 
tickY := (LarTick new initialize: 3 with: 10).

ticksY add: tickX.
].
]

{ #category : #'as yet unclassified' }
LarPlotterBar >> addTicksLabel: valuesX [
| tick |
self tickLablesInitialize.
	1 to: ( valuesX size) do: [: n| 
tick := LarTickLabel new initialize: (valuesX at: n).

tickLabelsX add: tick. 
].
]

{ #category : #'as yet unclassified' }
LarPlotterBar >> addTicksLabel: valuesX with: valuesY [
| tick |
self tickLablesInitialize.
	1 to: (valuesX size ) do: [: n| 
tick := LarTickLabel new initialize: (valuesX at: n).

tickLabelsX add: tick. 
].

1 to: ( valuesY size ) do: [: n| 
tick:= LarTickLabel new initialize: (valuesY at: (( valuesY size) - (n-1))). 

tickLabelsY add: tick.
].
]

{ #category : #'as yet unclassified' }
LarPlotterBar >> amountTicksY [
^amountTicksY
]

{ #category : #'as yet unclassified' }
LarPlotterBar >> asElement [
^LarPlotterBarElement new initialize: self.
]

{ #category : #'as yet unclassified' }
LarPlotterBar >> bars [
^bars
]

{ #category : #accessing }
LarPlotterBar >> bars: anObject [
	bars := anObject
]

{ #category : #'as yet unclassified' }
LarPlotterBar >> barsDefinition [
bars:=  OrderedCollection new. 
]

{ #category : #'as yet unclassified' }
LarPlotterBar >> changeTitle: text [
title setText: text. 

]

{ #category : #'as yet unclassified' }
LarPlotterBar >> gtLiveFor: aView [
	<gtView>
	^aView explicit
		title: 'Live';
		priority: 10;
		stencil: [ self asElement asScalableElement  ];
		actionUpdateButton.
		
]

{ #category : #'as yet unclassified' }
LarPlotterBar >> initialize [

self tickLablesInitialize.
self tickInitialize.
self barsDefinition. 
]

{ #category : #accessing }
LarPlotterBar >> initializeBarGraphFromSpec [

	| data axisX axisy |
	dict := STONJSON fromString: self spec.
	self initialize.
	data := ((dict at: 'data') at: 'values') collect: #values.
	axisX := ((dict at: 'encoding') at: 'x') at: 'field'.
	axisy := ((dict at: 'encoding') at: 'y') at: 'field'.

	self titel: 'This is a title'.
	self addBars: (data collect: [ :each | each last ]).
	self addAxisLabel: axisX with: axisy.
	self addTicks:  data size.
	self addTicksLabel: (data collect: [ :each | each first ])
]

{ #category : #accessing }
LarPlotterBar >> labelAxisX [
	^ labelAxisX
]

{ #category : #accessing }
LarPlotterBar >> labelAxisX: anObject [
	labelAxisX := anObject
]

{ #category : #accessing }
LarPlotterBar >> labelAxisY [
	^ labelAxisY
]

{ #category : #accessing }
LarPlotterBar >> labelAxisY: anObject [
	labelAxisY := anObject
]

{ #category : #accessing }
LarPlotterBar >> spec [
	^ spec
]

{ #category : #accessing }
LarPlotterBar >> spec: anObject [
	spec := anObject
]

{ #category : #'as yet unclassified' }
LarPlotterBar >> tickInitialize [
ticksX:= OrderedCollection new. 
ticksY := OrderedCollection new.
]

{ #category : #'as yet unclassified' }
LarPlotterBar >> tickLabelsX [
^tickLabelsX
]

{ #category : #accessing }
LarPlotterBar >> tickLabelsX: anObject [
	tickLabelsX := anObject
]

{ #category : #'as yet unclassified' }
LarPlotterBar >> tickLabelsY [
^tickLabelsY
]

{ #category : #accessing }
LarPlotterBar >> tickLabelsY: anObject [
	tickLabelsY := anObject
]

{ #category : #'as yet unclassified' }
LarPlotterBar >> tickLablesInitialize [
tickLabelsX:= OrderedCollection new. 
tickLabelsY := OrderedCollection new.
]

{ #category : #'as yet unclassified' }
LarPlotterBar >> ticksX [
^ticksX
]

{ #category : #accessing }
LarPlotterBar >> ticksX: anObject [
	ticksX := anObject
]

{ #category : #'as yet unclassified' }
LarPlotterBar >> ticksY [
^ticksY
]

{ #category : #accessing }
LarPlotterBar >> ticksY: anObject [
	ticksY := anObject
]

{ #category : #'as yet unclassified' }
LarPlotterBar >> titel: text [
	title := LarTitel new initialize: text. 
	"graph addTitle: text with: title asElement. "
]

{ #category : #'as yet unclassified' }
LarPlotterBar >> title [
^title
]

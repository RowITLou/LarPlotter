Class {
	#name : #LarPlotterLine,
	#superclass : #Object,
	#instVars : [
		'labelAxisX',
		'labelAxisY',
		'ticksY',
		'tickLabelsX',
		'tickLabelsY',
		'announcer',
		'spec',
		'ticksX',
		'title',
		'dict'
	],
	#category : #'LarPlotter-Plotter'
}

{ #category : #'as yet unclassified' }
LarPlotterLine >> addAxisLabel: textX with: textY [
labelAxisX := LarLabelAxis new initialize: textX. 
labelAxisY := LarLabelAxis new initialize: textY.
self notifyUpdate
]

{ #category : #'as yet unclassified' }
LarPlotterLine >> addTicks: tickAmount [
|  tickY |
self tickInitialize.
ticksY removeAll. 
1 to: ( tickAmount ) do: [: n| 
tickY := (LarTick new initialize: 3 with: 10).
ticksY add: tickY.

].
self notifyUpdate
]

{ #category : #'as yet unclassified' }
LarPlotterLine >> addTicks: tickXAmount with: tickYAmount [
| tickX tickY |
1 to: ( tickYAmount ) do: [: n| 
tickY := (LarTick new initialize: 3 with: 10).

ticksY add: tickX.
].
self notifyUpdate
]

{ #category : #'as yet unclassified' }
LarPlotterLine >> addTicksLabel: valuesX [
| tick |
self tickLablesInitialize.
	1 to: ( valuesX size) do: [: n| 
tick := LarTickLabel new initialize: (valuesX at: n).

tickLabelsX add: tick. 
].
self notifyUpdate
]

{ #category : #'as yet unclassified' }
LarPlotterLine >> addTicksLabel: valuesX with: valuesY [
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
self notifyUpdate
]

{ #category : #'as yet unclassified' }
LarPlotterLine >> announcer [
	^ announcer
]

{ #category : #'as yet unclassified' }
LarPlotterLine >> announcer: anObject [
	announcer := anObject
]

{ #category : #'as yet unclassified' }
LarPlotterLine >> asElement [
^LarPlotterLineElement new initialize: self.
]

{ #category : #accessing }
LarPlotterLine >> dict [
	^ dict
]

{ #category : #accessing }
LarPlotterLine >> dict: anObject [
	dict := anObject
]

{ #category : #'as yet unclassified' }
LarPlotterLine >> gtLiveFor: aView [
	<gtView>
	^aView explicit
		title: 'Live';
		priority: 10;
		stencil: [ self asElement asScalableElement  ];
		actionUpdateButton;
		updateWhen: LarLinePlotterUpdate in: self announcer.
		
]

{ #category : #'as yet unclassified' }
LarPlotterLine >> initialize [
announcer := Announcer new.
self tickLablesInitialize.
self tickInitialize.

]

{ #category : #accessing }
LarPlotterLine >> labelAxisX [
	^ labelAxisX
]

{ #category : #accessing }
LarPlotterLine >> labelAxisX: anObject [
	labelAxisX := anObject
]

{ #category : #accessing }
LarPlotterLine >> labelAxisY [
	^ labelAxisY
]

{ #category : #accessing }
LarPlotterLine >> labelAxisY: anObject [
	labelAxisY := anObject
]

{ #category : #'as yet unclassified' }
LarPlotterLine >> notifyUpdate [
self announcer announce: LarLinePlotterUpdate new
]

{ #category : #accessing }
LarPlotterLine >> spec [
	^ spec
]

{ #category : #accessing }
LarPlotterLine >> spec: anObject [
	spec := anObject
]

{ #category : #'as yet unclassified' }
LarPlotterLine >> tickInitialize [
ticksX:= OrderedCollection new. 
ticksY := OrderedCollection new.
]

{ #category : #accessing }
LarPlotterLine >> tickLabelsX [
	^ tickLabelsX
]

{ #category : #accessing }
LarPlotterLine >> tickLabelsX: anObject [
	tickLabelsX := anObject
]

{ #category : #accessing }
LarPlotterLine >> tickLabelsY [
	^ tickLabelsY
]

{ #category : #accessing }
LarPlotterLine >> tickLabelsY: anObject [
	tickLabelsY := anObject
]

{ #category : #'as yet unclassified' }
LarPlotterLine >> tickLablesInitialize [
tickLabelsX:= OrderedCollection new. 
tickLabelsY := OrderedCollection new.
]

{ #category : #accessing }
LarPlotterLine >> ticksX [
	^ ticksX
]

{ #category : #accessing }
LarPlotterLine >> ticksX: anObject [
	ticksX := anObject
]

{ #category : #accessing }
LarPlotterLine >> ticksY [
	^ ticksY
]

{ #category : #accessing }
LarPlotterLine >> ticksY: anObject [
	ticksY := anObject
]

{ #category : #'as yet unclassified' }
LarPlotterLine >> titel: text [
	title := LarTitel new initialize: text. 
	self notifyUpdate
	
]

{ #category : #'as yet unclassified' }
LarPlotterLine >> title [
^title
]

{ #category : #'as yet unclassified' }
LarPlotterLine >> withSpec: aSpec [
	 ^ self new
	 	spec: aSpec;
	 	initializeBarGraphFromSpec;
	 	yourself
]

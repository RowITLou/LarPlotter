Class {
	#name : #LarPlotterScatter,
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
		'dict',
		'points',
		'values'
	],
	#category : #'LarPlotter-Plotter'
}

{ #category : #'as yet unclassified' }
LarPlotterScatter >> addAxisLabel: textX with: textY [
labelAxisX := LarLabelAxis new initialize: textX. 
labelAxisY := LarLabelAxis new initialize: textY.
self notifyUpdate
]

{ #category : #'as yet unclassified' }
LarPlotterScatter >> addPoints: valuesCollection [
| point |
values := valuesCollection.
	1 to: (values size) do: [:n|
n = 1
	ifTrue:  [point:= LarPoint new initialize: 0 with: (values at: 1)]
	ifFalse: [point:= LarPoint new initialize: (65 * (n)) with: (values at: n)].
 points add: point. 
].
self notifyUpdate
]

{ #category : #'as yet unclassified' }
LarPlotterScatter >> addTicks: tickAmount [
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
LarPlotterScatter >> addTicks: tickXAmount with: tickYAmount [
| tickX tickY |
1 to: ( tickYAmount ) do: [: n| 
tickY := (LarTick new initialize: 3 with: 10).

ticksY add: tickX.
].
self notifyUpdate
]

{ #category : #'as yet unclassified' }
LarPlotterScatter >> addTicksLabel: valuesX [
| tick  |
self tickLablesInitialize.
	1 to: (valuesX size ) do: [: n| 
tick := LarTickLabel new initialize: (valuesX at: n).

tickLabelsX add: tick. 
].

]

{ #category : #'as yet unclassified' }
LarPlotterScatter >> addTicksLabel: valuesX with: steps [
| tick amount minDown |
self tickLablesInitialize.
	1 to: (valuesX size ) do: [: n| 
tick := LarTickLabel new initialize: (valuesX at: n).

tickLabelsX add: tick. 
].

amount := self calculateTickLabelsY: steps.
minDown := (values min) roundDownTo: steps. 
self tickLablesInitialize.
	1 to: (amount+1) do: [: n| 
tick := LarTickLabel new initialize: (minDown + (steps * (n-1))).

tickLabelsY add: tick. 
].
self notifyUpdate
]

{ #category : #'as yet unclassified' }
LarPlotterScatter >> announcer [
	^ announcer
]

{ #category : #'as yet unclassified' }
LarPlotterScatter >> announcer: anObject [
	announcer := anObject
]

{ #category : #'as yet unclassified' }
LarPlotterScatter >> asElement [
^LarPlotterScatterElement new initialize: self.
]

{ #category : #'as yet unclassified' }
LarPlotterScatter >> calculateTickLabelsY: steps [
| min max interval amount minRound maxRound |
	min := values min.
	max := values max.
	
	minRound := min roundDownTo: steps.
	maxRound := max roundUpTo: steps.
	interval := maxRound - minRound. 
	amount := interval / steps. 
	^amount
	
	
	"finalUp := amount roundUpTo: rounded. 
	finalDown := amount roundDownTo: rounded. 
	(amount - finalDown) abs > (amount - finalUp)
	ifTrue: [final := finalUp]
	ifFalse: [final := finalDown]"

]

{ #category : #'as yet unclassified' }
LarPlotterScatter >> dict [
	^ dict
]

{ #category : #'as yet unclassified' }
LarPlotterScatter >> dict: anObject [
	dict := anObject
]

{ #category : #'as yet unclassified' }
LarPlotterScatter >> download: aUrl [
ZnClient new
				url: aUrl;
				signalProgress: true;
				downloadTo: (FileLocator downloads  ).
]

{ #category : #'as yet unclassified' }
LarPlotterScatter >> gtLiveFor: aView [
	<gtView>
	^aView explicit
		title: 'Live';
		priority: 10;
		stencil: [ self asElement asScalableElement  ];
		actionUpdateButton;
		updateWhen: LarLinePlotterUpdate in: self announcer.
		
]

{ #category : #'as yet unclassified' }
LarPlotterScatter >> initialize [
announcer := Announcer new.
self tickLablesInitialize.
self tickInitialize.
self pointsDefinition
]

{ #category : #'as yet unclassified' }
LarPlotterScatter >> initializeLineGraphFromSpec [

	| data axisX axisy |
	dict := STONJSON fromString: self spec.
	self initialize.
	"data := ((dict at: 'data') at: 'values') collect: #values."
	axisX := ((dict at: 'encoding') at: 'x') at: 'field'.
	axisy := ((dict at: 'encoding') at: 'y') at: 'field'.

	self titel: 'This is a title'.
	"self addLines: (data collect: [ :each | each last ])."
	self addAxisLabel: axisX with: axisy.
	self addTicks:  data size.
	self addTicksLabel: (data collect: [ :each | each first ])
]

{ #category : #'as yet unclassified' }
LarPlotterScatter >> labelAxisX [
	^ labelAxisX
]

{ #category : #'as yet unclassified' }
LarPlotterScatter >> labelAxisX: anObject [
	labelAxisX := anObject
]

{ #category : #'as yet unclassified' }
LarPlotterScatter >> labelAxisY [
	^ labelAxisY
]

{ #category : #'as yet unclassified' }
LarPlotterScatter >> labelAxisY: anObject [
	labelAxisY := anObject
]

{ #category : #'as yet unclassified' }
LarPlotterScatter >> notifyUpdate [
self announcer announce: LarLinePlotterUpdate new
]

{ #category : #'as yet unclassified' }
LarPlotterScatter >> points [
	^ points
]

{ #category : #'as yet unclassified' }
LarPlotterScatter >> points: anObject [
	points := anObject
]

{ #category : #'as yet unclassified' }
LarPlotterScatter >> pointsDefinition [
points:=  OrderedCollection new. 
]

{ #category : #'as yet unclassified' }
LarPlotterScatter >> spec [
	^ spec
]

{ #category : #'as yet unclassified' }
LarPlotterScatter >> spec: anObject [
	spec := anObject
]

{ #category : #'as yet unclassified' }
LarPlotterScatter >> tickInitialize [
ticksX:= OrderedCollection new. 
ticksY := OrderedCollection new.
]

{ #category : #'as yet unclassified' }
LarPlotterScatter >> tickLabelsX [
	^ tickLabelsX
]

{ #category : #'as yet unclassified' }
LarPlotterScatter >> tickLabelsX: anObject [
	tickLabelsX := anObject
]

{ #category : #'as yet unclassified' }
LarPlotterScatter >> tickLabelsY [
	^ tickLabelsY
]

{ #category : #'as yet unclassified' }
LarPlotterScatter >> tickLabelsY: anObject [
	tickLabelsY := anObject
]

{ #category : #'as yet unclassified' }
LarPlotterScatter >> tickLablesInitialize [
tickLabelsX:= OrderedCollection new. 
tickLabelsY := OrderedCollection new.
]

{ #category : #'as yet unclassified' }
LarPlotterScatter >> ticksX [
	^ ticksX
]

{ #category : #'as yet unclassified' }
LarPlotterScatter >> ticksX: anObject [
	ticksX := anObject
]

{ #category : #'as yet unclassified' }
LarPlotterScatter >> ticksY [
	^ ticksY
]

{ #category : #'as yet unclassified' }
LarPlotterScatter >> ticksY: anObject [
	ticksY := anObject
]

{ #category : #'as yet unclassified' }
LarPlotterScatter >> titel: text [
	title := LarTitel new initialize: text. 
	self notifyUpdate
	
]

{ #category : #'as yet unclassified' }
LarPlotterScatter >> title [
^title
]

{ #category : #'as yet unclassified' }
LarPlotterScatter >> withSpec: aSpec [
	 ^ self new
	 	spec: aSpec;
	 	initializeBarGraphFromSpec;
	 	yourself
]

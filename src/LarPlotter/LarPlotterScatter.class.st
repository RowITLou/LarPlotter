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
		'values',
		'scale',
		'space'
	],
	#category : #'LarPlotter-Plotter'
}

{ #category : #'as yet unclassified' }
LarPlotterScatter class >> withSpec: aSpec [
	 ^ self new
	 	spec: aSpec;
	 	yourself
]

{ #category : #'as yet unclassified' }
LarPlotterScatter >> addAxisLabel: textX with: textY [
labelAxisX := LarLabelAxis new initialize: textX. 
labelAxisY := LarLabelAxis new initialize: textY.
self notifyUpdate
]

{ #category : #'as yet unclassified' }
LarPlotterScatter >> addPoints [
| point width val |
	
	width := 65.
	val := self ensureDataHeight.
	width := self ensureDataWidth: (val size).
    
	1 to: ((val size)-1)
		do: [ :n | 
			  point := LarPoint new initialize: ((n - 1)*width) with:(values at: n).
			points add: point ].
self notifyUpdate.
]

{ #category : #'as yet unclassified' }
LarPlotterScatter >> addTicks [
	| tickY tickAmount |
	self tickInitialize.
	ticksY removeAll.
	tickAmount := self ensureAmountTicksY.
	1
		to: tickAmount
		do: [ :n | 
			tickY := LarTick new initialize: 3 with: 10.
			ticksY add: tickY ].
	
	self scale: (dict at: 'data' at: 'scale'). 
	self space: (dict at: 'data' at: 'space'). 
	self notifyUpdate
]

{ #category : #'as yet unclassified' }
LarPlotterScatter >> addTicksLabel: valuesX with: valuesY [
| tick amount |
points isNil
	ifTrue:[^self].
	self tickLablesInitialize.
	
	1 to: (valuesX size ) do: [: n| 
tick := LarTickLabel new initialize: (valuesX at: n).

tickLabelsX add: tick. 
].

amount := dict at: 'data' at: 'tick'.
	1
		to: amount
		do: [ :n | 
			tick := LarTickLabel new initialize: (valuesY * (amount- (n - 1))).

			tickLabelsY add: tick ].
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
LarPlotterScatter >> dict [
	^ dict
]

{ #category : #'as yet unclassified' }
LarPlotterScatter >> dict: anObject [
	dict := anObject
]

{ #category : #'as yet unclassified' }
LarPlotterScatter >> ensureAmountTicksY [
	| rule newDict |
	rule := LARTickSpecUpdaterRule for: dict.
	newDict := rule updateDict.
	newDict := rule updateDictLineX.
	dict := newDict.
	
	^ dict at: 'data' at: 'tick'
]

{ #category : #'as yet unclassified' }
LarPlotterScatter >> ensureDataHeight [
| rule newDict val data|
	rule := LARLineSpecUpdaterRule for: dict.
	newDict := rule updateDictHeight.

	dict := newDict.
	val := (dict at: 'data') at: 'values_two'.
	data := OrderedCollection new. 
	data := val doWithIndex: [ :each :i | data add: (each at: i)].
	^ data
]

{ #category : #'as yet unclassified' }
LarPlotterScatter >> ensureDataWidth: aNumber [
	 |rule newDict val data|
	rule := LARLineSpecUpdaterRule for: dict.
	newDict := rule updateDictWidth.

	dict := newDict.
	val := (dict at: 'data') at: 'values_one'.
	data := OrderedCollection new. 
	data := val doWithIndex: [ :each :i | data add: (each at: i)].
	^ data
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
LarPlotterScatter >> initializeDict [
	<brainstorming>

	"| data axisX axisy |"
	dict := STONJSON fromString: self spec.
	self initializeFor
]

{ #category : #'as yet unclassified' }
LarPlotterScatter >> initializeFor [
	| axisX axisy |
	
axisX := (self dict at: 'encoding' at: 'x')at: 'field'. 
	axisy := (self dict at: 'encoding' at: 'y')at: 'field'. 
	self titel: 'This is a title'.
	self addPoints.
	self addAxisLabel: axisX with: axisy.
	self addTicks. 
	"self addTicksLabel: (self dict at: 'data' at: 'timeData') with: self space". 
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

{ #category : #accessing }
LarPlotterScatter >> scale [
	^ scale
]

{ #category : #accessing }
LarPlotterScatter >> scale: anObject [
	scale := anObject
]

{ #category : #accessing }
LarPlotterScatter >> space [
	^ space
]

{ #category : #accessing }
LarPlotterScatter >> space: anObject [
	space := anObject
]

{ #category : #'as yet unclassified' }
LarPlotterScatter >> spec [
	^ spec
]

{ #category : #'as yet unclassified' }
LarPlotterScatter >> spec: aJSONString [
	spec := aJSONString.
	self initializeDict
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

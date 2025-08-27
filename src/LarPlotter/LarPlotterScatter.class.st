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
		'scale_one',
		'space_one',
		'scale_two',
		'space_two'
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
	| point   val_one val_two |
	
	val_two := self ensureDataHeight.
	val_one := self ensureDataWidth.

	1
		to: val_one size
		do: [ :n | 
			point := LarPoint new initialize: (val_one at: n) with: (val_two at: n).
			points add: point ].
	self notifyUpdate
]

{ #category : #'as yet unclassified' }
LarPlotterScatter >> addTicks [
	| tickY tickX tickAmountX tickAmountY |
	self tickInitialize.
	ticksY removeAll.
	ticksX removeAll.
	self ensureAmountTicks.
	tickAmountX := dict at: 'data' at: 'tick_one'.
	tickAmountY := dict at: 'data' at: 'tick_two'.
	1
		to: tickAmountX
		do: [ :n | 
			
			tickX := LarTick new initialize: 3 with: 10.
			ticksX add: tickY ].
	1
		to: tickAmountY
		do: [ :n | 
			tickY := LarTick new initialize: 3 with: 10.
			ticksY add: tickY ].

	self scale_one: (dict at: 'data' at: 'scale_one').
	self space_one: (dict at: 'data' at: 'space_one').
	self scale_two: (dict at: 'data' at: 'scale_two').
	self space_two: (dict at: 'data' at: 'space_two').
	self notifyUpdate
]

{ #category : #'as yet unclassified' }
LarPlotterScatter >> addTicksLabel: valuesX with: valuesY [
	| tick amountY amountX |
	points isNil ifTrue: [ ^ self ].
	self tickLablesInitialize.

	amountX := dict at: 'data' at: 'tick_one'.
	1
		to: amountX
		do: [ :n | 
			tick := LarTickLabel new initialize: valuesX * (amountX - (n - 1)).

			tickLabelsX add: tick ].

	amountY := dict at: 'data' at: 'tick_two'.
	1
		to: amountY
		do: [ :n | 
			tick := LarTickLabel new initialize: valuesY * (amountY - (n - 1)).

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
LarPlotterScatter >> ensureAmountTicks [
	| rule newDict |
	rule := LARTickSpecUpdaterRule for: dict.
	newDict := rule updateDictScatterX.
	newDict := rule updateDictScatterY.
	dict := newDict.
	
	"^ dict at: 'data' at: 'tick'"
]

{ #category : #'as yet unclassified' }
LarPlotterScatter >> ensureAmountTicksY [
	| rule newDict |
	rule := LARTickSpecUpdaterRule for: dict.
	newDict := rule updateDictScatterX.
	newDict := rule updateDictScatterY.
	dict := newDict.
	
	"^ dict at: 'data' at: 'tick'"
]

{ #category : #'as yet unclassified' }
LarPlotterScatter >> ensureDataHeight [
| rule newDict val data|
	rule := LARScatterSpecUpdaterRule for: dict.
	newDict := rule updateDictHeight.

	dict := newDict.
	val := (dict at: 'data') at: 'values_two'.
	data := OrderedCollection new. 
	data := val doWithIndex: [ :each :i | data add: (val at: i)].
	^ data
]

{ #category : #'as yet unclassified' }
LarPlotterScatter >> ensureDataWidth [
	 |rule newDict val data|
	rule := LARScatterSpecUpdaterRule for: dict.
	newDict := rule updateDictWidth.

	dict := newDict.
	val := (dict at: 'data') at: 'values_one'.
	data := OrderedCollection new. 
	data := val doWithIndex: [ :each :i | data add: (val at: i)].
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
	self addTicksLabel: (self dict at: 'data' at: 'space_one') with: (self dict at: 'data' at: 'space_two'). 
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
LarPlotterScatter >> scale_one [
	^ scale_one
]

{ #category : #accessing }
LarPlotterScatter >> scale_one: anObject [
	scale_one := anObject
]

{ #category : #accessing }
LarPlotterScatter >> scale_two [
	^ scale_two
]

{ #category : #accessing }
LarPlotterScatter >> scale_two: anObject [
	scale_two := anObject
]

{ #category : #accessing }
LarPlotterScatter >> space [
	^ space
]

{ #category : #accessing }
LarPlotterScatter >> space: anObject [
	space := anObject
]

{ #category : #accessing }
LarPlotterScatter >> space_one [
	^ space_one
]

{ #category : #accessing }
LarPlotterScatter >> space_one: anObject [
	space_one := anObject
]

{ #category : #accessing }
LarPlotterScatter >> space_two [
	^ space_two
]

{ #category : #accessing }
LarPlotterScatter >> space_two: anObject [
	space_two := anObject
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

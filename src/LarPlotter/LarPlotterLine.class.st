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
		'dict',
		'lines',
		'scale',
		'space',
		'points'
	],
	#category : #'LarPlotter-Plotter'
}

{ #category : #'as yet unclassified' }
LarPlotterLine class >> withSpec: aSpec [
	 ^ self new
	 	spec: aSpec;
	 	yourself
]

{ #category : #'as yet unclassified' }
LarPlotterLine >> addAxisLabel: textX with: textY [
labelAxisX := LarLabelAxis new initialize: textX. 
labelAxisY := LarLabelAxis new initialize: textY.
self notifyUpdate
]

{ #category : #'as yet unclassified' }
LarPlotterLine >> addLines [
	| line width val |
	
	width := 65.
	val := self ensureDataHeight.
	width := self ensureDataWidth: (val size).
    self addPoints: val with: width. 
	1 to: ((val size)-1)
		do: [ :n | 
			  line := (LarLine new
							initialize: (width * (n - 1)) @ (val at: n)
							with: (width * n) @ (val at: (n+1))) .
			lines add: line ].
		
	self notifyUpdate
]

{ #category : #'as yet unclassified' }
LarPlotterLine >> addPoints [
]

{ #category : #'as yet unclassified' }
LarPlotterLine >> addPoints: values with: width [
	1 to: values size
		do: [ :n  | 
			| point |
			point := LarPoint new initialize: ((n - 1)*width) with:(values at: n).
			points add: point ]
]

{ #category : #'as yet unclassified' }
LarPlotterLine >> addTicks [
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
LarPlotterLine >> addTicksLabel: valuesX with: valuesY [
| tick amount |
lines isNil
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
LarPlotterLine >> ensureAmountTicksY [
	| rule newDict |
	rule := LARTickSpecUpdaterRule for: dict.
	newDict := rule updateDict.
	newDict := rule updateDictLineX.
	dict := newDict.
	
	^ dict at: 'data' at: 'tick'
]

{ #category : #'as yet unclassified' }
LarPlotterLine >> ensureDataHeight [
| rule newDict val data|
	rule := LARLineSpecUpdaterRule for: dict.
	newDict := rule updateDictHeight.

	dict := newDict.
	val := (dict at: 'data') at: 'values'.
	data := OrderedCollection new. 
	data := val doWithIndex: [ :each :i | data add: each ].
	^ data
]

{ #category : #'as yet unclassified' }
LarPlotterLine >> ensureDataWidth: aNumber [
	| width rule newDict |
	((dict at: 'data') includesKey: 'width') ifFalse: [ rule := LARLineSpecUpdaterRule for: dict.
	newDict := rule updateDictWidth.
	dict := newDict.
	^dict at: 'data' at: 'width' ].
     
     
    width := dict at: 'data' at: 'width'.  
    aNumber * width < 660 & (aNumber * width > 600) ifTrue: [ ^width].
	rule := LARBarSpecUpdaterRule for: dict.
	newDict := rule updateDictWidth: aNumber.
	dict := newDict.
	^ dict at: 'data' at: 'width'
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
self linesDefinition.
self pointsDefinition.
]

{ #category : #'as yet unclassified' }
LarPlotterLine >> initializeDict [
	<brainstorming>

	"| data axisX axisy |"
	dict := STONJSON fromString: self spec.
	self initializeFor
]

{ #category : #'as yet unclassified' }
LarPlotterLine >> initializeFor [
	| axisX axisy |
	

	self titel: 'This is a title'.
	self addLines.
	self addAxisLabel: axisX with: axisy.
	self addTicks. 
	self addTicksLabel: (self dict at: 'data' at: 'timeData') with: self space. 
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

{ #category : #accessing }
LarPlotterLine >> lines [
	^ lines
]

{ #category : #accessing }
LarPlotterLine >> lines: anObject [
	lines := anObject
]

{ #category : #'as yet unclassified' }
LarPlotterLine >> linesDefinition [
lines:=  OrderedCollection new. 
]

{ #category : #'as yet unclassified' }
LarPlotterLine >> notifyUpdate [
self announcer announce: LarLinePlotterUpdate new
]

{ #category : #accessing }
LarPlotterLine >> points [
	^ points
]

{ #category : #accessing }
LarPlotterLine >> points: anObject [
	points := anObject
]

{ #category : #'as yet unclassified' }
LarPlotterLine >> pointsDefinition [
points :=  OrderedCollection new. 
]

{ #category : #accessing }
LarPlotterLine >> scale [
	^ scale
]

{ #category : #accessing }
LarPlotterLine >> scale: anObject [
	scale := anObject
]

{ #category : #accessing }
LarPlotterLine >> space [
	^ space
]

{ #category : #accessing }
LarPlotterLine >> space: anObject [
	space := anObject
]

{ #category : #accessing }
LarPlotterLine >> spec [
	^ spec
]

{ #category : #accessing }
LarPlotterLine >> spec: aJSONString [
	spec := aJSONString.
	self initializeDict
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
	 	initializeLineGraphFromSpec;
	 	yourself
]

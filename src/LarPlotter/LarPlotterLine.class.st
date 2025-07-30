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
		'space'
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
LarPlotterLine >> addLines: valuesCollection [
	| line width val values |
	values := valuesCollection.
	width := 65.
	val := self ensureDataHeight: values.
	width := self ensureDataWidth: val size.

	1
		to: values size
		do: [ :n | 
			n = 1
				ifTrue: [ line := LarLine new initialize: 0 @ 0 with: width @ (values at: 1) ]
				ifFalse: [ line := LarLine new
							initialize: (width * (n - 1)) @ (values at: n - 1)
							with: (width * n) @ (values at: n) ].
			lines add: line ].
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
| tick  |
self tickLablesInitialize.
	1 to: (valuesX size ) do: [: n| 
tick := LarTickLabel new initialize: (valuesX at: n).

tickLabelsX add: tick. 
].

]

{ #category : #'as yet unclassified' }
LarPlotterLine >> addTicksLabel: valuesX with: steps [
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

{ #category : #'as yet unclassified' }
LarPlotterLine >> calculateTickLabelsY: steps [
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

{ #category : #accessing }
LarPlotterLine >> dict [
	^ dict
]

{ #category : #accessing }
LarPlotterLine >> dict: anObject [
	dict := anObject
]

{ #category : #'as yet unclassified' }
LarPlotterLine >> download: aUrl [
ZnClient new
				url: aUrl;
				signalProgress: true;
				downloadTo: (FileLocator downloads  ).
]

{ #category : #'as yet unclassified' }
LarPlotterLine >> ensureDataHeight: values [
| max rule newDict val data|
	max := values max.
	max > 450 & (max < 550) ifTrue: [ ^ values ].
	rule := LARBarSpecUpdaterRule for: dict.
	newDict := rule updateDictHeight.

	dict := newDict.
	val := (dict at: 'data') at: 'values'.
	data := val collect: [ :each | each at: 'b' ].
	^ data
]

{ #category : #'as yet unclassified' }
LarPlotterLine >> ensureDataWidth: aNumber [
	| width rule newDict |
	((dict at: 'data') includesKey: 'width') ifFalse: [ rule := LARBarSpecUpdaterRule for: dict.
	newDict := rule updateDictWidth: aNumber.
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
self linesDefinition
]

{ #category : #'as yet unclassified' }
LarPlotterLine >> initializeLineGraphFromSpec [

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
	 	initializeLineGraphFromSpec;
	 	yourself
]

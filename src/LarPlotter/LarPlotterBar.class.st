Class {
	#name : #LarPlotterBar,
	#superclass : #Object,
	#instVars : [
		'labelAxisX',
		'labelAxisY',
		'title',
		'tickLabelsX',
		'tickLabelsY',
		'ticksX',
		'ticksY',
		'spec',
		'dict',
		'amountTicksY',
		'announcer',
		'bars'
	],
	#category : #'LarPlotter-Plotter'
}

{ #category : #accessing }
LarPlotterBar class >> withSpec: aSpec [
	 ^ self new
	 	spec: aSpec;
	 	yourself
]

{ #category : #'as yet unclassified' }
LarPlotterBar >> addAxisLabel: textX with: textY [
labelAxisX := LarLabelAxis new initialize: textX. 
labelAxisY := LarLabelAxis new initialize: textY.
self notifyUpdate
]

{ #category : #'as yet unclassified' }
LarPlotterBar >> addBars: values [
	| bar val width |
	bars := OrderedCollection new.
	width := 65.
	val := self ensureBarsHeight: values.
	width := self esnureBarsWidth: (val size). 
    
	1 to: val size
		do: [ :n | 
			bar := LarBar new initialize: (val at: n) with: width.
			bars add: bar ].

	self notifyUpdate
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
self notifyUpdate
]

{ #category : #'as yet unclassified' }
LarPlotterBar >> addTicks: tickXAmount with: tickYAmount [
| tickX tickY |
1 to: ( tickYAmount ) do: [: n| 
tickY := (LarTick new initialize: 3 with: 10).

ticksY add: tickX.
].
self notifyUpdate
]

{ #category : #'as yet unclassified' }
LarPlotterBar >> addTicksLabel: valuesX [
| tick |
self tickLablesInitialize.
	1 to: ( valuesX size) do: [: n| 
tick := LarTickLabel new initialize: (valuesX at: n).

tickLabelsX add: tick. 
].
self notifyUpdate
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
self notifyUpdate
]

{ #category : #'as yet unclassified' }
LarPlotterBar >> amountTicksY [
^amountTicksY
]

{ #category : #accessing }
LarPlotterBar >> announcer [
	^ announcer
]

{ #category : #accessing }
LarPlotterBar >> announcer: anObject [
	announcer := anObject
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
self notifyUpdate
]

{ #category : #'as yet unclassified' }
LarPlotterBar >> ensureBarsHeight [
	| max rule newDict val data |
	val := (dict at: 'data') at: 'values'.
	data := val collect: [ :each | each at: 'b' ].
	max := data max.
	max > 450 & (max < 550) ifTrue: [ ^ data ].
	rule := LARBarSpecUpdaterRule for: dict.
	newDict := rule updateDictHeight.

	dict := newDict.
	val := (dict at: 'data') at: 'values'.
	data := val collect: [ :each | each at: 'b' ].
	^ data
]

{ #category : #'as yet unclassified' }
LarPlotterBar >> ensureBarsHeight: values [
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
LarPlotterBar >> ensureTicksSpec [
	<brainstorming>
	| rule newDict |
	(dict includesKey: 'ticks') ifTrue: [ ^ self ].

	rule := LARTickSpecUpdaterRule for: dict.
	newDict := rule updateDict.
	
	(newDict includesKey: 'ticks') ifFalse: [ ^ self error: 'waah'].
	dict:= newDict.
	^ self
	
]

{ #category : #'as yet unclassified' }
LarPlotterBar >> esnureBarsWidth: aNumber [
	| width |
	aNumber * 65 < 660 & (aNumber * 65 > 600) ifTrue: [ ^ 65 ].
	width := 600 /aNumber. 
	^width
]

{ #category : #'as yet unclassified' }
LarPlotterBar >> gtLiveFor: aView [
	<gtView>
	^aView explicit
		title: 'Live';
		priority: 10;
		stencil: [ self asElement asScalableElement  ];
		actionUpdateButton;
		updateWhen: LarBarPlotterUpdate in: self announcer.
		
]

{ #category : #'as yet unclassified' }
LarPlotterBar >> initialize [
	<brainstorming>
announcer := Announcer new.
"self tickLablesInitialize.
self tickInitialize.
self barsDefinition. "
]

{ #category : #accessing }
LarPlotterBar >> initializeDict [
	<brainstorming>

	"| data axisX axisy |"
	dict := STONJSON fromString: self spec.
	self initializeFor
]

{ #category : #'as yet unclassified' }
LarPlotterBar >> initializeFor [
	| data axisX axisy |
	data := ((dict at: 'data') at: 'values') collect: #values.
	axisX := ((dict at: 'encoding') at: 'x') at: 'field'.
	axisy := ((dict at: 'encoding') at: 'y') at: 'field'.

	self titel: 'This is a title'.
	self addBars: (data collect: [ :each | each last ]).
	self addAxisLabel: axisX with: axisy.
	self addTicks: data size.
	self addTicksLabel: (data collect: [ :each | each first ])
]

{ #category : #accessing }
LarPlotterBar >> labelAxisX [
	<brainstorming>
	| axisX |
	axisX := ((dict at: 'encoding') at: 'x') at: 'field'.
	^ LarLabelAxis new initialize: axisX
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

{ #category : #'as yet unclassified' }
LarPlotterBar >> notifyUpdate [
self announcer announce: LarBarPlotterUpdate new
]

{ #category : #accessing }
LarPlotterBar >> spec [
	^ spec
]

{ #category : #accessing }
LarPlotterBar >> spec: aJSONString [
	spec := aJSONString.
	self initializeDict
]

{ #category : #'as yet unclassified' }
LarPlotterBar >> tickInitialize [
ticksX:= OrderedCollection new. 
ticksY := OrderedCollection new.
]

{ #category : #'as yet unclassified' }
LarPlotterBar >> tickLabelsX [
self ensureTicksSpec.

^dict at: '...'
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
	self notifyUpdate
	
]

{ #category : #'as yet unclassified' }
LarPlotterBar >> title [
^title
]

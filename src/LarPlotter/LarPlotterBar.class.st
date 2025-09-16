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
		'announcer',
		'bars',
		'scale',
		'space',
		'borders'
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
	width := self ensureBarsWidth: (val size). 
    
	1 to: val size
		do: [ :n | 
			bar := LarBar new initialize: (val at: n) with: width.
			bar value: (val at: n).
			bars add: bar ].

	self notifyUpdate
]

{ #category : #'as yet unclassified' }
LarPlotterBar >> addData: data [
self bars isNil
ifTrue:[^self].
(self bars) doWithIndex: [:bar :i| bar data: (data at: i)]
]

{ #category : #'as yet unclassified' }
LarPlotterBar >> addObjects:objects [
self bars isNil
ifTrue:[^self].
(self bars) doWithIndex: [:bar :i| bar object: (objects at: i)]
]

{ #category : #'as yet unclassified' }
LarPlotterBar >> addTicks [
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
LarPlotterBar >> addTicksLabel: valuesX [
	| tick amount |
	bars isNil
	ifTrue:[^self].
	self tickLablesInitialize.
	1
		to: valuesX size
		do: [ :n | 
			tick := LarTickLabel new initialize: (valuesX at: n).

			tickLabelsX add: tick ].
	amount := dict at: 'data' at: 'tick'.
	1
		to: amount
		do: [ :n | 
			tick := LarTickLabel new initialize: (self space * (amount- (n - 1))).

			tickLabelsY add: tick ].
	self notifyUpdate
]

{ #category : #'as yet unclassified' }
LarPlotterBar >> addTicksLabel: valuesX with: valuesY [
	| tick amount |
	bars isNil
	ifTrue:[^self].
	self tickLablesInitialize.
	1
		to: valuesX size
		do: [ :n | 
			tick := LarTickLabel new initialize: (valuesX at: n).

			tickLabelsX add: tick ].
	amount := dict at: 'data' at: 'tick'.
	1
		to: amount
		do: [ :n | 
			tick := LarTickLabel new initialize: (valuesY * (amount- (n - 1))).

			tickLabelsY add: tick ].
	self notifyUpdate
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

{ #category : #accessing }
LarPlotterBar >> borders [
	^ borders
]

{ #category : #accessing }
LarPlotterBar >> borders: anObject [
	borders := anObject
]

{ #category : #'as yet unclassified' }
LarPlotterBar >> changeTitle: text [
title setText: text. 
self notifyUpdate
]

{ #category : #accessing }
LarPlotterBar >> dict [
	^ dict
]

{ #category : #accessing }
LarPlotterBar >> dict: anObject [
	dict := anObject.
	self initializeFor
]

{ #category : #'as yet unclassified' }
LarPlotterBar >> ensureAmountTicksY [
	| rule newDict |
	rule := LARTickSpecUpdaterRule for: dict.
	newDict := rule updateDict.
	dict := newDict.
	^ dict at: 'data' at: 'tick'
]

{ #category : #'as yet unclassified' }
LarPlotterBar >> ensureBarsHeight: values [
	| max rule newDict val data|
	values size = 1
	ifTrue: [max := values at: 1]
	ifFalse:[max := values max].
	max > 450 & (max < 550) ifTrue: [ ^ values ].
	rule := LARBarSpecUpdaterRule for: dict.
	newDict := rule updateDictHeight: values.

	dict := newDict.
	val := (dict at: 'data') at: 'values'.
	data := val collect: [ :each | each  ].
	^ data
]

{ #category : #'as yet unclassified' }
LarPlotterBar >> ensureBarsWidth: aNumber [
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
LarPlotterBar >> gtLiveFor: aView [
	<gtView>
	^aView explicit
		title: 'Live';
		priority: 10;
		stencil: [ self asElement asScalableElement  ];
		actionStencil: [ 
			BrCheckbox new 
				aptitude: BrGlamorousCheckboxAptitude;
				whenUncheckedDo: [   self borders: false  ];
				whenCheckedDo: [   self borders: true  ]];
		actionUpdateButton;
		updateWhen: LarBarPlotterUpdate in: self announcer.
		
		
]

{ #category : #'as yet unclassified' }
LarPlotterBar >> initialize [
	<brainstorming>
announcer := Announcer new.
 self borders: false.
 self noDict. 
"self tickLablesInitialize.
self tickInitialize.
self barsDefinition. "
]

{ #category : #accessing }
LarPlotterBar >> initializeDict [
	<brainstorming>

	"| data axisX axisy |"
	dict := self spec.
	self initializeFor
]

{ #category : #'as yet unclassified' }
LarPlotterBar >> initializeFor [
	| data axisX axisy values  |
	values := (dict at: 'data') at: 'bars'.
	axisX := ((dict at: 'encoding') at: 'x') at: 'field'.
	axisy := ((dict at: 'encoding') at: 'y') at: 'field'.

	self title: 'This is a title'.
	bars := OrderedCollection new.
	data := values collect: [ :each | (each at: 'element') values ].
	
	data
		do: [ :each | each size == 1 ifTrue: [ bars add: (each at: 1) ] 
		ifFalse: [ bars add: each sumNumbers ] ].
	dict
		at: 'data'
		at: 'values'
		put: bars.

	self addBars: bars.
	"self addObjects: (values collect: [ :each | each at: 'object' ])."
	self addData: (values collect: [ :each | (each at: 'element') keys ]).
	self addAxisLabel: axisX with: axisy.
	self addTicks.
	self
		addTicksLabel: (values collect: [ :each | each at: 'name' ])
		with: self space
]

{ #category : #'as yet unclassified' }
LarPlotterBar >> initializeVegaDict [
	<brainstorming>

	"| data axisX axisy |"
	dict := STONJSON fromString: self spec.
	self initializeVegaFor
]

{ #category : #'as yet unclassified' }
LarPlotterBar >> initializeVegaFor [
	| data axisX axisy |
	data := ((dict at: 'data') at: 'values') collect: #values.
	axisX := ((dict at: 'encoding') at: 'x') at: 'field'.
	axisy := ((dict at: 'encoding') at: 'y') at: 'field'.

	self title: 'This is a title'.
	
	self addBars: (data collect: [ :each |each last ]).
	self addAxisLabel: axisX with: axisy.
	self addTicks. 
	self addTicksLabel: (data collect: [ :each | each first ]) with: self space. 
]

{ #category : #accessing }
LarPlotterBar >> labelAxisX [
	<brainstorming>
	| axisX |
	
	"axisX := ((dict at: 'encoding') at: 'x') at: 'field'."
	"^ LarLabelAxis new initialize: axisX"
	^labelAxisX
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
LarPlotterBar >> noDict [
	| jsonString |
	jsonString := '{
"data": {
    
  },
  "encoding": {
   
  }
}'.
	dict := STONJSON fromString: jsonString
]

{ #category : #'as yet unclassified' }
LarPlotterBar >> notifyUpdate [
self announcer announce: LarBarPlotterUpdate new
]

{ #category : #accessing }
LarPlotterBar >> scale [
	^ scale
]

{ #category : #accessing }
LarPlotterBar >> scale: anObject [
	scale := anObject
]

{ #category : #'as yet unclassified' }
LarPlotterBar >> setBlackBorders [
]

{ #category : #accessing }
LarPlotterBar >> space [
	^ space
]

{ #category : #accessing }
LarPlotterBar >> space: anObject [
	space := anObject
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
LarPlotterBar >> specVega: aJSONString [
	spec := aJSONString.
	self initializeVegaDict
]

{ #category : #'as yet unclassified' }
LarPlotterBar >> tickInitialize [
ticksX:= OrderedCollection new. 
ticksY := OrderedCollection new.
]

{ #category : #'as yet unclassified' }
LarPlotterBar >> tickLabelsX [
^tickLabelsX


"self ensureTicksSpec.

^dict at: '...'"
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
LarPlotterBar >> title [
^title
]

{ #category : #'as yet unclassified' }
LarPlotterBar >> title: text [
	title := LarTitel new initialize: text. 
	self notifyUpdate
	
]

Class {
	#name : #LarPlotterScatter,
	#superclass : #Object,
	#instVars : [
		'announcer',
		'spec',
		'dict',
		'borders',
		'turn'
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
LarPlotterScatter >> addAxisLabel [
	| axisX axisy total labelAxisX labelAxisY |
	

	((dict at: 'encoding' at: 'x') includesKey: 'title')
		ifTrue: [ axisX := ((dict at: 'encoding') at: 'x') at: 'title' ]
		ifFalse: [ axisX := ((dict at: 'encoding') at: 'x') at: 'field' ].

	((dict at: 'encoding' at: 'y') includesKey: 'title')
		ifTrue: [ axisy := ((dict at: 'encoding') at: 'y') at: 'title' ]
		ifFalse: [ axisy := ((dict at: 'encoding') at: 'y') at: 'field' ].

	labelAxisX := LarLabelAxis new initialize: axisX.
	labelAxisY := LarLabelAxis new initialize: axisy.


	total := OrderedCollection new.
	self notifyUpdate.
	total add: labelAxisX.
	total add: labelAxisY.
	^ total
]

{ #category : #'as yet unclassified' }
LarPlotterScatter >> addAxisLabel: textX with: textY [
	|  axisX axisy  labelAxisX labelAxisY  |
	((dict at: 'encoding') at: 'x') at: 'field' put: textX.
	((dict at: 'encoding') at: 'y') at: 'field' put: textY.

	labelAxisX := LarLabelAxis new initialize: axisX.
	labelAxisY := LarLabelAxis new initialize: axisy.
	
	self notifyUpdate.
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
	| tickY tickAmount ticksY |
	ticksY := OrderedCollection new.
	tickAmount := self ensureAmountTicksY.
	1
		to: tickAmount
		do: [ :n | 
			tickY := LarTick new initialize: 3 with: 10.
			ticksY add: tickY ].
	
	self notifyUpdate.
	^ticksY
]

{ #category : #'as yet unclassified' }
LarPlotterScatter >> addTicksLabelX [
	| tick amount data int valuesX tickLabelsX |
	tickLabelsX := OrderedCollection new.
	data := (dict at: 'data' at: 'values') collect: #values.
	int := false.

	data first first isString 
	ifTrue: [ int := true ].
	
	valuesX := data collect: [ :each | int 
	ifTrue: [ each first asString ] 
	ifFalse: [ each last asString ] ].
	1 to: valuesX size
		do: [ :n | 
			tick := LarTickLabel new initialize: (valuesX at: n).

			tickLabelsX add: tick ].
	amount := dict at: 'data' at: 'tick'.
	^tickLabelsX
]

{ #category : #'as yet unclassified' }
LarPlotterScatter >> addTicksLabelY [
	| tick amount tickLabelsY|
	
	tickLabelsY := OrderedCollection new. 
	
	amount := dict at: 'data' at: 'tick'.
	1
		to: amount
		do: [ :n | 
			tick := LarTickLabel new initialize: (dict at: 'data' at: 'space') * (amount - (n - 1)).

			tickLabelsY add: tick ].
	self notifyUpdate. 
	^tickLabelsY
]

{ #category : #'as yet unclassified' }
LarPlotterScatter >> addTitle: aTitle [
	| title |
	dict at: 'title' put: aTitle.
	title := LarTitel new initialize: (dict at: 'title').
]

{ #category : #'as yet unclassified' }
LarPlotterScatter >> angleX [

((dict at: 'encoding' at: 'x' ) includesKey: 'axis')
	 ifTrue:[(((dict at: 'encoding' at: 'x' ) at: 'axis') includesKey: 'labelAngle')
	 ifTrue:[^(((dict at: 'encoding' at: 'x' ) at: 'axis') at: 'labelAngle')]].
	 ^0
]

{ #category : #'as yet unclassified' }
LarPlotterScatter >> angleY [
 ((dict at: 'encoding' at: 'y' ) includesKey: 'axis')
	 ifTrue:[(((dict at: 'encoding' at: 'y' ) at: 'axis') includesKey: 'labelAngle')
	 ifTrue:[^(((dict at: 'encoding' at: 'y' ) at: 'axis') at: 'labelAngle')]].
	 ^0
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

{ #category : #accessing }
LarPlotterScatter >> borders [
	^ borders
]

{ #category : #accessing }
LarPlotterScatter >> borders: anObject [
	borders := anObject
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
	(dict at: 'data') at: 'set' ifPresent:[
	(((dict at: 'data') at: 'set') = 1)
	ifTrue:[
	^ dict at: 'data' at: 'tick']].
	rule := LARTickSpecUpdaterRule for: dict.
	newDict := rule updateDictScatterX.
	newDict := rule updateDictScatterY.
	dict := newDict.
	
	^ dict at: 'data' at: 'tick'
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
LarPlotterScatter >> getDataFromJsonFile [
	| urlNew segments fileName file jsonData |
	urlNew := (dict at: 'data' at: 'url') addedToZnUrl: self url asZnUrl.
	segments := ((dict at: 'data') at: 'url') findTokens: '/'.
	fileName := segments last.
	(FileLocator downloads / fileName) ensureDelete.
	ZnClient new
		url: urlNew;
		signalProgress: true;
		downloadTo: FileLocator downloads.
	file := (FileLocator downloads / fileName) contents.
	jsonData := STONJSON fromString: file.
	dict at: 'data' at: 'values' put: jsonData. 
]

{ #category : #'as yet unclassified' }
LarPlotterScatter >> gtLiveFor: aView [
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
		updateWhen: LarLinePlotterUpdate in: self announcer.
		
]

{ #category : #'as yet unclassified' }
LarPlotterScatter >> initialize [
announcer := Announcer new.
 self borders: false.
self noDict. 
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
	| int |
	((dict at: 'data') includesKey: 'url') ifTrue: [ self getDataFromJsonFile ].
	dict
		at: 'data'
		at: 'set'
		put: 0.
	int := false.
(dict includesKey: 'transform') 
	ifTrue: [ self transform: (((dict at: 'transform')  first) at: 'filter')].
	self title. 
	self addPoints.
	self addAxisLabel.
	self addTicks.
	self addTicksLabelX.
	self addTicksLabelY.
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
LarPlotterScatter >> noDict [
	| jsonString |
	jsonString :=  '{
	"description" : "A template for a simple scatter plot with embedded data.",
	"mark" : "point",
	"encoding" : {
		"x" : {
			"field" : "xFieldName",
			"type" : "quantitative"
		},
		"y" : {
			"field" : "yFieldName",
			"type" : "quantitative"
		}
	},
	
	"data" : {
		"values" : [ ]
	}
}'.
	dict := STONJSON fromString: jsonString
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

{ #category : #'as yet unclassified' }
LarPlotterScatter >> setAmountTicks: anInteger [
	| space scale |
	(dict at: 'data') at: 'tick' put: anInteger.
	(dict at: 'data')
		at: 'scale'
		ifAbsent: [ (dict at: 'data') at: 'scale' put: 1 ].
	scale := (dict at: 'data') at: 'scale'.
	space := 500 / anInteger / scale.
	(dict at: 'data') at: 'space' put: space.
	dict
		at: 'data'
		at: 'set'
		put: 1
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
LarPlotterScatter >> title [
| title |
	(dict includesKey: 'title')
		ifTrue: [ title := LarTitel new initialize: (dict at: 'title').  ]
	ifFalse:[title := LarTitel new initialize: 'This is the title'].
	self notifyUpdate.
	^title
]

{ #category : #'as yet unclassified' }
LarPlotterScatter >> title: text [
	title := LarTitel new initialize: text. 
	self notifyUpdate
	
]

{ #category : #'as yet unclassified' }
LarPlotterScatter >> transform: anObject [
	| segment key jsonData json value newValue |
	segment := (anObject findTokens: '==') first.
	value := ((anObject findTokens: '==') last) trimLeft.
	key := ((segment findTokens: '.') last) trimRight.

	jsonData := (dict at: 'data') at: 'values'.
	json := OrderedCollection new.
	newValue := 0 .
	jsonData
			do: [ :d | newValue := (d at: key).
			(d at: key) asString = value 
			ifTrue: [ json add: d . ] ].
	dict at: 'data' at: 'values' put: json. 
]

{ #category : #'as yet unclassified' }
LarPlotterScatter >> url [
^'https://vega.github.io/vega-lite/examples/'
]

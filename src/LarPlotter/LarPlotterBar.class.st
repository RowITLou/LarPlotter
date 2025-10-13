Class {
	#name : #LarPlotterBar,
	#superclass : #Object,
	#instVars : [
		'spec',
		'dict',
		'announcer',
		'borders',
		'turn'
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
LarPlotterBar >> addAxisLabel [
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
LarPlotterBar >> addAxisLabel: textX with: textY [
	|  axisX axisy  labelAxisX labelAxisY  |
	((dict at: 'encoding') at: 'x') at: 'field' put: textX.
	((dict at: 'encoding') at: 'y') at: 'field' put: textY.

	labelAxisX := LarLabelAxis new initialize: axisX.
	labelAxisY := LarLabelAxis new initialize: axisy.


	
	self notifyUpdate.
	
]

{ #category : #'as yet unclassified' }
LarPlotterBar >> addBars [
	| bar val width int values bars data point |
	int := false.

	values := OrderedCollection new.
	((dict at: 'encoding') includesKey: 'color') 
		ifTrue: [  point := dict at: 'data' at: 'values'.
			point
				do: [ :p | 
					| vals sum |
					vals := p at: 'count'.
					sum := vals
							sum: [ :v | 
								| dat |
								dat := v at: 'count'. ].
								values add: sum ] ]
								
								
								
		ifFalse: [ point := dict at: 'data' at: 'values'.
			data := point collect: [ :each | each values ].
			data first first isString ifTrue: [ int := true ].
			values := data
					collect: [ :each | int ifTrue: [ each last ] ifFalse: [ each first ] ] ].

	bars := OrderedCollection new.
	width := 65.
	val := self ensureBarsHeight: values.
	width := self ensureBarsWidth: val size.

	1
		to: val size
		do: [ :n | 
			bar := LarBar new initialize: (val at: n) with: width.
			bar value: (val at: n).
			bar subbar: (self createSubBar: n).
			bars add: bar ].

	self notifyUpdate.
	^ bars
]

{ #category : #'as yet unclassified' }
LarPlotterBar >> addTicks [
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
LarPlotterBar >> addTicksLabel: valuesX with: valuesY [
	| tick amount |
	1
		to: valuesX size
		do: [ :n | 
			| tickLabelsX |
			tick := LarTickLabel new initialize: (valuesX at: n).

			tickLabelsX add: tick ].
	amount := dict at: 'data' at: 'tick'.
	1
		to: amount
		do: [ :n | 
			| tickLabelsY |
			tick := LarTickLabel new initialize: valuesY * (amount - (n - 1)).

			tickLabelsY add: tick ].
	self notifyUpdate
]

{ #category : #'as yet unclassified' }
LarPlotterBar >> addTicksLabelX [
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
LarPlotterBar >> addTicksLabelY [
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
LarPlotterBar >> addTitle: aTitle [
	| title |
	dict at: 'title' put: aTitle.
	title := LarTitel new initialize: (dict at: 'title').
]

{ #category : #'as yet unclassified' }
LarPlotterBar >> aggregateColorDataCount: aField [
	| transformation json jsonData fieldTwo transformation_two temp_1 temp_2 |
	transformation := OrderedCollection new.
	transformation_two := OrderedCollection new.

	jsonData := (dict at: 'data') at: 'values'.
	jsonData do: [ :d | transformation add: (d at: aField) ].
	transformation := transformation removeDuplicates.

	fieldTwo := ((dict at: 'encoding') at: 'color') at: 'field'.
	jsonData do: [ :d | transformation_two add: (d at: fieldTwo) ].
	transformation_two := transformation_two removeDuplicates.


	json := transformation
		collect: [ :field | 
		
			temp_1 := 
			transformation_two
				collect: [ :kind | 
				temp_2 := OrderedCollection new. 
				jsonData do:[:d| 
				
				(d includes: field) & (d includes: kind)
				ifTrue: [ temp_2 add: d ]].

			{fieldTwo -> kind.
				'count' -> temp_2 size} asDictionary ].
				
				{aField -> field.
				'count' -> temp_1} asDictionary
				].
	dict
		at: 'data'
		at: 'values'
		put: json asArray.
]

{ #category : #'as yet unclassified' }
LarPlotterBar >> aggregateColorDataSum: fieldTwo with: fieldOne [
	| transformation json jsonData transformation_two temp_1 temp_2 fieldThree |
	transformation := OrderedCollection new.
	transformation_two := OrderedCollection new.

	jsonData := (dict at: 'data') at: 'values'.
	jsonData do: [ :d | transformation add: (d at: fieldOne) ].
	transformation := transformation removeDuplicates.

	fieldThree := ((dict at: 'encoding') at: 'color') at: 'field'.
	jsonData do: [ :d | transformation_two add: (d at: fieldThree) ].
	transformation_two := transformation_two removeDuplicates.


	json := transformation
			collect: [ :field | 
				temp_1 := transformation_two
						collect: [ :kind | 
							temp_2 := OrderedCollection new.
							jsonData
								do: [ :d | 
									(d includes: field) & (d includes: kind)
										ifTrue: [ temp_2 add: (d at: fieldTwo) ] ].

							{fieldThree -> kind.
								'count' -> temp_2 sumNumbers} asDictionary ].

				{fieldOne -> field.
					'count' -> temp_1} asDictionary ].
	dict
		at: 'data'
		at: 'values'
		put: json asArray
]

{ #category : #'as yet unclassified' }
LarPlotterBar >> aggregateDataCount: fieldOne [ 
| transformation json jsonData |
	transformation := OrderedCollection new.
	
	jsonData := ((dict at: 'data') at: 'values').
	jsonData do: [ :d | transformation add: (d at: fieldOne)].
	transformation := transformation removeDuplicates.



	json := transformation
			collect: [ :aField | 
				| variety |
				variety := OrderedCollection new.
				
				jsonData
					do: [ :aStyle | (aStyle includes: aField) ifTrue: [ variety add: aStyle ] ].
					
				{fieldOne-> aField.
					'count' -> (variety size).
					} asDictionary ] .
  (dict at: 'data' at: 'values' put: (json asArray)).
]

{ #category : #'as yet unclassified' }
LarPlotterBar >> aggregateDataSum: fieldOne with: fieldTwo [
| transformation json jsonData |
	transformation := OrderedCollection new.
	
	jsonData := ((dict at: 'data') at: 'values').
	jsonData do: [ :d | transformation add: (d at: fieldTwo)].
	transformation := transformation removeDuplicates.



	json := transformation
			collect: [ :aField | 
				| variety |
				variety := OrderedCollection new.
				
				jsonData
					do: [ :aStyle | (aStyle includes: aField) ifTrue: [ variety add: (aStyle at: fieldOne) ] ].
					
				{fieldTwo -> aField.
					fieldOne -> (variety sumNumbers).
					} asDictionary ] .
  (dict at: 'data' at: 'values' put: (json asArray)).
]

{ #category : #'as yet unclassified' }
LarPlotterBar >> aggregateDataX [
	((dict at: 'encoding') includesKey: 'color')
	ifTrue:[(((dict at: 'encoding' at: 'x') at: 'aggregate') = 'sum')
	ifTrue:[self aggregateColorDataSum: (((dict at: 'encoding') at: 'x') at: 'field')
				with: (((dict at: 'encoding') at: 'y') at: 'field')]
	ifFalse:[self aggregateColorDataCount: (((dict at: 'encoding') at: 'y') at: 'field')]]
	
	
	ifFalse:[(((dict at: 'encoding' at: 'x') at: 'aggregate') = 'sum')
	ifTrue:[self aggregateDataSum: (((dict at: 'encoding') at: 'x') at: 'field')
				with: (((dict at: 'encoding') at: 'y') at: 'field')]
	ifFalse:[self aggregateDataCount: (((dict at: 'encoding') at: 'y') at: 'field')]]
  
]

{ #category : #'as yet unclassified' }
LarPlotterBar >> aggregateDataY [
	
	((dict at: 'encoding') includesKey: 'color')
	ifTrue:[(((dict at: 'encoding' at: 'y') at: 'aggregate') = 'sum')
	ifTrue:[self aggregateColorDataSum: (((dict at: 'encoding') at: 'y') at: 'field')
				with: (((dict at: 'encoding') at: 'x') at: 'field')]
	ifFalse:[self aggregateColorDataCount: (((dict at: 'encoding') at: 'x') at: 'field')]]
	
	
	ifFalse:[(((dict at: 'encoding' at: 'y') at: 'aggregate') = 'sum')
	ifTrue:[self aggregateDataSum: (((dict at: 'encoding') at: 'y') at: 'field')
				with: (((dict at: 'encoding') at: 'x') at: 'field')]
	ifFalse:[self aggregateDataCount: (((dict at: 'encoding') at: 'x') at: 'field')]]
  
]

{ #category : #accessing }
LarPlotterBar >> angleX [
	((dict at: 'encoding' at: 'x' ) includesKey: 'axis')
	 ifTrue:[(((dict at: 'encoding' at: 'x' ) at: 'axis') includesKey: 'labelAngle')
	 ifTrue:[^(((dict at: 'encoding' at: 'x' ) at: 'axis') at: 'labelAngle')]].
	 ^0
]

{ #category : #accessing }
LarPlotterBar >> angleY [
	 ((dict at: 'encoding' at: 'y' ) includesKey: 'axis')
	 ifTrue:[(((dict at: 'encoding' at: 'y' ) at: 'axis') includesKey: 'labelAngle')
	 ifTrue:[^(((dict at: 'encoding' at: 'y' ) at: 'axis') at: 'labelAngle')]].
	 ^0
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

{ #category : #accessing }
LarPlotterBar >> borders [
	^ borders
]

{ #category : #accessing }
LarPlotterBar >> borders: anObject [
	borders := anObject
]

{ #category : #'as yet unclassified' }
LarPlotterBar >> createSubBar [
]

{ #category : #'as yet unclassified' }
LarPlotterBar >> createSubBar: index [
	| subBar point val sub|
	((dict at: 'encoding') includesKey: 'color') 
	ifTrue:[
	subBar := OrderedCollection new.
	point := dict at: 'data' at: 'values'.
	((point at: index) at: 'count') doWithIndex:
	[:p :i| val := p at: 'count'.
	sub := LarSubBar new initialize: (val * (dict at: 'data' at: 'scale')) with: (dict at: 'data' at: 'width').
	sub color: ((((dict at:'encoding' at: 'color') at: 'scale') at: 'range') at:i).
	"sub data:  "
 subBar add: sub.].
 ^subBar ]
 ifFalse:[^nil]
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
	(dict at: 'data') at: 'set' ifPresent:[
	(((dict at: 'data') at: 'set') = 1)
	ifTrue:[
	^ dict at: 'data' at: 'tick']].
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
	
	rule := LARBarSpecUpdaterRule for: dict.
	newDict := rule updateDictHeight: values.

	dict := newDict.
	val := (dict at: 'data') at: 'modified'.
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
LarPlotterBar >> getDataFromJsonFile [
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
self turn: false.
]

{ #category : #accessing }
LarPlotterBar >> initializeDict [
	<brainstorming>
	dict := STONJSON fromString: self spec.
	self initializeFor
]

{ #category : #'as yet unclassified' }
LarPlotterBar >> initializeFor [
	|   int |
	((dict at: 'data') includesKey: 'url') ifTrue: [ self getDataFromJsonFile ].
	dict at: 'data' at: 'set' put: 0.
	int := false.
	
	(dict includesKey: 'transform') 
	ifTrue: [ self transform: (((dict at: 'transform')  first) at: 'filter')].
	

	((dict at: 'encoding' at: 'x') includesKey: 'aggregate')
		ifTrue: [ self aggregateDataX.
		turn:= true].

	((dict at: 'encoding' at: 'y') includesKey: 'aggregate')
		ifTrue: [ self aggregateDataY . 
		turn := false].
		
    ((dict at: 'encoding' at: 'x') includesKey: 'type')
    ifTrue:[(((dict at: 'encoding' at: 'x') at: 'type') = 'nominal')
    ifTrue: [turn := false ]
    ifFalse:[turn := true]].
	
		
	self title. 
	self addBars.
	self addAxisLabel.
	self addTicks.
	self addTicksLabelX.
	self addTicksLabelY.
]

{ #category : #'as yet unclassified' }
LarPlotterBar >> noDict [
	| jsonString |
	jsonString :=  '{
	"description" : "A template for a simple bar chart with embedded data.",
	"mark" : "bar",
	"encoding" : {
		"x" : {
			"field" : "xFieldName",
			"type" : "nominal"
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
LarPlotterBar >> notifyUpdate [
self announcer announce: LarBarPlotterUpdate new
]

{ #category : #'as yet unclassified' }
LarPlotterBar >> setAmountTicks: anInteger [
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
LarPlotterBar >> title [
	| title |
	(dict includesKey: 'title')
		ifTrue: [ title := LarTitel new initialize: (dict at: 'title').  ]
	ifFalse:[title := LarTitel new initialize: 'This is the title'].
	self notifyUpdate.
	^title
]

{ #category : #'as yet unclassified' }
LarPlotterBar >> transform: anObject [
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

{ #category : #accessing }
LarPlotterBar >> turn [
	^ turn
]

{ #category : #accessing }
LarPlotterBar >> turn: anObject [
	turn := anObject
]

{ #category : #'as yet unclassified' }
LarPlotterBar >> url [
^'https://vega.github.io/vega-lite/examples/'
]

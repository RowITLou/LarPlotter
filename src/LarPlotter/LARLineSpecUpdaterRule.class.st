Class {
	#name : #LARLineSpecUpdaterRule,
	#superclass : #Object,
	#instVars : [
		'dict',
		'data',
		'amountX'
	],
	#category : #LarPlotter
}

{ #category : #'as yet unclassified' }
LARLineSpecUpdaterRule class >> for: aDictionary [
^ self new
	dict: aDictionary;
	yourself 
]

{ #category : #'as yet unclassified' }
LARLineSpecUpdaterRule >> aggregation [
	| collectTime timeData dataPoints  |
	self importData.
	timeData := self setup: self data.

	collectTime := OrderedCollection new.
	timeData do: [ :y | collectTime add: OrderedCollection new ].
	timeData
		doWithIndex: [ :y :i | 
			self data
				do: [ :each | 
					(each at: 'date') asDate asYear = y
						ifTrue: [ (collectTime at: i) add: (each at: 'price') asInteger ] ] ].


	dataPoints := OrderedCollection new.
	collectTime do: [ :y | dataPoints add: (y averageIfEmpty: [ 0 ]) ].
	^dataPoints
]

{ #category : #accessing }
LARLineSpecUpdaterRule >> data [
	^ data
]

{ #category : #accessing }
LARLineSpecUpdaterRule >> data: anObject [
	data := anObject
]

{ #category : #'as yet unclassified' }
LARLineSpecUpdaterRule >> dict: aDictionary [ 
dict:= aDictionary 
]

{ #category : #'as yet unclassified' }
LARLineSpecUpdaterRule >> importData [
	| urlNew segments fileName file jsonData filter transformation |
	urlNew := ((dict at: 'data') at: 'url') addedToZnUrl: self url asZnUrl.
	segments := ((dict at: 'data') at: 'url') findTokens: '/'.
	fileName := segments last.
	(FileLocator downloads / fileName) ensureDelete.
	ZnClient new
		url: urlNew;
		signalProgress: true;
		downloadTo: FileLocator downloads.
	file := (FileLocator downloads / fileName) contents.
	jsonData := (CSV2JSON for: file) jsonObject.
	filter := (((dict at: 'transform') first at: 'filter') findTokens: '===') last
			copyWithout: $'.
	transformation := OrderedCollection new.
	jsonData
		do: [ :d | (d at: 'symbol') = filter ifTrue: [ transformation add: d ] ].
	self data: transformation.
	
]

{ #category : #'as yet unclassified' }
LARLineSpecUpdaterRule >> setup: importedData [
| time firstDate lastDate dataPoint timespan months years days arr num_ticks maxSpace idealSpace min_ticks max_ticks nearest min indexofMin timeArr timeData   |

    dataPoint := importedData collect: [ :d | d at: 'price' ].
	time := importedData collect: [ :d | d at: 'date' ].

	firstDate := time first asDate.
	lastDate := time last asDate.
	timespan := Timespan starting: firstDate ending: lastDate.

	months := timespan months size.
	years := timespan years size.
	days := timespan duration asDays asInteger.
	arr := OrderedCollection new.
	arr := {days.
			months.
			years}.

	idealSpace := 70.
	maxSpace := 500.
	min_ticks := 4.
	max_ticks := 8.

	num_ticks := maxSpace / idealSpace.

	num_ticks := min_ticks max: (num_ticks min: max_ticks).
	num_ticks := num_ticks rounded.

	nearest := arr collect: [ :each | (each - num_ticks) abs ].

	min := nearest min.
	
	indexofMin := nearest indexOf: min.


	timeArr := {timespan dates.
			timespan months.
			timespan years}.
   timeData := timeArr at: indexofMin.
   ^timeData

]

{ #category : #'as yet unclassified' }
LARLineSpecUpdaterRule >> updateDictHeight [
	| dataPoint max scale modifiedData min minus dictionary |
	
	dataPoint := self aggregation.	
	
	max := dataPoint max.
	scale := 500 / max.
	dict
		at: 'data'
		at: 'scale'
		put: scale.
	modifiedData := OrderedCollection new.
	dataPoint do: [ :each | modifiedData add: each * scale ].
	minus := 0.
	min := dataPoint min.

	min > 50 ifTrue: [ minus := min - 30 ].
	minus := minus * scale.

	dictionary := Dictionary new.

	modifiedData
		doWithIndex: [ :each :i | dictionary at: (i) put: each - minus ].
	dict
		at: 'data'
		at: 'values'
		put: dictionary.
	^ dict
]

{ #category : #'as yet unclassified' }
LARLineSpecUpdaterRule >> updateDictWidth [
	| amount width |
	amount := self aggregation size.
	width := 600 / amount.
	dict
		at: 'data'
		at: 'width'
		put: width.

	^ dict
]

{ #category : #'as yet unclassified' }
LARLineSpecUpdaterRule >> url [
^'https://vega.github.io/vega-lite/examples/'
]

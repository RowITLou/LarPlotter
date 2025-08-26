Class {
	#name : #LARScatterSpecUpdaterRule,
	#superclass : #Object,
	#instVars : [
		'dict',
		'data',
		'info_two',
		'info_one'
	],
	#category : #LarPlotter
}

{ #category : #'as yet unclassified' }
LARScatterSpecUpdaterRule class >> for: aDictionary [
^ self new
	dict: aDictionary;
	yourself 
]

{ #category : #accessing }
LARScatterSpecUpdaterRule >> data [
	^ data
]

{ #category : #accessing }
LARScatterSpecUpdaterRule >> data: anObject [
	data := anObject
]

{ #category : #accessing }
LARScatterSpecUpdaterRule >> dict [
	^ dict
]

{ #category : #accessing }
LARScatterSpecUpdaterRule >> dict: anObject [
	dict := anObject
]

{ #category : #'as yet unclassified' }
LARScatterSpecUpdaterRule >> importData [
	| urlNew segments fileName file jsonData   filter_one filter_two |
	urlNew := ((dict at: 'data') at: 'url') addedToZnUrl: self url asZnUrl.
	segments := ((dict at: 'data') at: 'url') findTokens: '/'.
	fileName := segments last.
	(FileLocator downloads / fileName) ensureDelete.
	ZnClient new
		url: urlNew;
		signalProgress: true;
		downloadTo: FileLocator downloads.
	file := (FileLocator downloads / fileName) contents.
	jsonData := STONJSON fromString: file.
	info_one := OrderedCollection new.
	info_two := OrderedCollection new.
	filter_one := ((dict at: 'encoding') at: 'x' at: 'field') copyWithout: $'.
	filter_two := ((dict at: 'encoding') at: 'y' at: 'field') copyWithout: $'.
	data := jsonData asOrderedCollection.
	jsonData do: [ :d | (d at: filter_one) isNil ifTrue: [ data remove: d ] ].
	jsonData do: [ :d | (d at: filter_two) isNil ifTrue: [ data remove: d ] ].
	data do: [ :d | info_one add: (d at: filter_one) ].
	data do: [ :d | info_two add: (d at: filter_two) ]
]

{ #category : #'as yet unclassified' }
LARScatterSpecUpdaterRule >> updateDictHeight [
	| scale max_two modifiedData_two |
	self importData.
	max_two := info_two max.
	scale := 450 / max_two.
	dict
		at: 'data'
		at: 'scale_two'
		put: scale.
	modifiedData_two := Dictionary new.
	info_two doWithIndex: [ :each :i | modifiedData_two at: i put: each * scale ].


	dict
		at: 'data'
		at: 'values_two'
		put: modifiedData_two.
	^dict
]

{ #category : #'as yet unclassified' }
LARScatterSpecUpdaterRule >> updateDictWidth [
	| max_one scale modifiedData_one |
	self importData.
	max_one := info_one max.
	scale := 450 / max_one.
	dict
		at: 'data'
		at: 'scale_one'
		put: scale.
	modifiedData_one := Dictionary new.
	info_one doWithIndex: [ :each :i | modifiedData_one at: i put: each * scale ].


	dict
		at: 'data'
		at: 'values_one'
		put: modifiedData_one.
	^dict
]

{ #category : #'as yet unclassified' }
LARScatterSpecUpdaterRule >> url [
^'https://vega.github.io/vega-lite/examples/'
]

Class {
	#name : #LARLineSpecUpdaterRule,
	#superclass : #Object,
	#instVars : [
		'dict',
		'data'
	],
	#category : #LarPlotter
}

{ #category : #'as yet unclassified' }
LARLineSpecUpdaterRule class >> for: aDictionary [
^ self new
	dict: aDictionary;
	yourself 
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
LARLineSpecUpdaterRule >> updateDictHeight [
	| ele data max scale modifiedData i min minus |
	ele := dict at: 'data' at: 'values'.	"collect: #values"
	data := ele collect: [ :each | each at: 'b' ].
	max := data max.
	scale := 500 / max.
	dict
		at: 'data'
		at: 'scale'
		put: scale.
	modifiedData := OrderedCollection new.
	data do: [ :each | modifiedData add: each * scale ].
	minus := 0.
	min := data min.

	min >> 50
		ifTrue: [ 
			minus := min - 30 ].
    minus := minus *scale.
	i := 1.
	ele
		do: [ :each | 
			each at: 'b' put: ((modifiedData at: i) - minus).
			i := i + 1 ].
	dict
		at: 'data'
		at: 'values'
		put: ele.
	^ dict
]

{ #category : #'as yet unclassified' }
LARLineSpecUpdaterRule >> updateDictWidth [

]

{ #category : #'as yet unclassified' }
LARLineSpecUpdaterRule >> url [
^'https://vega.github.io/vega-lite/examples/'
]

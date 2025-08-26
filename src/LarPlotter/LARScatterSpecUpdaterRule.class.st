Class {
	#name : #LARScatterSpecUpdaterRule,
	#superclass : #Object,
	#instVars : [
		'dict',
		'data'
	],
	#category : #LarPlotter
}

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

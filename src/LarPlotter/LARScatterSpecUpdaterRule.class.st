Class {
	#name : #LARScatterSpecUpdaterRule,
	#superclass : #Object,
	#instVars : [
		'dict'
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
LARScatterSpecUpdaterRule >> dict [
	^ dict
]

{ #category : #accessing }
LARScatterSpecUpdaterRule >> dict: anObject [
	dict := anObject
]

{ #category : #'as yet unclassified' }
LARScatterSpecUpdaterRule >> updateDictHeight [
	| scale max_two modifiedData_two info_two|
"	self importData."
	info_two := dict
		at: 'data'
		at: 'values_two_non'. 
	max_two := info_two max +50.
	scale := 500 / max_two.
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
LARScatterSpecUpdaterRule >> updateDictSize [
	| size min_size modifiedSize jsonData field |
	jsonData := dict at: 'data' at: 'values'.
	field := ((dict at: 'encoding') at: 'size' at: 'field') copyWithout: $'.
	size := OrderedCollection new.
	jsonData do: [ :d | size add: (d at: field) ].
	min_size := size min.
	modifiedSize := OrderedCollection new.
	size
		do: [ :each | 
			| diff |
			diff := (each - min_size) abs.
			modifiedSize add: diff ].
			dict
		at: 'data'
		at: 'size'
		put: modifiedSize.
]

{ #category : #'as yet unclassified' }
LARScatterSpecUpdaterRule >> updateDictWidth [
	| max_one scale modifiedData_one info_one|
	"self importData."
	info_one := dict
		at: 'data'
		at: 'values_one_non'. 
	max_one := info_one max +50.
	scale := 600 / max_one.
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

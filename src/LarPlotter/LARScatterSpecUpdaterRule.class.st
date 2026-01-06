Class {
	#name : 'LARScatterSpecUpdaterRule',
	#superclass : 'Object',
	#instVars : [
		'dict'
	],
	#category : 'LarPlotter',
	#package : 'LarPlotter'
}

{ #category : 'as yet unclassified' }
LARScatterSpecUpdaterRule class >> for: aDictionary [
^ self new
	dict: aDictionary;
	yourself 
]

{ #category : 'accessing' }
LARScatterSpecUpdaterRule >> dict [
	^ dict
]

{ #category : 'accessing' }
LARScatterSpecUpdaterRule >> dict: anObject [
	dict := anObject
]

{ #category : 'as yet unclassified' }
LARScatterSpecUpdaterRule >> updateDictHeight [
	| scale max_two modifiedData_two info_two arr beginning_two nearest min beginning |
	"	self importData."
	info_two := dict at: 'data' at: 'values_two_non'.
	arr := #(0 1 2 5 10 20 40 50 100 200 500 1000).

	beginning_two := info_two min.
	nearest := Dictionary new.
	arr
		do: [ :each | 
			| diff |
			diff := beginning_two - each.
			diff >= 0 ifTrue: [ nearest add: each -> diff ] ].


	min := (nearest values) min.
	beginning := nearest keyAtValue: min.
	max_two := info_two max.
	scale := 500 / (max_two - beginning).
	dict
		at: 'data'
		at: 'scale_two'
		put: scale.
	modifiedData_two := Dictionary new.
	info_two doWithIndex: [ :each :i | modifiedData_two at: i put: (each - beginning) * scale ].
	dict
		at: 'data'
		at: 'min_two'
		put: beginning.

	dict
		at: 'data'
		at: 'values_two'
		put: modifiedData_two.
	^ dict
]

{ #category : 'as yet unclassified' }
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

{ #category : 'as yet unclassified' }
LARScatterSpecUpdaterRule >> updateDictWidth [
	| max_one scale modifiedData_one info_one arr beginning_one nearest min beginning scale_new |
	"self importData."
	arr := #(0 1 2 5 10 20 40 50 100 200 500 1000).
	info_one := dict at: 'data' at: 'values_one_non'.
	beginning_one := info_one min.
	nearest := Dictionary new.
	arr
		do: [ :each | 
			| diff |
			diff := beginning_one - each.
			diff >= 0 ifTrue: [ nearest add: each -> diff ] ].

	min := nearest values min.
	beginning := nearest keyAtValue: min.
	max_one := info_one max.
	scale := 600 / max_one.
	scale_new := 600 / (max_one - beginning).
	dict
		at: 'data'
		at: 'scale_one'
		put: scale.
	dict
		at: 'data'
		at: 'scale_one_new'
		put: scale_new.
	modifiedData_one := Dictionary new.
	info_one
		doWithIndex: [ :each :i | modifiedData_one at: i put: (each - beginning) * scale ].
	dict
		at: 'data'
		at: 'min_one'
		put: beginning.

	dict
		at: 'data'
		at: 'values_one'
		put: modifiedData_one.
	^ dict
]

Class {
	#name : #LARBarSpecUpdaterRule,
	#superclass : #Object,
	#instVars : [
		'dict'
	],
	#category : #LarPlotter
}

{ #category : #'as yet unclassified' }
LARBarSpecUpdaterRule class >> for: aDictionary [
^ self new
	dict: aDictionary;
	yourself 
]

{ #category : #'as yet unclassified' }
LARBarSpecUpdaterRule >> dict: aDictionary [ 
dict:= aDictionary 
]

{ #category : #'as yet unclassified' }
LARBarSpecUpdaterRule >> forWidth [
]

{ #category : #'as yet unclassified' }
LARBarSpecUpdaterRule >> updateDictHeight [
	| ele data max scale modifiedData i |
	ele := dict at: 'data' at: 'values'.	"collect: #values"
	data := ele collect: [ :each | each at: 'b' ].
	max := data max.
	scale := 500 / max.
	dict at: 'data' at: 'scale' put: scale. 
	modifiedData := OrderedCollection new.
	data do: [ :each | modifiedData add: each * scale ].
	i := 1.
	ele
		do: [ :each | 
			each at: 'b' put: (modifiedData at: i).
			i := i + 1 ].
	dict
		at: 'data'
		at: 'values'
		put: ele.
	^ dict
]

{ #category : #'as yet unclassified' }
LARBarSpecUpdaterRule >> updateDictWidth [
	| aNumber width |
	aNumber * 65 < 660 & (aNumber * 65 > 600) ifTrue: [ ^ 65 ].
	width := 600 / aNumber.
	^ width
]

{ #category : #'as yet unclassified' }
LARBarSpecUpdaterRule >> updateDictWidth: aNumber [
	|  width |
	
	width := 600 / aNumber.
	dict at: 'data' at: 'width' put: width. 
	
	^ dict
]

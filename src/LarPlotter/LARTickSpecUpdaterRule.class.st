Class {
	#name : #LARTickSpecUpdaterRule,
	#superclass : #Object,
	#instVars : [
		'dict'
	],
	#category : #'LarPlotter-Plotter'
}

{ #category : #accessing }
LARTickSpecUpdaterRule class >> for: aDictionary [
^ self new
	dict: aDictionary;
	yourself 
]

{ #category : #accessing }
LARTickSpecUpdaterRule >> dict: aDictionary [ 
dict:= aDictionary 
]

{ #category : #'as yet unclassified' }
LARTickSpecUpdaterRule >> updateDict [
	<brainstorming>
]

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
	| scale max_ticks min_ticks maxSpace idealSpace arr num_ticks num nearest min indexofMin space amount |
	idealSpace := 70.
	maxSpace := 500.
	min_ticks := 4.
	max_ticks := 8.
	scale := dict at: 'data' at: 'scale'.
	arr := #(1 2 5 10 50 100 200).

	num_ticks := (maxSpace/scale) / (idealSpace/scale). 


num_ticks := (min_ticks max: (num_ticks min: max_ticks)).
num_ticks := num_ticks rounded.
num:= (maxSpace/scale)/num_ticks.

nearest := (arr collect: [ :each | (each - num) abs ]). 
min:= nearest min. 

indexofMin := nearest indexOf: min. 
indexofMin.

space := arr at: indexofMin.
amount := (maxSpace / scale) / space.
amount := amount roundDownTo: 1.

	dict
		at: 'data'
		at: 'tick'
		put: amount.
		
   dict at: 'data' at: 'space' put: space.
 ^dict
]

{ #category : #'as yet unclassified' }
LARTickSpecUpdaterRule >> updateDictDefault [
]

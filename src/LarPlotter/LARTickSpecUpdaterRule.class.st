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
	arr := #(1 2 5 10 50 100 200 1000 10000 100000 1000000 3000000 10000000).

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

{ #category : #'as yet unclassified' }
LARTickSpecUpdaterRule >> updateDictLineX [
	|  lineRules timeData dictionary |
	lineRules := LARLineSpecUpdaterRule new.
    lineRules dict: dict.
	lineRules importData.
	timeData := lineRules setup: (lineRules data).

	dictionary := Dictionary new.

	timeData
		doWithIndex: [ :each :i | dictionary at: i  put: each ].
	dict
		at: 'data'
		at: 'timeData'
		put: dictionary.
	^ dict
]

{ #category : #'as yet unclassified' }
LARTickSpecUpdaterRule >> updateDictScatterX [
	| scale max_ticks min_ticks maxSpace idealSpace arr num_ticks num nearest min indexofMin space amount |
	idealSpace := 70.
	maxSpace := 600.
	min_ticks := 4.
	max_ticks := 8.
	scale := dict at: 'data' at: 'scale_one'.
	arr := #(1 2 5 10 40 50 100 200  1000).

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
		at: 'tick_one'
		put: amount.
		
   dict at: 'data' at: 'space_one' put: space.
 ^dict
]

{ #category : #'as yet unclassified' }
LARTickSpecUpdaterRule >> updateDictScatterY [
	| scale max_ticks min_ticks maxSpace idealSpace arr num_ticks num nearest min indexofMin space amount |
	idealSpace := 70.
	maxSpace := 500.
	min_ticks := 4.
	max_ticks := 8.
	scale := dict at: 'data' at: 'scale_two'.
	arr := #(1 2 5 10 40 50 100 200  1000).

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
		at: 'tick_two'
		put: amount.
		
   dict at: 'data' at: 'space_two' put: space.
 ^dict
]

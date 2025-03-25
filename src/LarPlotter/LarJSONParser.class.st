"
This class takes a string of JSON code and implements a graph based on the information of the code. See the example {{gtClass:name=LarJSONParserExamples}} 
"
Class {
	#name : #LarJSONParser,
	#superclass : #Object,
	#instVars : [
		'dict',
		'typeGraph'
	],
	#category : #'LarPlotter-Parser'
}

{ #category : #'as yet unclassified' }
LarJSONParser >> barGraph [
| graph data axisX axisy |
data := ((dict at: 'data') at: 'values') collect: #values.
axisX := (((dict at: 'encoding') at: 'x') at: 'field').
axisy := (((dict at: 'encoding') at: 'y') at: 'field').
	graph := LarPlotterBar new initialize: 300 with: 300. 
graph titel: 'This is a title'. 
graph addBars: (data collect: [ :each | each last ]).
graph addAxisLabel: axisX with: axisy. 
graph addTicks: 0 with: (data size). 
graph addTicksLabel: (data collect: [:each | each first]).
^graph
]

{ #category : #'as yet unclassified' }
LarJSONParser >> parse: aString [
	dict := STONJSON fromString: aString.
	typeGraph := (dict at: 'mark').
	typeGraph = 'bar'
ifTrue:[^self barGraph].
"The more Charts I implement, the more cases will be implemented in this class and method"
]

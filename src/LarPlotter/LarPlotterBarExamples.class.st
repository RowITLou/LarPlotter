Class {
	#name : #LarPlotterBarExamples,
	#superclass : #Object,
	#category : #'LarPlotter-Examples'
}

{ #category : #'as yet unclassified' }
LarPlotterBarExamples >> basic [
<gtExample>
| plot |
	plot:= LarPlotterBar new initialize: 500 with: 500. 
	^plot
]

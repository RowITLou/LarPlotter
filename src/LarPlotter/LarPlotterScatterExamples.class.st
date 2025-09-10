Class {
	#name : #LarPlotterScatterExamples,
	#superclass : #Object,
	#category : #'LarPlotter-Examples'
}

{ #category : #'as yet unclassified' }
LarPlotterScatterExamples >> addPoints [
<gtExample>

^self newGraph addPoints: self values.

]

{ #category : #'as yet unclassified' }
LarPlotterScatterExamples >> addTitel [
<gtExample>

^self addPoints  title: 'This is a title'. 

]

{ #category : #'as yet unclassified' }
LarPlotterScatterExamples >> newGraph [
<gtExample>

^ LarPlotterScatter new 
	
]

{ #category : #'as yet unclassified' }
LarPlotterScatterExamples >> values [
^ #(20 40 60 80 10 90 70 50 30 10).

]

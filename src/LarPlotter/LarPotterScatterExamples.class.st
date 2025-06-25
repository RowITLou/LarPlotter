Class {
	#name : #LarPotterScatterExamples,
	#superclass : #Object,
	#category : #'LarPlotter-Examples'
}

{ #category : #'as yet unclassified' }
LarPotterScatterExamples >> addPoints [
<gtExample>

^self newGraph addPoints: self values.

]

{ #category : #'as yet unclassified' }
LarPotterScatterExamples >> addTitel [
<gtExample>

^self addPoints  titel: 'This is a title'. 

]

{ #category : #'as yet unclassified' }
LarPotterScatterExamples >> newGraph [
<gtExample>

^ LarPlotterScatter new 
	
]

{ #category : #'as yet unclassified' }
LarPotterScatterExamples >> values [
^ #(20 40 60 80 10 90 70 50 30 10).

]

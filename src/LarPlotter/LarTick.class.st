"
Is the model class for the ticks in a graph. When we add ticks to the graph via the plotter, the ticks will directly be initialized. See {{gtMethod:name=LarPlotterBar >>addTicks:with: }} The wished amount of ticks must be given. If we want to change something about the ticks, they have to be adressed via the Plotter class. {{gtMethod:name=LarPlotterBar >>ticksX }} and {{gtMethod:name=LarPlotterBar >>ticksY }}. 
Look at the following example {{gtMethod:name=LarPlotterBarExamples>>graphWithTicks}}. 
"
Class {
	#name : #LarTick,
	#superclass : #Object,
	#instVars : [
		'width',
		'length'
	],
	#category : #'LarPlotter-Model'
}

{ #category : #'as yet unclassified' }
LarTick >> asElementX [
^LarTickXElement new initialize: self.

]

{ #category : #'as yet unclassified' }
LarTick >> asElementY [
^LarTickYElement new initialize: self.
]

{ #category : #'as yet unclassified' }
LarTick >> initialize: sizeWidth with: sizeLength [
self sizeWidth: sizeWidth. 
self sizeLength: sizeLength. 
]

{ #category : #accessing }
LarTick >> length [
	^ length
]

{ #category : #accessing }
LarTick >> length: anObject [
	length := anObject
]

{ #category : #'as yet unclassified' }
LarTick >> resize: widthX with: lengthX [
self width: widthX. 
self length: lengthX.
self asElementX size: widthX with: lengthX.
self asElementY size: widthX with: lengthX.
]

{ #category : #'as yet unclassified' }
LarTick >> setBackground: color [
self asElementX background: color.
self asElementY background: color
]

{ #category : #'as yet unclassified' }
LarTick >> setBorderColor: color [
self asElementX border: (BlBorder paint: color). 
self asElementY border: (BlBorder paint: color). 
]

{ #category : #accessing }
LarTick >> width [
	^ width
]

{ #category : #accessing }
LarTick >> width: anObject [
	width := anObject
]

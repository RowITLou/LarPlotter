"
Is the model class for the ticks in a graph. When we add ticks to the graph via the plotter, the ticks will directly be initialized. See {{gtMethod:name=LarPlotterBar >>addTicks:with: }} The wished amount of ticks must be given. If we want to change something about the ticks, they have to be adressed via the Plotter class. {{gtMethod:name=LarPlotterBar >>ticksX }} and {{gtMethod:name=LarPlotterBar >>ticksY }}. 
Look at the following example {{gtMethod:name=LarPlotterBarExamples>>graphWithTicks}}. 
"
Class {
	#name : #LarTick,
	#superclass : #Object,
	#instVars : [
		'width',
		'length',
		'tickElementX',
		'tickElementY'
	],
	#category : #'LarPlotter-Model'
}

{ #category : #'as yet unclassified' }
LarTick >> asElementX [
^LarTickXElement new create: self sizeWidth with: self sizeLength.

]

{ #category : #'as yet unclassified' }
LarTick >> asElementY [
"<return: #LarTick>"
^LarTickYElement new create: self sizeWidth with: self sizeLength.
]

{ #category : #'as yet unclassified' }
LarTick >> initialize: sizeWidth with: sizeLength [
self sizeWidth: sizeWidth. 
self sizeLength: sizeLength. 
]

{ #category : #'as yet unclassified' }
LarTick >> resize: widthX with: lengthX [
self sizeWidth: widthX. 
self sizeLength: lengthX.
tickElementX size: widthX with: lengthX.
tickElementY size: widthX with: lengthX.
]

{ #category : #'as yet unclassified' }
LarTick >> setBackground: color [
tickElementX background: color.
tickElementY background: color
]

{ #category : #'as yet unclassified' }
LarTick >> setBorderColor: color [
tickElementX border: (BlBorder paint: color). 
tickElementY border: (BlBorder paint: color). 
]

{ #category : #'as yet unclassified' }
LarTick >> sizeLength [
length isNil
ifTrue:[^0]
ifFalse:[^length]
]

{ #category : #'as yet unclassified' }
LarTick >> sizeLength: size [
length := size
]

{ #category : #'as yet unclassified' }
LarTick >> sizeWidth [
width isNil
ifTrue:[^0]
ifFalse:[^width]
]

{ #category : #'as yet unclassified' }
LarTick >> sizeWidth: size [
width := size
]

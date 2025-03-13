Class {
	#name : #LarPlotterBar,
	#superclass : #Object,
	#instVars : [
		'amountTicksX',
		'amountTicksY',
		'posX',
		'posY',
		'labelHeight',
		'margine',
		'labelAxisX',
		'labelAxisY',
		'base',
		'heightG',
		'widthG',
		'graphElement',
		'graph'
	],
	#category : #'LarPlotter-Plotter'
}

{ #category : #'as yet unclassified' }
LarPlotterBar >> addAxisLabel: textX with: textY [
graph addAxisLabel: textX with: textY
]

{ #category : #'as yet unclassified' }
LarPlotterBar >> addBars: values [
graph addBars: values.
]

{ #category : #'as yet unclassified' }
LarPlotterBar >> addTicks: tickXAmount with: tickYAmount [
graph addTicks: tickXAmount with: tickYAmount.
]

{ #category : #'as yet unclassified' }
LarPlotterBar >> addTicksLabel: amountX with: amountY [
graph addTicksLabel: amountX with: amountY.
]

{ #category : #'as yet unclassified' }
LarPlotterBar >> amountTicks: numberX with: numberY [
amountTicksX:=numberX.
amountTicksY := numberY.
]

{ #category : #'as yet unclassified' }
LarPlotterBar >> amountTicksX [
^amountTicksX
]

{ #category : #'as yet unclassified' }
LarPlotterBar >> amountTicksY [
^amountTicksY
]

{ #category : #'as yet unclassified' }
LarPlotterBar >> graph [
^graph
]

{ #category : #'as yet unclassified' }
LarPlotterBar >> initialize: sizeWidth with: sizeHeight [

	posX := 100.
posY := 100. 
amountTicksX:= 8. 
amountTicksY := 8. 
labelHeight := 50.
margine := 40.

graph := LarPlotterBarElement new create: sizeWidth with: sizeHeight.


]

{ #category : #'as yet unclassified' }
LarPlotterBar >> labelHeight [
^labelHeight
]

{ #category : #'as yet unclassified' }
LarPlotterBar >> labelHeight: height [
labelHeight := height. 
]

{ #category : #'as yet unclassified' }
LarPlotterBar >> location: positionX with: positionY [
posY := positionX. 
posY := positionY.
]

{ #category : #'as yet unclassified' }
LarPlotterBar >> locationX [
^posX
]

{ #category : #'as yet unclassified' }
LarPlotterBar >> locationY [
^posY
]

{ #category : #'as yet unclassified' }
LarPlotterBar >> margine [
^margine
]

{ #category : #'as yet unclassified' }
LarPlotterBar >> margine: number [
margine := number
]

{ #category : #'as yet unclassified' }
LarPlotterBar >> titel: text [
	graph addTitle: text.
]

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
		'graph',
		'title',
		'bars',
		'tickLabelsX',
		'tickLabelsY',
		'ticksX',
		'ticksY',
		'spec',
		'dict'
	],
	#category : #'LarPlotter-Plotter'
}

{ #category : #accessing }
LarPlotterBar class >> withSpec: aSpec [
	 ^ self new
	 	spec: aSpec;
	 	initializeBarGraphFromSpec;
	 	yourself
]

{ #category : #'as yet unclassified' }
LarPlotterBar >> addAxisLabel: textX with: textY [
labelAxisX := LarLabelAxis new initialize: textX. 
labelAxisY := LarLabelAxis new initialize: textY. 
graph addAxisLabel: labelAxisX asElement with: labelAxisY asElement. 
]

{ #category : #'as yet unclassified' }
LarPlotterBar >> addBars: values [
| bar |
amountTicksX := values size. 
	1 to: (values size) do: [:n|
bar:= LarBar new initialize: ((values at: n)) with: (widthG/(values size)).
graph addBars: (values size) with: n with: bar asElement. 
 bars add: bar. 
].
"graph addBars: values."
graph rotation: 180. 
]

{ #category : #'as yet unclassified' }
LarPlotterBar >> addTicks: tickXAmount with: tickYAmount [
| tickX tickY |
self tickInitialize.
ticksX removeAll. 
ticksY removeAll. 
amountTicksY := tickYAmount.
amountTicksX := tickXAmount.
amountTicksX = 0
  ifFalse:[
	1 to: (tickXAmount) do: [: n| 
tickX := (LarTick new initialize: 3 with: 10). 
graph addTicksX: tickXAmount with: tickX asElementX with: n.
ticksX add: tickX.
].].

1 to: ( tickYAmount ) do: [: n| 
tickY := (LarTick new initialize: 3 with: 10).
graph addTicksY: tickYAmount with: tickY asElementY with: n.
ticksY add: tickX.

].
]

{ #category : #'as yet unclassified' }
LarPlotterBar >> addTicksLabel: valuesX [
| tick |
self tickLablesInitialize.
	1 to: (amountTicksX) do: [: n| 
tick := LarTickLabel new initialize: (valuesX at: n).
graph addTicksLabelX: tick asElement with: amountTicksX with: n.
tickLabelsX add: tick. 
].

1 to: ( amountTicksY ) do: [: n| 
tick:= LarTickLabel new initialize: (( amountTicksY) - (n-1)). 
graph addTicksLabelY: tick asElement with: amountTicksY with: n.
tickLabelsY add: tick.
].
"graph addTicksLabel: amountX with: amountY."

]

{ #category : #'as yet unclassified' }
LarPlotterBar >> addTicksLabel: valuesX with: valuesY [
| tick |
self tickLablesInitialize.
	1 to: (amountTicksX ) do: [: n| 
tick := LarTickLabel new initialize: (valuesX at: n).
graph addTicksLabelX: tick asElement with: amountTicksX with: n.
tickLabelsX add: tick. 
].

2 to: ( amountTicksY ) do: [: n| 
tick:= LarTickLabel new initialize: (valuesY at: (( amountTicksY) - (n-1))). 
graph addTicksLabelY: tick asElement with: amountTicksY with: n.
tickLabelsY add: tick.
].
"graph addTicksLabel: amountX with: amountY."

]

{ #category : #'as yet unclassified' }
LarPlotterBar >> amountTicks: numberX with: numberY [
amountTicksX:=numberX.
amountTicksY := numberY.
self addTicks: numberX with: numberY
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
LarPlotterBar >> bars [
^bars
]

{ #category : #'as yet unclassified' }
LarPlotterBar >> barsDefinition [
bars:=  OrderedCollection new. 
]

{ #category : #'as yet unclassified' }
LarPlotterBar >> changeTitle: text [
title setText: text. 
^graph
]

{ #category : #'as yet unclassified' }
LarPlotterBar >> graph [
^graph
]

{ #category : #'as yet unclassified' }
LarPlotterBar >> gtLiveFor: aView [
	<gtView>
	^aView explicit
		title: 'Live';
		priority: 10;
		stencil: [ self graph   ];
		actionUpdateButton.
		"updateWhen: LePageTitleChanged in: self page announcer.
		
	column ifNotNil: [column announcer announce: KBNameUpdate new]."
	"^view"
]

{ #category : #'as yet unclassified' }
LarPlotterBar >> initialize: sizeWidth with: sizeHeight [
"These are default values and can be changes if wished."
posX := 100.
posY := 100. 
"amountTicksX:= 8. 
amountTicksY := 8. "
labelHeight := 50.
margine := 20.
heightG:= sizeHeight. 
widthG := sizeWidth.

graph := LarPlotterBarElement new create: sizeWidth with: sizeHeight.
"graph changePosition: posX with: posY. "
self barsDefinition. 

]

{ #category : #accessing }
LarPlotterBar >> initializeBarGraphFromSpec [

	| data axisX axisy |
	dict := STONJSON fromString: self spec.
	self initialize: 300 with: 300.
	data := ((dict at: 'data') at: 'values') collect: #values.
	axisX := ((dict at: 'encoding') at: 'x') at: 'field'.
	axisy := ((dict at: 'encoding') at: 'y') at: 'field'.

	self titel: 'This is a title'.
	self addBars: (data collect: [ :each | each last ]).
	self addAxisLabel: axisX with: axisy.
	self addTicks: 0 with: data size.
	self addTicksLabel: (data collect: [ :each | each first ])
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

{ #category : #accessing }
LarPlotterBar >> spec [
	^ spec
]

{ #category : #accessing }
LarPlotterBar >> spec: anObject [
	spec := anObject
]

{ #category : #'as yet unclassified' }
LarPlotterBar >> tickInitialize [
ticksX:= OrderedCollection new. 
ticksY := OrderedCollection new.
]

{ #category : #'as yet unclassified' }
LarPlotterBar >> tickLabelsX [
^tickLabelsX
]

{ #category : #'as yet unclassified' }
LarPlotterBar >> tickLabelsY [
^tickLabelsY
]

{ #category : #'as yet unclassified' }
LarPlotterBar >> tickLablesInitialize [
tickLabelsX:= OrderedCollection new. 
tickLabelsY := OrderedCollection new.
]

{ #category : #'as yet unclassified' }
LarPlotterBar >> ticksX [
^ticksX
]

{ #category : #'as yet unclassified' }
LarPlotterBar >> ticksY [
^ticksY
]

{ #category : #'as yet unclassified' }
LarPlotterBar >> titel: text [
	title := LarTitel new initialize: text. 
	graph addTitle: text with: title asElement. 
]

{ #category : #'as yet unclassified' }
LarPlotterBar >> title [
^title
]

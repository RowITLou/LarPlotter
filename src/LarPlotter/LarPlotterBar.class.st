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
		'graphElement'
	],
	#category : #'LarPlotter-Plotter'
}

{ #category : #'as yet unclassified' }
LarPlotterBar >> addBars: values [
<return: #LarPlotterBar>
| bar |
1 to: (values size) do: [:n|
bar:= self createBars: ((values at: n)*100*4).
graphElement addChild: bar].

graphElement transform
		rotateBy: 180;
		apply.
^base
]

{ #category : #'as yet unclassified' }
LarPlotterBar >> addTicks [
<return: #LarPlotterBar>
|  tickX tickXcontainer tickY tickYcontainer |
	1 to: (self amountTicksX - 1) do: [: n| 
tickX := (self ticks: 3 with: 10) asElementX. 
tickXcontainer := BlElement new
		size:  ( widthG/ self amountTicksX)@ 12;
		"border: (BlBorder builder
					
					paint: Color black;
					width: 1;
					build);"
		relocate: (posX + ((n-1)*(widthG/self amountTicksX)) + ((widthG/self amountTicksX)/2)) @ (posY + heightG).
		
tickXcontainer addChild: tickX.
base addChild: tickXcontainer. ].

2 to: (self amountTicksY ) do: [: n| 
tickY := (self ticks: 3 with: 10) asElementY.
tickYcontainer := BlElement new
"border: (BlBorder builder
					
					paint: Color black;
					width: 1;
					build);"
		size:  12 @ ( widthG/ self amountTicksX);
		relocate: (posY-12)@(posX +((n-1)*(widthG/self amountTicksX)) - ((heightG/self amountTicksX)/2)).
		
		
base addChild: tickYcontainer.
tickYcontainer addChild: tickY.
].
^base
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
LarPlotterBar >> baseElement [ 
| aContainer |
	aContainer := BlElement new
		constraintsDo: [ :c |
			c horizontal exact:  800.
			c vertical exact:  800 ];
		border: (BlBorder paint: Color veryLightGray width: 1).
		base := aContainer.
^base
]

{ #category : #'as yet unclassified' }
LarPlotterBar >> createBars: height [
| child |

	child := BlElement new
			background: (Color white alpha: 0.2);
			border: (BlBorder builder
					paint: (Color blue alpha: 0.5);
					width: 1;
					build);
	layout: BlFrameLayout new;
			constraintsDo: [ :c | 
		    c vertical exact: (height).
		    
			c horizontal matchParent
			].
^child
]

{ #category : #'as yet unclassified' }
LarPlotterBar >> graphOutline: width with: height [
<return: #LarPlotterBar>

| labelContainerX labelContainerY |
widthG := width.
heightG := height.
base:= self baseElement.
graphElement := LarContainer new initialize: width with: height. 
graphElement relocate: posX @ posY. 
base addChild: graphElement. 
labelContainerX := self labelcontainer: width with: self labelHeight. 
labelAxisX := self labelAxis.
labelContainerY := self labelcontainer:  width with: self labelHeight. 
labelAxisY := self labelAxis.  

labelContainerX addChild: labelAxisX. 
base addChild: labelContainerX.

labelContainerX relocate: posX @(posY + height + margine).
labelContainerY relocate: (posX-margine - self labelHeight)@ (posY + height).

labelContainerY addChild: labelAxisY. 

labelContainerY transform
  	topLeftOrigin
		rotateBy: 270;
		apply.

base addChild: labelContainerY.
^self

]

{ #category : #'as yet unclassified' }
LarPlotterBar >> initialize: sizeWidth with: sizeHeight [
posX := 100.
posY := 100. 
amountTicksX:= 8. 
amountTicksY := 8. 
labelHeight := 50.
margine := 40.
^self graphOutline: sizeWidth with: sizeHeight. 
]

{ #category : #'as yet unclassified' }
LarPlotterBar >> labelAxis [
^LarLabelAxis new initialize: 'Text Axis'. 
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
LarPlotterBar >> labelcontainer: width with: height [
| labelAxis |
	labelAxis := BlElement new
		layout: BlLinearLayout horizontal;
		size:  width @  height;
		
		constraintsDo: [ :c |
		    c frame vertical alignCenter.
			c frame horizontal alignCenter];
		background: (Color white alpha: 0.3);
		padding: (BlInsets all: 1).
^labelAxis
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
LarPlotterBar >> ticks: sizeWidth with: sizeLength [
^LarTick new initialize: sizeWidth with: sizeLength.
	
]

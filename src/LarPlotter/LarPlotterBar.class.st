Class {
	#name : #LarPlotterBar,
	#superclass : #BlElement,
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
| bar |
	1 to: (values size) do: [:n|
bar:= LarBar new initialize: ((values at: n)*100*4) with: (widthG/(values size)).
graphElement addChild: bar
].

graphElement transform
		rotateBy: 180;
		apply.
graphElement forceLayout.
		
^graphElement
]

{ #category : #'as yet unclassified' }
LarPlotterBar >> addTicks [
|  tickX tickXcontainer tickY tickYcontainer |
	1 to: (self amountTicksX - 1) do: [: n| 
tickX := (self ticks: 3 with: 10) asElementX. 
tickXcontainer := LarContainer new initialize:( widthG/ self amountTicksX) with: 12.
		
tickXcontainer relocate: (posX + ((n-1)*(widthG/self amountTicksX)) + ((widthG/self amountTicksX)/2)) @ (posY + heightG);
border: (BlBorder builder
					
					paint: Color white;
					width: 1;
					build).
		
tickXcontainer addChild: tickX.
self addChild: tickXcontainer. ].

2 to: (self amountTicksY ) do: [: n| 
tickY := (self ticks: 3 with: 10) asElementY.
tickYcontainer := LarContainer new initialize:12 with: ( widthG/ self amountTicksX).
	tickYcontainer relocate: (posY-12)@(posX +((n-1)*(widthG/self amountTicksX)) - ((heightG/self amountTicksX)/2));
	border: (BlBorder builder
					
					paint: Color white;
					width: 1;
					build).
		
self addChild: tickYcontainer.
tickYcontainer addChild: tickY.
].
^self
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
| labelContainerX labelContainerY |
widthG := width.
heightG := height.
super initialize. 
self 
border: (BlBorder builder
					
					paint: Color white;
					width: 1;
					build);
			background: (Color transparent);
			constraintsDo: [ :c |
			c horizontal exact:  800.
			c vertical exact:  800 ];
			background: (BlBackground paint: Color white).

graphElement := LarContainer new initialize: width with: height.
self addChild: graphElement. 
graphElement relocate: posX @ posY.

labelContainerX := LarContainer new initialize: width with: self labelHeight. 
labelContainerX border: (BlBorder builder
					
					paint: Color white;
					width: 1;
					build).
labelAxisX := self labelAxis.
labelContainerY := LarContainer new initialize:  width with: self labelHeight. 
labelContainerY border: (BlBorder builder
					
					paint: Color transparent;
					width: 1;
					build).
labelAxisY := self labelAxis.  

labelContainerX addChild: labelAxisX. 

self addChild: labelContainerX.

labelContainerX relocate: posX @(posY + height + margine).
labelContainerY relocate: (posX-margine - self labelHeight)@ (posY + height).

labelContainerY addChild: labelAxisY. 

labelContainerY transform
  	topLeftOrigin
		rotateBy: 270;
		apply.

self addChild: labelContainerY.
labelContainerX forceLayout.
labelContainerY forceLayout.
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

Class {
	#name : #LarPlotterBarElement,
	#superclass : #BlElement,
	#instVars : [
		'graphElement',
		'posX',
		'posY',
		'widthGraph',
		'heightGraph',
		'labelAxisX',
		'labelAxisY',
		'heightLabel',
		'margin'
	],
	#category : #'LarPlotter-Plotter'
}

{ #category : #'as yet unclassified' }
LarPlotterBarElement >> addAxisLabel: textX with: textY [
| labelContainerX labelContainerY |
	labelContainerX := self createContainer: widthGraph with: heightLabel.
	labelContainerY := self createContainer: widthGraph with: heightLabel.
	labelAxisX := LarLabelAxis new initialize: textX. 
	labelAxisY := LarLabelAxis new initialize: textY. 
	labelContainerX addChild: labelAxisX.
	labelContainerY addChild: labelAxisY.
    labelContainerX relocate: posX @(posY + heightGraph + margin).
    labelContainerY relocate: (posX-margin -  heightLabel)@ (posY + heightGraph).
    labelContainerY transform
  	topLeftOrigin
		rotateBy: 270;
		apply.
    self addChild: labelContainerY.
    self addChild: labelContainerX.
^self
]

{ #category : #'as yet unclassified' }
LarPlotterBarElement >> addBars: values [
| bar |
	1 to: (values size) do: [:n|
bar:= LarBar new initialize: ((values at: n)*100*4) with: (widthGraph/(values size)).
bar relocate: ("posX +" (widthGraph/(values size)*((values size)-n ))) @ "posY" 0.
graphElement addChild: bar. 
graphElement forceLayout.].

graphElement transform
		rotateBy: 180;
		apply.
"graphElement forceLayout."
		
^self
]

{ #category : #'as yet unclassified' }
LarPlotterBarElement >> addTicks: amountTickX with: amountTickY [

| tickX tickXcontainer tickYContainer tickY |
	1 to: (amountTickX - 1) do: [: n| 
tickX := (LarTick new initialize: 3 with: 10) asElementX.
tickXcontainer := (self createContainer:( widthGraph/  amountTickX) with: 12).
tickXcontainer relocate: (posX + ((n-1)*(widthGraph/ amountTickX)) + ((widthGraph/ amountTickX)/2)) @ (posY + heightGraph).

self addChild: tickXcontainer. 
tickXcontainer addChild: tickX.].

2 to: ( amountTickY ) do: [: n| 
tickY := (LarTick new initialize: 3 with: 10) asElementY.
tickYContainer := self createContainer: 12 with: ( widthGraph/  amountTickY).
tickYContainer relocate: (posY-12)@(posX +((n-1)*(widthGraph/ amountTickX)) - ((heightGraph/ amountTickX)/2)).
self addChild: tickYContainer.
tickYContainer addChild: tickY.
].
^self 

]

{ #category : #'as yet unclassified' }
LarPlotterBarElement >> addTicksLabel: amountTickX with: amountTickY [
| tickXLabel tickXcontainer tickYLabel tickYcontainer |
	1 to: (amountTickX - 1) do: [: n| 
tickXLabel := LarTickLabel new initialize: n.
 tickXcontainer:=self createContainer: ( widthGraph/ amountTickX) with: 20.
 tickXcontainer relocate: (posX + ((n-1)*(widthGraph/ amountTickX)) + ((widthGraph/ amountTickX)/2)) @ (posY + heightGraph + 17).
 tickXcontainer addChild: tickXLabel.
self addChild: tickXcontainer. ].

2 to: ( amountTickY ) do: [: n| 
tickYLabel := LarTickLabel new initialize: ( amountTickY) - (n-1). 
tickYcontainer := self createContainer:20 with: ( widthGraph/  amountTickY).
	tickYcontainer relocate: (posY-29)@(posX +((n-1)*(widthGraph/ amountTickY)) - ((heightGraph/ amountTickY)/2)).
	self addChild: tickYcontainer.
tickYcontainer addChild: tickYLabel.
].
^self
]

{ #category : #'as yet unclassified' }
LarPlotterBarElement >> addTitle: text [
| titel titelContainer |
	titel:= LarTitel new initialize: text asRopedText. 
	titelContainer := self createContainer: widthGraph with: heightLabel. 
	titelContainer relocate: posX@ 0. 
	titelContainer addChild: titel.
	self addChild: titelContainer.
	^self
]

{ #category : #'as yet unclassified' }
LarPlotterBarElement >> create: width with: height [
widthGraph := width.
heightGraph := height.
heightLabel:= 50 .
margin := 20.
graphElement := LarContainer new initialize: width with: height.
posX :=100.
posY := 100.
graphElement relocate: 100@100.
super initialize. 
^self 
border: (BlBorder builder
					
					paint: Color white;
					width: 1;
					build);
			background: (Color transparent);
			constraintsDo: [ :c |
			c horizontal exact:  800.
			c vertical exact:  800 ];
			background: (BlBackground paint: Color white);
			 addChild: graphElement; yourself. 



]

{ #category : #'as yet unclassified' }
LarPlotterBarElement >> createContainer: width with: height [
| container |
	container := LarContainer new initialize:  width with: height. 
container border: (BlBorder builder
					
					paint: Color transparent;
					width: 1;
					build).
^container
]

{ #category : #'as yet unclassified' }
LarPlotterBarElement >> graphElement [
^graphElement
]

{ #category : #'as yet unclassified' }
LarPlotterBarElement >> position: x with: y [
posX := x.
posY := y
]

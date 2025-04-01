"
This class is responsible to plot the entire graph
"
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
		'margin',
		'title',
		'container',
		'labelsContainer'
	],
	#category : #'LarPlotter-Plotter'
}

{ #category : #'as yet unclassified' }
LarPlotterBarElement >> addAxisLabel: elementX with: elementY [
| labelContainerX labelContainerY |
	"labelContainerX := self createContainer: widthGraph with: heightLabel.
	labelContainerY := self createContainer: widthGraph with: heightLabel."
	labelAxisX := elementX.
	labelAxisY := elementY.
	"labelContainerX addChild: labelAxisX.
	labelContainerY addChild: labelAxisY.
    labelContainerX relocate: posX @(posY + heightGraph + margin).
    labelContainerY relocate: (posX-margin -  heightLabel)@ (posY + heightGraph).
    labelContainerY transform
  	topLeftOrigin
		rotateBy: 270;
		apply."
	labelAxisY transform
  	topLeftOrigin
		rotateBy: 270;
		apply.
    container addChild: labelAxisX.
    "self addChild: labelContainerX."
^self
]

{ #category : #'as yet unclassified' }
LarPlotterBarElement >> addBars: valuesSize with: n with: element [
| bar |
"	1 to: (values size) do: [:n|"
bar:= element.
"bar relocate: (posX + (widthGraph/(valuesSize)*((valuesSize)-n ))) @ posY 0."
graphElement addChild: bar. 
graphElement forceLayout.

"graphElement transform
		rotateBy: 180;
		apply."
"graphElement forceLayout."
		
^self
]

{ #category : #'as yet unclassified' }
LarPlotterBarElement >> addTicks: amountTickX with: element with: n [

| tickX tickXcontainer |
"	1 to: (amountTickX - 1) do: [: n| "
tickX := element.
tickXcontainer := (self createContainer:( widthGraph/  amountTickX) with: 12).
tickXcontainer relocate: (posX + ((n-1)*(widthGraph/ amountTickX)) + ((widthGraph/ amountTickX)/2)) @ (posY + heightGraph).

self addChild: tickXcontainer. 
tickXcontainer addChild: tickX.

^self 
]

{ #category : #'as yet unclassified' }
LarPlotterBarElement >> addTicksLabelX: elementX with: amountTickX with: n [

| tickXLabel tickXcontainer |
	"1 to: (amountTickX - 1) do: [: n| "
tickXLabel := elementX.
 tickXcontainer:= self createContainer: heightGraph with: widthGraph.

 
 tickXcontainer constraintsDo: [ :c |
			c vertical fitContent.
			c horizontal exact:(widthGraph/ amountTickX)].
 "tickXcontainer relocate: (posX + ((n-1)*(widthGraph/ amountTickX)) + ((widthGraph/ amountTickX)/2)) @ (posY + heightGraph + 10)."
 tickXcontainer addChild: tickXLabel.
labelsContainer addChild: tickXcontainer.
"container addChild: labelsContainer."
^self
]

{ #category : #'as yet unclassified' }
LarPlotterBarElement >> addTicksLabelY: elementY with: amountTickY with: n [
| tickYLabel tickYcontainer |
	"2 to: ( amountTickY ) do: [: n| "
tickYLabel := elementY. 
tickYcontainer := self createContainer:20 with: ( widthGraph/  (amountTickY+1)).
	tickYcontainer relocate: (posY-29)@(posX +((n)*(widthGraph/ (amountTickY+1))) - ((heightGraph/ (amountTickY+1))/2)).
	self addChild: tickYcontainer.
tickYcontainer addChild: tickYLabel.
^self
]

{ #category : #'as yet unclassified' }
LarPlotterBarElement >> addTicksX: amountTickX with: element with: n [

| tickX tickXcontainer |
"	1 to: (amountTickX - 1) do: [: n| "
tickX := element.
tickXcontainer := (self createContainer:( widthGraph/  (amountTickX+1)) with: 12).
tickXcontainer relocate: (posX + ((n-1)*(widthGraph/ (amountTickX+1))) + ((widthGraph/ (amountTickX+1))/2)) @ (posY + heightGraph).

self addChild: tickXcontainer. 
tickXcontainer addChild: tickX.

^self 
]

{ #category : #'as yet unclassified' }
LarPlotterBarElement >> addTicksY: amountTickY with: element with: n [
| tickY tickYContainer |
	"2 to: ( amountTickY ) do: [: n| "
tickY := element.
tickYContainer := self createContainer: 12 with: ( widthGraph/  (amountTickY+1)).
tickYContainer relocate: (posX-12)@(posY +((n)*(heightGraph/ (amountTickY+1))) - ((heightGraph/ (amountTickY+1))/2)).
self addChild: tickYContainer.
tickYContainer addChild: tickY.
^self
]

{ #category : #'as yet unclassified' }
LarPlotterBarElement >> addTitle: text with: element [
| titel titelContainer |
	titel:= element.
	self title: text. 
	"titelContainer := self createContainer: widthGraph with: heightLabel. 

	titelContainer addChild: titel."
	"self addChild: titelContainer.
	titelContainer constraintsDo: [ :c |
			c horizontal fitContent.
			c vertical fitContent ].
	titelContainer relocate: posX@ 0. "
	"titel relocate: posX@ 0. "
	
	container addChildFirst: titel.
	
	
	^self
]

{ #category : #'as yet unclassified' }
LarPlotterBarElement >> changePosition: positionX with: positionY [
graphElement relocate: positionX @ positionY. 
posX := positionX. 
posY := positionY. 
]

{ #category : #'as yet unclassified' }
LarPlotterBarElement >> create: width with: height [
widthGraph := width.
heightGraph := height.
heightLabel:= 50 .
margin := 20.
graphElement := (LarContainer new initialize: width with: height) asElement.
container := (LarContainer new initialize: width with: height) asElementVertical.
"posX :=100.
posY := 100.
graphElement relocate: 100@100."
super initialize. 
container addChild: graphElement.
labelsContainer:= (LarContainer new initialize: heightGraph with: widthGraph) asElement.
container addChild: labelsContainer. 
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
			addChild: container;
			
			 "addChild: graphElement;" yourself. 
			


]

{ #category : #'as yet unclassified' }
LarPlotterBarElement >> createContainer: width with: height [
| containerC |
	containerC := (LarContainer new initialize:  width with: height) asElement. 
containerC border: (BlBorder builder
					
					paint: Color black;
					width: 1;
					build).
					"constraintsDo: [ :c |
			c horizontal fitContent.
			c vertical fitContent ]."
					
^containerC
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

{ #category : #'as yet unclassified' }
LarPlotterBarElement >> rotation: value [
graphElement transform
		rotateBy: value;
		apply.
]

{ #category : #'as yet unclassified' }
LarPlotterBarElement >> title [
^title
]

{ #category : #'as yet unclassified' }
LarPlotterBarElement >> title: text [
title:= text
]

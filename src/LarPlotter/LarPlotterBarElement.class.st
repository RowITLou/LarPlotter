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
		'labelsContainer',
		'containerTickAndLabel',
		'labelsYContainer'
	],
	#category : #'LarPlotter-Plotter'
}

{ #category : #'as yet unclassified' }
LarPlotterBarElement >> addAxisLabel: elementX with: elementY [
	labelAxisX := elementX.
	labelAxisY := elementY.
	labelAxisY transform
  	topLeftOrigin
		rotateBy: 270;
		apply.
	containerTickAndLabel addChildFirst: labelAxisY. 
    container addChild: labelAxisX.
^self
]

{ #category : #'as yet unclassified' }
LarPlotterBarElement >> addBars: valuesSize with: n with: element [
| bar |
bar:= element.

graphElement addChild: bar. 
graphElement forceLayout.

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
			c horizontal exact:65].
 tickXcontainer addChild: tickXLabel.
labelsContainer addChild: tickXcontainer.
^self
]

{ #category : #'as yet unclassified' }
LarPlotterBarElement >> addTicksLabelY: elementY with: amountTickY with: n [
| tickYLabel tickYcontainer |
tickYLabel := elementY. 
tickYcontainer := (LarContainer new initialize: widthGraph with: heightGraph) asElementVertical.
tickYcontainer constraintsDo: [ :c |
			c horizontal fitContent.
			c vertical exact: 50].

	tickYcontainer addChild: tickYLabel.
 labelsYContainer addChild: tickYcontainer.
^self
]

{ #category : #'as yet unclassified' }
LarPlotterBarElement >> addTicksX: amountTickX with: element with: n [

| tickX tickXcontainer |
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
tickY := element.
tickYContainer := self createContainer: 12 with: ( widthGraph/  (amountTickY+1)).
tickYContainer relocate: (posX-12)@(posY +((n)*(heightGraph/ (amountTickY+1))) - ((heightGraph/ (amountTickY+1))/2)).
self addChild: tickYContainer.
tickYContainer addChild: tickY.
^self
]

{ #category : #'as yet unclassified' }
LarPlotterBarElement >> addTitle: text with: element [
| titel  |
	titel:= element.
	self title: text. 
	
	container addChild: titel at: 5.
	
	
	^self
]

{ #category : #'as yet unclassified' }
LarPlotterBarElement >> changePosition: positionX with: positionY [
graphElement relocate: positionX @ positionY. 
posX := positionX. 
posY := positionY. 
]

{ #category : #'as yet unclassified' }
LarPlotterBarElement >> create [
| empty empty_too  scroll empty_other grid |

labelsYContainer := LarContainer new  asElementVertical.
graphElement := LarContainer new  asElement.
container := LarContainer new asElementVertical.
containerTickAndLabel :=LarContainer new  asElement.
containerTickAndLabel addChild: labelsYContainer. 

super initialize. 
container addChild: graphElement.
grid := BlGridLayoutImpl new.

container layout columnCount: 2.
container layout rowCount: 4.
empty := BlElement new. 
empty_too := BlElement new. 
empty_other := BlElement new. 

container addChildFirst: empty. 

container addChild: containerTickAndLabel at: 2.  
container addChild: empty_too at: 3. 
container addChild: empty_other at: 4.

labelsContainer:= (LarContainer new initialize: heightGraph with: widthGraph) asElement.
container addChild: labelsContainer. 


^self 
border: (BlBorder builder

paint: Color white;
					width: 1;
					build);
			background: (Color transparent);
			constraintsDo: [ :c |
			c horizontal matchParent.
			c vertical matchParent ];
			background: (BlBackground paint: Color white);
			addChild: container;
			
			 yourself. 
]

{ #category : #'as yet unclassified' }
LarPlotterBarElement >> create: width with: height [
| empty empty_too  scroll empty_other grid |

labelsYContainer := (LarContainer new initialize: width with: height) asElementVertical.
graphElement := (LarContainer new initialize: width with: height) asElement.
container := (LarContainer new initialize: width with: height) asElementVertical.
containerTickAndLabel :=(LarContainer new initialize: width with: height) asElement.
containerTickAndLabel addChild: labelsYContainer. 

super initialize. 
container addChild: graphElement.
grid := BlGridLayoutImpl new.

container layout columnCount: 2.
container layout rowCount: 4.
empty := BlElement new. 
empty_too := BlElement new. 
empty_other := BlElement new. 

container addChildFirst: empty. 

container addChild: containerTickAndLabel at: 2.  
container addChild: empty_too at: 3. 
container addChild: empty_other at: 4.

labelsContainer:= (LarContainer new initialize: heightGraph with: widthGraph) asElement.
container addChild: labelsContainer. 


^self 
border: (BlBorder builder
					
					paint: Color white;
					width: 1;
					build);
			background: (Color transparent);
			constraintsDo: [ :c |
			c horizontal matchParent.
			c vertical matchParent ];
			background: (BlBackground paint: Color white);
			addChild: container;
			
			 yourself. 
			


]

{ #category : #'as yet unclassified' }
LarPlotterBarElement >> createContainer [
| containerC |
	containerC := (LarContainer new asElement).
containerC border: (BlBorder builder
					
					paint: Color white;
					width: 1;
					build).
					
^containerC
]

{ #category : #'as yet unclassified' }
LarPlotterBarElement >> createContainer: width with: height [
| containerC |
	containerC := (LarContainer new initialize:  width with: height) asElement. 
containerC border: (BlBorder builder
					
					paint: Color white;
					width: 1;
					build).
					
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
